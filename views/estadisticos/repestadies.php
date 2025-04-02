<h1>Generar Reporte</h1>

<form action="<?=base_url?>estadisticos/repest" method="POST" enctype="multipart/form-data">

    <table style="width: 75%; text-align: left; margin-left: 15%;">
        <tr>
            <th style="width: 150px;">
                <label class="frm" for="fecha">Fecha Inicio</label>
                <input type="date" name="fecha1" id="MyInpute1" style="width: 200px;" />
            </th>
            <th style="width: 150px;">
                <label class="frm" for="fecha">Fecha Fin</label>
                <input type="date" name="fecha2" id="MyInpute2" style="width: 200px;" />
            </th>
        </tr>
        <tr>
            <th style="width: 150px;">
                <label class="frm" for="selec">Elije</label>
                <select name="selec" style="width: 200px;">
                    <option value="clienteses">Top Clientes</option>
                    <option value="productoses">Top Productos</option>
                    <option value="productosazaes">Top Productos Azapampa</option>
                    <option value="productoshuaes">Top Productos Huancán</option>
                    <option value="productospees">Top Productos Por Entregar</option>
                </select>
            </th>
            <th style="width: 150px;">
                <label class="frm" for="grafico">Grafico</label>
                <select name="grafico" style="width: 200px;">
                    <option value="bar">Grafico de Barras</option>
                    <option value="line">Grafico de Línea</option>
                    <option value="pie">Grafico Pastel</option>
                    <option value="doughnut">Grafico Dona</option>
                    <option value="polarArea">Grafico Polar</option>
                    <option value="radar">Grafico Radar</option>
                </select>
            </th>
        </tr>
        <tr>
            <th>
                <label class="frm" for="rango">Rango</label>
                <input type="text" name="rango" value="" style="width: 200px;" />
            </th>
            <th style="width: 150px;">
                <input type="submit" value="Generar Arqueo" name="arqueo"/>
            </th>
        </tr>
    </table>
    
</form>

<script>
    MyInpute1.valueAsDate = new Date();
    MyInpute2.valueAsDate = new Date();
</script>