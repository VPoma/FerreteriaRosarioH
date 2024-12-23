<?Php
require_once 'models/tipodoc.php';

class tipodocController{
    public function index(){
        echo "<h1>Tipo de Documento</h1>";
    }

    public function registro(){

        require_once 'views/tipodoc/registrotd.php';
    }

    public function save(){
        if(isset($_POST)){
            $documento = isset($_POST['documento']) ? $_POST['documento'] : false;

            if($documento){
                $tipodoc = new Tipodoc;
                $tipodoc->setDocumento($documento);

                if(isset($_GET['id'])){
                    $id = $_GET['id'];
                    $tipodoc->setId($id);
                    //Edita el registro de tipodoc - 4tipodoc
                    $save = $tipodoc->edit();
                }else{
                    //Registra tipo de documento - 1tipodoc
                    $save = $tipodoc->save();

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
        echo '<script>window.location="'.base_url.'tipodoc/gestion"</script>';
        
    }

    public function gestion(){
        $tipodoc = new Tipodoc();
        //Busca registros de tipo doc - 2tipodoc
        $tipo = $tipodoc->getAll();

        require_once 'views/tipodoc/gestiontd.php';
    }

    public function editar(){

        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $edit = true;

            $tipodoc = new Tipodoc();
            $tipodoc->setId($id);
            //Busca un registro de tipo doc a partir de un id - 3tipodoc
            $tip = $tipodoc->getOne();

            require_once 'views/tipodoc/registrotd.php';
        }else{
            echo '<script>window.location="'.base_url.'tipodoc/gestion"</script>';
        }
    }

    public function eliminar(){

        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $delete = true;

            $tipodoc = new Tipodoc();
            $tipodoc->setId($id);
            //Busca un registro de tipo doc a partir de un id - 3tipodoc
            $tip = $tipodoc->getOne();

            require_once 'views/tipodoc/eliminartd.php';
        }else{
            //header('Location:'.base_url.'usuario/gestion');
            echo '<script>window.location="'.base_url.'tipodoc/gestion"</script>';
        }

    }

    public function delete(){

        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $tipodoc = new Tipodoc();
            $tipodoc->setId($id);
            //Edita el registro a fin de ocultar registro - 5tipodoc
            $delete = $tipodoc->edit_oculta(); 
            
            if($delete){
                $_SESSION['delete'] = 'complete';
            }else{
                $_SESSION['delete'] = 'failed';
            }
        }else{
            $_SESSION['delete'] = 'failed';
        }

        echo '<script>window.location="'.base_url.'tipodoc/gestion"</script>';
    }
}

?>