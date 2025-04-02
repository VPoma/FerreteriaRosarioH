<h1>DETALLE DE NOTA DE VENTA N° <?=$cua->id_cua?></h1>

<?Php if(isset($cua)):?>
        <h3>Datos de Nota de Venta:</h3>
            <table>
                <tr>
                    <th>Tienda</th>
                    <th>Fecha</th>
                    <th>Hora</th>
                </tr>
                <tr>
                    <td><?=$cua->tienda?></td>
                    <td><?=$cua->fecha?></td>
                    <td><?=$cua->hora?></td>
                </tr>
                <tr>
                    <th>Vendedor</th>
                    <th>Cliente</th>
                    <th>Situación</th>
                </tr>
                <tr>
                    
                    <td><?=$cua->nombre?> <?=$cua->apellidos?></td>
                    <td><?=$cua->nombrecom?></td>
                    <td><?=$cua->situacion?></td>
                </tr>
                <tr>
                    <th>Monto Total</th>
                    <th>Importe</th>
                    <th>Resto</th>
                </tr>
                <tr>
                    <td><?=$cua->total?></td>
                    <td><?=$cua->importe?></td>
                    <td><?=$cua->resto?></td>
                </tr>
                <tr>
                    <th>Estado</th>
                    <th>Fecha de Entrega</th>
                    <th>Hora de Entrega</th>
                </tr>
                <tr>
                    <td><?=$cua->estado?></td>
                    <td><?=$cua->fecha_sal?></td>
                    <td><?=$cua->hora_sal?></td>
                </tr>
                <tr>
                    <th>Descripción</th>
                </tr>
                <tr>
                    <td><?=$cua->descripcion?></td>
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

    <table  style="margin-left: 13%;">
        <tr>
            <?Php if(isset($_SESSION['admin']) && $cua->estado != "ANULADO"): ?>
            <th>
                <a href="<?=base_url?>cuaderno/eliminar&id=<?=$cua->id?>" class="button extrae-colort" style="margin-left: 6%; width:85px;">Anular</a>
            </th>
            <th>
                <a href="<?=base_url?>cuaderno/editacua&id=<?=$cua->id?>" class="button solide-colort" style="margin-left: 6%; width:95px;">Editar C.</a>
            </th>
            <?Php endif;?>
            <th>
                <?php if($cua->situacion != "CANCELADO"):?>
                    <a href="<?=base_url?>cuaderno/pago&id=<?=$cua->id?>" class="button solide-colort" style="margin-left: 6%; width:80px;">Pago</a>
                <?Php endif;?>
            </th>
            <th>
                <form action="<?=base_url?>views/comprobante_tik.php" method="GET" target="_blank">
                    <input type="hidden" value="<?=$cua->id?>" name="id"/>
                    <input type="submit" value="Imprimir" name="Imprimir" class="button solide-colort" style="margin-left: 6%; width:90px;"/>
                </form>
            </th>
            <?Php if($cua->estado != "ENTREGADO AZAPAMPA" && $cua->estado != "ENTREGADO HUANCAN" && $cua->estado != "ANULADO"):?>
            <th>
                <a href="<?=base_url?>cuaderno/entregaH&id=<?=$cua->id?>" class="button solide-colort" style="margin-left: 6%; width:150px;">Entr. Huancan</a>
            </th>
            <th>
                <a href="<?=base_url?>cuaderno/entrega&id=<?=$cua->id?>" class="button solide-colort" style="margin-left: 6%; width:155px;">Entr. Azapampa</a>
            </th>
            <?Php endif;?>
            <th>
                <a href="<?=base_url?>cuaderno/Comprobante" class="button solide-colort" style="margin-left: 6%; width:155px;">Comprobante E.</a>
            </th>
        </tr>
    </table>
    
<?Php endif; ?>
    <br><br>

<a href="<?=base_url?>cuaderno/registroscuaderno" class="button extrae-colort" style="margin-left: 6%">Regresar</a>