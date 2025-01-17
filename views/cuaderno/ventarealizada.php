<?Php if(isset($_SESSION['pedido']) && $_SESSION['pedido'] == 'complete'):?>
    <h1>Venta Realizada Con Exito</h1>

    <?Php if(isset($cua)):?>
        <h3>Datos de la Venta:</h3>
            <table>
                <tr>
                    <th>N° de Venta</th>
                    <th>Total a Pagar</th>
                    <th>Fecha</th>
                </tr>
                <tr>
                    <td><?=$cua->id?></td>
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
                    <td>
                        <?=$prod->cantidad?>
                    </td>
                </tr>
            <?Php endwhile;?>
        </table>
    <br>

    <div class="fila-1">

        <a href="<?=base_url?>cuaderno/entrega&id=<?=$cua->id?>" class="button solide-colort">Entrega</a>

        <a href="<?=base_url?>cuaderno/registroscuaderno" class="button solide-colort" style="margin-left: 6%">Continuar</a>

    </div>

    <?Php endif; ?>
<?Php elseif(isset($_SESSION['pedido']) && $_SESSION['pedido'] != 'complete'):?>
    <h1>Tu Pedido No ha podido Realizarse</h1>
<?Php endif; ?>