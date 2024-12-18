<?Php
require_once 'models/familia.php';

class familiaController{
    public function index(){
        echo "<h1>Familia de Producto</h1>";
    }

    public function registro(){

        require_once 'views/familia/registrof.php';
    }

    public function save(){
        if(isset($_POST)){
            $nombre = isset($_POST['nombre']) ? $_POST['nombre'] : false;

            if($nombre){
                $familia = new Familia;
                $familia->setNombre($nombre);

                if(isset($_GET['id'])){
                    $id = $_GET['id'];
                    $familia->setId($id);
                    $save = $familia->edit();
                }else{
                    $save = $familia->save();

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
        echo '<script>window.location="'.base_url.'familia/gestion"</script>';
        
    }

    public function gestion(){
        $familia = new Familia();
        $fami = $familia->getAll();

        require_once 'views/familia/gestionf.php';
    }

    public function editar(){

        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $edit = true;

            $familia = new Familia();
            $familia->setId($id);
            
            $fam = $familia->getOne();

            require_once 'views/familia/registrof.php';
        }else{
            echo '<script>window.location="'.base_url.'familia/gestion"</script>';
        }
    }

    public function eliminar(){

        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $delete = true;

            $familia = new Familia();
            $familia->setId($id);
            
            $fam = $familia->getOne();

            require_once 'views/familia/eliminarf.php';
        }else{
            //header('Location:'.base_url.'usuario/gestion');
            echo '<script>window.location="'.base_url.'familia/gestion"</script>';
        }

    }

    public function delete(){

        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $familia = new Familia();
            $familia->setId($id);
            $delete = $familia->edit_oculta(); 
            
            if($delete){
                $_SESSION['delete'] = 'complete';
            }else{
                $_SESSION['delete'] = 'failed';
            }
        }else{
            $_SESSION['delete'] = 'failed';
        }

        echo '<script>window.location="'.base_url.'familia/gestion"</script>';
    }
}

?>