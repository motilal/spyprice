<?php

$DB = new dataBase(server_name, server_user_name, server_password, server_DB);

$categories = $DB->selectAll('categories', ['parent_id' => 0]);
$features = $DB->selectAll('features');
$companies = $DB->selectAll('companies');
$merchants = $DB->selectAll('merchants');

if (isset($_REQUEST) and ! empty($_REQUEST)) {
    $offset = 1;
    $cat_ids = array();
    $feature_ids = array();
    $product_ids = array();
    $brand_ids = array();
    $merchant_ids = array();
    $sql = 'SELECT * FROM products where status=1 ';

    if (isset($_GET['q']) and ! empty($_GET['q'])) {
        $sql = 'SELECT * FROM products where status=1 and (name LIKE "%' . $_GET['q'] . '%" or price LIKE "%' . $_GET['q'] . '%" ';

        $category_details = $DB->selectAll('categories', ['status' => 1, ['name' => 'LIKE "%' . $_GET['q'] . '%"']]);

        foreach ($category_details['result'] as $val) {
            if (!in_array($val->id, $cat_ids)) {
                $cat_ids[] = $val->id;
            }
        }
        if (!empty($cat_ids)) {
            $cat_ids = implode(',', $cat_ids);
            $sql .= 'or category_id IN(' . $cat_ids . ') ';
        }

        $company_details = $DB->selectAll('companies', ['status' => 1, ['name' => 'LIKE "%' . $_GET['q'] . '%"']]);

        foreach ($company_details['result'] as $val) {
            if (!in_array($val->id, $brand_ids)) {
                $brand_ids[] = $val->id;
            }
        }
        if (!empty($brand_ids)) {
            $brand_ids = implode(',', $brand_ids);
            $sql .= 'or company_id IN(' . $brand_ids . ') ';
        }

        $merchant_details = $DB->selectAll('merchants', ['status' => 1, ['name' => 'LIKE "%' . $_GET['q'] . '%"']]);

        foreach ($merchant_details['result'] as $val) {
            if (!in_array($val->id, $merchant_ids)) {
                $merchant_ids[] = $val->id;
            }
        }
        if (!empty($merchant_ids)) {
            $merchant_ids = implode(',', $merchant_ids);
            $sql .= 'or merchant_id IN(' . $merchant_ids . ') ';
        }

        $feature_details = $DB->selectAll('features', ['status' => 1, ['name' => 'LIKE "%' . $_GET['q'] . '%"']]);
        $feature_ids_str = array();
        foreach ($feature_details['result'] as $feature) {
            $feature_ids_str[] = $feature->id;
        }
        if (!empty($feature_ids_str)) {
            $feature_ids_str = implode(',', $feature_ids_str);
            $feature_detail = $DB->selectAll('product_features', ['status' => 1, ['feature_id' => 'IN(' . $feature_ids_str . ')']]);

            foreach ($feature_detail['result'] as $val) {
                if (!in_array($val->product_id, $product_ids)) {
                    $product_ids[] = $val->product_id;
                }
            }

            $product_ids = implode(',', $product_ids);
            $sql .= 'or id IN(' . $product_ids . ') ';
        }
        $sql .= ' )';
    } else {
        if (isset($_GET['cat']) and ! empty($_GET['cat'])) {
            $cat_ids[] = $_GET['cat'];
            $cates = $DB->selectAll('categories', ['status' => 1, 'parent_id' => $_GET['cat']]);
            foreach ($cates['result'] as $cat1 => $cat_val) {
                $cat_ids[] = $cat_val->id;
            }
            $cat_ids = implode(',', $cat_ids);

            $sql .= 'and category_id IN(' . $cat_ids . ') ';
        }

        if (isset($_GET['rateFilter']) and ! empty($_GET['rateFilter'])) {
            $allProducts = $DB->selectAll('products', ['status' => 1]);

            foreach ($allProducts['result'] as $val) {
                $rate_detail = $DB->conn->prepare('select AVG(rate) as rate from product_reviews as review where review.product_id = ' . $val->id);
                $rate_detail->execute();
                $result1 = $rate_detail->fetchAll(PDO::FETCH_OBJ);
                $avg = round($result1[0]->rate, 0, PHP_ROUND_HALF_UP);
                if ($avg >= $_GET['rateFilter']) {
                    if (!in_array($val->id, $product_ids)) {
                        $product_ids[] = $val->id;
                    }
                }
            }
        }

        if (isset($_GET['featureFilter']) and ! empty($_GET['featureFilter'])) {
            foreach ($_GET['featureFilter'] as $feature) {
                $feature_ids[] = $feature;
                if (isset($_GET['rateFilter']) and ! empty($_GET['rateFilter'])) {
                    $feature_detail = $DB->selectAll('product_features', ['status' => 1, 'feature_id' => $feature]);
                    foreach ($feature_detail['result'] as $val) {
                        $rate_detail = $DB->conn->prepare('select AVG(rate) as rate from product_reviews as review where review.product_id = ' . $val->product_id);
                        $rate_detail->execute();
                        $result1 = $rate_detail->fetchAll(PDO::FETCH_OBJ);
                        $avg = round($result1[0]->rate, 0, PHP_ROUND_HALF_UP);
                        if ($avg >= $_GET['rateFilter']) {
                            if (!in_array($val->product_id, $product_ids)) {
                                $product_ids[] = $val->id;
                            }
                        }
                    }
                } else {
                    $feature_detail = $DB->selectAll('product_features', ['status' => 1, 'feature_id' => $feature]);
                    foreach ($feature_detail['result'] as $val) {
                        if (!in_array($val->product_id, $product_ids)) {
                            $product_ids[] = $val->product_id;
                        }
                    }
                }
            }
        }
        if (!empty($product_ids)) {
            $product_ids = implode(',', $product_ids);
            $sql .= 'and id IN(' . $product_ids . ') ';
        }

        if (isset($_GET['brandFilter']) and ! empty($_GET['brandFilter'])) {
            foreach ($_GET['brandFilter'] as $brand) {
                $brand_detail = $DB->selectAll('companies', ['status' => 1, 'name' => $brand]);
                $brand_ids[] = $brand_detail['result'][0]->id;
            }
            $brand_ids = implode(',', $brand_ids);
            $sql .= 'and company_id IN(' . $brand_ids . ') ';
        }

        if (isset($_GET['merchantFilter']) and ! empty($_GET['merchantFilter'])) {
            foreach ($_GET['merchantFilter'] as $merchant) {
                $merchant_detail = $DB->selectAll('merchants', ['status' => 1, 'name' => $merchant]);
                $merchant_ids[] = $merchant_detail['result'][0]->id;
            }
            $merchant_ids = implode(',', $merchant_ids);
            $sql .= 'and merchant_id IN(' . $merchant_ids . ') ';
        }

        if (isset($_GET['sort']) and ! empty($_GET['sort'])) {
            if ($_GET['sort'] == 'price-high-low') {
                $sql .= ' order by CAST(price AS DECIMAL(10,2)) DESC ';
            } else if ($_GET['sort'] == 'price-low-high') {
                $sql .= ' order by CAST(price AS DECIMAL(10,2)) ASC ';
            } else if ($_GET['sort'] == 'newest') {
                $sql .= ' order by created DESC ';
            }
        }
    }

    $stmt = $DB->conn->prepare($sql);
    $stmt->execute();
    $count = $stmt->rowCount();

    if (isset($_GET['page']) and ! empty($_GET['page'])) {
        $num_pages = $count / pagination_limit;
        if ($count % pagination_limit != 0) {
            $num_pages++;
        }
        $num_pages = floor($num_pages);

        if ($num_pages < $_GET['page']) {
            $_GET['page'] = 1;
            $_GET['page'] = 1;
        }
        $offset = ($_GET['page'] - 1) * pagination_limit;
        $sql .= " LIMIT " . $offset . ", " . pagination_limit;
    } else {
        $sql .= " LIMIT " . pagination_limit;
    }

    $stmt = $DB->conn->prepare($sql);
    $stmt->execute();
    $result = $stmt->fetchAll(PDO::FETCH_OBJ);
    $products = array('count' => $count, 'result' => $result);
} else {
    $_GET = '';
    $products = $DB->selectAll('products', ['status' => 1], pagination_limit);
}