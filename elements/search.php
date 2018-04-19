<?php

$where = array();
$where[] = "products.status = 1";
$having = array();
/* Keyword filter start here */
$keyword = get_Input('q');
if ($keyword != "") {
    $keyword_array = array();
    array_push($keyword_array, "products.name REGEXP '[[:<:]]" . addslashes($keyword) . "[[:>:]]'");
    array_push($keyword_array, "categories.name REGEXP '[[:<:]]" . addslashes($keyword) . "[[:>:]]'");
    array_push($keyword_array, "companies.name REGEXP '[[:<:]]" . addslashes($keyword) . "[[:>:]]'");
    array_push($keyword_array, "merchants.name REGEXP '[[:<:]]" . addslashes($keyword) . "[[:>:]]'");
    array_push($keyword_array, "features.name REGEXP '[[:<:]]" . addslashes($keyword) . "[[:>:]]'");
    $where[] = "(" . implode(' OR ', $keyword_array) . ")";
}

/* Category filter start here */
$category_id = get_Input('cat');
if ($category_id != "" && is_numeric($category_id)) {
    $where[] = "products.category_id = " . $category_id;
}

/* Rating filter start here */
$rateFilter = get_Input('rateFilter');
if ($rateFilter != "" && is_numeric($rateFilter)) {
    $having[] = "avg_rate = " . $rateFilter;
}

/* feature filter start here */
$featureFilter = get_Input('featureFilter');
if ($featureFilter != "" && is_array($featureFilter)) {
    $where[] = "product_features.feature_id IN (" . implode(',', array_filter($featureFilter)) . ")";
}

/* brand filter start here */
$brandFilter = get_Input('brandFilter');
if ($brandFilter != "" && is_array($brandFilter)) {
    $brandCond = array();
    foreach ($brandFilter as $brandName) {
        $brandCond[] = "companies.name LIKE '%" . urldecode($brandName) . "%'";
    }
    if (!empty($brandCond)) {
        $where[] = "(" . implode(' OR ', $brandCond) . ")";
    }
}

/* merchant filter start here */
$merchantFilter = get_Input('merchantFilter');
if ($merchantFilter != "" && is_array($merchantFilter)) {
    $merchantCond = array();
    foreach ($merchantFilter as $merchantName) {
        $merchantCond[] = "merchants.name LIKE '" . urldecode($merchantName) . "'";
    }
    if (!empty($merchantCond)) {
        $where[] = "(" . implode(' OR ', $merchantCond) . ")";
    }
}

/* sorting records */
$sort = get_Input('sort');
$sorting = "";
if ($sort != "") {
    if ($sort == 'price-high-low') {
        $sorting = array('field' => 'CAST(products.price AS DECIMAL(10,2))', 'order' => 'DESC');
    } else if ($sort == 'price-low-high') {
        $sorting = array('field' => 'CAST(products.price AS DECIMAL(10,2))', 'order' => 'ASC');
    } else if ($sort == 'newest') {
        $sorting = array('field' => 'products.created', 'order' => 'DESC');
    } else {
        $sorting = array('field' => 'products.created', 'order' => 'DESC');
    }
}
$select = array('`products`.id', '`products`.name', '`products`.image', '`products`.price', 'categories.name as category_name', 'companies.name as company_name', 'merchants.name as merchant_name');

/* Count total product for paging */
$total_products = $DB->searchProducts(array('`products`.id'), $where, $having, null, $sorting, true);

/* pagination limit */
if (get_Input('page') != "") {
    $num_pages = $total_products / PAGINATION_LIMIT;
    if ($total_products % PAGINATION_LIMIT != 0) {
        $num_pages++;
    }
    $num_pages = floor($num_pages);
    if ($num_pages < get_Input('page')) {
        $_GET['page'] = 1;
    }
    $offset = ($_GET['page'] - 1) * PAGINATION_LIMIT;
    $limit = array('limit' => PAGINATION_LIMIT, 'offset' => $offset);
} else {
    $limit = array('limit' => PAGINATION_LIMIT);
}
/* Fetch product listing */
$products = $DB->searchProducts($select, $where, $having, $limit, $sorting, false);

/* search via ajax */
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
