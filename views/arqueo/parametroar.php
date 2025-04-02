<h1>Generar Arqueo</h1>

<form action="<?=base_url?>arqueo/arqueodiario" method="POST" enctype="multipart/form-data">

    <h2>Parametros:</h2>

    <table style="width: 75%; text-align: left; margin-left: 15%;">
        <tr>
            <th style="width: 150px;">
                <label class="frm" for="fecha">Fecha</label>
                <input type="date" name="fecha" id="MyInput" style="width: 200px;">
            </th>
            <th style="width: 150px;">
                <label class="frm" for="turno">Turno</label>
                <select name="turno" style="width: 200px;">
                    <option value="MAÑANA">MAÑANA</option>
                    <option value="TARDE">TARDE</option>
                    <option value="CIERRE">CIERRE</option>
                </select>
            </th>
            <th style="width: 150px;">
                <input type="submit" value="Generar Arqueo" name="arqueo"/>
            </th>
        </tr>
    </table>
</form>

<script>
    MyInput.valueAsDate = new Date();
</script>