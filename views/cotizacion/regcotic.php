<?Php if(isset($_SESSION['identity'])): ?>
    <?Php if(isset($reg) && isset($cli) && is_object($cli)):?>
        <h1>DATOS PARA COTIZACIÓN</h1>
        <?Php $url_action = base_url."cotizacion/regcotizacion";?>
    <?Php endif;?>

    <form action="<?=$url_action?>" method="POST" enctype="multipart/form-data">

        <label class="frm" for="tienda">Tienda</label>
        <?Php $tiendas = utils::showTienda(); ?>
        <select name="tienda" id="">
            <?Php while($tie = $tiendas->fetch_object()): ?>
                <option value="<?=$tie->id?>">
                    <?=$tie->nombre?>
                </option>
            <?Php endwhile; ?>
        </select>

        <input type="hidden" value="<?=$_SESSION['identity']->id?>" name="usuario"/>
        <input type="hidden" value="<?=$cli->id?>" name="cliente"/>

        <label class="frm"  for="documento">Documento</label>
        <input type="text" value="<?=$cli->documento?> :  <?=$cli->numdoc?>" readonly/>

        <label class="frm"  for="cliente">Cliente</label>
        <input type="text" value="<?=$cli->nombrecom?>" readonly/>
        
        <?Php $stats = Utils::statsCarrito();?>
        <?php $total = number_format($stats['total'], 2, '.', ''); ?>

        <label class="frm"  for="total">Total</label>
        <input type="number" step="0.01" value="<?=$total?>" name="total"  />

        <br>
        <div class="fila-2">
            <!--<a href="<?=base_url?>cuaderno/eligcliente" class="button extrae-colort">
                Regresar
            </a>-->
            <input type="submit" value="Confirmar Cotización" class="button solide-colort" style="width:200px;">
        </div>
        </form>
        <br>
        <p><a href="<?=base_url?>cuaderno/eligcliente" class="button extrae-colort" style="margin-left: 2%">Regresar</a></p>

    <?Php else: ?>
        <h1>Logueese Primero!!!</h1>
        <p>Necesitas estar logueado en la WEB para poder realizar tu Nota de Venta</p>
<?Php endif;?>