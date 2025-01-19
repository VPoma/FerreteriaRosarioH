<h1>Generar Arqueo</h1>

<form action="<?=base_url?>arqueo/arqueodiario" method="POST" enctype="multipart/form-data">

    <h2>Parametros:</h2>

    <table style="width: 75%; text-align: left; margin-left: 15%;">
        <tr>
            <th style="width: 150px;">
                <label class="frm" for="fecha">Fecha</label>
                <input type="date" name="fecha" style="width: 200px;">
            </th>
            <th style="width: 150px;">
                <label class="frm" for="turno">Turno</label>
                <select name="turno" style="width: 200px;">
                    <option value="MAÑANA">Mañana</option>
                    <option value="TARDE">Tarde</option>
                </select>
            </th>
            <th style="width: 150px;">
                <label class="frm" for="mic">Monto Inicial de Caja</label>
                <input class="number" type="number" step="0.01" name="mic" value="0.00" required/>
            </th>
        </tr>
        <tr>
            <th></th>
            <th style="width: 150px;">
                <input type="submit" value="Generar Arqueo" name="arqueo"/>
            </th>
            <th></th>
        </tr>
    </table>
</form>