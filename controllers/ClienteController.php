<?Php
require_once 'models/cliente.php';

class clienteCOntroller{

    public function index(){
        echo "<h1>CLIENTE</h1>";
    }

    public function registro(){

        require_once 'views/cliente/registroci.php';
    }

    public function save(){
        if(isset($_POST)){
            $ciudad = isset($_POST['ciudad']) ? $_POST['ciudad'] : false;
            $tipodoc = isset($_POST['tipodoc']) ? $_POST['tipodoc'] : false;
            $numdoc = isset($_POST['numdoc']) ? $_POST['numdoc'] : false;
            $nombrecom = isset($_POST['nombrecom']) ? $_POST['nombrecom'] : false;
            $direccion = isset($_POST['direccion']) ? $_POST['direccion'] : false;
            $numcel = isset($_POST['numcel']) ? $_POST['numcel'] : false;

            if($ciudad && $tipodoc && $numdoc && $nombrecom && $direccion && $numcel){
                $cliente = new Cliente;
                $cliente->setId_ciudad($ciudad);
                $cliente->setId_tipodoc($tipodoc);
                $cliente->setNumdoc($numdoc);
                $cliente->setNombrecom($nombrecom);
                $cliente->setDireccion($direccion);
                $cliente->setNumcel($numcel);

                if(isset($_GET['id'])){
                    $id = $_GET['id'];
                    $cliente->setId($id);
                    //Edita Registro Cliente - 0cliente
                    $save = $cliente->edit();
                }else{
                    //Guardar cliente - 1cliente
                    $save = $cliente->save();

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
        echo '<script>window.location="'.base_url.'cliente/gestion"</script>';
        
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

        $cliente = new Cliente();
        $cliente->setOffset($offset);
        $cliente->setLimite($limite);

        //Mostrar todos los registros - 2cliente
        $clie = $cliente->getAll();

        //Saca la cantidad de lineas - 3cliente
        $total = $cliente->getAlltotal();

        $totalP = ceil($total/$limite);
        $totalPag = $totalP;

        require_once 'views/cliente/gestionci.php';
    }

    public function filtro(){
        if(isset($_POST)){
            $numdoc = isset($_POST['numdoc']) ? $_POST['numdoc'] : false;
            $nombrecom = isset($_POST['nombrecom']) ? $_POST['nombrecom'] : false;

            $cliente = new cliente();

            if(strlen(trim($numdoc)) == 0 && strlen(trim($nombrecom)) == 0){
                
                echo '<script>window.location="'.base_url.'cliente/gestion"</script>';

            }else{

            //Filtro de registros - 4cliente
            $cliente->setNumdoc($numdoc);
            $cliente->setNombrecom($nombrecom);
            $clie = $cliente->getFiltro();
            }
        }

        require_once 'views/cliente/gestionci.php';
    }

    public function editar(){

        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $edit = true;

            $cliente = new Cliente();
            $cliente->setId($id);
            
            //Muestra un solo registro en base a un id - 5cliente
            $cli = $cliente->getOne();

            require_once 'views/cliente/registroci.php';
        }else{
            echo '<script>window.location="'.base_url.'cliente/gestion"</script>';
        }
    }

    public function eliminar(){

        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $delete = true;

            $cliente = new Cliente();
            $cliente->setId($id);
            
            $cli = $cliente->getOne();

            require_once 'views/cliente/eliminarci.php';
        }else{
            echo '<script>window.location="'.base_url.'cliente/gestion"</script>';
        }

    }

    public function delete(){

        if(isset($_GET['id'])){
            $id = $_GET['id'];

            $cliente = new Cliente();
            $cliente->setId($id);
            
            //Edita para ocultar un registro - 6cliente
            $delete = $cliente->edit_oculta(); 
            
            if($delete){
                $_SESSION['delete'] = 'complete';
            }else{
                $_SESSION['delete'] = 'failed';
            }
        }else{
            $_SESSION['delete'] = 'failed';
        }

        echo '<script>window.location="'.base_url.'cliente/gestion"</script>';
    }
}

?>