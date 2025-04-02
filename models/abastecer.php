<?Php

class abastecer{
    private $id;
    private $id_tienda;
    private $id_usuario;
    private $id_proveedor;
    private $descripcion;
    private $total;
    private $situacion;
    private $importe;
    private $resto;
    private $fecha;
    private $hora;
    private $fecha_ent;
    private $hora_ent;
    private $estado;
    private $est;
    //variables extra
    private $limite;
    private $offset;
    //
    private $db;

    public function __construct(){
        $this->db = Database::connect();
    }

    function getId(){
        return $this->id;
    }

    function getId_Tienda(){
        return $this->id_tienda;
    }

    function getId_Usuario(){
        return $this->id_usuario;
    }

    function getId_proveedor(){
        return $this->id_proveedor;
    }

    function getdescripcion(){
        return $this->descripcion;
    }

    function getTotal(){
        return $this->total;
    }

    function getSituacion(){
        return $this->situacion;
    }

    function getImporte(){
        return $this->importe;
    }

    function getResto(){
        return $this->resto;
    }

    function getFecha(){
        return $this->fecha;
    }

    function getHora(){
        return $this->hora;
    }

    function getFecha_ent(){
        return $this->fecha_ent;
    }

    function getHora_ent(){
        return $this->hora_ent;
    }

    function getEstado(){
        return $this->estado;
    }

    function getEst(){
        return $this->est;
    }
    //variables extra
    function getLimite(){
        return $this->limite;
    }

    function getOffset(){
        return $this->offset;
    }
    //
    function setId($id){
        $this->id = $id;
    }

    function setId_Tienda($id_tienda){
        $this->id_tienda = $id_tienda;
    }

    function setId_Usuario($id_usuario){
        $this->id_usuario = $id_usuario;
    }

    function setId_proveedor($id_proveedor){
        $this->id_proveedor = $id_proveedor;
    }

    function setdescripcion($descripcion){
        $this->descripcion = $this->db->real_escape_string($descripcion);
    }

    function setTotal($total){
        $this->total = $total;
    }

    function setSituacion($situacion){
        $this->situacion = $this->db->real_escape_string($situacion);
    }

    function setImporte($importe){
        $this->importe = $importe;
    }

    function setResto($resto){
        $this->resto = $resto;
    }

    function setFecha($fecha){
        $this->fecha = $fecha;
    }

    function sethora($hora){
        $this->hora = $hora;
    }

    function setFecha_ent($fecha_ent){
        $this->fecha_ent = $fecha_ent;
    }

    function sethora_ent($hora_ent){
        $this->hora_ent = $hora_ent;
    }

    function setEstado($estado){
        $this->estado = $this->db->real_escape_string($estado);
    }

    function setEst($est){
        $this->est = $this->db->real_escape_string($est);
    }
    //variables extra
    function setLimite($limite){
        $this->limite = $limite;
    }

    function setOffset($offset){
        $this->offset = $offset;
    }
    //

    //Consultas

    //Guardar Registro de Abastecimiento - 1abastece
    public function save(){
        $sql = "INSERT INTO abastecer VALUES(NULL, {$this->getId_tienda()}, {$this->getId_usuario()}, {$this->getId_proveedor()}, '{$this->getDescripcion()}', {$this->getTotal()}, '{$this->getSituacion()}', {$this->getImporte()}, {$this->getResto()}, CURDATE(), CURRENT_TIME(), NULL, NULL, 'ADQUIRIDO', 'H');";
        $save = $this->db->query($sql);

        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

    //Guardar listado de Abastecimiento de un proveedor - 2abastece
    public function save_pa(){
        $sql = "SELECT LAST_INSERT_ID() as 'abastecer';";
        $query = $this->db->query($sql);
        $abastecer = $query->fetch_object()->abastecer;

        foreach($_SESSION['añadir'] as $elemento){
            $producto = $elemento['producto'];

            $insert = "INSERT INTO producto_abastecer Values(NULL, {$abastecer}, {$producto->id}, {$elemento['precio']}, {$elemento['unidades']}, 'H')";
            $save = $this->db->query($insert);
        }

        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

    //Muestra todos los registros de abastecimiento - 3abastece
    public function getAllabas(){
        $sql = "SELECT ab.*, pv.nombrecom, pv.numruc FROM abastecer ab INNER JOIN proveedor pv on ab.id_proveedor = pv.id WHERE ab.est = 'H' ORDER BY id DESC LIMIT {$this->getOffset()},{$this->getLimite()};";
        $cuaderno = $this->db->query($sql);
        return $cuaderno;
    }

    //Muestra el total de registros de abastecer - 4abastece
    public function getAlltotal(){
        $cuaderno  = $this->db->query("SELECT * FROM abastecer WHERE est = 'H'");
        return $cuaderno->num_rows;
    }
    
    //Muestra el total de registros segun usuario - 5abastece
    public function getAllByUser(){
        $sql = "SELECT ab.*, pv.nombrecom, pv.numruc FROM abastecer ab INNER JOIN proveedor pv on ab.id_proveedor = pv.id WHERE ab.id_usuario = {$this->getId_Usuario()} AND ab.est = 'H' ORDER BY ab.id DESC LIMIT {$this->getOffset()},{$this->getLimite()};";
        $cuaderno = $this->db->query($sql);
        return $cuaderno;
    }

    //Muestra el total de registros de abastecer segun usuario  - 6abastece
    public function getAlltotalu(){
        $cuaderno  = $this->db->query("SELECT * FROM abastecer WHERE id_usuario = {$this->getId_Usuario()} AND est = 'H'");
        return $cuaderno->num_rows;
    }

    //Muestra el total de registros anulados segun usuario - 7abastece
    public function getAllByUserA(){
        $sql = "SELECT ab.*, pv.nombrecom FROM abastecer ab INNER JOIN proveedor pv on ab.id_proveedor = pv.id WHERE ab.est = 'D' ORDER BY ab.id DESC LIMIT {$this->getOffset()},{$this->getLimite()};";
        $pedido = $this->db->query($sql);
        return $pedido;
    }

    //Muestra el total de registros de abastecer anulados segun usuario  - 8abastece
    public function getAlltotalA(){
        $cuaderno  = $this->db->query("SELECT * FROM abastecer WHERE est = 'D'");
        return $cuaderno->num_rows;
    }

    //Filtra la busqueda de abastecimiento - 9abastecer
    public function getfillabas(){
        $sql = "SELECT ab.*, pv.nombrecom, pv.numruc FROM abastecer ab INNER JOIN proveedor pv on ab.id_proveedor = pv.id WHERE ab.fecha like '%{$this->getFecha()}%' AND ab.est = 'H' ORDER BY id DESC;";
        $pedido = $this->db->query($sql);
        return $pedido;
    }

    //Filtra la busqueda de abastecimiento por usuario - 10abastecer
    public function getfillabasus(){
        $sql = "SELECT ab.*, pv.nombrecom, pv.numruc FROM abastecer ab INNER JOIN proveedor pv on ab.id_proveedor = pv.id WHERE ab.fecha like '%{$this->getFecha()}%' AND ab.id_usuario = {$this->getId_Usuario()} AND ab.est = 'H' ORDER BY id DESC;";
        $pedido = $this->db->query($sql);
        return $pedido;
    }

    //Saca datos del registro de cuaderno en base a un id - 11abastecer
    public function getOne(){
        $sql = "SELECT ab.*, pv.nombrecom, ti.nombre as 'tienda', u.nombre, u.apellidos FROM abastecer ab "
                . "INNER JOIN proveedor pv on ab.id_proveedor = pv.id INNER JOIN usuario u on ab.id_usuario = u.id "
                . "INNER JOIN tienda ti on ab.id_tienda = ti.id WHERE ab.id = {$this->getId()};";
        $cuaderno = $this->db->query($sql);
        return $cuaderno->fetch_object();
    }

    //Sacar Productos del Cuaderno - 12abastecer
    public function getProductosByabastecer($id){
        $sql = "SELECT p.*, pa.precio, pa.cantidad, m.nombre as 'marca' FROM producto p "
                . "INNER JOIN producto_abastecer pa ON p.id = pa.id_producto "
                . "INNER JOIN marca m ON m.id = p.id_marca "
                . "WHERE pa.id_abastecer ={$id};";
        $producto = $this->db->query($sql);
        return $producto;
    }

    //Edita para olcutar registro - 13abastecer
    public function edit_oculta(){
        $sql = "UPDATE abastecer SET estado = 'ANULADO', est = 'D' WHERE id = {$this->getId()};";
        $save = $this->db->query($sql);

        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

    //Cambia la situacion del pago por abastecer - 14abastecer
    public function pagar(){
        $sql = "UPDATE abastecer SET situacion = '{$this->getSituacion()}', importe = {$this->getImporte()}, resto = {$this->getResto()} WHERE id = {$this->getId()};";
        $save = $this->db->query($sql);

        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

    //cambia el estado de ingreso de productos abastecer - 15abastecer
    public function recibir(){
        $sql = "UPDATE abastecer SET fecha_ent = CURDATE(), hora_ent = CURRENT_TIME(), estado = 'INGRESADO' WHERE id = {$this->getId()};";
        $save = $this->db->query($sql);

        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

    //Recibe cantidad de productos a stock - 16abastecer
    public function getProdByabs_suma($id){
        $sql = "SELECT p.id, p.cantidad, pa.cantidad as 'cantisuma' FROM producto p "
                . "INNER JOIN producto_abastecer pa ON p.id = pa.id_producto "
                . "WHERE pa.id_abastecer ={$id};";
        $producto = $this->db->query($sql);
        return $producto;
    }

    //Busca en base a un usuario - 17abastecer
    public function getOneByUser(){
        $sql = "SELECT id, total, situacion, importe, resto, fecha, estado FROM abastecer WHERE id_usuario = {$this->getId_usuario()} ORDER BY id DESC LIMIT 1;";
        $abastecer= $this->db->query($sql);
        return $abastecer->fetch_object();
    }
}

?>