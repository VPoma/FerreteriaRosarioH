<h1>DETALLE DE COTIZACIÓN N° <?=$cua->id_cot?></h1>

<?Php if(isset($cua)):?>
        <h3>DATOS</h3>
            <table>
                <tr>
                    <th>Tienda</th>
                    <th>Fecha</th>
                    <th>Hora</th>
                </tr>
                <tr>
                    <td><?=$cua->tienda?></td>
                    <td><?=$cua->fecha_cot?></td>
                    <td><?=$cua->hora_cot?></td>
                </tr>
                <tr>
                    <th>Vendedor</th>
                    <th>Cliente</th>
                    <th>Monto Total</th>
                </tr>
                <tr>
                    
                    <td><?=$cua->nombre?> <?=$cua->apellidos?></td>
                    <td><?=$cua->nombrecom?></td>
                    <td><?=$cua->total?></td>
                </tr>
            </table>

            <br><br>

            <table>
                <tr>
                    <th>Imagen</th>
                    <th>Marca</th>
                    <th>Nombre</th>
                    <th>Medida</th>
                    <th>Precio</th>
                    <th>Cantidad</th>
                </tr>
            <?Php while($prod = $prodcua->fetch_object()): ?>
                <tr>
                    <td>
                        <?Php if($prod->imagen != null): ?>
                            <img src="<?=base_url?>uploads/images/<?=$prod->imagen?>" class="img_carrito" />
                        <?Php else: ?>
                            <img src="<?=base_url?>assets/images/ferre.jpg" class="img_carrito" />
                        <?Php endif; ?>
                    </td>
                    <td>
                        <?=$prod->marca?>
                    </td>
                    <td>
                        <?=$prod->nombre?>
                    </td>
                    <td>
                        <?=$prod->medida?>
                    </td>
                    <td>
                        S/.<?=$prod->precio?>
                    </td>
                    <?Php
                    $unidades = $prod->cantidad;
                    // Verifica si el número tiene decimales
                    if (floor($unidades) == $unidades){
                        // Si no tiene decimales, muestra el número sin decimales
                        $cantidad = number_format($unidades, 0);
                    }else{
                        // Si tiene decimales, muestra el número con dos decimales
                        $cantidad = number_format($unidades, 2);
                    }
                    ?>
                    <td>
                        <?=$cantidad?>
                    </td>
                </tr>
            <?Php endwhile;?>
        </table>
    <br>

    <div class="fila-1">
    
        <?Php if(isset($_SESSION['admin'])): ?>
            <a href="<?=base_url?>cotizacion/eliminarcoti&id=<?=$cua->id?>" class="button extrae-colort">Anular</a>
        <?Php endif;?>

        <form action="<?=base_url?>views/cotizacion_tik.php" method="GET" target="_blank">
            <input type="hidden" value="<?=$cua->id?>" name="id"/>
            <input type="submit" value="Imprimir" name="Imprimir" class="button solide-colort"/>
        </form>
        <a href="<?=base_url?>carrito/add&idc=<?=$cua->id?>" class="button solide-colort">Editar</a>

        <a href="<?=base_url?>cotizacion/nnventa&id=<?=$cua->id?>" class="button solide-colort">NVenta</a>

    </div>
    
<?Php endif; ?>
    <br><br>

<a href="<?=base_url?>cotizacion/regiscotizacion" class="button extrae-colort" style="margin-left: 6%">Regresar</a>