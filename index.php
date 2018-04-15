<?php
require_once('config/config.php');
require_once('config/database.php');
require_once('search.php');
if (is_ajax_request()) {
    ob_start();
    require_once('elements/product_grid.php');
    $view = ob_get_clean();
    $response = array();
    $response['result'] = $view;
    header("Content-type:application/json");
    echo json_encode($response);
    ob_end_flush();
    exit();
}
?>
<!DOCTYPE HTML>
<html lang="en-GB">
    <head>
        <meta charset="UTF-8">
        <meta name="robots" content="index, follow" />
        <title>Technology price compare | SpyPrice</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-grid.min.css">
        <link rel="stylesheet" href="css/bootstrap-reboot.min.css">
        <link rel="stylesheet" href="css/jquery-ui.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="css/mobile.css" /> 
        <link rel="stylesheet" href="css/developer.css" /> 
        <link rel="stylesheet" href="css/pace-minimal.css"> 
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
    <script src="js/pace.min.js"></script>
    <script src="js/menu.js"></script>
    <script src="js/jquery.lazyload.min.js"></script> 
    <script>
        var url = '<?php echo $page_url; ?>';
        var search_url = '<?php echo $paginate[0]; ?>';
    </script>
    <script src="js/custom.js"></script>
</html>