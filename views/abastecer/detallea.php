<h1>DETALLE DE ABASTECIMIENTO N° <?=$abs->id?></h1>

<?Php if(isset($abs)):?>
        <h3>Datos de Abastecimiento:</h3>
            <table>
                <tr>
                    <th>Tienda</th>
                    <th>Fecha</th>
                    <th>Hora</th>
                </tr>
                <tr>
                    <td><?=$abs->tienda?></td>
                    <td><?=$abs->fecha?></td>
                    <td><?=$abs->hora?></td>
                </tr>
                <tr>
                    <th>Usuario</th>
                    <th>Proveedor</th>
                    <th>Situación</th>
                </tr>
                <tr>
                    
                    <td><?=$abs->nombre?> <?=$abs->apellidos?></td>
                    <td><?=$abs->nombrecom?></td>
                    <td><?=$abs->situacion?></td>
                </tr>
                <tr>
                    <th>Monto Total</th>
                    <th>Importe</th>
                    <th>Resto</th>
                </tr>
                <tr>
                    <td><?=$abs->total?></td>
                    <td><?=$abs->importe?></td>
                    <td><?=$abs->resto?></td>
                </tr>
                <tr>
                    <th>Estado</th>
                    <th>Fecha de Entrega</th>
                    <th>Hora de Entrega</th>
                </tr>
                <tr>
                    <td><?=$abs->estado?></td>
                    <td><?=$abs->fecha_ent?></td>
                    <td><?=$abs->hora_ent?></td>
                </tr>
                <tr>
                    <th>Descripción</th>
                </tr>
                <tr>
                    <td><?=$abs->descripcion?></td>
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
    
        <?Php if(isset($_SESSION['admin'])): ?>
            <?Php if($abs->estado != "ANULADO"): ?>
                <a href="<?=base_url?>abastecer/eliminar&id=<?=$abs->id?>" class="button extrae-colort">Anular</a>
            <?Php endif;?>        
        <?Php endif;?>
        
        <?php if($abs->situacion != "CANCELADO"):?>
        <a href="<?=base_url?>abastecer/pago&id=<?=$abs->id?>" class="button solide-colort">Pago</a>
        <?Php endif;?>

        <?Php if($abs->estado == "INGRESADO"):?>
        <form action="<?=base_url?>views/constancia_tik.php" method="GET">
            <input type="hidden" value="<?=$abs->id?>" name="id"/>
            <input type="submit" value="Imprimir" name="Imprimir" class="button solide-colort"/>
        </form>
        <?Php elseif($abs->estado != "INGRESADO"):?>
        <a href="<?=base_url?>abastecer/entrega&id=<?=$abs->id?>" class="button solide-colort">Recepción</a>
        <?Php endif;?>

    </div>
    
<?Php endif; ?>
    <br><br>

<a href="<?=base_url?>abastecer/registrosabastecer" class="button extrae-colort" style="margin-left: 6%">Regresar</a>