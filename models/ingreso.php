<?Php

Class ingreso{
    private $id;
    private $id_tienda;
    private $id_cliente;
    private $id_cuaderno;
    private $tipopago;
    private $ingresos;
    private $deudas;
    private $fecha;
    private $hora;
    private $turno;
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
    //Guardar Registro de Ingresos - 1Egreso
    public function save(){
        $insert = "INSERT INTO ingreso VALUES(NULL, {$this->getId_tienda()}, {$this->getId_cliente()}, {$this->getId_cuaderno()}, '{$this->getTipopago()}', {$this->getIngresos()}, {$this->getDeudas()}, CURDATE(), CURRENT_TIME(), '{$this->getTurno()}', 'H');";
        $save = $this->db->query($insert);
        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

    //Muestra todos los registros de Ingreso - 2Ingreso
    Public function getall(){
        $sql = "SELECT i.id, i.tipopago, i.ingresos, i.deudas, i.fecha, i.turno, t.nombre as 'tienda', c.nombrecom as 'cliente', cu.id as 'cuaderno' FROM ingreso i "
                . "INNER JOIN tienda t on t.id = i.id_tienda "
                . "INNER JOIN cliente c on c.id = i.id_cliente "
                . "INNER JOIN cuaderno cu on cu.id = i.id_cuaderno "
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
        $sql = "SELECT i.id, i.tipopago, i.ingresos, i.deudas, i.fecha, i.turno, t.nombre as 'tienda', c.nombrecom as 'cliente', cu.id as 'cuaderno' FROM ingreso i "
                . "INNER JOIN tienda t on t.id = i.id_tienda "
                . "INNER JOIN cliente c on c.id = i.id_cliente "
                . "INNER JOIN cuaderno cu on cu.id = i.id_cuaderno "
                . "WHERE i.fecha = '{$this->getFecha()}' AND i.turno = '{$this->getTurno()}' AND i.est = 'H' ORDER BY id DESC;";
        $ingreso = $this->db->query($sql);
        return $ingreso;
    }
    //Muestra el monto de los registros en efectivo de Ingreso para Arqueo - 5Ingreso
    Public function getall_Ari_in_ef(){
        $sql = "SELECT ingresos FROM ingreso "
                . "WHERE tipopago = 'EFECTIVO'  AND fecha = '{$this->getFecha()}' AND turno = '{$this->getTurno()}' AND est = 'H' ORDER BY id DESC;";
        $egreso = $this->db->query($sql);
        return $egreso;
    }
    //Muestra el monto de los registros en transferencia de Ingreso para Arqueo - 6Ingreso
    Public function getall_Ari_in_tr(){
        $sql = "SELECT ingresos FROM ingreso "
                . "WHERE tipopago = 'TRANSFERENCIA'  AND fecha = '{$this->getFecha()}' AND turno = '{$this->getTurno()}' AND est = 'H' ORDER BY id DESC;";
        $egreso = $this->db->query($sql);
        return $egreso;
    }
    //Muestra el monto de los registros en deuda de Ingreso para Arqueo - 7Ingreso
    Public function getall_Ari_in_deu(){
        $sql = "SELECT deudas FROM ingreso "
                . "WHERE fecha = '{$this->getFecha()}' AND turno = '{$this->getTurno()}' AND est = 'H' ORDER BY id DESC;";
        $egreso = $this->db->query($sql);
        return $egreso;
    }
}

?>