<?Php if(isset($_SESSION['pedido']) && $_SESSION['pedido'] == 'complete'):?>
    <h1>Nota de Venta Realizada Con Exito</h1>

    <?Php if(isset($cua)):?>
        <h3>Datos de Nota de Venta:</h3>
            <table>
                <tr>
                    <th>N° de Venta</th>
                    <th>Total a Pagar</th>
                    <th>Fecha</th>
                </tr>
                <tr>
                    <td><?=$cua->id_cua?></td>
                    <td><?=$cua->total?></td>
                    <td><?=$cua->fecha?></td>
                </tr>
                <tr>
                    <th>Situación</th>
                    <th>Importe</th>
                    <th>Resto</th>
                </tr>
                <tr>
                    <td><?=$cua->situacion?></td>
                    <td><?=$cua->importe?></td>
                    <td><?=$cua->resto?></td>
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
            <th>
                <a href="<?=base_url?>cuaderno/entregaH&id=<?=$cua->id?>" class="button solide-colort">Entr. Huancan</a>
            </th>
            <th>
                <a href="<?=base_url?>cuaderno/entrega&id=<?=$cua->id?>" class="button solide-colort">Entr. Azapampa</a>
            </th>
            <th>
                <a href="<?=base_url?>cuaderno/Comprobante" class="button solide-colort" style="margin-left: 6%; width:160px;">Comprobante E.</a>
            </th>
            <th>
                <a href="<?=base_url?>cuaderno/registroscuaderno" class="button solide-colort" style="margin-left: 6%">Continuar</a>
            </th>
        </tr>

    </table>

    <?Php endif; ?>
<?Php elseif(isset($_SESSION['pedido']) && $_SESSION['pedido'] != 'complete'):?>
    <h1>La Nota de Venta No ha podido Realizarse</h1>
<?Php endif; ?>