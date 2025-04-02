<?Php if(isset($_SESSION['identity'])): ?>
    <?Php if(isset($edit) && isset($cua) && is_object($cua)):?>
        <h1>EDITA COTIZACIÓN N° <?=$cua->id_cot?></h1>
        <?Php $url_action = base_url."cotizacion/editcoti";?>
    <?Php endif;?>

    <form action="<?=$url_action?>" method="POST" enctype="multipart/form-data">

        <input type="hidden" value="<?=$cua->id?>" name="id"/>

        <label class="frm" for="tienda">Tienda</label>
        <?Php $tiendas = utils::showTienda(); ?>
        <select name="tienda" id="">
            <?Php while($tie = $tiendas->fetch_object()): ?>
                <option value="<?=$tie->id?>">
                    <?=$tie->nombre?>
                </option>
            <?Php endwhile; ?>
        </select>

        <label class="frm"  for="documento">Documento</label>
        <input type="text" value="<?=$cua->documento?> :  <?=$cua->numdoc?>" readonly/>

        <label class="frm"  for="cliente">Cliente</label>
        <input type="text" value="<?=$cua->nombrecom?>" readonly/>

        <label class="frm"  for="hora">Hora</label>
        <input type="text" value="<?=$cua->hora_cot?>" readonly/>

        <label class="frm"  for="fecha">Fecha</label>
        <input type="text" value="<?=$cua->fecha_cot?>" readonly/>
        
        <?Php $stats = Utils::statsCarrito();?>
        <?php $total = number_format($stats['total'], 2, '.', ''); ?>

        <label class="frm"  for="total">Total</label>
        <input type="number" step="0.01" value="<?=$total?>" name="total"  />

        <br>
        <div class="fila-2">
            <input type="submit" value="Editar Cotización" class="button solide-colort" style="width:200px;">
        </div>
    </form>
        <br>
        <p><a href="<?=base_url?>carrito/index" class="button extrae-colort" style="margin-left: 2%">Regresar</a></p>


    
<?Php else: ?>
    <h1>Logueese Primero!!!</h1>
    <p>Necesitas estar logueado en la WEB para poder realizar tu Nota de Venta</p>
<?Php endif;?>