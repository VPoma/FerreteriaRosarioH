<?Php

class descuento{
    private $id;
    private $porcentaje;
    private $est;
    private $db;

    public function __construct(){
        $this->db = Database::connect();
    }

    function getId(){
        return $this->id;
    }

    function getPorcentaje(){
        return $this->porcentaje;
    }

    function getEst(){
        return $this->est;
    }

    function setId($id){
        $this->id = $id;
    }

    function setPorcentaje($porcentaje){
        $this->porcentaje = $porcentaje;
    }

    function setEst($est){
        $this->est = $this->db->real_escape_string($est);
    }

    //Consultas

    //Muestra todos los registros de descuento -1descuento
    public function getAll(){
        $descuento = $this->db->query("SELECT * FROM descuento WHERE est = 'H' ORDER BY id DESC;");
        return $descuento;
    }

    //Muestra un solo registro a partir del id -2descuento
    public function getone(){
        $descuento = $this->db->query("SELECT * FROM descuento WHERE id = {$this->getId()} ORDER BY id DESC;");
        return $descuento->fetch_object();
    }

    //Edita descuento -3descuento
    public function edit(){
        $sql = "UPDATE descuento SET porcentaje = '{$this->getPorcentaje()}' WHERE id = {$this->getId()};";
        $save = $this->db->query($sql);

        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

    //Envía el descuento para calculo - 4descuento
    public function getAllpor(){
        $descuento = $this->db->query("SELECT * FROM descuento WHERE est = 'H' ORDER BY id DESC;");
        return $descuento->fetch_object();
    }
}

?>