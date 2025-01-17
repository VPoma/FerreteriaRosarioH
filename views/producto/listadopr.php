<h1> Productos Ferreteria Rosario</h1>

<form action="<?=base_url?>producto/filtroindex" method="POST" enctype="multipart/form-data">
    <table style="width: 75%; text-align: left; border: none;">
        <tr>
            <th style="width:200px;">
            <label class="frm" for="familia">Familia</label>
                <?Php $familias = utils::showFamilia(); ?>
                <select name="familia" id="">
                    <option value="">Seleccionar</option>
                    <?Php while($fam = $familias->fetch_object()): ?>
                        <option value="<?=$fam->nombre?>">
                            <?=$fam->nombre?>
                        </option>
                    <?Php endwhile; ?>
                </select>
            </th>
            <th style="width:200px;">
                <label class="frm" for="linea">Linea</label>
                <?Php $lineas = utils::showLinea(); ?>
                <select name="linea" id="">
                    <option value="">Seleccionar</option>
                    <?Php while($lin = $lineas->fetch_object()): ?>
                        <option value="<?=$lin->nombre?>">
                            <?=$lin->nombre?>
                        </option>
                    <?Php endwhile; ?>
                </select>
            </th>
            <th style="width:200px;">
                <label class="frm" for="marca">Marca</label>
                <?Php $marcas = utils::showMarca(); ?>
                <select name="marca" id="">
                    <option value="">Seleccionar</option>
                    <?Php while($mar = $marcas->fetch_object()): ?>
                        <option value="<?=$mar->nombre?>">
                            <?=$mar->nombre?>
                        </option>
                    <?Php endwhile; ?>
                </select>
            </th>
            <th style="width:200px;">
                <label class="frm" style="margin-left:5%;" for="nombre">Producto</label>
                <input style="margin-left:5%; width:150px;" type="text"  name="nombre" class="fildt"/>
            </th>
            <th>
            <div class="fila-2" style="margin-right: 13%; margin-top: 30px;">
                <input type="submit" value="Buscar" class="button solid-colort">
            </div>
            </th>
        </tr>
    </table>
</form>
<br><br>

<?Php While($prod = $product->fetch_object()): ?>
<div class="product">
    <a href="<?=base_url?>producto/ver&id=<?=$prod->id?>">
        <?Php if($prod->imagen != null): ?>
            <img src="<?=base_url?>uploads/images/<?=$prod->imagen?>" alt="" />
        <?Php else: ?>
            <img src="<?=base_url?>assets/images/ferre.jpg" alt="" />
        <?Php endif; ?>
        <h4 style="margin-bottom: -20px; margin-top: -20px;"><b><?=$prod->linea?></b></h4>
        <h4 style="margin-bottom: -20px; margin-top: -20px;"><b><?=$prod->marca?></b></h4>
        <h3 style="font-size: 11px; margin-bottom: -10px;"><b><?=$prod->nombre?></b></h3>
        <h4 class="precio" style="margin-bottom: 0px;"><b><?=$prod->medida?></b></h4>
    </a>
    <p style="margin-bottom: 10px;">S/. <?=$prod->precio?></p>
    <?Php
        $unidades = $prod->cantidad;
        // Verifica si el número tiene decimales
        if (floor($unidades) == $unidades){
            // Si no tiene decimales, muestra el número sin decimales
            $cantidad = number_format($unidades, 0);
        }else{
            // Si tiene decimales, muestra el número con dos decimales
            $cantidad = number_format($unidades, 2);
        }
    ?>
    <p>Stock: <?=$cantidad?></p>
    <a href="<?=base_url?>carrito/add&id=<?=$prod->id?>" class="button blista">Agregar</a>
</div>
<?Php endwhile; ?>

<!--Paginador-->
<table>
    <tr>
        <!--Paginador-->
        <td class="text-center" colspan="11">
        <?Php if(isset($totalPag)): ?>
            <?Php for($i=1; $i<=$totalPag; $i++): ?>
                <a href="<?=base_url?>producto/index&pag=<?=$i?>"><?=$i?></a> -
            <?Php endfor; ?>
        <?Php endif; ?>
        </td>
    </tr>
</table>

<!--
<div class="product">
    <img src="<?//=base_url?>assets/images/ferre.jpg" />
    <h2>Producto de Prueba</h2>
    <p>S/. 45.00</p>
    <a href="" class="button">Agregar</a>
</div>
-->