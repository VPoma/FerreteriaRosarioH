<?Php
require_once 'models/linea.php';

Class lineaController{
    public function index(){
        echo "<h1>Linea de Producto</h1>";
    }

    public function registro(){

        require_once 'views/linea/registrol.php';
    }

    public function save(){
        if(isset($_POST)){
            $nombre = isset($_POST['nombre']) ? $_POST['nombre'] : false;

            if($nombre){
                $linea = new Linea;
                $linea->setNombre($nombre);

                if(isset($_GET['id'])){
                    $id = $_GET['id'];
                    $linea->setId($id);
                    $save = $linea->edit();
                }else{
                    $save = $linea->save();

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
        echo '<script>window.location="'.base_url.'linea/gestion"</script>';
        
    }

    public function gestion(){
        $linea = new Linea();
        $line = $linea->getAll();

        require_once 'views/linea/gestionl.php';
    }

    public function editar(){

        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $edit = true;

            $linea = new Linea();
            $linea->setId($id);
            
            $lin = $linea->getOne();

            require_once 'views/linea/registrol.php';
        }else{
            echo '<script>window.location="'.base_url.'linea/gestion"</script>';
        }
    }

    public function eliminar(){

        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $delete = true;

            $linea = new Linea();
            $linea->setId($id);
            
            $lin = $linea->getOne();

            require_once 'views/linea/eliminarl.php';
        }else{
            //header('Location:'.base_url.'usuario/gestion');
            echo '<script>window.location="'.base_url.'linea/gestion"</script>';
        }

    }

    public function delete(){

        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $linea = new Linea();
            $linea->setId($id);
            $delete = $linea->edit_oculta(); 
            
            if($delete){
                $_SESSION['delete'] = 'complete';
            }else{
                $_SESSION['delete'] = 'failed';
            }
        }else{
            $_SESSION['delete'] = 'failed';
        }

        echo '<script>window.location="'.base_url.'linea/gestion"</script>';
    }
}

?>