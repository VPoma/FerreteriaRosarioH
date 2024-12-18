<?Php
require_once 'models/usuario.php';

class usuarioCOntroller{

    public function index(){
        echo "<h1>Usuarios</h1>";
    }

    public function logini(){

        require_once 'views/usuario/login.php';
    }

    public function registro(){

        require_once 'views/usuario/registroU.php';
    }

    public function save(){
        if(isset($_POST)){
            $tienda = isset($_POST['tienda']) ? $_POST['tienda'] : false;
            $dni = isset($_POST['dni']) ? $_POST['dni'] : false;
            $nombre = isset($_POST['nombre']) ? $_POST['nombre'] : false;
            $apellidos = isset($_POST['apellidos']) ? $_POST['apellidos'] : false;
            $usuariof = isset($_POST['usuariof']) ? $_POST['usuariof'] : false;
            $password = isset($_POST['password']) ? $_POST['password'] : false;
            $rol = isset($_POST['rol']) ? $_POST['rol'] : false;
            //$imagen = isset($_POST['imagen']) ? $_POST['imagen'] : false;

            if($tienda && $dni && $nombre && $apellidos && $usuariof && $password && $rol){
                $usuario = new Usuario;
                $usuario->setId_tienda($tienda);
                $usuario->setDni($dni);
                $usuario->setNombre($nombre);
                $usuario->setApellidos($apellidos);
                $usuario->setusuariof($usuariof);
                $usuario->setPassword($password);
                $usuario->setRol($rol);

                //Guardar la imagen
                if(isset($_FILES['imagen'])){
                    $file = $_FILES['imagen'];
                    $filename = $file['name'];
                    $mimetype = $file['type'];

                    if($mimetype == "image/jpg" || $mimetype == 'image/jpeg' || $mimetype == 'image/png' || $mimetype == 'image/gif'){
                            
                        if(!is_dir('uploads/images')){
                            mkdir('uploads/images', 0777, true);
                        }

                        move_uploaded_file($file['tmp_name'],'uploads/images/'.$filename);
                        $usuario->setImagen($filename);
                    }
                }

                if(isset($_GET['id'])){
                    $id = $_GET['id'];
                    $usuario->setId($id);
                    $save = $usuario->edit();
                }else{
                    $save = $usuario->save();

                }
                
                if($save){
                    $_SESSION['register'] = "complete";
                }else{
                    $_SESSION['register'] = "failed";
                }

            }else{
                $_SESSION['register'] = "failed";
            }
        }else{
            $_SESSION['register'] = "failed";
        }
        echo '<script>window.location="'.base_url.'usuario/gestion"</script>';
        
    }

    public function login(){
        if(isset($_POST)){
            //Identificar al usuario
            //consulta a la base de datos
            $usuario = new Usuario();
            $usuario->setUsuariof($_POST['usuariof']);
            $usuario->setPassword($_POST['password']);

            $identity = $usuario->login();

            if($identity && is_object($identity)){
                $_SESSION['identity'] = $identity;

                if($identity->rol == 'admin'){
                    $_SESSION['admin'] = true;
                }

            }else{
                $_SESSION['error_login'] = 'Identifiación fallida !!';
                echo '<script>window.location="'.base_url.'usuario/logini"</script>';
            }
        }

        echo '<script>window.location="'.base_url.'"</script>';
    }

    public function logout(){

        if(isset($_SESSION['identity'])){
            session_unset();
        }

        if(isset($_SESSION['admin'])){
            session_unset();
        }

        echo '<script>window.location="'.base_url.'usuario/logini"</script>';
    }  

    public function gestion(){
        $usuario = new Usuario();
        $user = $usuario->getAll();

        require_once 'views/usuario/gestionU.php';
    }

    public function editar(){

        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $edit = true;

            $usuario = new Usuario();
            $usuario->setId($id);
            
            $usu = $usuario->getOne();

            require_once 'views/usuario/registroU.php';
        }else{
            echo '<script>window.location="'.base_url.'usuario/gestion"</script>';
        }
    }

    public function eliminar(){

        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $delete = true;

            $usuario = new Usuario();
            $usuario->setId($id);
            
            $usu = $usuario->getOne();

            require_once 'views/usuario/eliminarU.php';
        }else{
            //header('Location:'.base_url.'usuario/gestion');
            echo '<script>window.location="'.base_url.'usuario/gestion"</script>';
        }

    }

    public function delete(){

        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $usuario = new Usuario();
            $usuario->setId($id);
            $delete = $usuario->edit_oculta(); 
            
            if($delete){
                $_SESSION['delete'] = 'complete';
            }else{
                $_SESSION['delete'] = 'failed';
            }
        }else{
            $_SESSION['delete'] = 'failed';
        }

        echo '<script>window.location="'.base_url.'usuario/gestion"</script>';
    }

    //funciones para usuario

    public function editu(){

        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $edit = true;

            $usuario = new Usuario();
            $usuario->setId($id);
            
            $usu = $usuario->getOne();

            require_once 'views/usuario/soloeditaU.php';
        }else{
            echo '<script>window.location="'.base_url.'usuario/logini"</script>';
        }
    }

    public function saveuser(){
        if(isset($_POST)){
            $dni = isset($_POST['dni']) ? $_POST['dni'] : false;
            $nombre = isset($_POST['nombre']) ? $_POST['nombre'] : false;
            $apellidos = isset($_POST['apellidos']) ? $_POST['apellidos'] : false;
            $usuariof = isset($_POST['usuariof']) ? $_POST['usuariof'] : false;

            if($dni && $nombre && $apellidos && $usuariof){
                $usuario = new Usuario;
                $usuario->setDni($dni);
                $usuario->setNombre($nombre);
                $usuario->setApellidos($apellidos);
                $usuario->setUsuariof($usuariof);

                //Guardar la imagen
                if(isset($_FILES['imagen'])){
                    $file = $_FILES['imagen'];
                    $filename = $file['name'];
                    $mimetype = $file['type'];

                    if($mimetype == "image/jpg" || $mimetype == 'image/jpeg' || $mimetype == 'image/png' || $mimetype == 'image/gif'){
                            
                        if(!is_dir('uploads/images')){
                            mkdir('uploads/images', 0777, true);
                        }

                        move_uploaded_file($file['tmp_name'],'uploads/images/'.$filename);
                        $usuario->setImagen($filename); //8:26 -283
                    }
                }

                if(isset($_GET['id'])){
                    $id = $_GET['id'];
                    $usuario->setId($id);

                $save = $usuario->editus();
                }

                if($save){
                    $_SESSION['r'] = "c";
                }else{
                    $_SESSION['r'] = "f";
                }
            }else{
                $_SESSION['r'] = "f";
            }
        }else{
            $_SESSION['r'] = "f";
        }

        session_unset();
        echo '<script>window.location="'.base_url.'usuario/logini"</script>';
        
    }

    public function editp(){

        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $edit = true;

            $usuario = new Usuario();
            $usuario->setId($id);
            
            $usu = $usuario->getOne();

            require_once 'views/usuario/passeditaU.php';
        }else{
            echo '<script>window.location="'.base_url.'usuario/logini"</script>';
        }
    }

    public function savepass(){
        if(isset($_POST)){
            $password = isset($_POST['password']) ? $_POST['password'] : false;

            if($password){
                $usuario = new Usuario;
                $usuario->setPassword($password);

                if(isset($_GET['id'])){
                    $id = $_GET['id'];
                    $usuario->setId($id);

                $save = $usuario->editps();
                }

                if($save){
                    $_SESSION['r'] = "c";
                }else{
                    $_SESSION['r'] = "f";
                }
            }else{
                $_SESSION['r'] = "f";
            }
        }else{
            $_SESSION['r'] = "f";
        }

        session_unset();
        echo '<script>window.location="'.base_url.'usuario/logini"</script>';
        
    }

    /*
    public function eliminar(){

        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $delete = true;

            $usuario = new Usuario();
            $usuario->setId($id);
            
            $usu = $usuario->getOne();

            require_once 'views/usuario/eliminarU.php';
        }else{
            //header('Location:'.base_url.'usuario/gestion');
            echo '<script>window.location="'.base_url.'usuario/gestion"</script>';
        }
    }*/

        /*
    public function delete(){

        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $usuario = new Usuario();
            $usuario->setId($id);
            $delete = $usuario->delete(); 
            if($delete){
                $_SESSION['delete'] = 'complete';
            }else{
                $_SESSION['delete'] = 'failed';
            }
        }else{
            $_SESSION['delete'] = 'failed';
        }

        echo '<script>window.location="'.base_url.'usuario/gestion"</script>';
    }*/

}

?>