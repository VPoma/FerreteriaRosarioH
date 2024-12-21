<?Php

class producto{
    private $id;
    private $id_tienda;
    private $id_familia;
    private $id_linea;
    private $id_marca;
    private $id_descuento;
    private $nombre;
    private $medida;
    private $cantidad;
    private $paquete;
    private $imagen;
    private $preciob;
    private $preciof;
    private $precioc;
    private $est;
    //variables extra
    private $limite;
    private $offset;
    //
    //Filtro
    private $linea;
    private $marca;
    //
    private $db;

    public function __construct(){
        $this->db = Database::connect();
    }

    function getId(){
        return $this->id;
    }

    function getId_tienda(){
        return $this->id_tienda;
    }

    function getId_familia(){
        return $this->id_familia;
    }

    function getId_linea(){
        return $this->id_linea;
    }

    function getId_marca(){
        return $this->id_marca;
    }

    function getId_descuento(){
        return $this->id_descuento;
    }

    function getNombre(){
        return $this->nombre;
    }

    function getMedida(){
        return $this->medida;
    }


    function getCantidad(){
        return $this->cantidad;
    }

    function getPaquete(){
        return $this->paquete;
    }

    function getImagen(){
        return $this->imagen;
    }

    function getPreciob(){
        return $this->preciob;
    }

    function getPreciof(){
        return $this->preciof;
    }

    function getPrecioc(){
        return $this->precioc;
    }

    function getEst(){
        return $this->est;
    }

    //variables extra
    function getLimite(){
        return $this->limite;
    }

    function getOffset(){
        return $this->offset;
    }
    //

    //Filtro
    function getLinea(){
        return $this->linea;
    }

    function getMarca(){
        return $this->marca;
    }
    //

    function setId($id){
        $this->id = $id;
    }

    function setId_tienda($id_tienda){
        $this->id_tienda = $id_tienda;
    }

    function setId_familia($id_familia){
        $this->id_familia = $id_familia;
    }

    function setId_linea($id_linea){
        $this->id_linea = $id_linea;
    }

    function setId_marca($id_marca){
        $this->id_marca = $id_marca;
    }

    function setId_descuento($id_descuento){
        $this->id_descuento = $id_descuento;
    }

    function setNombre($nombre){
        $this->nombre = $this->db->real_escape_string($nombre);
    }

    function setMedida($medida){
        $this->medida = $this->db->real_escape_string($medida);
    }

    function setCantidad($cantidad){
        $this->cantidad = $cantidad;
    }

    function setPaquete($paquete){
        $this->paquete = $paquete;
    }

    function setImagen($imagen){
        $this->imagen = $this->db->real_escape_string($imagen);
    }

    function setPreciob($preciob){
        $this->preciob = $preciob;
    }

    function setPreciof($preciof){
        $this->preciof = $preciof;
    }

    function setPrecioc($precioc){
        $this->precioc = $precioc;
    }

    function setEst($est){
        $this->est = $this->db->real_escape_string($est);
    }

    //variables extra
    function setLimite($limite){
        $this->limite = $limite;
    }

    function setOffset($offset){
        $this->offset = $offset;
    }
    //
    
    //Filtro
    function setLinea($linea){
        $this->linea = $linea;
    }

    function setMarca($marca){
        $this->marca = $marca;
    }
    //

    //Consultas

    //Producto Controller
    //Saca la cantidad de lineas - 0
    public function getAlltotal(){
        $producto  = $this->db->query("SELECT * FROM producto WHERE est = 'H'");
        return $producto->num_rows;
    }

    //Mostrar listado de productos con imagenes (para el carrito) - 1
    public function getRandom(){
        $sql = "SELECT p.id, p.nombre as 'nombre', p.medida as 'medida', p.imagen as 'imagen', p.preciob as 'precio', m.nombre as 'marca' FROM producto p "
                . "INNER JOIN marca m ON m.id = p.id_marca "
                . "WHERE p.est = 'H' ORDER BY p.nombre LIMIT {$this->getOffset()},{$this->getLimite()};";
        $producto = $this->db->query($sql);
        return $producto;
    }

    //Mostrar listado de productos con imagenes CON FILTRO (para el carrito) - 2
    public function getfillRandom(){
        $sql = "SELECT p.id, p.nombre as 'nombre', p.medida as 'medida', p.imagen as 'imagen', p.preciob as 'precio', m.nombre as 'marca' FROM producto p "
                . "INNER JOIN marca m ON m.id = p.id_marca INNER JOIN linea l ON l.id = p.id_linea "
                . "WHERE l.nombre like '%{$this->getLinea()}%' AND m.nombre like '%{$this->getMarca()}%' "
                . "AND p.nombre like '%{$this->getNombre()}%' AND p.est = 'H' ORDER BY p.nombre;";
        $producto = $this->db->query($sql);
        return $producto;
    }

    //MOSTRAR PRODUCTO UNITARIAMENTE - 3
    public function getOnever(){
        $sql = "SELECT p.id, p.nombre, p.medida, p.imagen, p.preciof, p.preciob, p.precioc, l.nombre as 'linea', m.nombre as 'marca' FROM producto p "
                . "INNER JOIN linea l ON l.id = p.id_linea "
                . "INNER JOIN marca m ON m.id = p.id_marca "
                . "WHERE p.id = {$this->getId()};";
        $producto = $this->db->query($sql);
        return $producto->fetch_object();
    }

    //Guardar Registro de Productos - 4
    public function save(){
        $sql = "INSERT INTO producto VALUES(NULL, {$this->getId_tienda()}, {$this->getId_familia()}, {$this->getId_linea()}, {$this->getId_marca()}, 1, '{$this->getNombre()}', '{$this->getMedida()}', {$this->getCantidad()}, {$this->getPaquete()}, '{$this->getImagen()}', {$this->getPreciob()}, {$this->getPreciof()}, {$this->getPrecioc()}, 'H');";
        $save = $this->db->query($sql);
        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

    //MUESTRA TODOS LOS REGISTROS SIN FILTRO - LISTADO - 5
    public function getAll(){
        $sql = "SELECT p.*, t.nombre as 'tienda', f.nombre as 'familia', l.nombre as 'linea', m.nombre as 'marca' FROM producto p "
                . "INNER JOIN tienda t ON t.id = p.id_tienda "
                . "INNER JOIN familia f ON f.id = p.id_familia "
                . "INNER JOIN linea l ON l.id = p.id_linea "
                . "INNER JOIN marca m ON m.id = p.id_marca "
                . "WHERE p.est = 'H' ORDER BY id DESC;";
        $producto = $this->db->query($sql);
        return $producto;
    }

    //EDITA LOS REGISTROS DE PRODUCTOS - 6
    public function edit(){
        $sql = "UPDATE producto SET id_tienda = {$this->getId_tienda()}, id_familia = {$this->getId_familia()}, id_linea = {$this->getId_linea()}, id_marca = {$this->getId_marca()}, nombre = '{$this->getNombre()}', medida = '{$this->getMedida()}', cantidad = {$this->getCantidad()}, paquete = {$this->getPaquete()}, preciob = {$this->getPreciob()}, preciof = {$this->getPreciof()}, precioc = {$this->getPrecioc()} ";
        
        if($this->getImagen() != null){
            $sql .= ", imagen = '{$this->getImagen()}'"; 
        }
        $sql .= "WHERE id = {$this->getId()};";
        //$sql .= "WHERE id = {$this->id};";

        $save = $this->db->query($sql);

        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

    //EDITA LOS REGISTROS DE OCULTAR PRODUCTOS - 7
    public function edit_oculta(){
        $sql = "UPDATE producto SET est = 'D' WHERE id = {$this->getId()};";
        $save = $this->db->query($sql);

        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

    //Abastecer Controller

    //Muestra todos los productos para ABASTECER - 8
    public function getAllab(){
        $sql = "SELECT p.*, f.nombre as 'familia', l.nombre as 'linea', m.nombre as 'marca' FROM producto p "
                . "INNER JOIN familia f ON f.id = p.id_familia "
                . "INNER JOIN linea l ON l.id = p.id_linea "
                . "INNER JOIN marca m ON m.id = p.id_marca "
                . "WHERE p.est = 'H' ORDER BY p.id LIMIT {$this->getOffset()},{$this->getLimite()};";
        $producto = $this->db->query($sql);
        return $producto;
    }

    //Muestra todos los productos para ABASTECER FILTRADO  - 9
    public function getFillab(){
        $sql = "SELECT p.*, f.nombre as 'familia', l.nombre as 'linea', m.nombre as 'marca' FROM producto p "
                . "INNER JOIN familia f ON f.id = p.id_familia "
                . "INNER JOIN linea l ON l.id = p.id_linea "
                . "INNER JOIN marca m ON m.id = p.id_marca "
                . "WHERE l.nombre like '%{$this->getLinea()}%' AND m.nombre like '%{$this->getMarca()}%' "
                . "AND p.nombre like '%{$this->getNombre()}%' AND p.est = 'H' ORDER BY p.nombre;";
        $producto = $this->db->query($sql);
        return $producto;
    }

    //Cuaderno Controller - Abastecer Controller
    //Edita y resta la cantidad de productos  - 10
    public function salida(){
        $sql = "UPDATE producto SET cantidad = {$this->getCantidad()} WHERE id = {$this->getId()};";
        $save = $this->db->query($sql);

        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

    ////
    public function getAll_simple(){
        $producto = $this->db->query("SELECT * FROM producto WHERE est = 'H' ORDER BY id DESC;");
        return $producto;
    }

    public function getOne(){
        $producto = $this->db->query("SELECT * FROM producto WHERE id = {$this->getId()} ORDER BY id DESC;");
        return $producto->fetch_object();
    }

    //backup
    public function getRandom01($limit){
        $sql = "SELECT p.id, p.nombre as 'nombre', p.medida as 'medida', p.imagen as 'imagen', p.preciof as 'precio', m.nombre as 'marca' FROM producto p "
                . "INNER JOIN marca m ON m.id = p.id_marca "
                . "WHERE p.est = 'H' ORDER BY RAND() LIMIT $limit;";
        $producto = $this->db->query($sql);
        return $producto;
    }

    //PRECIO
    //para inserción de precios Fierro
    public function getFierro(){
        $sql = "SELECT p.id as 'id', p.paquete as 'paquete' from producto P "
                . "INNER JOIN marca m ON m.id = p.id_marca INNER JOIN linea l ON l.id = p.id_linea "
                . "WHERE p.id_marca = {$this->getId_marca()};";
        $producto = $this->db->query($sql);
        return $producto;
    }

    public function edit_pfierro(){
        $sql = "UPDATE producto SET preciob = {$this->getPreciob()}, preciof = {$this->getPreciof()}, precioc = {$this->getPrecioc()} WHERE id = {$this->getId()};";
        $save = $this->db->query($sql);

        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

    public function gettablaprecio(){
        $sql = "SELECT po.id, m.nombre as 'marca', l.nombre as 'linea', po.nombre, po.medida, po.preciob, po.preciof, po.precioc FROM producto po "
                . "INNER JOIN marca m ON m.id = po.id_marca INNER JOIN linea l ON l.id = po.id_linea WHERE po.est = 'H' ORDER BY id DESC LIMIT {$this->getOffset()},{$this->getLimite()};";
        $producto = $this->db->query($sql);
        return $producto;
    }

    public function gettablapreciofill(){
        $sql = "SELECT po.id, m.nombre as 'marca', l.nombre as 'linea',po.nombre, po.preciob, po.medida, po.preciof, po.precioc FROM producto po "
                . "INNER JOIN marca m ON m.id = po.id_marca INNER JOIN linea l ON l.id = po.id_linea WHERE m.nombre like '%{$this->getMarca()}%' AND po.est = 'H' ORDER BY id DESC;";
        $producto = $this->db->query($sql);
        return $producto;
    }

    public function edit_precio(){
        $sql = "UPDATE producto SET preciob = {$this->getPreciob()}, preciof = {$this->getPreciof()}, precioc = {$this->getPrecioc()} WHERE id = {$this->getId()};";
        $save = $this->db->query($sql);

        $result = false;
        if($save){
            $result = true;
        }

        return $result;
    }

    public function getOne_precio(){
        $producto = $this->db->query("SELECT p.id, p.nombre, p.medida, p.preciob, p.preciof, p.precioc, l.nombre as 'linea', m.nombre as 'marca' FROM producto p INNER JOIN linea l ON l.id = p.id_linea INNER JOIN marca m ON m.id = p.id_marca WHERE p.id = {$this->getId()} ORDER BY id DESC;");
        return $producto->fetch_object();
    }

}

?>