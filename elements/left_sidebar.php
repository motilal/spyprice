<div class="sidebar">
    <article class="content">
        <div class="catHeader">
            <div class="left">
                <div class="left category-filter-icon"><i class="icon icon-filter">&nbsp;</i></div>
                <div class="left">
                    <h4>Filter Deals</h4></div>
            </div>
            <div id="filter-wrapper-buttons" class="right">
                <a id="filter-wrapper-hide" href="javascript:void(0)">Hide &#x25B2;</a>
                <a id="filter-wrapper-show" href="javascript:void(0)">Show &#x25BC;</a>
            </div>
        </div>
        <div id="filter-wrapper" class="cntHolder marBtm keepPad"> 
            <div class="inner">
                <div class="sidebarheading">
                    <h6 class="skybluecolor">Minimum Review Rating</h6>
                </div>
                <ul class="filter">
                    <li>
                        <label>
                            <input name="rateFilter" class="filter_rate filter" type="radio" value="5" <?php echo (isset($_GET['rateFilter']) && !empty($_GET['rateFilter']) && $_GET['rateFilter'] == 5) ? 'checked' : '' ?>>
                            <span class="rate" data="5"><img src="asset/img/5.png" /></span>
                        </label>
                    </li>
                    <li>
                        <label>
                            <input name="rateFilter" class="filter_rate" type="radio" value="4" <?php echo (isset($_GET['rateFilter']) && !empty($_GET['rateFilter']) && $_GET['rateFilter'] == 4) ? 'checked' : '' ?>>
                            <span class="rate" data="4"><img src="asset/img/4.png" /></span>
                        </label>
                    </li>
                    <li>
                        <label>
                            <input name="rateFilter" class="filter_rate" type="radio" value="3" <?php echo (isset($_GET['rateFilter']) && !empty($_GET['rateFilter']) && $_GET['rateFilter'] == 3) ? 'checked' : '' ?>>
                            <span class="rate" data="3"><img src="asset/img/3.png" /></span>
                        </label>
                    </li>
                    <div class="inner">
                        <div class="sidebarheading">
                            <h6 class="skybluecolor">Features</h6>
                        </div>
                        <ul class="filter">
                            <?php
                            $features = $DB->getResult(['id', 'name'], 'features', [], null, ['field' => 'name', 'order' => 'ASC']);
                            if (!empty($features)) {
                                foreach ($features as $key => $feature) {
                                    ?>
                                    <li class="<?php echo $key > 4 ? 'hide-feature' : ''; ?>">
                                        <label>
                                            <input type="checkbox" class="filter_feature filter" name="featureFilter[]" value="<?php echo $feature->id; ?>" <?php echo (!empty($feature_ids) && in_array($feature->id, $feature_ids)) ? 'checked' : ''; ?>>
                                            <?php echo $feature->name; ?>
                                        </label>
                                    </li>
                                    <?php
                                }
                            }
                            ?>
                        </ul>
                    </div>
                    <div class="inner">
                        <div class="sidebarheading">
                            <h6 class="skybluecolor">Brand</h6>
                        </div>
                        <ul class="filter">
                            <?php
                            $companies = $DB->getResult(['id', 'name'], 'companies', [], null, ['field' => 'name', 'order' => 'ASC']);
                            if (!empty($companies)) {
                                foreach ($companies as $key => $company) {
                                    ?>
                                    <li class="<?php echo $key > 4 ? 'hide-brand' : ''; ?>">
                                        <label>
                                            <input type="checkbox" class="filter_brand filter" name="brandFilter[]" value="<?php echo $company->name; ?>" <?php echo (get_input('brandFilter') && in_array($company->name, get_input('brandFilter'))) ? 'checked' : ''; ?>> <?php echo $company->name; ?>
                                        </label>
                                    </li>
                                    <?php
                                }
                            }
                            ?>
                        </ul>
                    </div>
                    <div class="inner">
                        <div class="sidebarheading">
                            <h6 class="skybluecolor">Store</h6>
                        </div>
                        <ul class="filter">
                            <?php
                            $merchants = $DB->getResult(['id', 'name'], 'merchants', [], null, ['field' => 'name', 'order' => 'ASC']);
                            if (!empty($merchants)) {
                                foreach ($merchants as $key => $merchant) {
                                    ?>
                                    <li class="<?php echo $key > 4 ? 'hide-merchant' : ''; ?>">
                                        <label>
                                            <input type="checkbox" class="filter_merchant filter" name="merchantFilter[]" value="<?php echo $merchant->name; ?>" <?php echo (get_input('merchantFilter') && in_array($merchant->name, get_input('brandFilter'))) ? 'checked' : ''; ?>> <?php echo $merchant->name; ?>
                                        </label>
                                    </li>
                                    <?php
                                }
                            }
                            ?>
                        </ul>
                    </div>
                </ul>
            </div> 
        </div>
    </article>
    <br />
</div>