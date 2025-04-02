<?php
$db = new mysqli('localhost', 'root', '', 'ferr_ros_h');
mysqli_query($db,"SET NAMES 'utf8'");

if($r){
    $tab1 = mysqli_query($db, "SELECT c.id, c.numdoc, c.nombrecom, c.direccion, c.numcel, td.documento, ci.nombre as 'ciudad', COALESCE(COUNT(cu.id), 0) AS 'total_ventas' " 
                            . "FROM cliente c LEFT JOIN cuaderno cu ON cu.id_cliente = c.id INNER JOIN tipodoc td ON td.id = c.id_tipodoc INNER JOIN ciudad ci ON ci.id = c.id_ciudad "
                            . "WHERE cu.fecha BETWEEN '$f1' AND '$f2' AND c.est = 'H' GROUP BY c.id, c.nombrecom ORDER BY total_ventas DESC LIMIT $r;");
}else{
    $tab1 = mysqli_query($db, "SELECT c.id, c.numdoc, c.nombrecom, c.direccion, c.numcel, td.documento, ci.nombre as 'ciudad', COALESCE(COUNT(cu.id), 0) AS 'total_ventas' " 
                            . "FROM cliente c LEFT JOIN cuaderno cu ON cu.id_cliente = c.id INNER JOIN tipodoc td ON td.id = c.id_tipodoc INNER JOIN ciudad ci ON ci.id = c.id_ciudad "
                            . "WHERE cu.fecha BETWEEN '$f1' AND '$f2' AND c.est = 'H' GROUP BY c.id, c.nombrecom ORDER BY total_ventas DESC;");
}

if($r){
    $tab2 = mysqli_query($db, "SELECT c.id, c.numdoc, c.nombrecom, c.direccion, c.numcel, td.documento, ci.nombre as 'ciudad', COALESCE(COUNT(cu.id), 0) AS 'total_ventas' " 
                            . "FROM cliente c LEFT JOIN cuaderno cu ON cu.id_cliente = c.id INNER JOIN tipodoc td ON td.id = c.id_tipodoc INNER JOIN ciudad ci ON ci.id = c.id_ciudad "
                            . "WHERE cu.fecha BETWEEN '$f1' AND '$f2' AND c.est = 'H' GROUP BY c.id, c.nombrecom ORDER BY total_ventas DESC LIMIT $r;");
}else{
    $tab2 = mysqli_query($db, "SELECT c.id, c.numdoc, c.nombrecom, c.direccion, c.numcel, td.documento, ci.nombre as 'ciudad', COALESCE(COUNT(cu.id), 0) AS 'total_ventas' " 
                            . "FROM cliente c LEFT JOIN cuaderno cu ON cu.id_cliente = c.id INNER JOIN tipodoc td ON td.id = c.id_tipodoc INNER JOIN ciudad ci ON ci.id = c.id_ciudad "
                            . "WHERE cu.fecha BETWEEN '$f1' AND '$f2' AND c.est = 'H' GROUP BY c.id, c.nombrecom ORDER BY total_ventas DESC;");
}

$datos = ["labels" => [], "valores" => []];

while($t1 = $tab1->fetch_object()){
    $datos["labels"][] = $t1->nombrecom;
    $datos["valores"][] = $t1->total_ventas;
}
$datos_json = json_encode($datos);

?>

<h1>TOP <?=$r?> DE CLIENTES</h1>

<table  style="margin-left: 20%;">
    <tr>
        <th>
            <form action="<?=base_url?>views/ereportcliente.php" method="GET" target="_blank">
                <input type="hidden" value="<?=$f1?>" name="f1"/>
                <input type="hidden" value="<?=$f2?>" name="f2"/>
                <input type="hidden" value="<?=$r?>" name="r"/>
                <input type="submit" value="Imprimir" name="Imprimir" class="button solide-colort"/>
            </form>
        </th>
        <th>
            <a href="<?=base_url?>estadisticos/index" class="button extrae-colort" style="margin-left: 6%">Regresar</a>
        </th>
    </tr>
</table>

<h2>Reporte de Clientes Frecuentes del <?=$f1?> al <?=$f2?> </h2>

<table>
    <tr>
        <th style="width:10px;">Id</th>
        <th style="width:16px;">Doc</th>
        <th style="width:25px;">Número</th>
        <th style="width:120px;">Nombre</th>
        <th style="width:180px;">Dirección</th>
        <th style="width:28px;">Ciudad</th>
        <th style="width:25px;">Celular</th>
        <th style="width:22px;">Total</th>
    </tr>
    <?Php $num = 1?>
    <?Php while($t = $tab2->fetch_object()): ?>
        <tr>
            <td><?=$num?></td>
            <td><?=$t->documento?></td>
            <td><?=$t->numdoc?></td>
            <td><?=$t->nombrecom?></td>
            <td><?=$t->direccion?></td>
            <td><?=$t->ciudad?></td>
            <td><?=$t->numcel?></td>
            <td><?=$t->total_ventas?></td>
        </tr>
        <?Php $num++;?>
    <?Php endwhile;?>
</table>

<h2>Gráfico Estadístico de Clientes </h2>

<div style="width: 900px; height: 900px; margin:auto;">
    <canvas id="miGrafico"></canvas>
</div>

<script>
    const datos = <?php echo $datos_json; ?>;
    // Obtener contexto del canvas
    const ctx = document.getElementById('miGrafico').getContext('2d');

    // Crear gráfico con Chart.js
    new Chart(ctx, {
        type: '<?=$graf?>', // Tipo de gráfico: bar, line, pie, etc.
        data: {
            labels: datos.labels, // Etiquetas (meses)
            datasets: [{
                label: 'Ventas Mensuales',
                data: datos.valores, // Valores de las barras
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(255, 159, 64, 0.2)',
                    'rgba(255, 205, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(201, 203, 207, 0.2)'
                ],
                borderColor: [
                    'rgb(255, 99, 132)',
                    'rgb(255, 159, 64)',
                    'rgb(255, 205, 86)',
                    'rgb(75, 192, 192)',
                    'rgb(54, 162, 235)',
                    'rgb(153, 102, 255)',
                    'rgb(201, 203, 207)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });

</script>