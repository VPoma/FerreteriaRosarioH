<?Php

class cliente{
    private $id;
    private $id_ciudad;
    private $id_tipodoc;
    private $numdoc;
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

    function getId_tipodoc(){
        return $this->id_tipodoc;
    }

    function getNumdoc(){
        return $this->numdoc;
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

    function setId_tipodoc($id_tipodoc){
        $this->id_tipodoc = $id_tipodoc;
    }

    function setNumdoc($numdoc){
        $this->numdoc = $numdoc;
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
    public function save(){
        $sql = "INSERT INTO cliente VALUES(NULL, {$this->getId_ciudad()}, {$this->getId_tipodoc()}, '{$this->getNumdoc()}', '{$this->getNombrecom()}', '{$this->getDireccion()}', '{$this->getNumcel()}', 'H');";
        $save = $this->db->query($sql);
        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

    public function getAll(){
        $cliente = $this->db->query("SELECT c.*, td.documento, ci.nombre as 'ciudad' FROM cliente c INNER JOIN tipodoc td ON td.id = c.id_tipodoc INNER JOIN ciudad ci ON ci.id = c.id_ciudad WHERE c.est = 'H' ORDER BY id DESC LIMIT {$this->getOffset()},{$this->getLimite()};");
        return $cliente;
    }

    public function getAllc(){
        $cliente = $this->db->query("SELECT c.*, td.documento, ci.nombre as 'ciudad' FROM cliente c INNER JOIN tipodoc td ON td.id = c.id_tipodoc INNER JOIN ciudad ci ON ci.id = c.id_ciudad WHERE c.est = 'H' ORDER BY id DESC;");
        return $cliente;
    }

    //FILTRO
    public function getFiltro(){
        $sql = "SELECT c.*, td.documento, ci.nombre as 'ciudad' FROM cliente c " 
                . "INNER JOIN tipodoc td ON td.id = c.id_tipodoc " 
                . "INNER JOIN ciudad ci ON ci.id = c.id_ciudad "
                . "WHERE c.numdoc like '%{$this->getNumdoc()}%' "
                . "AND c.nombrecom like '%{$this->getNombrecom()}%' AND c.est = 'H' ORDER BY id DESC;";
        $ticket = $this->db->query($sql);
        return $ticket;
    }

    public function getAlltotal(){
        $cliente  = $this->db->query("SELECT * FROM cliente WHERE est = 'H'");
        return $cliente->num_rows;
    }

    public function getone(){
        $cliente = $this->db->query("SELECT c.*, td.documento, ci.nombre as 'ciudad' FROM cliente c INNER JOIN tipodoc td ON td.id = c.id_tipodoc INNER JOIN ciudad ci ON ci.id = c.id_ciudad WHERE c.id = {$this->getId()} ORDER BY id DESC;");
        return $cliente->fetch_object();
    }    

    public function edit(){
        $sql = "UPDATE cliente SET id_ciudad = {$this->getId_ciudad()}, id_tipodoc = {$this->getId_tipodoc()}, numdoc = '{$this->getNumdoc()}', nombrecom = '{$this->getNombrecom()}', direccion = '{$this->getDireccion()}', numcel = '{$this->getNumcel()}' WHERE id = {$this->getId()};";
        $save = $this->db->query($sql);

        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

    public function edit_oculta(){
        $sql = "UPDATE cliente SET est = 'D' WHERE id = {$this->getId()};";
        $save = $this->db->query($sql);

        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

    //Busqueda despues de crear para registro de Cuaderno
    public function getclienregcuad(){
        $cliente = $this->db->query("SELECT * FROM cliente WHERE numdoc = {$this->getNumdoc()} ORDER BY id DESC;");
        return $cliente->fetch_object();
    }

}


?>