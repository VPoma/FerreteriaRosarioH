<?Php

class Marca{
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
        $marca = $this->db->query("SELECT * FROM marca WHERE est = 'H' ORDER BY nombre;");
        return $marca;
    }

    //Consulta para Helpers busqueda de marca de fierros para actualizar precios
    public function getAllFi(){
        $marca = $this->db->query("SELECT * FROM marca WHERE est = 'H' AND id < 3 ORDER BY id DESC;");
        return $marca;
    }

    //Registra de marca(Guardar)
    public function save(){
        $sql = "INSERT INTO marca VALUES(NULL, '{$this->getnombre()}', 'H');";
        $save = $this->db->query($sql);
        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

    //Busca y muestra un solo registro
    public function getone(){
        $marca = $this->db->query("SELECT * FROM marca WHERE id = {$this->getId()} ORDER BY id DESC;");
        return $marca->fetch_object();
    }

    //Editar registro de marca
    public function edit(){
        $sql = "UPDATE marca SET nombre = '{$this->getNombre()}' WHERE id = {$this->getId()};";
        $save = $this->db->query($sql);

        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

    //Editar A fin de Ocultar
    public function edit_oculta(){
        $sql = "UPDATE marca SET est = 'D' WHERE id = {$this->getId()};";
        $save = $this->db->query($sql);

        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

}

?>