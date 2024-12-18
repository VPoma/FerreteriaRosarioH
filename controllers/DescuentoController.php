<?Php
require_once 'models/descuento.php';

Class descuentoController{
    public function index(){
        echo "<h1>Descuentos</h1>";
    }

    public function gestion(){
        $descuento = new Descuento();
        $desc = $descuento->getAll();

        require_once 'views/descuento/gestionds.php';
    }

    public function editar(){

        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $edit = true;

            $descuento = new Descuento();
            $descuento->setId($id);
            
            $des = $descuento->getOne();

            require_once 'views/descuento/actualizads.php';
        }else{
            echo '<script>window.location="'.base_url.'descuento/gestion"</script>';
        }
    }

    public function edita(){
        if(isset($_POST)){
            $porcentaje = isset($_POST['porcentaje']) ? $_POST['porcentaje'] : false;

            if($porcentaje){
                $descuento = new Descuento;
                $descuento->setporcentaje($porcentaje);

                if(isset($_GET['id'])){
                    $id = $_GET['id'];
                    $descuento->setId($id);
                    $save = $descuento->edit();
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
        echo '<script>window.location="'.base_url.'descuento/gestion"</script>';
        
    }
}

?>