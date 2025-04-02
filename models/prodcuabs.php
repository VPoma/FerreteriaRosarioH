<?Php

Class prodcuadbs{
    private $id_producto;
    private $db;

    public function __construct(){
        $this->db = Database::connect();
    }

    function getId_producto(){
        return $this->id_producto;
    }

    //

    function setId_producto($id_producto){
        $this->id_producto = $id_producto;
    }

    //Consultas

    //Mostrar listado de productos que salieron e ingrsaron a almacen - 1prodcuabs
    public function buscaprodie(){
        $sql = "SELECT cu.id as 'id', cu.fecha as 'fechareg', cu.fecha_sal as 'fecha', 'cuaderno' AS 'fuente', pc.cantidad as 'cantidad', cu.estado "
                . "FROM producto_cuaderno pc "
                . "INNER JOIN cuaderno cu ON cu.id = pc.id_cuaderno "
                . "INNER JOIN producto p ON p.id = pc.id_producto "
                . "INNER JOIN familia fa ON fa.id = p.id_familia "
                . "INNER JOIN linea li ON li.id = p.id_linea "
                . "INNER JOIN marca ca ON ca.id = p.id_marca "
                . "WHERE pc.id_producto = {$this->getId_producto()} AND pc.est = 'H' "
                . "UNION "
                . "SELECT ab.id as 'id', ab.fecha as 'fechareg', ab.fecha_ent as 'fecha', 'abastecer' AS 'fuente', pa.cantidad as 'cantidad', ab.estado "
                . "FROM producto_abastecer pa "
                . "INNER JOIN abastecer ab ON ab.id = pa.id_abastecer "
                . "INNER JOIN producto p ON p.id = pa.id_producto "
                . "INNER JOIN familia fa ON fa.id = p.id_familia "
                . "INNER JOIN linea li ON li.id = p.id_linea "
                . "INNER JOIN marca ca ON ca.id = p.id_marca "
                . "WHERE pa.id_producto = {$this->getId_producto()} AND pa.est = 'H' "
                . "ORDER BY fecha DESC;";
        $productoie = $this->db->query($sql);
        return $productoie;
    }

}