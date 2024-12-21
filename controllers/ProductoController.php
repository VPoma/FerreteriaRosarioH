<?Php

require_once 'models/producto.php';

Class productoController{
    public function index(){
        //Mostrar listado de productos con imagenes (para el carrito)
        if(isset($_GET['pag'])){
            $pag = $_GET['pag'];
        }else{
            $pag = 1;
        }

        $limite = 9;
        $offset = ($pag-1)*$limite;

        $producto = new Producto;
        $producto->setOffset($offset);
        $producto->setLimite($limite);

        $product = $producto->getRandom();

        $total = $producto->getAlltotal();

        $totalP = ceil($total/$limite);
        $totalPag = $totalP;

        require_once  'views/producto/listadopr.php';
    }

    public function filtroindex(){
        //Mostrar listado de productos con imagenes CON FILTRO (para el carrito)
        if(isset($_POST)){
            $linea = isset($_POST['linea']) ? $_POST['linea'] : false;
            $marca = isset($_POST['marca']) ? $_POST['marca'] : false;
            $nombre = isset($_POST['nombre']) ? $_POST['nombre'] : false;

            $producto = new producto();

            if(strlen(trim($linea)) == 0 && strlen(trim($marca)) == 0 && strlen(trim($nombre)) == 0){
                
                echo '<script>window.location="'.base_url.'producto/index"</script>';

            }else{

            $producto->setLinea($linea); 
            $producto->setMarca($marca);
            $producto->setNombre($nombre);

            $product = $producto->getfillRandom();

            }

        }

        require_once  'views/producto/listadopr.php';
    }

    public function ver(){
        //MOSTRAR PRODUCTO UNITARIAMENTE
        if(isset($_GET['id'])){
            $id = $_GET['id'];

            $producto = new Producto();
            $producto->setId($id);
            
            $product = $producto->getOnever();

            require_once 'views/producto/verpr.php';
        }
    }

    public function registro(){
        
        require_once 'views/producto/registropr.php';
    }

    //Guardar Registro de Productos
    public function save(){
        if(isset($_POST)){
            $tienda = isset($_POST['tienda']) ? $_POST['tienda'] : false;
            $familia = isset($_POST['familia']) ? $_POST['familia'] : false;
            $linea = isset($_POST['linea']) ? $_POST['linea'] : false;
            $marca = isset($_POST['marca']) ? $_POST['marca'] : false;
            $nombre = isset($_POST['nombre']) ? $_POST['nombre'] : false;
            $medida = isset($_POST['medida']) ? $_POST['medida'] : false;
            $cantidad = isset($_POST['cantidad']) ? $_POST['cantidad'] : false;
            $paquete = isset($_POST['paquete']) ? $_POST['paquete'] : false;
            $preciob = isset($_POST['preciob']) ? $_POST['preciob'] : false;
            $preciof = isset($_POST['preciof']) ? $_POST['preciof'] : false;
            $precioc = isset($_POST['precioc']) ? $_POST['precioc'] : false;
            //$imagen = isset($_POST['imagen']) ? $_POST['imagen'] : false;

            if($tienda && $familia && $linea && $marca && $nombre && $medida){
                $producto = new Producto;
                $producto->setId_tienda($tienda);
                $producto->setId_familia($familia);
                $producto->setId_linea($linea);
                $producto->setId_marca($marca);
                $producto->setNombre($nombre);
                $producto->setMedida($medida);
                $producto->setCantidad($cantidad);
                $producto->setPaquete($paquete);
                $producto->setPreciob($preciob);
                $producto->setPreciof($preciof);
                $producto->setPrecioc($precioc);

                //Guardar la imagen
                if(isset($_FILES['imagen'])){
                    $file = $_FILES['imagen'];
                    $filename = $file['name'];
                    $mimetype = $file['type'];

                    if($mimetype == "image/jpg" || $mimetype == 'image/jpeg' || $mimetype == 'image/png' || $mimetype == 'image/gif'){
                            
                        if(!is_dir('uploads/images')){
                            mkdir('uploads/images', 0777, true);
                        }

                        move_uploaded_file($file['tmp_name'],'uploads/images/'.$filename);
                        $producto->setImagen($filename);
                    }
                }

                if(isset($_GET['id'])){
                    $id = $_GET['id'];
                    $producto->setId($id);
                    $save = $producto->edit();
                }else{
                    $save = $producto->save();

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
        echo '<script>window.location="'.base_url.'producto/gestion"</script>';
        
    }

    public function gestion(){
        $producto = new Producto();
        $prod = $producto->getAll();

        require_once 'views/producto/gestionpr.php';
    }

    public function editar(){

        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $edit = true;

            $producto = new Producto();
            $producto->setId($id);
            
            $pro = $producto->getOne();

            require_once 'views/producto/registropr.php';
        }else{
            echo '<script>window.location="'.base_url.'producto/gestion"</script>';
        }
    }

    public function eliminar(){

        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $delete = true;

            $producto = new Producto();
            $producto->setId($id);
            
            $pro = $producto->getOne();

            require_once 'views/producto/eliminarpr.php';
        }else{
            //header('Location:'.base_url.'usuario/gestion');
            echo '<script>window.location="'.base_url.'producto/gestion"</script>';
        }

    }

    public function delete(){

        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $producto = new Producto();
            $producto->setId($id);
            $delete = $producto->edit_oculta(); 
            
            if($delete){
                $_SESSION['delete'] = 'complete';
            }else{
                $_SESSION['delete'] = 'failed';
            }
        }else{
            $_SESSION['delete'] = 'failed';
        }

        echo '<script>window.location="'.base_url.'producto/gestion"</script>';
    }

    
    public function venta(){
        
        echo "<h1>Realizar Ventas</h1>";
    }


}

?>