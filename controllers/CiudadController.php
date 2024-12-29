<?Php
require_once 'models/ciudad.php';

class ciudadController{

    public function index(){
        echo "<h1>Ciudad!!!</h1>";
    }

    public function registro(){
        require_once 'views/ciudad/registroc.php';
    }

    public function save(){
        if(isset($_POST)){
            $nombre = isset($_POST['nombre']) ? $_POST['nombre'] : false;

            if($nombre){
                $ciudad = new Ciudad;
                $ciudad->setNombre($nombre);

                if(isset($_GET['id'])){
                    $id = $_GET['id'];
                    $ciudad->setId($id);
                    $save = $ciudad->edit();
                }else{
                    $save = $ciudad->save();

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
        echo '<script>window.location="'.base_url.'ciudad/gestion"</script>';
        
    }

    public function gestion(){
        $ciudad = new Ciudad();
        $ciud = $ciudad->getAll();

        require_once 'views/ciudad/gestionc.php';
    }

    public function editar(){

        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $edit = true;

            $ciudad = new Ciudad();
            $ciudad->setId($id);
            
            $ciu = $ciudad->getOne();

            require_once 'views/ciudad/registroc.php';
        }else{
            echo '<script>window.location="'.base_url.'ciudad/gestion"</script>';
        }
    }

    public function eliminar(){

        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $delete = true;

            $ciudad = new Ciudad();
            $ciudad->setId($id);
            
            $ciu = $ciudad->getOne();

            require_once 'views/ciudad/eliminarc.php';
        }else{
            //header('Location:'.base_url.'usuario/gestion');
            echo '<script>window.location="'.base_url.'ciudad/gestion"</script>';
        }

    }

    public function delete(){

        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $ciudad = new Ciudad();
            $ciudad->setId($id);
            $delete = $ciudad->edit_oculta(); 
            
            if($delete){
                $_SESSION['delete'] = 'complete';
            }else{
                $_SESSION['delete'] = 'failed';
            }
        }else{
            $_SESSION['delete'] = 'failed';
        }

        echo '<script>window.location="'.base_url.'ciudad/gestion"</script>';
    }
}


?>