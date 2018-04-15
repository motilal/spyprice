<div style="clear: both;width: 100%">
    <div class="paginator clearfix">
        <?php require('elements/pagination.php'); ?>
    </div>
</div>
<?php
if (count($products['result']) > 0) {
    foreach ($products['result'] as $product) {
        ?>
        <div class="cols">
            <div class="block">
                <div class="imgBlock center">
                    <a href="<?php echo site_url("detail.php?id=$product->id"); ?>">
                        <img class="lazy" src="<?php echo site_url("img/loader.gif"); ?>" data-original="<?php echo site_url("img/product_images/$product->image"); ?>"  alt="<?php echo $product->name; ?>" title="<?php echo $product->name; ?>" />
                    </a>
                </div>
                <p class="img-title"><a href="<?php echo site_url("detail.php?id=$product->id"); ?>" title="<?php echo $product->name; ?>"><span class="p-name"><?php echo $product->name; ?></span></a></p>
                <h6 class="center">&pound;<?php echo $product->price; ?></h6>
                <div class="center review">
                    <?php
                    $reviews = $DB->selectAll('product_reviews', ['status' => 1, 'product_id' => $product->id]);
                    $review_count = 0;
                    foreach ($reviews['result'] as $val) {
                        $review_count += $val->rate;
                    }
                    @$avg = $review_count / $reviews['count'];
                    $avg = round($avg, 0, PHP_ROUND_HALF_UP);
                    ?>
                    <span class=""><img src="<?php echo site_url("img/$avg.png"); ?>" /></span><br/>
                    (<?php echo $reviews['count']; ?> reviews)
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
<div style="clear: both;width: 100%;margin-top:30px;">
    <div class="paginator clearfix">
        <?php require('elements/pagination.php'); ?>
    </div>
</div>        