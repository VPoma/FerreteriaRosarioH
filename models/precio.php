<?Php

class precio{
    private $id;
    private $id_producto;
    private $tipocam;
    private $toneladab;
    private $toneladaf;
    private $toneladac;
    private $preciob;
    private $preciof;
    private $precioc;
    private $fecha;
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

    function getId_producto(){
        return $this->id_producto;
    }

    function getTipocam(){
        return $this->tipocam;
    }

    function getToneladab(){
        return $this->toneladab;
    }

    function getToneladaf(){
        return $this->toneladaf;
    }

    function getToneladac(){
        return $this->toneladac;
    }

    function getPreciob(){
        return $this->preciob;
    }

    function getPreciof(){
        return $this->preciof;
    }

    function getPrecioc(){
        return $this->precioc;
    }

    function getFecha(){
        return $this->fecha;
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

    function setId_producto($id_producto){
        $this->id_producto = $id_producto;
    }

    function setTipocam($tipocam){
        $this->tipocam = $tipocam;
    }

    function setToneladab($toneladab){
        $this->toneladab = $toneladab;
    }

    function setToneladaf($toneladaf){
        $this->toneladaf = $toneladaf;
    }

    function setToneladac($toneladac){
        $this->toneladac = $toneladac;
    }

    function setPreciob($preciob){
        $this->preciob = $preciob;
    }

    function setPreciof($preciof){
        $this->preciof = $preciof;
    }

    function setPrecioc($precioc){
        $this->precioc = $precioc;
    }

    function setFecha($fecha){
        $this->fecha = $fecha;
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

    //Precio Controller
    //muestra todos los registros de precio- 1precio
    public function getAll(){
        $sql = "select pe.id, l.nombre as 'linea', m.nombre as 'marca', po.nombre, po.medida, po.paquete, pe.toneladab, pe.toneladaf, pe.toneladac, pe.tipocam, pe.preciob, pe.preciof, pe.precioc, pe.fecha "
                . "from precio pe INNER JOIN producto po ON po.id = pe.id_producto INNER JOIN marca m ON m.id = po.id_marca INNER JOIN linea l ON l.id = po.id_linea ORDER BY id DESC;";
        $precio = $this->db->query($sql);
        return $precio;
    }

    //Guardar Precios - 2precio
    public function save(){
        $sql = "INSERT INTO precio VALUES(NULL, {$this->getId_producto()}, {$this->getTipocam()}, {$this->getToneladab()}, {$this->getToneladaf()}, {$this->getToneladac()}, {$this->getPreciob()}, {$this->getPreciof()}, {$this->getPrecioc()}, CURDATE(), 'H');";
        $save = $this->db->query($sql);
        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }
    
    //Eliminar precio fierro - 3precio
    public function delete(){
        $sql = "DELETE FROM precio WHERE id_producto = {$this->getId_producto()} AND fecha = '{$this->getFecha()}'";
        $delete = $this->db->query($sql);

        $result = false;
        if($delete){
            $result = true;
        }

        return $result;
    }

    //Muestra precio fierro - 4precio
    public function getpfierro(){
        $sql = "SELECT id_producto, preciob, preciof, precioc FROM precio WHERE fecha = CURDATE();";
        $precio = $this->db->query($sql);
        return $precio;
    }

    ////
    ////
    ////

    public function getAlltabla(){
        $sql = "select pe.id, l.nombre as 'linea', m.nombre as 'marca', po.nombre, po.medida, po.paquete, pe.toneladab, pe.toneladaf, pe.toneladac, pe.tipocam, pe.preciob, pe.preciof, pe.precioc, pe.fecha "
                . "from precio pe INNER JOIN producto po ON po.id = pe.id_producto INNER JOIN marca m ON m.id = po.id_marca INNER JOIN linea l ON l.id = po.id_linea WHERE pe.fecha like '%{$this->getFecha()}%' ORDER BY id DESC;";
        $precio = $this->db->query($sql);
        return $precio;
    }

}

?>