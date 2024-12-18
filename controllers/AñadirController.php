<?php
require_once 'models/producto.php';

class AñadirController{
    
    public function index(){

        if(isset($_SESSION['añadir']) && count($_SESSION['añadir']) >= 1){
            $añadir = $_SESSION['añadir'];
        }else{
            $añadir = array();
        }

        require_once 'views/añadir/index.php';
    }

    public function add(){
        if(isset($_GET['id'])){
            $producto_id = $_GET['id'];
        }else{
            header('Location:'.base_url);
        }

        if(isset($_SESSION['añadir'])){
            $counter = 0;
            foreach($_SESSION['añadir'] as $indice => $elemento){
                if($elemento['id_producto'] == $producto_id){
                    $_SESSION['añadir'][$indice]['unidades']++;
                    $counter++;
                }
            }

        }

        if(!isset($counter) || $counter == 0){
            //Conseguir producto
            $producto = new Producto();
            $producto->setId($producto_id);
            $producto = $producto->getOnever();

            //añadir al carrito
            if(is_object($producto)){
                $_SESSION['añadir'][] = array(
                    "id_producto" => $producto->id,
                    "precio" => 0,
                    "unidades" => 1,
                    "producto" => $producto
                );

            }
        }
        
        echo '<script>window.location="'.base_url.'añadir/index"</script>';
    }

    public function remove(){
        if(isset($_GET['index'])){
            $index = $_GET['index'];
            unset($_SESSION['añadir'][$index]);
        }
        echo '<script>window.location="'.base_url.'añadir/index"</script>';
    }

    public function cantipreci(){
        $unidades = isset($_POST['unidades']) ? $_POST['unidades'] : false;
        $unid = intval($unidades);

        //unidades
        if(isset($_GET['index'])){
            $index = $_GET['index'];
            $_SESSION['añadir'][$index]['unidades'] = $unid;
        }

        if($_SESSION['añadir'][$index]['unidades'] == 0){
            unset($_SESSION['añadir'][$index]);
        }
        
        //Precio
        $preciof = isset($_POST['preciof']) ? $_POST['preciof'] : false;
        $prec = floatval($preciof);

        if(isset($_GET['index'])){
            $index = $_GET['index'];
            $_SESSION['añadir'][$index]['precio'] = $prec;        
        }

        echo '<script>window.location="'.base_url.'añadir/index"</script>';
    }

        public function up(){
            if(isset($_GET['index'])){
                $index = $_GET['index'];
                $_SESSION['añadir'][$index]['unidades']++;
            }

        echo '<script>window.location="'.base_url.'añadir/index"</script>';
    }

    public function down(){
        if(isset($_GET['index'])){
            $index = $_GET['index'];
            $_SESSION['añadir'][$index]['unidades']--;
            
            if($_SESSION['añadir'][$index]['unidades'] == 0){
                unset($_SESSION['añadir'][$index]);
            }
        }
        echo '<script>window.location="'.base_url.'añadir/index"</script>';
    }

    public function delete_all() {
        unset($_SESSION['añadir']);
        echo '<script>window.location="'.base_url.'añadir/index"</script>';
    }
}

?>