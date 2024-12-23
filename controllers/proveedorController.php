<?Php
require_once 'models/proveedor.php';

class proveedorController{

    public function index(){
        echo "<h1>Proveedores</h1>";
    }

    public function registro(){

        require_once 'views/proveedor/registropv.php';
    }

    public function save(){
        if(isset($_POST)){
            $ciudad = isset($_POST['ciudad']) ? $_POST['ciudad'] : false;
            $numruc = isset($_POST['numruc']) ? $_POST['numruc'] : false;
            $nombrecom = isset($_POST['nombrecom']) ? $_POST['nombrecom'] : false;
            $direccion = isset($_POST['direccion']) ? $_POST['direccion'] : false;
            $numcel = isset($_POST['numcel']) ? $_POST['numcel'] : false;

            if($ciudad && $numruc && $nombrecom && $direccion && $numcel){
                $proveedor = new Proveedor;
                $proveedor->setId_ciudad($ciudad);
                $proveedor->setNumruc($numruc);
                $proveedor->setNombrecom($nombrecom);
                $proveedor->setDireccion($direccion);
                $proveedor->setNumcel($numcel);

                if(isset($_GET['id'])){
                    $id = $_GET['id'];
                    $proveedor->setId($id);
                    //Edita al Proveedor - 6proveedor
                    $save = $proveedor->edit();
                }else{
                    //Registra Proveedor -1proveedor
                    $save = $proveedor->save();

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
        echo '<script>window.location="'.base_url.'proveedor/gestion"</script>';
    }

    public function gestion(){
        //Paginador
        if(isset($_GET['pag'])){
            $pag = $_GET['pag'];
        }else{
            $pag = 1;
        }

        $limite = 6;
        $offset = ($pag-1)*$limite;

        $proveedor = new Proveedor();
        $proveedor->setOffset($offset);
        $proveedor->setLimite($limite);
        
        //Muestra los dotos de todos Proveedores -2proveedor
        $prove = $proveedor->getAll();

        //Muestra la cantidad de filas de la tabla proveedor -3proveedor
        $total = $proveedor->getAlltotal();

        $totalP = ceil($total/$limite);
        $totalPag = $totalP;

        require_once 'views/proveedor/gestionpv.php';
    }

    public function filtro(){
        if(isset($_POST)){
            $numruc = isset($_POST['numruc']) ? $_POST['numruc'] : false;
            $nombrecom = isset($_POST['nombrecom']) ? $_POST['nombrecom'] : false;

            $proveedor = new Proveedor();

            if(strlen(trim($numruc)) == 0 && strlen(trim($nombrecom)) == 0){
                
                echo '<script>window.location="'.base_url.'proveedor/gestion"</script>';

            }else{

            $proveedor->setNumruc($numruc);
            $proveedor->setNombrecom($nombrecom);
            //FILTRO - 4proveedor
            $prove = $proveedor->getFiltro();
            }
        }

        require_once 'views/proveedor/gestionpv.php';
    }

    public function editar(){

        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $edit = true;

            $proveedor = new Proveedor();
            $proveedor->setId($id);

            //Muestra a un proveedor buscado a partir de su "ID" - 5proveedor
            $pvd = $proveedor->getOne();

            require_once 'views/proveedor/registropv.php';
        }else{
            echo '<script>window.location="'.base_url.'proveedor/gestion"</script>';
        }
    }

    public function eliminar(){

        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $delete = true;

            $proveedor = new Proveedor();
            $proveedor->setId($id);

            //Muestra a un proveedor buscado a partir de su "ID" - 5proveedor
            $pvd = $proveedor->getOne();

            require_once 'views/proveedor/eliminarpv.php';
        }else{
            echo '<script>window.location="'.base_url.'proveedor/gestion"</script>';
        }

    }

    public function delete(){

        if(isset($_GET['id'])){
            $id = $_GET['id'];

            $proveedor = new Proveedor();
            $proveedor->setId($id);
            
            //Edita para ocultar al Proveedor - 7proveedor
            $delete = $proveedor->edit_oculta(); 
            
            if($delete){
                $_SESSION['delete'] = 'complete';
            }else{
                $_SESSION['delete'] = 'failed';
            }
        }else{
            $_SESSION['delete'] = 'failed';
        }

        echo '<script>window.location="'.base_url.'proveedor/gestion"</script>';
    }

}

?>