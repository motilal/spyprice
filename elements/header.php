<header>
    <div class="header">
        <div class="container clearfix">
            <div class="logo"> <a href="/SpyPrice"> <img src="img/logo.png" alt=" SpyPrice "/> </a> </div>
            <div class="searchbox clearfix">
                <input type="text" id="q" name="q" placeholder="Search..." class="sbox" value="<?php echo (isset($_GET['q'])) ? $_GET['q'] : ''; ?>">
                <button type="button" class="sbtn search_btn" data="q">Search</button>
                <div class="mobileMenu"><span></span></div>
            </div>
            <div class="res_searchbox clearfix">
                <div class="searchbox1 clearfix">

                    <input type="text" id="q2" name="q" placeholder="Search..." class="sbox1" value="">
                    <input type="button" class="sbtn search_btn" data="q2" value="Search"/>

                </div>
            </div>
        </div>
    </div>
    <?php require_once('nav.php'); ?>
</header>