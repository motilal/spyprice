<?php

/*
  Common helper function - can be call direct anywhere without instant
 *  
 */


if (!function_exists('pr')) {

    function pr($data = null, $exit = false) {
        echo "<pre>";
        print_r($data);
        echo "</pre>";
        if ($exit === TRUE)
            die();
    }

}

if (!function_exists('site_url')) {

    function site_url($url = null) {
        $site_url = isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == "on" ? 'https://' . $_SERVER['SERVER_NAME'] . '/' . BASE_PATH : 'http://' . $_SERVER['SERVER_NAME'] . BASE_PATH;
        if ($url != "") {
            $site_url = $site_url . $url;
        }
        return $site_url;
    }

}

if (!function_exists('get_Input')) {

    function get_Input($index = null) {
        if (isset($_GET[$index]) && $_GET[$index] != "") {
            return $_GET[$index];
        } else {
            return '';
        }
    }

}
if (!function_exists('is_ajax_request')) {

    function is_ajax_request($index = null) {
        $ajax = false;
        if (!empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') {
            $ajax = true;
        }
        return $ajax;
    }

}


if (!function_exists('is_get_request')) {

    function is_get_request() {
        if (isset($_GET) and ! empty($_GET)) {
            return true;
        }
        return false;
    }

}