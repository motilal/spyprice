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
                            <span class="rate" data="5"><img src="img/5.png" /></span>
                        </label>
                    </li>
                    <li>
                        <label>
                            <input name="rateFilter" class="filter_rate" type="radio" value="4" <?php echo (isset($_GET['rateFilter']) && !empty($_GET['rateFilter']) && $_GET['rateFilter'] == 4) ? 'checked' : '' ?>>
                            <span class="rate" data="4"><img src="img/4.png" /></span>
                        </label>
                    </li>
                    <li>
                        <label>
                            <input name="rateFilter" class="filter_rate" type="radio" value="3" <?php echo (isset($_GET['rateFilter']) && !empty($_GET['rateFilter']) && $_GET['rateFilter'] == 3) ? 'checked' : '' ?>>
                            <span class="rate" data="3"><img src="img/3.png" /></span>
                        </label>
                    </li>
                    <div class="inner">
                        <div class="sidebarheading">
                            <h6 class="skybluecolor">Features</h6>
                        </div>
                        <ul class="filter">
                            <?php
                            $i = 1;
                            $class = '';
                            foreach ($features['result'] as $feature) {
                                $checked = '';
                                if (isset($feature_ids) and ! empty($feature_ids) and in_array($feature->id, $feature_ids)) {
                                    $checked = 'checked';
                                }
                                if ($i > 5)
                                    $class = 'hide-feature';
                                echo '<li class="' . $class . '"><label><input type="checkbox" class="filter_feature filter" name="featureFilter[]" value="' . $feature->id . '" ' . $checked . '>' . $feature->name . '</label></li>';
                                $i++;
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
                            $i = 1;
                            $class = '';
                            foreach ($companies['result'] as $company) {
                                $checked = '';
                                if (isset($_GET['brandFilter']) and ! empty($_GET['brandFilter']) and in_array($company->name, $_GET['brandFilter'])) {
                                    $checked = 'checked';
                                }
                                if ($i > 5)
                                    $class = 'hide-brand';
                                echo '<li class="' . $class . '"><label><input type="checkbox" class="filter_brand filter" name="brandFilter[]" value="' . $company->name . '"' . $checked . '>' . $company->name . '</label></li>';
                                $i++;
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
                            $i = 1;
                            $class = '';
                            foreach ($merchants['result'] as $merchant) {
                                $checked = '';
                                if (isset($_GET['merchantFilter']) and ! empty($_GET['merchantFilter']) and in_array($merchant->name, $_GET['merchantFilter'])) {
                                    $checked = 'checked';
                                }
                                if ($i > 5)
                                    $class = 'hide-merchant';
                                echo '<li class="' . $class . '"><label><input type="checkbox" class="filter_merchant filter" name="merchantFilter[]" value="' . $merchant->name . '" ' . $checked . '>' . $merchant->name . '</label></li>';
                                $i++;
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