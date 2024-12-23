<?php
Class proveedor{
    private $id;
    private $id_ciudad;
    private $numruc;
    private $nombrecom;
    private $direccion;
    private $numcel;
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

    function getId_ciudad(){
        return $this->id_ciudad;
    }

    function getNumruc(){
        return $this->numruc;
    }

    function getNombrecom(){
        return $this->nombrecom;
    }

    function getDireccion(){
        return $this->direccion;
    }

    function getNumcel(){
        return $this->numcel;
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

    function setId_ciudad($id_ciudad){
        $this->id_ciudad = $id_ciudad;
    }

    function setNumruc($numruc){
        $this->numruc = $numruc;
    }

    function setNombrecom($nombrecom){
        $this->nombrecom = $this->db->real_escape_string($nombrecom);
    }

    function setDireccion($direccion){
        $this->direccion = $this->db->real_escape_string($direccion);
    }

    function setNumcel($numcel){
        $this->numcel = $numcel;
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

    //Registra Proveedor -1proveedor
    public function save(){
        $sql = "INSERT INTO proveedor VALUES(NULL, {$this->getId_ciudad()}, '{$this->getNumruc()}', '{$this->getNombrecom()}', '{$this->getDireccion()}', '{$this->getNumcel()}', 'H');";
        $save = $this->db->query($sql);
        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

    //Muestra los dotos de todos Proveedores -2proveedor
    public function getAll(){
        $proveedor = $this->db->query("SELECT pv.*, ci.nombre as 'ciudad' FROM proveedor pv INNER JOIN ciudad ci ON ci.id = pv.id_ciudad WHERE pv.est = 'H' ORDER BY id DESC LIMIT {$this->getOffset()},{$this->getLimite()};");
        return $proveedor;
    }

    //Muestra la cantidad de filas de la tabla proveedor -3proveedor
    public function getAlltotal(){
        $proveedor  = $this->db->query("SELECT * FROM proveedor WHERE est = 'H'");
        return $proveedor->num_rows;
    }

    //FILTRO - 4proveedor
    public function getFiltro(){
        $sql = "SELECT pv.*, ci.nombre as 'ciudad' FROM proveedor pv " 
                . "INNER JOIN ciudad ci ON ci.id = pv.id_ciudad "
                . "WHERE pv.numruc like '%{$this->getNumruc()}%' "
                . "AND pv.nombrecom like '%{$this->getNombrecom()}%' AND pv.est = 'H' ORDER BY id DESC;";
        $proveedor = $this->db->query($sql);
        return $proveedor;
    }

    //Muestra a un proveedor buscado a partir de su "ID" - 5proveedor
    public function getone(){
        $cliente = $this->db->query("SELECT pv.*, ci.nombre as 'ciudad' FROM proveedor pv INNER JOIN ciudad ci ON ci.id = pv.id_ciudad WHERE pv.id = {$this->getId()} ORDER BY id DESC;");
        return $cliente->fetch_object();
    }    

    //Edita al Proveedor - 6proveedor
    public function edit(){
        $sql = "UPDATE proveedor SET id_ciudad = {$this->getId_ciudad()}, numruc = '{$this->getNumruc()}', nombrecom = '{$this->getNombrecom()}', direccion = '{$this->getDireccion()}', numcel = '{$this->getNumcel()}' WHERE id = {$this->getId()};";
        $save = $this->db->query($sql);

        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

    //Edita para ocultar al Proveedor - 7proveedor
    public function edit_oculta(){
        $sql = "UPDATE proveedor SET est = 'D' WHERE id = {$this->getId()};";
        $save = $this->db->query($sql);

        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

    //Busca y muestra a todos los proveedores - 8proveedor
    public function getAllp(){
        $proveedor = $this->db->query("SELECT p.*, ci.nombre as 'ciudad' FROM proveedor p INNER JOIN ciudad ci ON ci.id = p.id_ciudad WHERE p.est = 'H' ORDER BY id DESC;");
        return $proveedor;
    }

    //Busqueda despues de crear para registro de abastecimiento - 9proveedor
    public function getprovregabs(){
        $proveedor = $this->db->query("SELECT * FROM proveedor WHERE numruc = {$this->getNumruc()} ORDER BY id DESC;");
        return $proveedor->fetch_object();
    }
    
}

?>