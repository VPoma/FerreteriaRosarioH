<?php

class Utils{

    public static function deleteSession($name){
        if(isset($_SESSION[$name])){
            $_SESSION[$name] = null;
            unset($_SESSION[$name]);
        }

        return $name;
    }

    public static function isAdmin(){
        if(!isset($_SESSION['admin'])){
            header("Location:".base_url);
        }else{
            return true;
        }
    }

    public static function isIdentity(){
        if(!isset($_SESSION['identity'])){
            header("Location:".base_url);
        }else{
            return true;
        }
    }

    public static function showCiudad(){
        require_once 'models/ciudad.php';
        $ciudad = new Ciudad();
        $ciudades = $ciudad->getAll();
        return $ciudades;
    }

    public static function showTienda(){
        require_once 'models/tienda.php';
        $tienda = new Tienda();
        $tiendas = $tienda->getAll();
        return $tiendas;
    }

    public static function showFamilia(){
        require_once 'models/familia.php';
        $familia = new Familia();
        $familias = $familia->getAll();
        return $familias;
    }

    public static function showLinea(){
        require_once 'models/linea.php';
        $linea = new Linea();
        $lineas = $linea->getAll();
        return $lineas;
    }

    public static function showMarca(){
        require_once 'models/marca.php';
        $marca = new Marca();
        $marcas = $marca->getAll();
        return $marcas;
    }

    public static function showMarcaFi(){
        require_once 'models/marca.php';
        $marca = new Marca();
        $marcas = $marca->getAllFi();
        return $marcas;
    }

    public static function showTipodoc(){
        require_once 'models/tipodoc.php';
        $tipodoc = new Tipodoc();
        $tdoc = $tipodoc->getAll();
        return $tdoc;
    }

    public static function showUsuario(){
        require_once 'models/usuario.php';
        $usuario = new Usuario();
        $usuarios = $usuario->getAll();
        return $usuarios;
    }

    public static function statsCarrito(){
        $stats = array(
            'count' => 0.00,
            'total' => 0.00
        );

        if(isset($_SESSION['carrito'])){
            $stats['count'] =count($_SESSION['carrito']);
            
            foreach($_SESSION['carrito'] as $producto){
                $stats['total'] += $producto['precio']*$producto['unidades'];

            }
        }
        return $stats;
    }

    public static function statsAñadir(){
        $stats = array(
            'count' => 0.00,
            'total' => 0.00
        );

        if(isset($_SESSION['añadir'])){
            $stats['count'] =count($_SESSION['añadir']);
            
            foreach($_SESSION['añadir'] as $producto){
                $stats['total'] += $producto['precio']*$producto['unidades'];

            }
        }
        return $stats;
    }

/*
    public static function showCatTick(){
        require_once 'models/categoria.php';
        $categoria = new Categoria();
        $categorias = $categoria->getAllTick();
        return $categorias;
    }

    public static function showUsuario(){
        require_once 'models/usuario.php';
        $usuario = new Usuario();
        $usuarios = $usuario->getAllu();
        return $usuarios;
    }

    public static function showPersonal(){
        require_once 'models/usuario.php';
        $persona = new Usuario();
        $personal = $persona->getAllp();
        return $personal;
    }*/
}

?>