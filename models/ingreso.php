<?Php

Class ingreso{
    private $id;
    private $id_tienda;
    private $id_usuario;
    private $id_cliente;
    private $id_cuaderno;
    private $tipopago;
    private $ingresos;
    private $deudas;
    private $fecha;
    private $hora;
    private $turno;
    private $descripcion;
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

    function getId_tienda(){
        return $this->id_tienda;
    }

    function getId_usuario(){
        return $this->id_usuario;
    }

    function getId_cliente(){
        return $this->id_cliente;
    }

    function getId_cuaderno(){
        return $this->id_cuaderno;
    }

    function getTipopago(){
        return $this->tipopago;
    }

    function getIngresos(){
        return $this->ingresos;
    }

    function getDeudas(){
        return $this->deudas;
    }

    function getFecha(){
        return $this->fecha;
    }

    function getHora(){
        return $this->hora;
    }

    function getTurno(){
        return $this->turno;
    }

    function getDescripcion(){
        return $this->descripcion;
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

    function setId_tienda($id_tienda){
        $this->id_tienda = $id_tienda;
    }

    function setId_usuario($id_usuario){
        $this->id_usuario = $id_usuario;
    }

    function setId_cliente($id_cliente){
        $this->id_cliente = $id_cliente;
    }

    function setId_cuaderno($id_cuaderno){
        $this->id_cuaderno = $id_cuaderno;
    }

    function setTipopago($tipopago){
        $this->tipopago = $this->db->real_escape_string($tipopago);
    }

    function setIngresos($ingresos){
        $this->ingresos = $ingresos;
    }

    function setDeudas($deudas){
        $this->deudas = $deudas;
    }

    function setFecha($fecha){
        $this->fecha = $fecha;
    }

    function setHora($hora){
        $this->hora = $hora;
    }

    function setTurno($turno){
        $this->turno = $this->db->real_escape_string($turno);
    }

    function setDescripcion($descripcion){
        $this->descripcion = $this->db->real_escape_string($descripcion);
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

    //Consutas
    //Guardar Registro de Ingresos - 1Ingreso
    public function save(){
        $insert = "INSERT INTO ingreso VALUES(NULL, {$this->getId_tienda()}, {$this->getId_usuario()}, {$this->getId_cliente()}, {$this->getId_cuaderno()}, '{$this->getTipopago()}', {$this->getIngresos()}, {$this->getDeudas()}, CURDATE(), CURRENT_TIME(), '{$this->getTurno()}', 'N/A', 'H');";
        $save = $this->db->query($insert);
        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

    //Muestra todos los registros de Ingreso - 2Ingreso
    Public function getall(){
        $sql = "SELECT i.id, i.tipopago, i.ingresos, i.deudas, i.fecha, i.turno, i.descripcion, t.nombre as 'tienda', c.nombrecom as 'cliente', cu.id_cua as 'cuaderno', cu.descripcion as 'describecu', u.usuariof as 'usuario' FROM ingreso i "
                . "INNER JOIN tienda t on t.id = i.id_tienda "
                . "LEFT JOIN usuario u on u.id = i.id_usuario "
                . "LEFT JOIN cliente c on c.id = i.id_cliente "
                . "LEFT JOIN cuaderno cu on cu.id = i.id_cuaderno "
                . "WHERE i.est = 'H' ORDER BY id DESC LIMIT {$this->getOffset()},{$this->getLimite()};";
        $ingreso = $this->db->query($sql);
        return $ingreso;
    }

    //Saca la cantidad de lineas - 3Ingreso
    public function getAlltotal(){
        $ingreso  = $this->db->query("SELECT * FROM ingreso WHERE est = 'H'");
        return $ingreso->num_rows;
    }

    //Muestra todos los registros de Ingreso para arqueo en base a fecha y turno - 4Ingreso
    Public function getall_Ari(){
        $sql = "SELECT i.id, i.tipopago, i.ingresos, i.deudas, i.fecha, i.turno, i.descripcion, t.nombre as 'tienda', c.nombrecom as 'cliente', cu.id_cua as 'cuaderno', cu.descripcion as 'describecu', u.usuariof as 'usuario' FROM ingreso i "
                . "INNER JOIN tienda t on t.id = i.id_tienda "
                . "LEFT JOIN usuario u on u.id = i.id_usuario "
                . "LEFT JOIN cliente c on c.id = i.id_cliente "
                . "LEFT JOIN cuaderno cu on cu.id = i.id_cuaderno "
                . "WHERE i.fecha = '{$this->getFecha()}' AND i.turno = '{$this->getTurno()}' AND i.est = 'H' ORDER BY id DESC;";
        $ingreso = $this->db->query($sql);
        return $ingreso;
    }
    //Muestra el monto de los registros en efectivo de Ingreso para Arqueo - 5Ingreso
    Public function getall_Ari_in_ef(){
        $sql = "SELECT ingresos FROM ingreso "
                . "WHERE tipopago = 'EFECTIVO'  AND fecha = '{$this->getFecha()}' AND turno = '{$this->getTurno()}' AND est = 'H' ORDER BY id DESC;";
        $ingreso = $this->db->query($sql);
        return $ingreso;
    }
    //Muestra el monto de los registros en transferencia de Ingreso para Arqueo - 6Ingreso
    Public function getall_Ari_in_tr(){
        $sql = "SELECT ingresos FROM ingreso "
                . "WHERE tipopago != 'EFECTIVO'  AND fecha = '{$this->getFecha()}' AND turno = '{$this->getTurno()}' AND est = 'H' ORDER BY id DESC;";
        $ingreso = $this->db->query($sql);
        return $ingreso;
    }
    //Muestra el monto de los registros en deuda de Ingreso para Arqueo - 7Ingreso
    Public function getall_Ari_in_deu(){
        $sql = "SELECT deudas FROM ingreso "
                . "WHERE fecha = '{$this->getFecha()}' AND turno = '{$this->getTurno()}' AND est = 'H' ORDER BY id DESC;";
        $ingreso = $this->db->query($sql);
        return $ingreso;
    }

    //Guardar Registro de Ingresos no cuaderno - 8Ingreso
    public function savein(){
        $insert = "INSERT INTO ingreso VALUES(NULL, {$this->getId_tienda()}, {$this->getId_usuario()}, NULL, NULL, '{$this->getTipopago()}', {$this->getIngresos()},0.00, CURDATE(), CURRENT_TIME(), '{$this->getTurno()}', '{$this->getDescripcion()}', 'H');";
        $save = $this->db->query($insert);
        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

    //Busca un solo registro de Ingreso a travez de id - 9Ingreso
    public function getOne(){
        $sql = "SELECT i.id, i.tipopago, i.ingresos, i.turno, i.descripcion, i.fecha, t.nombre as 'tienda', cu.id_cua as 'cuaderno' FROM ingreso i "
                . "INNER JOIN tienda t on t.id = i.id_tienda "
                . "LEFT JOIN cuaderno cu on cu.id = i.id_cuaderno "
                . "WHERE i.id = {$this->getId()};";
        $ingreso = $this->db->query($sql);
        return $ingreso->fetch_object();
    }

    //Editar registro de ingreso - 10Ingreso
    public function edit(){
        $sql = "UPDATE ingreso SET descripcion = '{$this->getDescripcion()}', tipopago = '{$this->getTipopago()}', ingresos = {$this->getingresos()}, fecha = '{$this->getFecha()}' WHERE id = {$this->getId()};";
        $save = $this->db->query($sql);

        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

    //Editar A fin de Ocultar - 11Ingreso
    public function edit_oculta(){
        $sql = "UPDATE ingreso SET est = 'D' WHERE id = {$this->getId()};";
        $save = $this->db->query($sql);

        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

    //Muestra todos los registros de Ingreso para arqueo en base a fecha - 12Ingreso
    Public function getall_Arit(){
        $sql = "SELECT i.id, i.tipopago, i.ingresos, i.deudas, i.fecha, i.turno, i.descripcion, t.nombre as 'tienda', c.nombrecom as 'cliente', cu.id_cua as 'cuaderno', cu.descripcion as 'describecu', u.usuariof as 'usuario' FROM ingreso i "
                . "INNER JOIN tienda t on t.id = i.id_tienda "
                . "LEFT JOIN usuario u on u.id = i.id_usuario "
                . "LEFT JOIN cliente c on c.id = i.id_cliente "
                . "LEFT JOIN cuaderno cu on cu.id = i.id_cuaderno "
                . "WHERE i.fecha = '{$this->getFecha()}' AND i.est = 'H' ORDER BY id DESC;";
        $ingreso = $this->db->query($sql);
        return $ingreso;
    }
    //Muestra el monto total de los registros en efectivo de Ingreso para Arqueo - 13Ingreso
    Public function getall_Ari_in_eft(){
        $sql = "SELECT ingresos FROM ingreso "
                . "WHERE tipopago = 'EFECTIVO'  AND fecha = '{$this->getFecha()}' AND est = 'H' ORDER BY id DESC;";
        $ingreso = $this->db->query($sql);
        return $ingreso;
    }
    //Muestra el monto total de los registros en transferencia de Ingreso para Arqueo - 14Ingreso
    Public function getall_Ari_in_trt(){
        $sql = "SELECT ingresos FROM ingreso "
                . "WHERE tipopago != 'EFECTIVO'  AND fecha = '{$this->getFecha()}' AND est = 'H' ORDER BY id DESC;";
        $ingreso = $this->db->query($sql);
        return $ingreso;
    }
    //Muestra el monto total de los registros en deuda de Ingreso para Arqueo - 15Ingreso
    Public function getall_Ari_in_deut(){
        $sql = "SELECT deudas FROM ingreso "
                . "WHERE fecha = '{$this->getFecha()}' AND est = 'H' ORDER BY id DESC;";
        $ingreso = $this->db->query($sql);
        return $ingreso;
    }

    //Editar A fin de Ocultar Ingreso Cuaderno - 16Ingreso
    public function edit_oculta_ci(){
        $sql = "UPDATE ingreso SET est = 'D' WHERE id_cuaderno = {$this->getId_cuaderno()};";
        $save = $this->db->query($sql);

        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

}

?>