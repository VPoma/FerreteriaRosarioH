<?Php

Class tienda{
    private $id;
    private $id_ciudad;
    private $nombre;
    private $direccion;
    private $est;
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

    function getNombre(){
        return $this->nombre;
    }

    function getDireccion(){
        return $this->direccion;
    }
    
    function getEst(){
        return $this->est;
    }

    function setId($id){
        $this->id = $id;
    }

    function setId_ciudad($id_ciudad){
        $this->id_ciudad = $id_ciudad;
    }

    function setNombre($nombre){
        $this->nombre = $this->db->real_escape_string($nombre);
    }

    function setdireccion($direccion){
        $this->direccion = $this->db->real_escape_string($direccion);
    }

    function setEst($est){
        $this->est = $this->db->real_escape_string($est);
    }

    //Consultas

    //Mostrar todos los registros de la tabla Tienda - NO BORRAR ESTE COMENTARIO
    //SERVIRA CUANDO SE MIGRE E INTEGRE EL SISTEMA EN LA WEB!
    /*
    public function getAll(){
        $tienda = $this->db->query("SELECT * FROM tienda WHERE est = 'H' ORDER BY id DESC;");
        return $tienda;
    }
    */
    //Mostrar solo la tienda "Azapampa"
    public function getAll(){
        $tienda = $this->db->query("SELECT * FROM tienda WHERE id = '1';");
        return $tienda;
    }

    //Registra de tienda(Guardar)
    public function save(){
        $sql = "INSERT INTO tienda VALUES(NULL, {$this->getId_ciudad()}, '{$this->getnombre()}', '{$this->getdireccion()}','H');";
        $save = $this->db->query($sql);
        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

    //Busca y muestra un solo registro
    public function getone(){
        $tienda = $this->db->query("SELECT * FROM tienda WHERE id = {$this->getId()} ORDER BY id DESC;");
        return $tienda->fetch_object();
    }

    //Editar registro de tienda
    public function edit(){
        $sql = "UPDATE tienda SET id_ciudad = {$this->getId_ciudad()}, nombre = '{$this->getNombre()}', direccion = '{$this->getDireccion()}' WHERE id = {$this->getId()};";
        $save = $this->db->query($sql);

        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

    //Editar A fin de Ocultar
    public function edit_oculta(){
        $sql = "UPDATE tienda SET est = 'D' WHERE id = {$this->getId()};";
        $save = $this->db->query($sql);

        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

}

?>