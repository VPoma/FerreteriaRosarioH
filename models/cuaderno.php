<?Php

class cuaderno{
    private $id;
    private $id_cua;
    private $id_tienda;
    private $id_usuario;
    private $id_cliente;
    private $descripcion;
    private $total;
    private $situacion;
    private $importe;
    private $resto;
    private $id_cot;
    private $fecha_cot;
    private $hora_cot;
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

    function getId_cua(){
        return $this->id_cua;
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

    function getDescripcion(){
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

    function getId_cot(){
        return $this->id_cot;
    }

    function getFecha_cot(){
        return $this->fecha_cot;
    }

    function getHora_cot(){
        return $this->hora_cot;
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

    function setId_cua($id_cua){
        $this->id_cua = $id_cua;
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

    function setId_cot($id_cot){
        $this->id_cot = $id_cot;
    }

    function setFecha_cot($fecha_cot){
        $this->fecha_cot = $fecha_cot;
    }

    function sethora_cot($hora_cot){
        $this->hora_cot = $hora_cot;
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
        $sql = "INSERT INTO cuaderno VALUES(NULL, {$this->getId_cua()}, {$this->getId_tienda()}, {$this->getId_usuario()}, {$this->getId_cliente()}, '{$this->getDescripcion()}', {$this->getTotal()}, '{$this->getSituacion()}', {$this->getImporte()}, {$this->getResto()}, NULL, NULL, NULL, CURDATE(), CURRENT_TIME(), NULL, NULL, 'VENDIDO', 'H');";
        $save = $this->db->query($sql);

        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

    //Busca en base a un usuario - 2cuaderno
    public function getOneByUser(){
        $sql = "SELECT id, id_cua, id_cot, total, situacion, importe, resto, fecha, fecha_cot, estado FROM cuaderno WHERE id_usuario = {$this->getId_usuario()} ORDER BY id_cua DESC LIMIT 1;";
        $cuaderno = $this->db->query($sql);
        return $cuaderno->fetch_object();
    }

    //Busca los productos del listado del cuaderno - 3cuaderno
    public function getProductosBycuaderno($id){
        $sql = "SELECT p.*, pc.precio, pc.cantidad, m.nombre as 'marca' FROM producto p "
                . "INNER JOIN producto_cuaderno pc ON p.id = pc.id_producto "
                . "INNER JOIN marca m ON m.id = p.id_marca "
                . "WHERE pc.id_cuaderno = {$id} AND pc.est = 'H';";
        $producto = $this->db->query($sql);
        return $producto;
    }

    //Busca todos los resultados de cuaderno - 4cuaderno
    public function getAllcuad(){
        $sql = "SELECT cu.*, ci.nombrecom, ci.numdoc, u.usuariof FROM cuaderno cu INNER JOIN cliente ci on cu.id_cliente = ci.id INNER JOIN usuario u on u.id = cu.id_usuario WHERE cu.estado != 'COTIZADO' AND cu.est = 'H' ORDER BY id_cua DESC LIMIT {$this->getOffset()},{$this->getLimite()};";
        $cuaderno = $this->db->query($sql);
        return $cuaderno;
    }

    //Busca y saca los pedidos de los usuarios - 5cuaderno
    public function getAllByUser(){
        $sql = "SELECT cu.*, ci.nombrecom, ci.numdoc FROM cuaderno cu INNER JOIN cliente ci on cu.id_cliente = ci.id WHERE cu.id_usuario = {$this->getId_Usuario()} AND cu.estado != 'COTIZADO' AND cu.est = 'H' ORDER BY cu.id DESC LIMIT {$this->getOffset()},{$this->getLimite()};";
        $cuaderno = $this->db->query($sql);
        return $cuaderno;
    }

    //Guardar listado de productos de un comprador - 6cuaderno
    public function save_pc($idc){
        foreach($_SESSION['carrito'] as $elemento){
            $producto = $elemento['producto'];

            $insert = "INSERT INTO producto_cuaderno Values(NULL, {$idc}, {$producto->id}, {$elemento['precio']}, {$elemento['unidades']}, 'H')";
            $save = $this->db->query($insert);
        }

        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

    /*
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
     */

    //Busca un registro de cuaderno en base al filtro, busca todos - 7cuaderno
    public function getfillcuad(){
        $sql = "SELECT cu.*, ci.nombrecom, ci.numdoc, u.usuariof FROM cuaderno cu INNER JOIN cliente ci on cu.id_cliente = ci.id INNER JOIN usuario u on u.id = cu.id_usuario WHERE cu.fecha like '%{$this->getFecha()}%' AND cu.id_cua like '%{$this->getId_cua()}%' AND cu.estado != 'COTIZADO' AND cu.est = 'H' ORDER BY id DESC;";
        $pedido = $this->db->query($sql);
        return $pedido;
    }

    //Busca un registro de cuaderno en base al filtro, busca solo de usuario - 8cuaderno
    public function getfillcuadus(){
        $sql = "SELECT cu.*, ci.nombrecom, ci.numdoc, u.usuariof FROM cuaderno cu INNER JOIN cliente ci on cu.id_cliente = ci.id INNER JOIN usuario u on u.id = cu.id_usuario WHERE cu.fecha like '%{$this->getFecha()}%' AND cu.id_cua like '%{$this->getId_cua()}%' AND cu.estado != 'COTIZADO' AND cu.id_usuario = {$this->getId_Usuario()} AND cu.est = 'H' ORDER BY id DESC;";
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
        $sql = "SELECT cu.*, ci.nombrecom FROM cuaderno cu INNER JOIN cliente ci on cu.id_cliente = ci.id WHERE cu.estado = 'ANULADO' AND cu.est = 'D' ORDER BY cu.id DESC LIMIT {$this->getOffset()},{$this->getLimite()};";
        $pedido = $this->db->query($sql);
        return $pedido;
    }

    //Saca la cantidad total de registros anulados - 12cuaderno
    public function getAlltotalA(){
        $cuaderno  = $this->db->query("SELECT * FROM cuaderno WHERE estado = 'ANULADO' AND est = 'D'");
        return $cuaderno->num_rows;
    }

    //Cambiar el estado a E_AZAPAMPA - 13cuaderno
    public function entregar(){
        $sql = "UPDATE cuaderno SET fecha_sal = CURDATE(), hora_sal = CURRENT_TIME(), estado = 'ENTREGADO AZAPAMPA' WHERE id = {$this->getId()};";
        $save = $this->db->query($sql);

        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

    //Busca los datos para restar la cantidad de stock - 14cuaderno
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
        $cuaderno  = $this->db->query("SELECT * FROM cuaderno WHERE estado != 'COTIZADO' AND est = 'H'");
        return $cuaderno->num_rows;
    }

    //busca todo los registros de un usuario - 17cuaderno
    public function getAlltotalu(){
        $cuaderno  = $this->db->query("SELECT * FROM cuaderno WHERE id_usuario = {$this->getId_Usuario()} AND estado != 'COTIZADO' AND est = 'H'");
        return $cuaderno->num_rows;
    }

    //Busca el id del ultimo registro cotización generado - 18cuaderno
    public function getidcuadulty(){
        $sql = "SELECT LAST_INSERT_ID() as 'id';";
        //$sql = "SELECT id FROM cuaderno ORDER BY id DESC limit 1;";
        $cuaderno = $this->db->query($sql);
        return $cuaderno->fetch_object();
    }

    //Registro de Cotización - 19cuaderno
    public function savecotiza(){
        $sql = "INSERT INTO cuaderno VALUES(NULL, NULL, {$this->getId_tienda()}, {$this->getId_usuario()}, {$this->getId_cliente()}, NULL, {$this->getTotal()}, NULL, NULL, NULL, {$this->getId_cot()}, CURDATE(), CURRENT_TIME(), NULL, NULL, NULL, NULL, 'COTIZADO', 'H');";
        $save = $this->db->query($sql);

        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

    //Busca todos los resultados de cotización - 20cuaderno
    public function getAllcoti(){
        $sql = "SELECT cu.*, ci.nombrecom, ci.numdoc FROM cuaderno cu INNER JOIN cliente ci on cu.id_cliente = ci.id WHERE cu.estado = 'COTIZADO' AND cu.est = 'H' ORDER BY id DESC LIMIT {$this->getOffset()},{$this->getLimite()};";
        $cuaderno = $this->db->query($sql);
        return $cuaderno;
    }

    //Busca y saca los pedidos de cotización - 21cuaderno
    public function getAllByUserC(){
        $sql = "SELECT cu.*, ci.nombrecom, ci.numdoc FROM cuaderno cu INNER JOIN cliente ci on cu.id_cliente = ci.id WHERE cu.id_usuario = {$this->getId_Usuario()} AND cu.estado = 'COTIZADO' AND cu.est = 'H' ORDER BY cu.id DESC LIMIT {$this->getOffset()},{$this->getLimite()};";
        $cuaderno = $this->db->query($sql);
        return $cuaderno;
    }

    //busca todo los registros de cotización - 22cuaderno
    public function getAlltotalcot(){
        $cuaderno  = $this->db->query("SELECT * FROM cuaderno WHERE estado = 'COTIZADO' AND est = 'H'");
        return $cuaderno->num_rows;
    }

    //busca todo los registros de cotización - 23cuaderno
    public function getAlltotalucot(){
        $cuaderno  = $this->db->query("SELECT * FROM cuaderno WHERE id_usuario = {$this->getId_Usuario()} AND estado = 'COTIZADO' AND est = 'H'");
        return $cuaderno->num_rows;
    }

    //Busca un registro de cotización en base al filtro, busca todos - 24cuaderno
    public function getfillcoti(){
        $sql = "SELECT cu.*, ci.nombrecom, ci.numdoc FROM cuaderno cu INNER JOIN cliente ci on cu.id_cliente = ci.id WHERE cu.fecha_cot like '%{$this->getFecha()}%' AND cu.id_cot like '%{$this->getId_cot()}%' AND cu.estado = 'COTIZADO' AND cu.est = 'H' ORDER BY id DESC;";
        $pedido = $this->db->query($sql);
        return $pedido;
    }

    //Busca un registro de cotización en base al filtro, busca solo de usuario - 25cuaderno
    public function getfillcotius(){
        $sql = "SELECT cu.*, ci.nombrecom, ci.numdoc FROM cuaderno cu INNER JOIN cliente ci on cu.id_cliente = ci.id WHERE cu.fecha_cot like '%{$this->getFecha()}%' AND cu.id_cot like '%{$this->getId_cot()}%' AND cu.estado = 'COTIZADO' AND cu.id_usuario = {$this->getId_Usuario()} AND cu.est = 'H' ORDER BY id DESC;";
        $pedido = $this->db->query($sql);
        return $pedido;
    }

    //Busca un solo registro a travez de id - 26cuaderno
    public function getOneCoti(){
        $sql = "SELECT cu.*, ci.nombrecom, ti.nombre as 'tienda', u.nombre, u.apellidos FROM cuaderno cu "
                . "INNER JOIN cliente ci on cu.id_cliente = ci.id INNER JOIN usuario u on cu.id_usuario = u.id "
                . "INNER JOIN tienda ti on cu.id_tienda = ti.id WHERE cu.id = {$this->getId()};";
        $cuaderno = $this->db->query($sql);
        return $cuaderno->fetch_object();
    }

    //Busca el id del ultimo registro generado de Cotizaciones - 27cuaderno
    public function getidcotiulty(){
        $sql = "SELECT id_cot from cuaderno ORDER BY id_cot DESC LIMIT 1;";
        $cuaderno = $this->db->query($sql);
        return $cuaderno->fetch_object();
    }

    //Edita para olcutar registro cotización - 28cuaderno
    public function edit_oculta_coti(){
        $sql = "UPDATE cuaderno SET estado = 'ANULADOC', est = 'D' WHERE id = {$this->getId()};";
        $save = $this->db->query($sql);

        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

    //Busca todos los registros anulados - 29cuaderno
    public function getAllByUserAcoti(){
        $sql = "SELECT cu.*, ci.nombrecom FROM cuaderno cu INNER JOIN cliente ci on cu.id_cliente = ci.id WHERE cu.estado = 'ANULADOC' AND cu.est = 'D' ORDER BY cu.id DESC LIMIT {$this->getOffset()},{$this->getLimite()};";
        $pedido = $this->db->query($sql);
        return $pedido;
    }

    //Saca la cantidad total de registros anulados - 30cuaderno
    public function getAlltotalAcoti(){
        $cuaderno  = $this->db->query("SELECT * FROM cuaderno WHERE estado = 'ANULADOC' AND est = 'D'");
        return $cuaderno->num_rows;
    }

    //Busca los datos para editar cotización - 31cuaderno
    public function getProdBycuad_edicoti($id){
        $sql = "SELECT p.id, c.id_cot, p.nombre, p.medida, p.imagen, pc.precio, pc.cantidad, l.nombre as 'linea', m.nombre as 'marca' FROM producto p "
                . "INNER JOIN producto_cuaderno pc ON p.id = pc.id_producto "
                . "INNER JOIN cuaderno c ON c.id = pc.id_cuaderno "
                . "INNER JOIN linea l ON l.id = p.id_linea "
                . "INNER JOIN marca m ON m.id = p.id_marca "
                . "WHERE pc.id_cuaderno = {$id} AND pc.est = 'H';";
        $producto = $this->db->query($sql);
        return $producto;
    }

    //Busca id_cotización - 32cuaderno
    public function getcoticuad($id){
        $sql = "SELECT id_cot FROM cuaderno WHERE id = {$id};";
        $cuaderno = $this->db->query($sql);
        return $cuaderno->fetch_object();
    }

    //Busca la cotización a partir de id_cotización - 33cuaderno
    public function getOneCotiza(){
        $sql = "SELECT c.id, c.id_cot, c.total, c.hora_cot, c.fecha_cot, c.estado, td.documento, cl.numdoc, cl.nombrecom "
                . "FROM cuaderno c "
                . "INNER JOIN cliente cl ON cl.id = c.id_cliente "
                . "INNER JOIN tipodoc td ON td.id = cl.id_tipodoc "
                . "WHERE c.id_cot = {$this->getId_cot()};";
        $cuaderno = $this->db->query($sql);
        return $cuaderno->fetch_object();
    }

    //Oculta los productos de cotización - 34cuaderno
    public function edit_oculta_cotiprod(){
        $sql = "UPDATE producto_cuaderno SET est = 'D' WHERE id_cuaderno = {$this->getId()};";
        $save = $this->db->query($sql);

        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

    //Cambia el monto de la Cotización - 35cuaderno
    public function edit_monto_coti(){
        $sql = "UPDATE cuaderno SET total = {$this->getTotal()} WHERE id = {$this->getId()};";
        $save = $this->db->query($sql);

        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

    //Busca el id del ultimo registro generado de Cuaderno - 36cuaderno
    public function getidcuadernoulty(){
        $sql = "SELECT id_cua from cuaderno ORDER BY id_cua DESC LIMIT 1;";
        $cuaderno = $this->db->query($sql);
        return $cuaderno->fetch_object();
    }

    //Busca la cotización a partir de id - 37cuaderno
    public function getOneCotizaid(){
        $sql = "SELECT c.id, c.id_cot, c.total, c.hora_cot, c.fecha_cot, c.estado, td.documento, cl.id as 'cliente', cl.numdoc, cl.nombrecom "
                . "FROM cuaderno c "
                . "INNER JOIN cliente cl ON cl.id = c.id_cliente "
                . "INNER JOIN tipodoc td ON td.id = cl.id_tipodoc "
                . "WHERE c.id = {$this->getId()};";
        $cuaderno = $this->db->query($sql);
        return $cuaderno->fetch_object();
    }

    //Guarda la Nota de Venta - 38cuaderno
    public function savecotinventa(){
        $sql = "UPDATE cuaderno SET id_cua = {$this->getId_cua()}, descripcion = '{$this->getDescripcion()}', situacion = '{$this->getSituacion()}', importe = {$this->getImporte()}, resto = {$this->getResto()}, fecha = CURDATE(), hora = CURRENT_TIME(), estado = 'VENDIDO' WHERE id = {$this->getId()};";
        $save = $this->db->query($sql);

        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

    //Cambiar el estado a E_HUANCAN - 39cuaderno
    public function entregarH(){
        $sql = "UPDATE cuaderno SET estado = 'ENTREGADO HUANCAN' WHERE id = {$this->getId()};";
        $save = $this->db->query($sql);

        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

    //Busca en base a un usuario - 40cuaderno
    public function getOneByUsercotiza(){
        $sql = "SELECT id, id_cua, id_cot, total, situacion, importe, resto, fecha, fecha_cot, estado FROM cuaderno WHERE id_usuario = {$this->getId_usuario()} ORDER BY id_cot DESC LIMIT 1;";
        $cuaderno = $this->db->query($sql);
        return $cuaderno->fetch_object();
    }

    //Edita para olcutar registro de productos de cotización - 34cuaderno

    ////
    ////
    ////
    
    /*
    public function getAll(){
        $cuaderno = $this->db->query("SELECT * FROM cuaderno ORDER BY id DESC;");
        return $cuaderno;
    }
    */

    //Edita Datos del Cuaderno - 41cuaderno
    public function editacua(){
        $sql = "UPDATE cuaderno SET id_usuario = {$this->getId_usuario()} , descripcion = '{$this->getDescripcion()}', situacion = '{$this->getSituacion()}', total = {$this->getTotal()}, importe = {$this->getImporte()}, resto = {$this->getResto()}, fecha = '{$this->getFecha()}' WHERE id = {$this->getId()};";
        $save = $this->db->query($sql);

        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

    //Edita Datos del Cuaderno con fecha salida - 42cuaderno
    public function editacuafs(){
        $sql = "UPDATE cuaderno SET id_usuario = {$this->getId_usuario()} , descripcion = '{$this->getDescripcion()}', situacion = '{$this->getSituacion()}', total = {$this->getTotal()}, importe = {$this->getImporte()}, resto = {$this->getResto()}, fecha = '{$this->getFecha()}', fecha_sal = '{$this->getFecha_sal()}' WHERE id = {$this->getId()};";
        $save = $this->db->query($sql);

        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }
}