<?Php

Class ingreso{
    private $id;
    private $id_tienda;
    private $id_cliente;
    private $id_cuaderno;
    private $tipopago;
    private $ingreso;
    private $deuda;
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

    function getIngreso(){
        return $this->ingreso;
    }

    function getDeuda(){
        return $this->deuda;
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

    function setIngreso($ingreso){
        $this->ingreso = $ingreso;
    }

    function setDeuda($deuda){
        $this->deuda = $deuda;
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
    //Guardar Registro de Egresos - 1Egreso
    public function save(){
        $insert = "INSERT INTO ingreso VALUES(NULL, {$this->getId_tienda()}, {$this->getId_cliente()}, {$this->getId_cuaderno()}, '{$this->getTipopago()}', {$this->getIngreso()}, {$this->getDeuda()}, CURDATE(), CURRENT_TIME(), '{$this->getTurno()}', 'H');";
        $save = $this->db->query($insert);
        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }


}

?>