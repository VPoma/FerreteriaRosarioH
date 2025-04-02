<?Php if(isset($_SESSION['identity'])): ?>
    <?Php if(isset($edit) && isset($cua) && is_object($cua)):?>
        <h1>Registro de Nota de Venta a partir de la Cotización N° <?=$cua->id_cot?></h1>
        <?Php $url_action = base_url."cotizacion/cotianventa";?>
    <?Php endif;?>

    <form action="<?=$url_action?>" method="POST" enctype="multipart/form-data">

        <input type="hidden" value="<?=$cua->id?>" name="id"/>
        <input type="hidden" value="<?=$_SESSION['identity']->id?>" name="usuario"/>
        <input type="hidden" value="<?=$cua->cliente?>" name="cliente"/>

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
        
        <?Php $stats = $cua->total;?>
        <?php $total = number_format($stats, 2, '.', ''); ?>

        <label class="frm"  for="total">Total</label>
        <input type="number" step="0.01" value="<?=$total?>" name="total"  />

        <label class="frm"  for="situacion">Situación</label>
        <select name="situacion" id="opcion" onchange="actualizarEstado()">
            <option value="POR COBRAR">Por Cobrar - ORDEN</option>
            <option value="A CUENTA">A cuenta</option>
            <option value="CANCELADO">Cancelado</option>
        </select>

        <label class="frm"  for="importe">Importe</label>
        <input type="number" id="texto" step="0.01" name="importe" value="0.00" disabled/>

        <label class="frm" for="tipopago">Tipo de Pago</label>
        <select name="tipopago" id="">
            <option value="EFECTIVO">EFECTIVO</option>
            <option value="YAPE">YAPE</option>
            <option value="BCP">BCP</option>
            <option value="CAJA HUANCAYO">CAJA HUANCAYO</option>
        </select>

        <label class="frm"  for="descripcion">Descripción (Opcional)</label>
        <textarea id="caja4" name="descripcion">N/A</textarea>

        <br>
        <div class="fila-2">
            <input type="submit" value="Generar N. Venta" class="button solide-colort" style="width:200px;">
        </div>
    </form>
        <br>
        <p><a href="<?=base_url?>cotizacion/detallecoti&id=<?=$cua->id?>" class="button extrae-colort" style="margin-left: 2%">Regresar</a></p>


    
<?Php else: ?>
    <h1>Logueese Primero!!!</h1>
    <p>Necesitas estar logueado en la WEB para poder realizar tu Nota de Venta</p>
<?Php endif;?>

<script>
    function actualizarEstado() {
        // Obtener el valor seleccionado
        const select = document.getElementById('opcion');
        const inputTexto = document.getElementById('texto');

        // Deshabilitar o habilitar según la opción seleccionada
        if (select.value === 'A CUENTA') {
            inputTexto.disabled = false;
        } else {
            inputTexto.disabled = true;
        }
    }
</script>