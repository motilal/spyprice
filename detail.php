<?php
require_once('config/config.php');
require_once('config/database.php');
$DB = new dataBase(server_name, server_user_name, server_password, server_DB);
$categories = $DB->selectAll('categories', ['parent_id' => 0]);

if (isset($_GET['id']) and ! empty($_GET['id']) && is_numeric($_GET['id'])) {
    $features_str = '';
    $product = $DB->conn->prepare('select product.id as id,product.name as name, product.description as description,product.image as image,product.price as price,merchant.name as merchant,category.name as category,company.name as company from products as product left join merchants as merchant on product.merchant_id=merchant.id left join categories as category on product.category_id=category.id left join companies as company on product.company_id=company.id where product.status=1 and product.id = ' . $_GET['id']);
    $product->execute();
    $result = $product->fetchAll(PDO::FETCH_OBJ);

    if (count($result) > 0) {
        $feature = $DB->conn->prepare('select * from product_features as feature join features as f on f.id=feature.feature_id where feature.status=1 and feature.product_id=' . $result[0]->id);
        $feature->execute();
        $features = $feature->fetchAll(PDO::FETCH_OBJ);

        foreach ($features as $val) {
            $features_str .= ' ' . $val->name;
        }
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
        <title><?php echo $result[0]->name; ?> | SpyPrice</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="description" content="Technology. Get the best price online. Technology price compare online. Grab a bargain today!" />
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-grid.min.css">
        <link rel="stylesheet" href="css/bootstrap-reboot.min.css">
        <link rel="stylesheet" href="css/jquery-ui.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="css/mobile.css" />
        <link rel="stylesheet" href="css/developer.css" />
    </head>
    <body>
        <div class="Wrapper">
            <?php require_once('elements/header.php'); ?>
            <div class="pad30">
                <div class="container clearfix">
                    <?php if (count($result) > 0) { ?>
                        <article class="content">
                            <div class="catHeading"><?php echo $result[0]->name . ' ' . $features_str; ?> </div>
                            <div class="cntHolder marBtm keepPad">
                                <div class="desc clearfix">
                                    <div class="leftcontent">
                                        <img src="img/product_images/<?php echo $result[0]->image; ?>" width="175" height="175" onerror="this.src='/resource/img/noimage.jpg'" alt="<?php echo $result[0]->name . ' ' . $features_str; ?>" title="<?php echo $result[0]->name . ' ' . $features_str; ?>">
                                    </div>
                                    <div class="rightcontent">
                                        <div class="artical">
                                            <h1><?php echo $result[0]->name . ' ' . $features_str; ?> </h1>
                                            <div class="review">
                                                <?php
                                                $reviews = $DB->selectAll('product_reviews', ['status' => 1, 'product_id' => $result[0]->id]);
                                                $review_count = 0;
                                                foreach ($reviews['result'] as $val) {
                                                    $review_count += $val->rate;
                                                }
                                                $avg = $review_count / $reviews['count'];
                                                $avg = round($avg, 0, PHP_ROUND_HALF_UP);
                                                ?>
                                                <span class=""><img src="img/<?php echo $avg; ?>.png" /></span>
                                                (<?php echo $reviews['count']; ?> customer reviews)
                                            </div><br/>
                                            <p><span class="best-price" value="149.99">Best Price: £<?php echo $result[0]->price; ?></span> Currys, New Condition</p><br/>
                                            <p><?php echo $result[0]->description; ?></p> 
                                        </div>
                                    </div>
                                </div>            
                            </div>
                            <div class="errorreport">
                                <a rel="nofollow" href="errorreport.php?q=Acer-Chromebook-116-Inch-Celeron-2GB-16GB-Laptop" class="cboxElement"><i class="icon icon-exclamation-circle"></i> Found an error? Let us know</a>
                            </div>
                            <div class="clearboth"></div>
                        </article>
                        <?php
                    } else {
                        ?>
                        <article class="content">
                            <div class="catHeading">No Record Fount</div>
                            <div class="cntHolder marBtm keepPad">
                                <div class="desc clearfix">
                                    <div class="col-lg-12">
                                        <div class="">
                                            <center><b>No Products Found....</b></center>
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
    <script src="js/menu.js"></script>
    <script src="js/developer.js"></script>
</html>