<?Php

class cuaderno{
    private $id;
    private $id_tienda;
    private $id_usuario;
    private $id_cliente;
    private $descripcion;
    private $total;
    private $situacion;
    private $importe;
    private $resto;
    private $fecha;
    private $hora;
    private $fecha_sal;
    private $hora_sal;
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

    function getId_cliente(){
        return $this->id_cliente;
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

    function getFecha_sal(){
        return $this->fecha_sal;
    }

    function getHora_sal(){
        return $this->hora_sal;
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

    function setId_Cliente($id_cliente){
        $this->id_cliente = $id_cliente;
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

    function setFecha_sal($fecha_sal){
        $this->fecha_sal = $fecha_sal;
    }

    function sethora_sal($hora_sal){
        $this->hora_sal = $hora_sal;
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
    
    //Guardar Cuaderno - 1cuaderno
    public function save(){
        $sql = "INSERT INTO cuaderno VALUES(NULL, {$this->getId_tienda()}, {$this->getId_usuario()}, {$this->getId_cliente()}, '{$this->getDescripcion()}', {$this->getTotal()}, '{$this->getSituacion()}', {$this->getImporte()}, {$this->getResto()}, CURDATE(), CURRENT_TIME(), NULL, NULL, 'VENDIDO', 'H');";
        $save = $this->db->query($sql);

        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }
    
    //Busca en base a un usuario - 2cuaderno
    public function getOneByUser(){
        $sql = "SELECT id, total, situacion, importe, resto, fecha, estado FROM cuaderno WHERE id_usuario = {$this->getId_usuario()} ORDER BY id DESC LIMIT 1;";
        $cuaderno = $this->db->query($sql);
        return $cuaderno->fetch_object();
    }

    //Busca los productos del listado del cuaderno - 3cuaderno
    public function getProductosBycuaderno($id){
        $sql = "SELECT p.*, pc.precio, pc.cantidad, m.nombre as 'marca' FROM producto p "
                . "INNER JOIN producto_cuaderno pc ON p.id = pc.id_producto "
                . "INNER JOIN marca m ON m.id = p.id_marca "
                . "WHERE pc.id_cuaderno ={$id};";
        $producto = $this->db->query($sql);
        return $producto;
    }

    //Busca todos los resultados de cuaderno - 4cuaderno
    public function getAllcuad(){
        $sql = "SELECT cu.*, ci.nombrecom, ci.numdoc FROM cuaderno cu INNER JOIN cliente ci on cu.id_cliente = ci.id WHERE cu.est = 'H' ORDER BY id DESC LIMIT {$this->getOffset()},{$this->getLimite()};";
        $cuaderno = $this->db->query($sql);
        return $cuaderno;
    }

    //Busca y saca los pedidos de los usuarios - 5cuaderno
    public function getAllByUser(){
        $sql = "SELECT cu.*, ci.nombrecom, ci.numdoc FROM cuaderno cu INNER JOIN cliente ci on cu.id_cliente = ci.id WHERE cu.id_usuario = {$this->getId_Usuario()} AND cu.est = 'H' ORDER BY cu.id DESC LIMIT {$this->getOffset()},{$this->getLimite()};";
        $cuaderno = $this->db->query($sql);
        return $cuaderno;
    }

    //Guardar listado de productos de un comprador - 6cuaderno
    public function save_pc(){
        $sql = "SELECT LAST_INSERT_ID() as 'cuaderno';";
        $query = $this->db->query($sql);
        $cuaderno = $query->fetch_object()->cuaderno;

        foreach($_SESSION['carrito'] as $elemento){
            $producto = $elemento['producto'];

            $insert = "INSERT INTO producto_cuaderno Values(NULL, {$cuaderno}, {$producto->id}, {$elemento['precio']}, {$elemento['unidades']}, 'H')";
            $save = $this->db->query($insert);
        }

        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

    //Busca un registro de cuaderno en base al filtro, busca todos - 7cuaderno
    public function getfillcuad(){
        $sql = "SELECT cu.*, ci.nombrecom, ci.numdoc FROM cuaderno cu INNER JOIN cliente ci on cu.id_cliente = ci.id WHERE cu.fecha like '%{$this->getFecha()}%' AND cu.est = 'H' ORDER BY id DESC;";
        $pedido = $this->db->query($sql);
        return $pedido;
    }

    //Busca un registro de cuaderno en base al filtro, busca solo de usuario - 8cuaderno
    public function getfillcuadus(){
        $sql = "SELECT cu.*, ci.nombrecom, ci.numdoc FROM cuaderno cu INNER JOIN cliente ci on cu.id_cliente = ci.id WHERE cu.fecha like '%{$this->getFecha()}%' AND cu.id_usuario = {$this->getId_Usuario()} AND cu.est = 'H' ORDER BY id DESC;";
        $pedido = $this->db->query($sql);
        return $pedido;
    }

    //Busca un solo registro a travez de id - 9cuaderno
    public function getOne(){
        $sql = "SELECT cu.*, ci.nombrecom, ti.nombre as 'tienda', u.nombre, u.apellidos FROM cuaderno cu "
                . "INNER JOIN cliente ci on cu.id_cliente = ci.id INNER JOIN usuario u on cu.id_usuario = u.id "
                . "INNER JOIN tienda ti on cu.id_tienda = ti.id WHERE cu.id = {$this->getId()};";
        $cuaderno = $this->db->query($sql);
        return $cuaderno->fetch_object();
    }

    //Edita para olcutar registro- 10cuaderno
    public function edit_oculta(){
        $sql = "UPDATE cuaderno SET estado = 'ANULADO', est = 'D' WHERE id = {$this->getId()};";
        $save = $this->db->query($sql);

        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

    //Busca todos los registros anulados - 11cuaderno
    public function getAllByUserA(){
        $sql = "SELECT cu.*, ci.nombrecom FROM cuaderno cu INNER JOIN cliente ci on cu.id_cliente = ci.id WHERE cu.est = 'D' ORDER BY cu.id DESC LIMIT {$this->getOffset()},{$this->getLimite()};";
        $pedido = $this->db->query($sql);
        return $pedido;
    }

    //Saca la cantidad total de registros anulados - 12cuaderno
    public function getAlltotalA(){
        $cuaderno  = $this->db->query("SELECT * FROM cuaderno WHERE est = 'D'");
        return $cuaderno->num_rows;
    }

    //Cambiar el estado a Entregado - 13cuaderno
    public function entregar(){
        $sql = "UPDATE cuaderno SET fecha_sal = CURDATE(), hora_sal = CURRENT_TIME(), estado = 'ENTREGADO' WHERE id = {$this->getId()};";
        $save = $this->db->query($sql);

        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

    //Busca los datos para restar la cantodad de stock - 14cuaderno
    public function getProdBycuad_resta($id){
        $sql = "SELECT p.id, p.cantidad, pc.cantidad as 'cantiresta' FROM producto p "
                . "INNER JOIN producto_cuaderno pc ON p.id = pc.id_producto "
                . "WHERE pc.id_cuaderno ={$id};";
        $producto = $this->db->query($sql);
        return $producto;
    }

    //Cambia el estaddo de la situacion del pago - 15cuaderno
    public function pagar(){
        $sql = "UPDATE cuaderno SET situacion = '{$this->getSituacion()}', importe = {$this->getImporte()}, resto = {$this->getResto()} WHERE id = {$this->getId()};";
        $save = $this->db->query($sql);

        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

    //busca todo los registros - 16cuaderno
    public function getAlltotal(){
        $cuaderno  = $this->db->query("SELECT * FROM cuaderno WHERE est = 'H'");
        return $cuaderno->num_rows;
    }

    //busca todo los registros de un usuario - 17cuaderno
    public function getAlltotalu(){
        $cuaderno  = $this->db->query("SELECT * FROM cuaderno WHERE id_usuario = {$this->getId_Usuario()} AND est = 'H'");
        return $cuaderno->num_rows;
    }

    ///
    ///
    ///
    
    /*
    public function getAll(){
        $cuaderno = $this->db->query("SELECT * FROM cuaderno ORDER BY id DESC;");
        return $cuaderno;
    }
    */
}