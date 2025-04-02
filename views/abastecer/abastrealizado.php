<?Php if(isset($_SESSION['pedido']) && $_SESSION['pedido'] == 'complete'):?>
    <h1>Abastecimiento Realizado Con Exito</h1>

    <?Php if(isset($abs)):?>
        <h3>Datos de Abastecimiento:</h3>
            <table>
                <tr>
                    <th>N° de Abastecmiento</th>
                    <th>Total a Pagar</th>
                    <th>Fecha</th>
                </tr>
                <tr>
                    <td><?=$abs->id?></td>
                    <td><?=$abs->total?></td>
                    <td><?=$abs->fecha?></td>
                </tr>
                <tr>
                    <th>Situación</th>
                    <th>Importe</th>
                    <th>Resto</th>
                </tr>
                <tr>
                    <td><?=$abs->situacion?></td>
                    <td><?=$abs->importe?></td>
                    <td><?=$abs->resto?></td>
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
            <?Php while($prod = $prodabs->fetch_object()): ?>
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

        <a href="<?=base_url?>abastecer/entrega&id=<?=$abs->id?>" class="button solide-colort">Ingreso</a>

        <a href="<?=base_url?>abastecer/registrosabastecer" class="button solide-colort" style="margin-left: 6%">Continuar</a>

    </div>

    <?Php endif; ?>
<?Php elseif(isset($_SESSION['pedido']) && $_SESSION['pedido'] != 'complete'):?>
    <h1>Tu Pedido No ha podido Realizarse</h1>
<?Php endif; ?>