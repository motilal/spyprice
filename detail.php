<?php
include_once("classes/Database.php");
$DB = new Database();
$product_id = get_Input('id');
$featureList = '';
if (!empty($product_id) && is_numeric($product_id)) {
    $select = array('`products`.id', '`products`.name', '`products`.description', '`products`.image', '`products`.price', 'categories.name as category_name', 'companies.name as company_name', 'merchants.name as merchant_name');
    $product_detail = $DB->searchProducts($select, ["products.id = $product_id"]);
    if (count($product_detail) > 0) {
        $feature = $DB->getProductFeatures($product_id);
        if (!empty($feature)) {
            $featureList = implode(', ', $feature);
        }
    } else {
        header('Location: ' . site_url());
    }
} else {
    header('Location: ' . site_url());
}
?>
<!DOCTYPE HTML>
<html lang="en-GB">
    <head>
        <meta charset="UTF-8">
        <meta name="robots" content="index, follow" />
        <title><?php echo $product_detail[0]->name; ?> | SpyPrice</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="description" content="Technology. Get the best price online. Technology price compare online. Grab a bargain today!" />
        <?php require_once('elements/script.php'); ?> 
    </head>
    <body>
        <div class="Wrapper">
            <?php require_once('elements/header.php'); ?>
            <div class="pad30">
                <div class="container clearfix">
                    <?php if (count($product_detail) > 0) { ?>
                        <article class="content">
                            <div class="catHeading"><?php echo $product_detail[0]->name; ?> </div>
                            <div class="cntHolder marBtm keepPad">
                                <div class="desc clearfix">
                                    <div class="leftcontent">
                                        <img src="asset/img/product_images/<?php echo $product_detail[0]->image; ?>" width="175" height="175" onerror="this.src='/resource/img/noimage.jpg'" alt="<?php echo $product_detail[0]->name . ' ' . $featureList; ?>" title="<?php echo $product_detail[0]->name . ' ' . $features_str; ?>">
                                    </div>
                                    <div class="rightcontent">
                                        <div class="artical">
                                            <h1><?php echo $product_detail[0]->name . ' ' . $featureList; ?> </h1>
                                            <div class="review">
                                                <?php $avg_rate = $product_detail[0]->avg_rate != "" ? $product_detail[0]->avg_rate : '0'; ?>
                                                <span class=""><img src="asset/img/<?php echo $avg_rate; ?>.png" /></span>
                                                (<?php echo isset($product_detail[0]->total_review) ? $product_detail[0]->total_review : '0'; ?> customer reviews)
                                            </div><br/>
                                            <p><span class="best-price" value="149.99">Best Price: £<?php echo $product_detail[0]->price; ?></span> Currys, New Condition</p><br/>
                                            <p><?php echo $product_detail[0]->description; ?></p> 
                                        </div>
                                    </div>
                                </div>            
                            </div>
                            <div class="errorreport">
                                <a rel="nofollow" href="#" class="cboxElement"><i class="icon icon-exclamation-circle"></i> Found an error? Let us know</a>
                            </div>
                            <div class="clearboth"></div>
                        </article>
                        <?php
                    } else {
                        ?>
                        <article class="content">
                            <div class="catHeading">No Record found</div>
                            <div class="cntHolder marBtm keepPad">
                                <div class="desc clearfix">
                                    <div class="col-lg-12">
                                        <div class="">
                                            <center><b>No result found.</b></center>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </article>
                        <?php
                    }
                    ?>
                </div>
            </div>
            <?php require_once('elements/footer.php'); ?>
        </div>
    </body> 
    <script src="asset/js/menu.js"></script>
    <script src="asset/js/developer.js"></script>
</html>