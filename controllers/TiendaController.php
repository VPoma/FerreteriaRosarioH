<?Php
require_once 'models/tienda.php';

class tiendaController{

    public function index(){
        echo "<h1>Tiendas</h1>";
    }

    public function registro(){

        require_once 'views/tienda/registrot.php';
    }

    public function save(){
        if(isset($_POST)){
            $ciudad = isset($_POST['ciudad']) ? $_POST['ciudad'] : false;
            $nombre = isset($_POST['nombre']) ? $_POST['nombre'] : false;
            $direccion = isset($_POST['direccion']) ? $_POST['direccion'] : false;

            if($ciudad && $nombre && $direccion){
                $tienda = new Tienda;
                $tienda->setId_ciudad($ciudad);
                $tienda->setNombre($nombre);
                $tienda->setDireccion($direccion);

                if(isset($_GET['id'])){
                    $id = $_GET['id'];
                    $tienda->setId($id);
                    $save = $tienda->edit();
                }else{
                    $save = $tienda->save();

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
        echo '<script>window.location="'.base_url.'tienda/gestion"</script>';
        
    }

    public function gestion(){
        $tienda = new Tienda();
        $tien = $tienda->getAll();

        require_once 'views/tienda/gestiont.php';
    }

    public function editar(){

        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $edit = true;

            $tienda = new Tienda();
            $tienda->setId($id);
            
            $tie = $tienda->getOne();

            require_once 'views/tienda/registrot.php';
        }else{
            echo '<script>window.location="'.base_url.'tienda/gestion"</script>';
        }
    }

    public function eliminar(){

        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $delete = true;

            $tienda = new Tienda();
            $tienda->setId($id);
            
            $tie = $tienda->getOne();

            require_once 'views/tienda/eliminart.php';
        }else{
            //header('Location:'.base_url.'usuario/gestion');
            echo '<script>window.location="'.base_url.'tienda/gestion"</script>';
        }

    }

    public function delete(){

        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $tienda = new Tienda();
            $tienda->setId($id);
            $delete = $tienda->edit_oculta(); 
            
            if($delete){
                $_SESSION['delete'] = 'complete';
            }else{
                $_SESSION['delete'] = 'failed';
            }
        }else{
            $_SESSION['delete'] = 'failed';
        }

        echo '<script>window.location="'.base_url.'tienda/gestion"</script>';
    }
}



?>