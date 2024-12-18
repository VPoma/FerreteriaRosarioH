<?Php
require_once 'models/marca.php';

Class marcaController{
    public function index(){
        echo "<h1>Marca de Producto</h1>";
    }

    public function registro(){

        require_once 'views/marca/registrom.php';
    }

    public function save(){
        if(isset($_POST)){
            $nombre = isset($_POST['nombre']) ? $_POST['nombre'] : false;

            if($nombre){
                $marca = new Marca;
                $marca->setNombre($nombre);

                if(isset($_GET['id'])){
                    $id = $_GET['id'];
                    $marca->setId($id);
                    $save = $marca->edit();
                }else{
                    $save = $marca->save();

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
        echo '<script>window.location="'.base_url.'marca/gestion"</script>';
        
    }

    public function gestion(){
        $marca = new Marca();
        $marc = $marca->getAll();

        require_once 'views/marca/gestionm.php';
    }

    public function editar(){

        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $edit = true;

            $marca = new Marca();
            $marca->setId($id);
            
            $mar = $marca->getOne();

            require_once 'views/marca/registrom.php';
        }else{
            echo '<script>window.location="'.base_url.'marca/gestion"</script>';
        }
    }

    public function eliminar(){

        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $delete = true;

            $marca = new Marca();
            $marca->setId($id);
            
            $mar = $marca->getOne();

            require_once 'views/marca/eliminarm.php';
        }else{
            //header('Location:'.base_url.'usuario/gestion');
            echo '<script>window.location="'.base_url.'marca/gestion"</script>';
        }

    }

    public function delete(){

        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $marca = new Marca();
            $marca->setId($id);
            $delete = $marca->edit_oculta(); 
            
            if($delete){
                $_SESSION['delete'] = 'complete';
            }else{
                $_SESSION['delete'] = 'failed';
            }
        }else{
            $_SESSION['delete'] = 'failed';
        }

        echo '<script>window.location="'.base_url.'marca/gestion"</script>';
    }
}

?>