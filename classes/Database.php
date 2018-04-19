<?php

include_once 'config/DbConfig.php';

class Database extends DbConfig {

    public function __construct() {
        /* Calling the parent class construct */
        parent::__construct();
    }

    /**
     * Get Query Result
     *
     * @access	public
     * @param	string	the sql select statement
     * @param	string	the sql from statement
     * @param	array	an array of bind data
     * @param	integer	the sql limit of record
     * @param	array   'field' => 'Colomn Name', 'order' => 'ASC/DESC'
     * @return  array as a reult of sql statement
     */
    public function getResult($select = '*', $table_name = null, $where = null, $limit = null, $orderBy = null) {
        $statement = [];
        $statement[] = $this->select($select);
        $statement[] = $this->from($table_name);
        $statement[] = $this->where($where);
        $statement[] = $this->order_by($orderBy);
        $statement[] = $this->limit($limit);
        $sql = implode(' ', $statement);
        $query = $this->connection->prepare($sql);
        $query->execute();
        $result = $query->fetchAll(PDO::FETCH_OBJ);
        return $result;
    }

    /**
     * Get total records
     *
     * @access	public
     * @param	string	the sql select statement
     * @param	string	the sql from statement
     * @param	array	an array of bind data 
     * @return  integer total result of mysql statement
     */
    public function countResult($select, $table_name = null, $where = null) {
        $sql = $this->select($select) . ' ' . $this->from($table_name) . ' ' . $this->where($where);
        $query = $this->connection->prepare($sql);
        $query->execute();
        return $query->rowCount();
    }

    /**
     * Get Average Ratiing of specific product
     *
     * @access	public
     * @param	integer	product id
     * @return  object type array result of mysql statement
     */
    public function avgProductReviews($product_id = null) {
        if (!empty($product_id) && is_numeric($product_id)) {
            $query = $this->getQueryResult('SELECT SUM(rate) as total_rate,count(id) as total_review FROM product_reviews WHERE product_id=' . $product_id);
            $result = $query->fetch();
            $avg = 0;
            if (!empty($result['total_rate']) && !empty($result['total_review'])) {
                if ($result['total_rate'] > 0 && $result['total_review'] > 0) {
                    $avg = $result['total_rate'] / $result['total_review'];
                    $avg = round($avg, 0);
                }
            }
            return (object) ['result' => $result, 'avg' => $avg];
        }
    }

    /**
     * Get Search product
     *
     * @access	public
     * @param	string	the sql select statement 
     * @param	array	an array of bind data
     * @param	array/string	the sql select statement 
     * @param	array	the sql limit of record 'limit' => 'limit Name(int)', 'offset' => 'offset value (int)'
     * @param	array   'field' => 'Colomn Name', 'order' => 'ASC/DESC'
     * @param	boolean  count row of records
     * @return  array as a reult of sql statement
     */
    public function searchProducts($select = '*', $where = null, $having = null, $limit = null, $orderBy = null, $countRow = false) {
        if (!empty($where) && is_array($where)) {
            $where = "(" . implode(' AND ', $where) . ")";
        }
        if (!empty($having) && is_array($having)) {
            $having = "(" . implode(' AND ', $having) . ")";
        }
        $AvgReviewQuery = '(SELECT ROUND(AVG(`product_reviews`.`rate`),0) FROM `product_reviews` WHERE product_reviews.product_id=products.`id`) as avg_rate';
        array_push($select, $AvgReviewQuery);
        $TotalReviewQuery = '(SELECT count(`product_reviews`.`id`) FROM `product_reviews` WHERE product_reviews.product_id=products.`id`) as total_review';
        array_push($select, $TotalReviewQuery);

        $statement = [];
        $statement[] = $this->select($select);
        $statement[] = $this->from('products');
        $statement[] = $this->join('categories', 'categories.id=products.`category_id`', 'LEFT');
        $statement[] = $this->join('companies', 'companies.id=products.`company_id`', 'LEFT');
        $statement[] = $this->join('merchants', 'merchants.id=products.`merchant_id`', 'LEFT');
        $statement[] = $this->join('product_features', 'product_features.product_id=products.`id`', 'LEFT');
        $statement[] = $this->join('features', 'features.id=product_features.`feature_id`', 'LEFT');
        if (!empty($where)) {
            $statement[] = $this->where($where);
        }
        $statement[] = $this->group_by(array('product_features.product_id'));
        if (!empty($having)) {
            $statement[] = $this->having($having);
        }
        $statement[] = $this->order_by($orderBy);
        if (!empty($limit)) {
            $statement[] = $this->limit($limit);
        }
        $statement = array_filter($statement);
        $sql = implode(' ', $statement);
        $query = $this->connection->prepare($sql);
        $query->execute();
        if ($countRow) {
            return $query->rowCount();
        }
        $result = $query->fetchAll(PDO::FETCH_OBJ);
        return $result;
    }

    /**
     * Get Product feature list on basic of product id
     *
     * @access	public 
     * @param	integer 
     * @return  array as a reult of sql statement
     */
    public function getProductFeatures($product_id) {
        if (!empty($product_id)) {
            $statement = [];
            $statement[] = $this->select('f.name');
            $statement[] = $this->from('product_features as feature');
            $statement[] = $this->join('features as f ', 'f.id=feature.feature_id', 'INNER');
            $statement[] = $this->where(['feature.status' => 1, 'feature.product_id' => $product_id]);
            $sql = implode(' ', $statement);
            $query = $this->connection->prepare($sql);
            $query->execute();
            $result = $query->fetchAll(PDO::FETCH_OBJ);
            if (!empty($result)) {
                $feature = [];
                foreach ($result as $val) {
                    $feature[] = $val->name;
                }
                return $feature;
            }
        }
    }

    /**
     * Get Query Result direct by query
     *
     * @access	public
     * @param	string	the sql statement 
     * @return  array as a reult of sql statement
     */
    public function getQueryResult($sql) {
        $query = $this->connection->prepare($sql);
        $query->execute();
        return $query;
    }

    /**
     * @access	protected
     * @param	string	the sql select statement 
     * @return  string
     */
    protected function select($select = null) {
        if (is_array($select)) {
            $select = implode(',', $select);
        }
        return 'SELECT ' . $select;
    }

    /**
     * @access	protected
     * @param	string	the sql from statement 
     * @return  string
     */
    protected function from($table_name = null) {
        return 'FROM ' . $table_name;
    }

    /**
     * @access	protected
     * @param	string	the sql conditinal statement 
     * @return  string
     */
    protected function where($where = '') {
        $sql = '';
        if (is_array($where) && !empty($where)) {
            $sql .= 'WHERE ';
            $i = 1;
            foreach ($where as $key => $val) {
                if (is_array($val)) {
                    foreach ($val as $key1 => $val1) {
                        if ($val1 != "") {
                            $sql .= "$key1 $val1 AND ";
                        }
                    }
                } else {
                    $sql .= "$key='$val' AND ";
                }
            }
            $sql = trim($sql, ' AND ');
        } else if (!empty($where)) {
            $sql = 'WHERE ' . $where;
        }
        return $sql;
    }

    protected function having($having = '') {
        if (!empty($having)) {
            return 'HAVING ' . $having;
        }
    }

    /**
     * @access	protected
     * @param	string	the sql join statement 
     * @return  string
     */
    protected function join($table = null, $condition = null, $type = 'LEFT') {
        $sql = '';
        if (!empty($table) && !empty($condition)) {
            $sql = "$type JOIN $table ON $condition";
        }
        return $sql;
    }

    /**
     * @access	protected
     * @param	array 'limit' => 'Limit Value(int)', 'offset' => 'Offset Value(int)'
     * @return  string
     */
    protected function limit($limit = null) {
        if (!empty($limit['limit']) && !isset($limit['offset'])) {
            return "LIMIT " . $limit['limit'];
        } else if (!empty($limit['limit']) && isset($limit['offset'])) {
            return "LIMIT " . $limit['offset'] . ", " . $limit['limit'];
        }
    }

    /**
     * @access	protected
     * @param	string	the sql order by statement 
     * @return  string
     */
    protected function order_by($orderBy = null) {
        if (!empty($orderBy)) {
            return "ORDER BY " . $orderBy['field'] . " " . $orderBy['order'];
        }
    }

    /**
     * @access	protected
     * @param	string	the sql group by statement 
     * @return  string
     */
    protected function group_by($fieldname = NULL) {
        if (!empty($fieldname)) {
            if (is_array($fieldname)) {
                $query = implode(',', $fieldname);
            }
            return 'GROUP BY ' . $query;
        }
    }

    /**
     * Escape String
     *
     * Escapes data based on type
     * Sets boolean and null types
     *
     * @access	public
     * @param	string
     * @return	mixed
     */
    public function escape_string($value) {
        return $this->connection->real_escape_string($value);
    }

}
