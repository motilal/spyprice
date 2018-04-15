<div class="maincontent">
    <article class="content">
        <div class="catHeader">
            <div class="left">
                <div class="left">
                    <span class="icon icon-technology">&nbsp;</span>
                </div>
                <div class="left">
                    <h1>Technology</h1>
                </div>
            </div>
            <div class="right">
                <label class="sort">Sort by:</label>
                <select id="sort" name="sort" class="filter">
                    <option value="">Select Option</option>
                    <option <?php echo (isset($_GET['sort']) and $_GET['sort'] == 'price-high-low') ? 'selected="selected"' : '' ?> value="price-high-low">Price: High to low</option>
                    <option <?php echo (isset($_GET['sort']) and $_GET['sort'] == 'price-low-high') ? 'selected="selected"' : '' ?> value="price-low-high">Price: Low to high</option>
                    <option <?php echo (isset($_GET['sort']) and $_GET['sort'] == 'newest') ? 'selected="selected"' : '' ?> value="newest">Newest products</option>
                </select>
            </div>
        </div>
        <div id="results">
            <div class="cntHolder marBtm">
                <div class="product-with-filter-wrapper">
                    <div id="product_listing">
                        <?php require('elements/product_grid.php'); ?>
                    </div> 
                </div>
                <div class="clearboth"></div>
            </div>
        </div>
    </article>
</div>