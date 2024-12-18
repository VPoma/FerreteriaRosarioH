<?Php
require_once 'models/precio.php';
require_once 'models/producto.php';

class precioController{

    public function index(){
        echo "<h1> Precios de Fierro </h1>";
    }

    public function registro(){
        
        require_once 'views/precio/actualizafpe.php';
    }

    public function registroFierro(){
        if(isset($_POST)){
            $marca = isset($_POST['marca']) ? $_POST['marca'] : false;
            $tipocam = isset($_POST['tipocam']) ? $_POST['tipocam'] : false;
            //$tipocam = number_format($dolar,3);
            $toneladab = isset($_POST['toneladab']) ? $_POST['toneladab'] : false;
            $toneladaf = isset($_POST['toneladaf']) ? $_POST['toneladaf'] : false;
            $toneladac = isset($_POST['toneladac']) ? $_POST['toneladac'] : false;
            
            if($marca && $tipocam && $toneladab && $toneladaf && $toneladac){
                $producto = new Producto();
                $producto->setId_marca($marca);
                $prod = $producto->getFierro();

                $precio = new Precio();
                while($pr = $prod->fetch_object()){
                        $precio->setId_producto($pr->id);
                        $precio->setTipocam($tipocam);
                        $precio->setToneladab($toneladab);
                        $precio->setToneladaf($toneladaf);
                        $precio->setToneladac($toneladac);
                        $pb = (2*$tipocam*$toneladab)/$pr->paquete;
                        $precio->setPreciob($pb);
                        $pf = (2*$tipocam*$toneladaf)/$pr->paquete;
                        $precio->setPreciof($pf);
                        $pc = (2*$tipocam*$toneladac)/$pr->paquete;
                        $precio->setPrecioc($pc);
                        $save = $precio->save();
                }
                if($save){
                    $_SESSION['register'] = "complete";
                }else{
                    $_SESSION['register'] = "failed";
                }

                $pfierro = $precio->getpfierro();
                while($pf = $pfierro->fetch_object()){
                    $producto->setId($pf->id_producto);
                    $producto->setPreciob($pf->preciob);
                    $producto->setPreciof($pf->preciof);
                    $producto->setPrecioc($pf->precioc);
                    $update = $producto->edit_pfierro();

                }

                if($update){
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
        
        echo '<script>window.location="'.base_url.'precio/gestion"</script>';
    }

    public function gestion(){
        $precio = new precio();
        $prec = $precio->getAll();

        require_once 'views/precio/gestionfpe.php';
    }

    public function tabla(){
        //Paginador
        if(isset($_GET['pag'])){
            $pag = $_GET['pag'];
        }else{
            $pag = 1;
        }

        $limite = 10;
        $offset = ($pag-1)*$limite;

        $precio = new producto();
        $precio->setOffset($offset);
        $precio->setLimite($limite);

        $prec = $precio->gettablaprecio();

        $total = $precio->getAlltotal();

        $totalP = ceil($total/$limite);
        $totalPag = $totalP;

        require_once 'views/precio/tablape.php';

    }

    public function filtrotabla(){
        if(isset($_POST)){
            $marca = isset($_POST['marca']) ? $_POST['marca'] : false;

            $precio = new producto();

            if(strlen(trim($marca)) == 0){

                echo '<script>window.location="'.base_url.'precio/tabla"</script>';
            }else{
            $precio->setmarca($marca); 
            $prec = $precio->gettablapreciofill();
            
            }

        }
        
        require_once 'views/precio/tablape.php';
    }

    public function delete(){
        if(isset($_POST)){
            $marca = isset($_POST['marca']) ? $_POST['marca'] : false;
            $fecha = isset($_POST['fecha']) ? $_POST['fecha'] : false;
            
            if($marca && $fecha){
                $producto = new Producto();
                $producto->setId_marca($marca);
                $prod = $producto->getFierro();

                $precio = new Precio();
                while($pr = $prod->fetch_object()){
                    $precio->setId_producto($pr->id);
                    $precio->setFecha($fecha);
                    $delete = $precio->delete(); 
                }

                if($delete){
                    $_SESSION['delete'] = 'complete';
                }else{
                    $_SESSION['delete'] = 'failed';
                }

            }else{
                $_SESSION['register'] = "failed";
            }
        }else{
            $_SESSION['register'] = "failed";
        }
        
        echo '<script>window.location="'.base_url.'precio/gestion"</script>';
    }

    public function editar(){

        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $edit = true;

            $precio = new Producto();
            $precio->setId($id);
            
            $pre = $precio->getOne_precio();

            require_once 'views/precio/editape.php';
        }else{
            echo '<script>window.location="'.base_url.'precio/tabla"</script>';
        }
    }

    public function editprecio(){
        if(isset($_POST)){
            $preciob = isset($_POST['preciob']) ? $_POST['preciob'] : false;
            $preciof = isset($_POST['preciof']) ? $_POST['preciof'] : false;
            $precioc = isset($_POST['precioc']) ? $_POST['precioc'] : false;

            if($preciob && $preciof && $precioc){
                $producto = new Producto;
                $producto->setPreciob($preciob);
                $producto->setPreciof($preciof);
                $producto->setPrecioc($precioc);

                if(isset($_GET['id'])){
                    $id = $_GET['id'];
                    $producto->setId($id);
                    $save = $producto->edit_precio();
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
        echo '<script>window.location="'.base_url.'precio/tabla"</script>';
        
    }

}


?>