<div style="float: left;width: 100%;clear: both;">
    <div class="pagination" style="padding-top: 10px;">
        <?php require('elements/pagination.php'); ?>
    </div> 
</div>
<?php
if (!empty($products)) {
    foreach ($products as $product) {
        ?>
        <div class="cols">
            <div class="block">
                <div class="imgBlock center">
                    <a href="<?php echo site_url("detail.php?id=$product->id"); ?>">
                        <img class="lazy" src="<?php echo site_url("asset/img/loader.gif"); ?>" data-original="<?php echo site_url("asset/img/product_images/$product->image"); ?>"  alt="<?php echo $product->name; ?>" title="<?php echo $product->name; ?>" />
                    </a>
                </div>
                <p class="img-title"><a href="<?php echo site_url("detail.php?id=$product->id"); ?>" title="<?php echo $product->name; ?>"><span class="p-name"><?php echo $product->name; ?></span></a></p>
                <h6 class="center">&pound;<?php echo $product->price; ?></h6>
                <div class="center review"> 
                    <?php $avg_rate = $product->avg_rate != "" ? $product->avg_rate : '0'; ?>
                    <span class=""><img src="<?php echo site_url("asset/img/$avg_rate.png"); ?>" /></span><br/>
                    (<?php echo isset($product->total_review) ? $product->total_review : '0'; ?> reviews)
                </div>
            </div>
        </div>
        <?php
    }
} else {
    ?>
    <div class="col-lg-12">
        <div class="">
            <center><b>No result found.</b></center>
        </div>
    </div>
    <?php
}
?> 
<div style="float: left;width: 100%;clear: both;">
    <div class="pagination">
        <?php require('elements/pagination.php'); ?>
    </div>  
</div> 