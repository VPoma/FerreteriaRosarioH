<?Php 

class usuario{
    private $id;
    private $id_tienda;
    private $dni;
    private $nombre;
    private $apellidos;
    private $usuariof;
    private $password;
    private $rol;
    private $imagen;
    private $est;
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

    function getDni(){
        return $this->dni;
    }
    
    function getNombre(){
        return $this->nombre;
    }

    function getApellidos(){
        return $this->apellidos;
    }

    function getUsuariof(){
        return $this->usuariof;
    }

    function getPassword(){
        return password_hash($this->db->real_escape_string($this->password), PASSWORD_BCRYPT, ['cost' =>4]);
    }

    function getRol(){
        return $this->rol;
    }

    function getImagen(){
        return $this->imagen;
    }

    function getEst(){
        return $this->est;
    }

    function setId($id){
        $this->id = $id;
    }

    function setId_tienda($id_tienda){
        $this->id_tienda = $id_tienda;
    }

    function setDni($dni){
        $this->dni = $dni;
    }

    function setNombre($nombre){
        $this->nombre = $this->db->real_escape_string($nombre);
    }

    function setApellidos($apellidos){
        $this->apellidos = $this->db->real_escape_string($apellidos);
    }

    function setUsuariof($usuariof){
        $this->usuariof = $this->db->real_escape_string($usuariof);
    }

    function setPassword($password){
        $this->password = $password;
    }

    function setRol($rol){
        $this->rol = $this->db->real_escape_string($rol);
    }

    function setImagen($imagen){
        $this->imagen = $this->db->real_escape_string($imagen);
    }

    function setEst($est){
        $this->est = $this->db->real_escape_string($est);
    }

    //Consultas

    //Registra de usuario(Guardar)
    public function save(){
        $sql = "INSERT INTO usuario VALUES(NULL, {$this->getId_tienda()}, {$this->getDNI()}, '{$this->getNombre()}', '{$this->getApellidos()}', '{$this->getUsuariof()}', '{$this->getPassword()}', '{$this->getRol()}', '{$this->getImagen()}', 'H');";
        $save = $this->db->query($sql);
        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

    //Login de usuario
    public function login(){
        $result = false;
        $usuariof = $this->usuariof;
        $password = $this->password;

        //comprobar si existe el usuario
        $sql = "SELECT * FROM usuario WHERE usuariof = '$usuariof'";
        $login = $this->db->query($sql);

        if($login && $login->num_rows == 1){
            $usuario = $login->fetch_object();

            //verificar la contraseña
            $verify = password_verify($password, $usuario->password);
            
            if($verify){
                $result = $usuario;
            }
        }

        return $result;
    }

    //Mostrar todos los registros de la tabla
    public function getAll(){
        $usuario = $this->db->query("SELECT * FROM usuario WHERE est = 'H' ORDER BY id DESC;");
        return $usuario;
    }

    //Busca y muestra un solo registro
    public function getone(){
        $usuario = $this->db->query("SELECT * FROM usuario WHERE id = {$this->getId()} ORDER BY id DESC;");
        return $usuario->fetch_object();
    }

    //Editar registro de usuario perfil adm
    public function edit(){
        $sql = "UPDATE usuario SET id_tienda = {$this->getId_tienda()}, dni = {$this->getDNI()}, nombre = '{$this->getNombre()}', apellidos = '{$this->getApellidos()}', usuariof = '{$this->getUsuariof()}', Password = '{$this->getPassword()}', rol = '{$this->getRol()}' ";
        
        if($this->getImagen() != null){
            $sql .= ", imagen = '{$this->getImagen()}'"; 
        }
        $sql .= "WHERE id = {$this->getId()};";
        //$sql .= "WHERE id = {$this->id};";

        $save = $this->db->query($sql);

        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

    //Editar A fin de Ocultar
    public function edit_oculta(){
        $sql = "UPDATE usuario SET est = 'D' WHERE id = {$this->getId()};";
        $save = $this->db->query($sql);

        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

    //Editar registro de usuario perfil usuario (edita su propio usuario)
    public function editus(){
        $sql = "UPDATE usuario SET dni = {$this->getDNI()}, nombre = '{$this->getNombre()}', apellidos = '{$this->getApellidos()}', usuariof = '{$this->getUsuariof()}' ";
        
        if($this->getImagen() != null){
            $sql .= ", imagen = '{$this->getImagen()}'";
        }

        $sql .= " WHERE id = {$this->getId()};";
        $save = $this->db->query($sql);

        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

    //Editar contraseña de usuario perfil usuario (edita su propio usuario)
    public function editps(){
        $sql = "UPDATE usuario SET password = '{$this->getPassword()}' WHERE id = {$this->getId()};";
        $save = $this->db->query($sql);

        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

    //Eliminar Registro
/*
    public function delete(){
        $sql = "DELETE FROM usuario WHERE id = {$this->id}";
        $delete = $this->db->query($sql);

        $result = false;
        if($delete){
            $result = true;
        }

        return $result;
    }
*/

}

?>