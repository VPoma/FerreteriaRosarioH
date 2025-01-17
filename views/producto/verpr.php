<?Php if(isset($product)): ?>
    <h1><?=$product->id?> - <?=$product->nombre?> <?=$product->medida?></h1>
    <div id="detail-product">
        <div class="image">
            <?Php if($product->imagen != null): ?>
                <img src="<?=base_url?>uploads/images/<?=$product->imagen?>" alt="" />
            <?Php else: ?>
                <img src="<?=base_url?>assets/images/ferre.jpg"  alt="" />
            <?Php endif; ?>
        </div>
        <div class="data">
            <h2 style="text-align: left; margin-left:-20px; margin-top:15px;">LINEA: <?=$product->linea?></h2>
            <h3 style="text-align: left; margin-left:-20px; margin-top:-40px;">MARCA: <?=$product->marca?></h3>
            <p class="price" style="margin-top:-20px;"><b>PRECIO: S/. <?=$product->preciob?></b></p>
            <p class="price" style="margin-top:5px;"><b>STOCK: <?=$product->cantidad?></b></p>
            <br>
            <a href="<?=base_url?>carrito/add&id=<?=$product->id?>" class="button blista">Comprar</a>
            <br><br><br><br><br><br>
            <a href="<?=base_url?>producto/index" class="button extrae-colort" style="width:200px;" >Regresar</a>
        </div>
    </div>
<?Php else: ?>
    <h1>El producto no existe</h1>
<?Php endif; ?>
