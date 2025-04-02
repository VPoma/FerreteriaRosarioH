<?Php

require_once 'models/producto.php';

Class productoController{
    //Mostrar listado de productos con imagenes (para el carrito) - 1producto
    public function index(){
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
         //Mostrar listado de productos con imagenes (para el carrito) - 1producto
        $product = $producto->getRandom();
    
        //Saca la cantidad de lineas - 0producto
        $total = $producto->getAlltotal();

        $totalP = ceil($total/$limite);
        $totalPag = $totalP;

        require_once  'views/producto/listadopr.php';
    }

    //Mostrar listado de productos con imagenes CON FILTRO (para el carrito) - 2producto
    public function filtroindex(){
        if(isset($_POST)){
            $familia = isset($_POST['familia']) ? $_POST['familia'] : false;
            $linea = isset($_POST['linea']) ? $_POST['linea'] : false;
            $marca = isset($_POST['marca']) ? $_POST['marca'] : false;
            $nombre = isset($_POST['nombre']) ? $_POST['nombre'] : false;
            $medida = isset($_POST['medida']) ? $_POST['medida'] : false;
            $codigo = isset($_POST['codigo']) ? $_POST['codigo'] : false;

            $producto = new producto();

            if(strlen(trim($familia)) == 0 && strlen(trim($linea)) == 0 && strlen(trim($marca)) == 0 && strlen(trim($nombre)) == 0 && strlen(trim($medida)) == 0 && strlen(trim($codigo)) == 0){
                
                echo '<script>window.location="'.base_url.'producto/index"</script>';

            }else{

                $producto->setFamilia($familia);
                $producto->setLinea($linea); 
                $producto->setMarca($marca);
                $producto->setNombre($nombre);
                $producto->setMedida($medida);
                $producto->setCodigo($codigo);
                //Mostrar listado de productos con imagenes CON FILTRO (para el carrito) - 2producto
                $product = $producto->getfillRandom();

            }

        }

        require_once  'views/producto/listadopr.php';
    }

    //MOSTRAR PRODUCTO UNITARIAMENTE - 3producto
    public function ver(){
        if(isset($_GET['id'])){
            $id = $_GET['id'];

            $producto = new Producto();
            $producto->setId($id);
            
            $product = $producto->getOnever();

            require_once 'views/producto/verpr.php';
        }
    }

    //LLAMA LA INTERFAS DE REGISTRO DE PRODUCTO
    public function registro(){
        require_once 'views/producto/registropr.php';
    }

    //Guardar Registro de Productos - 4producto
    public function save(){
        if(isset($_POST)){
            $tienda = isset($_POST['tienda']) ? $_POST['tienda'] : false;
            $familia = isset($_POST['familia']) ? $_POST['familia'] : false;
            $linea = isset($_POST['linea']) ? $_POST['linea'] : false;
            $marca = isset($_POST['marca']) ? $_POST['marca'] : false;
            $codigo = isset($_POST['codigo']) ? $_POST['codigo'] : false;
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
                $producto->setCodigo($codigo);
                $producto->setNombre($nombre);
                $producto->setMedida($medida);
                $producto->setCantidad(floatval($cantidad));
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
                    //EDITA LOS REGISTROS DE PRODUCTOS - 6producto
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
        //Paginador
        if(isset($_GET['pag'])){
            $pag = $_GET['pag'];
        }else{
            $pag = 1;
        }

        $limite = 10;
        $offset = ($pag-1)*$limite;

        //MUESTRA TODOS LOS REGISTROS SIN FILTRO - LISTADO - 5producto
        $producto = new Producto();
        $producto->setOffset($offset);
        $producto->setLimite($limite);

        $prod = $producto->getAll();

        $total = $producto->getAlltotal();

        $totalP = ceil($total/$limite);
        $totalPag = $totalP;

        require_once 'views/producto/gestionpr.php';
    }

    public function filtrogestion(){
        if(isset($_POST)){
            $familia = isset($_POST['familia']) ? $_POST['familia'] : false;
            $linea = isset($_POST['linea']) ? $_POST['linea'] : false;
            $marca = isset($_POST['marca']) ? $_POST['marca'] : false;
            $nombre = isset($_POST['nombre']) ? $_POST['nombre'] : false;
            $medida = isset($_POST['medida']) ? $_POST['medida'] : false;

            $producto = new producto();

            if(strlen(trim($familia)) == 0 && strlen(trim($linea)) == 0 && strlen(trim($marca)) == 0 && strlen(trim($nombre)) == 0 && strlen(trim($medida)) == 0){
                
                echo '<script>window.location="'.base_url.'producto/gestion"</script>';

            }else{

            $producto->setFamilia($familia);
            $producto->setLinea($linea); 
            $producto->setMarca($marca);
            $producto->setNombre($nombre);
            $producto->setMedida($medida);
            //MUESTRA TODOS LOS REGISTROS CON FILTRO - LISTADO - 18producto
            $prod = $producto->getAllfiltro();

            }

        }

        require_once 'views/producto/gestionpr.php';
    }

    public function editar(){
        if(isset($_GET['id'])){
            $id = $_GET['id'];
            $edit = true;

            $producto = new Producto();
            $producto->setId($id);
            
            //Busca un registro de producto a partir del id - 17producto
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
            
            //Busca un registro de producto a partir del id - 17producto
            $pro = $producto->getOne();

            require_once 'views/producto/eliminarpr.php';
        }else{
            //header('Location:'.base_url.'usuario/gestion');
            echo '<script>window.location="'.base_url.'producto/gestion"</script>';
        }

    }

    //EDITA LOS REGISTROS DE OCULTAR PRODUCTOS - 7producto
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

}

?>