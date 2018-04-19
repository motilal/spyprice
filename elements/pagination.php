<?php

require_once 'classes/Pagination.php';
$page = isset($_GET['page']) ? ((int) $_GET['page']) : 1;
$pagination = new Pagination();
$pagination->setCurrent($page);
$pagination->setTotal($total_products);
$markup = $pagination->parse();
echo $markup;
