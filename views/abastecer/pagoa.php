<?Php if(isset($abs)):?>

<h2>Abastecimiento N° <?=$abs->id?></h2>

<h3>Datos del Pago:</h3>
<table>
    <tr>
    <th style="width: 200px;">Monto Total</th>
        <th style="width: 200px;">Importe</th>
        <th style="width: 200px;">Resto</th>
    </tr>
    <tr>
        <td><?=$abs->total?></td>
        <td><?=$abs->importe?></td>
        <td><?=$abs->resto?></td>
    </tr>
</table>

<br>

<form action="<?=base_url?>abastecer/pagocua" method="POST" enctype="multipart/form-data">
    
    <input type="hidden" value="<?=$abs->id?>" name="abastecer"/>>
    <input type="hidden" value="<?=$abs->total?>" name="total"/>
    <input type="hidden" value="<?=$abs->importe?>" name="importe_c"/>

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
    </table>

    <br><br>

    <div class="fila-1">
        <a href="<?=base_url?>abastecer/detalle&id=<?=$abs->id?>" class="button extrae-colort">Regresar</a>
        
        <input type="submit" value="Pagar" class="button solide-colort" style="width:130px;">
    </div>
</form>

<?Php else:?>
    <?Php require_once 'views/abastecer/registrosa.php'; ?>
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