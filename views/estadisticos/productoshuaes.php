<?php
$db = new mysqli('localhost', 'root', '', 'ferr_ros_h');
mysqli_query($db,"SET NAMES 'utf8'");

if($r){
    $tab1 = mysqli_query($db, "SELECT p.id, p.codigo , p.nombre, p.medida, m.nombre as 'marca', COALESCE(SUM(pc.cantidad), 0) AS 'total_ventas' "
                            . "FROM producto p LEFT JOIN producto_cuaderno pc ON pc.id_producto = p.id INNER JOIN marca m ON p.id_marca = m.id INNER JOIN cuaderno cu ON cu.id = pc.id_cuaderno "
                            . "WHERE cu.fecha BETWEEN '$f1' AND '$f2' AND cu.estado = 'ENTREGADO HUANCAN' AND p.est = 'H' AND pc.est = 'H' GROUP BY p.id, p.nombre ORDER BY total_ventas DESC LIMIT $r");
}else{
    $tab1 = mysqli_query($db, "SELECT p.id, p.codigo , p.nombre, p.medida, m.nombre as 'marca', COALESCE(SUM(pc.cantidad), 0) AS 'total_ventas' "
                            . "FROM producto p LEFT JOIN producto_cuaderno pc ON pc.id_producto = p.id INNER JOIN marca m ON p.id_marca = m.id INNER JOIN cuaderno cu ON cu.id = pc.id_cuaderno "
                            . "WHERE cu.fecha BETWEEN '$f1' AND '$f2' AND cu.estado = 'ENTREGADO HUANCAN' AND p.est = 'H' AND pc.est = 'H' GROUP BY p.id, p.nombre ORDER BY total_ventas DESC;");
}

if($r){
    $tab2 = mysqli_query($db, "SELECT p.id, p.codigo , p.nombre, p.medida, m.nombre as 'marca', COALESCE(SUM(pc.cantidad), 0) AS 'total_ventas' "
                            . "FROM producto p LEFT JOIN producto_cuaderno pc ON pc.id_producto = p.id INNER JOIN marca m ON p.id_marca = m.id INNER JOIN cuaderno cu ON cu.id = pc.id_cuaderno "
                            . "WHERE cu.fecha BETWEEN '$f1' AND '$f2' AND cu.estado = 'ENTREGADO HUANCAN' AND p.est = 'H' AND pc.est = 'H' GROUP BY p.id, p.nombre ORDER BY total_ventas DESC LIMIT $r");
}else{
    $tab2 = mysqli_query($db, "SELECT p.id, p.codigo , p.nombre, p.medida, m.nombre as 'marca', COALESCE(SUM(pc.cantidad), 0) AS 'total_ventas' "
                            . "FROM producto p LEFT JOIN producto_cuaderno pc ON pc.id_producto = p.id INNER JOIN marca m ON p.id_marca = m.id INNER JOIN cuaderno cu ON cu.id = pc.id_cuaderno "
                            . "WHERE cu.fecha BETWEEN '$f1' AND '$f2' AND cu.estado = 'ENTREGADO HUANCAN' AND p.est = 'H' AND pc.est = 'H' GROUP BY p.id, p.nombre ORDER BY total_ventas DESC;");
}

$datos = ["labels" => [], "valores" => []];

while($t1 = $tab1->fetch_object()){
    $datos["labels"][] =$t1->marca.' - '. $t1->nombre.' '.$t1->medida;
    $datos["valores"][] = $t1->total_ventas;
}
$datos_json = json_encode($datos);

?>

<h1>TOP <?=$r?> DE PRODUCTOS ENTREGADOS POR HUANCÁN</h1>

<table  style="margin-left: 20%;">
    <tr>
        <th>
            <form action="<?=base_url?>views/ereportproductohua.php" method="GET" target="_blank">
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

<h2>Reporte de Productos Más Vendidos y Entregados por Huancán del <?=$f1?> al <?=$f2?> </h2>

<table>
    <tr>
        <th style="width:10px;">Id</th>
        <th style="width:16px;">Cod</th>
        <th style="width:150px;">Marca</th>
        <th style="width:150px;">Nombre</th>
        <th style="width:60px;">Medida</th>
        <th style="width:22px;">Total</th>
    </tr>
    <?Php $num = 1?>
    <?Php while($t = $tab2->fetch_object()): ?>
        <tr>
            <td><?=$num?></td>
            <td><?=$t->codigo?></td>
            <td><?=$t->marca?></td>
            <td><?=$t->nombre?></td>
            <td><?=$t->medida?></td>
            <?Php
            $total = $t->total_ventas;
            // Verifica si el número tiene decimales
            if (floor($total) == $total){
                // Si no tiene decimales, muestra el número sin decimales
                $totalv = number_format($total, 0);
            }else{
                // Si tiene decimales, muestra el número con dos decimales
                $totalv = number_format($total, 2);
            }
            ?>
            <td><?=$totalv?></td>
        </tr>
        <?Php $num++;?>
    <?Php endwhile;?>
</table>

<h2>Gráfico Estadístico de Productos Entregados por Huancan </h2>

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