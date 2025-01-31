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

    //Cliente Controller

    //Edita Registro Cliente - 0cliente
    public function edit(){
        $sql = "UPDATE cliente SET id_ciudad = {$this->getId_ciudad()}, id_tipodoc = {$this->getId_tipodoc()}, numdoc = '{$this->getNumdoc()}', nombrecom = '{$this->getNombrecom()}', direccion = '{$this->getDireccion()}', numcel = '{$this->getNumcel()}' WHERE id = {$this->getId()};";
        $save = $this->db->query($sql);

        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

    //Guardar cliente - 1cliente
    public function save(){
        $sql = "INSERT INTO cliente VALUES(NULL, {$this->getId_ciudad()}, {$this->getId_tipodoc()}, '{$this->getNumdoc()}', '{$this->getNombrecom()}', '{$this->getDireccion()}', '{$this->getNumcel()}', 'H');";
        $save = $this->db->query($sql);
        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

    //Mostrar todos los registros - 2cliente
    public function getAll(){
        $cliente = $this->db->query("SELECT c.*, td.documento, ci.nombre as 'ciudad' FROM cliente c INNER JOIN tipodoc td ON td.id = c.id_tipodoc INNER JOIN ciudad ci ON ci.id = c.id_ciudad WHERE c.est = 'H' ORDER BY id DESC LIMIT {$this->getOffset()},{$this->getLimite()};");
        return $cliente;
    }

    //Saca la cantidad de lineas - 3cliente
    public function getAlltotal(){
        $cliente  = $this->db->query("SELECT * FROM cliente WHERE est = 'H'");
        return $cliente->num_rows;
    }

    //FILTRO
    //Filtro de registros - 4cliente
    public function getFiltro(){
        $sql = "SELECT c.*, td.documento, ci.nombre as 'ciudad' FROM cliente c " 
                . "INNER JOIN tipodoc td ON td.id = c.id_tipodoc " 
                . "INNER JOIN ciudad ci ON ci.id = c.id_ciudad "
                . "WHERE c.numdoc like '%{$this->getNumdoc()}%' "
                . "AND c.nombrecom like '%{$this->getNombrecom()}%' AND c.est = 'H' ORDER BY id DESC;";
        $cliente = $this->db->query($sql);
        return $cliente;
    }

    //Muestra un solo registro en base a un id - 5cliente
    public function getone(){
        $cliente = $this->db->query("SELECT c.*, td.documento, ci.nombre as 'ciudad' FROM cliente c INNER JOIN tipodoc td ON td.id = c.id_tipodoc INNER JOIN ciudad ci ON ci.id = c.id_ciudad WHERE c.id = {$this->getId()} ORDER BY id DESC;");
        return $cliente->fetch_object();
    }
    
    //Edita para ocultar un registro - 6cliente
    public function edit_oculta(){
        $sql = "UPDATE cliente SET est = 'D' WHERE id = {$this->getId()};";
        $save = $this->db->query($sql);

        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

    //Cuaderno Controller
    
    //Saca todos los clientes para el controlador cuaderno - 7cliente
    public function getAllc(){
        $sql = "SELECT c.id, c.numdoc, c.nombrecom, c.direccion, c.numcel, td.documento, ci.nombre as 'ciudad', COALESCE(COUNT(cu.id), 0) AS 'total_ventas' " 
                . "FROM cliente c "
                . "LEFT JOIN cuaderno cu ON cu.id_cliente = c.id "
                . "INNER JOIN tipodoc td ON td.id = c.id_tipodoc " 
                . "INNER JOIN ciudad ci ON ci.id = c.id_ciudad "
                . "WHERE c.est = 'H' "
                . "GROUP BY c.nombrecom "
                . "ORDER BY total_ventas DESC "
                . "LIMIT 10";
        $cliente = $this->db->query($sql);
        return $cliente;
    }

    //Busqueda despues de crear para registro de Cuaderno - 8cliente
    public function getclienregcuad(){
        $cliente = $this->db->query("SELECT * FROM cliente WHERE numdoc = {$this->getNumdoc()} ORDER BY id DESC;");
        return $cliente->fetch_object();
    }

}

?>