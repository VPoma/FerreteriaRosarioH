<?Php if(isset($cua)):?>

<h2>Venta N° <?=$cua->id?></h2>

<h3>Datos del Pago:</h3>
<table>
    <tr>
        <th style="width: 200px;">Monto Total</th>
        <th style="width: 200px;">Importe</th>
        <th style="width: 200px;">Resto</th>
    </tr>
    <tr>
        <td><?=$cua->total?></td>
        <td><?=$cua->importe?></td>
        <td><?=$cua->resto?></td>
    </tr>
</table>

<br>

<form action="<?=base_url?>cuaderno/pagocua" method="POST" enctype="multipart/form-data">
    
    <input type="hidden" value="<?=$cua->id?>" name="cuaderno"/>
    <input type="hidden" value="<?=$cua->id_tienda?>" name="tienda">
    <input type="hidden" value="<?=$cua->id_cliente?>" name="cliente">
    <input type="hidden" value="<?=$cua->total?>" name="total"/>
    <input type="hidden" value="<?=$cua->importe?>" name="importe_c"/>

    <table>
        <tr>
            <th style="text-align: left;">
                <label class="frm"  for="situacion">Situación</label>
                <select name="situacion" id="opcion" onchange="actualizarEstado()">
                    <option value="A CUENTA">A cuenta</option>
                    <option value="CANCELADO">Cancelado</option>
                </select>
            </th>
        <tr>
            <th style="text-align: left;">
                <label class="frm"  for="importe">Importe</label>
                <input type="number" id="texto" step="any" name="importe" value="0.00"/>
            </th>
        </tr>
        <tr>
            <th style="text-align: left;">
                <label class="frm" for="tipopago">Tipo de Pago</label>
                <select name="tipopago" id="">
                    <option value="EFECTIVO">EFECTIVO</option>
                    <option value="TRANSFERENCIA">TRANSFERENCIA</option>
                </select>
            </th>
        </tr>
    </table>

    <br><br>

    <div class="fila-1">
        <a href="<?=base_url?>cuaderno/detalle&id=<?=$cua->id?>" class="button extrae-colort">Regresar</a>
        
        <input type="submit" value="Pagar" class="button solide-colort" style="width:130px;">
    </div>
</form>

<?Php else:?>
    <?Php require_once 'views/cuaderno/registrosc.php'; ?>
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