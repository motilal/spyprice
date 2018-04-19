<?php
include_once("classes/Database.php");
$DB = new Database();
require_once('elements/search.php');
?>
<!DOCTYPE HTML>
<html lang="en-GB">
    <head>
        <meta charset="UTF-8">
        <meta name="robots" content="index, follow" />
        <title>Technology price compare | SpyPrice</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
        <?php require_once('elements/script.php'); ?> 
    </head>
    <body>
        <div class="Wrapper">
            <?php require_once('elements/header.php'); ?>
            <form name="filter_form" id="filter_form" method="get" action="<?php echo site_url(); ?>">
                <input name="page" id="page" value="<?php echo get_Input('page') != "" ? get_Input('page') : 1; ?>" type="hidden"/>
                <div class="pad30">
                    <div class="container clearfix">
                        <?php require_once('elements/left_sidebar.php'); ?>
                        <?php require_once('elements/products.php'); ?>
                    </div>
                </div>
                <?php require_once('elements/footer.php'); ?>
            </form>
        </div>
    </body>  
    <script type="text/javascript">
        window.paceOptions = {startOnPageLoad: false};
    </script>
    <script src="asset/js/pace.min.js"></script>
    <script src="asset/js/menu.js"></script>
    <script src="asset/js/jquery.lazyload.min.js"></script> 
    <script>
        var url = '<?php echo $page_url; ?>';
        var search_url = '<?php echo $paginate[0]; ?>';
    </script>
    <script src="asset/js/custom.js"></script>
</html>