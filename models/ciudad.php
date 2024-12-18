<?Php

class ciudad{
    private $id;
    private $nombre;
    private $est;
    private $db;

    public function __construct(){
        $this->db = Database::connect();
    }

    function getId(){
        return $this->id;
    }

    function getNombre(){
        return $this->nombre;
    }

    function getEst(){
        return $this->est;
    }

    function setId($id){
        $this->id = $id;
    }

    function setNombre($nombre){
        $this->nombre = $this->db->real_escape_string($nombre);
    }

    function setEst($est){
        $this->est = $this->db->real_escape_string($est);
    }

    //Consultas
    
    //Mostrar todos los registros de la tabla
    public function getAll(){
        $ciudad = $this->db->query("SELECT * FROM ciudad WHERE est = 'H' ORDER BY id DESC;");
        return $ciudad;
    }

    //Registra de ciudad(Guardar)
    public function save(){
        $sql = "INSERT INTO ciudad VALUES(NULL, '{$this->getnombre()}', 'H');";
        $save = $this->db->query($sql);
        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

    //Busca y muestra un solo registro
    public function getone(){
        $ciudad = $this->db->query("SELECT * FROM ciudad WHERE id = {$this->getId()} ORDER BY id DESC;");
        return $ciudad->fetch_object();
    }

    //Editar registro de ciudad
    public function edit(){
        $sql = "UPDATE ciudad SET nombre = '{$this->getNombre()}' WHERE id = {$this->getId()};";
        $save = $this->db->query($sql);

        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

    //Editar A fin de Ocultar
    public function edit_oculta(){
        $sql = "UPDATE ciudad SET est = 'D' WHERE id = {$this->getId()};";
        $save = $this->db->query($sql);

        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

}

?>