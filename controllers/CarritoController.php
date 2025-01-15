<?Php
require_once 'models/descuento.php';
require_once 'models/producto.php';

Class carritoController{

    public function index(){

        if(isset($_SESSION['carrito']) && count($_SESSION['carrito']) >= 1){
            $carrito = $_SESSION['carrito'];
        }else{
            $carrito = array();
        }

        require_once 'views/carrito/index.php';
    }

    public function add(){
        if(isset($_GET['id'])){
            $producto_id = $_GET['id'];
        }else{
            header('Location:'.base_url);
        }

        if(isset($_SESSION['carrito'])){
            $counter = 0;
            foreach($_SESSION['carrito'] as $indice => $elemento){
                if($elemento['id_producto'] == $producto_id){
                    $_SESSION['carrito'][$indice]['unidades']++;
                    $counter++;
                }
            }

        }

        if(!isset($counter) || $counter == 0){
            //Conseguir producto
            $producto = new Producto();
            $producto->setId($producto_id);
            //MOSTRAR PRODUCTO UNITARIAMENTE - 3producto
            $producto = $producto->getOnever();

            //añadir al carrito
            if(is_object($producto)){
                $_SESSION['carrito'][] = array(
                    "id_producto" => $producto->id,
                    "precio" => $producto->preciob,
                    "unidades" => 1,
                    "producto" => $producto
                );

            }
        }
        
        echo '<script>window.location="'.base_url.'carrito/index"</script>';
    }

    public function remove(){
        if(isset($_GET['index'])){
            $index = $_GET['index'];
            unset($_SESSION['carrito'][$index]);
        }
        echo '<script>window.location="'.base_url.'carrito/index"</script>';
    }

    public function cantipreci(){
        $unidades = isset($_POST['unidades']) ? $_POST['unidades'] : false;
        $unid = intval($unidades);

        if(isset($_GET['index'])){
            $index = $_GET['index'];
            $_SESSION['carrito'][$index]['unidades'] = $unid;
        }

        if($_SESSION['carrito'][$index]['unidades'] == 0){
            unset($_SESSION['carrito'][$index]);
        }

        //Envía el descuento para calculo - 4descuento
        $descuento = new Descuento();
        $desc = $descuento->getAllpor();
        $porcent = floatval($desc->porcentaje);

        $preciob = isset($_POST['preciob']) ? $_POST['preciob'] : false;
        $prec = floatval($preciob);

        if(isset($_GET['index'])){
            $index = $_GET['index'];

            if(isset($_GET['index'])){
                $id = $_SESSION['carrito'][$index]['producto']->id;
                $producto = new Producto();
                $producto->setId($id);
                //MOSTRAR PRODUCTO UNITARIAMENTE - 3producto
                $prod = $producto->getOnever();
            }

            $preciobase = floatval($prod->preciob);
            $descuent = floatval($preciobase * $porcent);
            $rebaja =  floatval($preciobase - $descuent);

            if($rebaja <= $prec && $prec <= $preciobase){
                $_SESSION['carrito'][$index]['precio'] = $prec;
            }else{
                $_SESSION['carrito'][$index]['precio'] = $preciobase;
            }
        }

        echo '<script>window.location="'.base_url.'carrito/index"</script>';
    }

    public function up(){
        if(isset($_GET['index'])){
            $index = $_GET['index'];
            $_SESSION['carrito'][$index]['unidades']++;
        }

    echo '<script>window.location="'.base_url.'carrito/index"</script>';
}

    public function down(){
        if(isset($_GET['index'])){
            $index = $_GET['index'];
            $_SESSION['carrito'][$index]['unidades']--;
            
            if($_SESSION['carrito'][$index]['unidades'] == 0){
                unset($_SESSION['carrito'][$index]);
            }
        }
        echo '<script>window.location="'.base_url.'carrito/index"</script>';
    }

    public function delete_all() {
        unset($_SESSION['carrito']);
        echo '<script>window.location="'.base_url.'carrito/index"</script>';
    }


}

?>