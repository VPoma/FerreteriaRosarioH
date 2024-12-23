<?Php

class tipodoc{
    private $id;
    private $documento;
    private $est;
    private $db;

    public function __construct(){
        $this->db = Database::connect();
    }

    function getId(){
        return $this->id;
    }

    function getDocumento(){
        return $this->documento;
    }

    function getEst(){
        return $this->est;
    }

    function setId($id){
        $this->id = $id;
    }

    function setDocumento($documento){
        $this->documento = $this->db->real_escape_string($documento);
    }

    function setEst($est){
        $this->est = $this->db->real_escape_string($est);
    }

    //Consultas

    //Controllador Tipodoc
    
    //Registra tipo de documento - 1tipodoc
    public function save(){
        $sql = "INSERT INTO tipodoc VALUES(NULL, '{$this->getDocumento()}', 'H');";
        $save = $this->db->query($sql);
        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

    //Busca registros de tipo doc - 2tipodoc
    public function getAll(){
        $tipodoc = $this->db->query("SELECT * FROM tipodoc WHERE est = 'H' ORDER BY id DESC;");
        return $tipodoc;
    }

    //Busca un registro de tipo doc a partir de un id - 3tipodoc
    public function getone(){
        $tipodoc = $this->db->query("SELECT * FROM tipodoc WHERE id = {$this->getId()} ORDER BY id DESC;");
        return $tipodoc->fetch_object();
    }

    //Edita el registro de tipodoc - 4tipodoc
    public function edit(){
        $sql = "UPDATE tipodoc SET documento = '{$this->getDocumento()}' WHERE id = {$this->getId()};";
        $save = $this->db->query($sql);

        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

    //Edita el registro a fin de ocultar registro - 5tipodoc
    public function edit_oculta(){
        $sql = "UPDATE tipodoc SET est = 'D' WHERE id = {$this->getId()};";
        $save = $this->db->query($sql);

        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

}

?>