<?Php if(isset($_SESSION['identity'])): ?>
    <?Php if(isset($reg) && isset($cli) && is_object($cli)):?>
        <h1>DATOS PARA VENTA</h1>
        <?Php $url_action = base_url."cuaderno/regcuaderno";?>
    <?Php endif;?>

    <form action="<?=$url_action?>" method="POST" enctype="multipart/form-data">
        
        <?Php $stats = Utils::statsCarrito();?>
        <?Php $a = $stats['total']?>
        <?Php $total = number_format($a, 2)?>

        <label class="frm"  for="total">Total</label>
        <input type="text" value="<?=$total?>" readonly/>

        <label class="frm"  for="situacion">Situación</label>
        <select name="situacion" id="">
            <option value="POR COBRAR">Por Cobrar</option>
            <option value="A CUENTA">A cuenta</option>
            <option value="CANCELADO">Cancelado</option>
        </select>

        <label class="frm"  for="importe">Importe</label>
        <input type="number" step="any" name="importe" value="0.00" required/>

        <label class="frm"  for="situacion">Situación</label>
            <select name="situacion" id="opcion" onchange="actualizarEstado()">
            <option value="POR COBRAR">Por Cobrar</option>
            <option value="A CUENTA">A cuenta</option>
            <option value="CANCELADO">Cancelado</option>
        </select>

        <label class="frm"  for="importe">Importe</label>
        <input type="number" id="texto" step="any" name="importe" value="0.00" required/>

        <label class="frm"  for="descripcion">Descripción (Opcional)</label>
        <textarea id="caja4" name="descripcion">N/A</textarea>

        <!--<input type="submit" value="Confirmar Venta">-->

        <br>
        <div class="fila-2">
            <!--<a href="<?=base_url?>cuaderno/eligcliente" class="button extrae-colort">
                Regresar
            </a>-->
            <input type="submit" value="Confirmar Venta" class="button solide-colort" style="width:200px;">
        </div>

        <br>
        <p><a href="<?=base_url?>cuaderno/eligcliente" class="button extrae-colort" style="margin-left: 2%">Regresar</a></p>
    </form>

    <?Php else: ?>
        <h1>Logueese Primero!!!</h1>
        <p>Necesitas estar logueado en la WEB para poder realizar tu pedido</p>
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