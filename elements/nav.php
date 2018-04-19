<nav>
    <div class="container">
        <div id='cssmenu'>
            <ul id="menu" class="nav clearfix">
                <?php $categories = $DB->getResult(['id', 'name'], 'categories', ['parent_id' => 0], null, ['field' => 'name', 'order' => 'ASC']); ?>
                <li><a href="<?php echo site_url(); ?>"><i class="fa fa-home"></i> Home</a></li>
                    <?php
                    if (!empty($categories)) {
                        foreach ($categories as $category) {
                            $childsCategories = $DB->getResult(['id', 'name'], 'categories', ['parent_id' => $category->id], null, ['field' => 'name', 'order' => 'ASC']);
                            ?>
                        <li class="<?php echo count($childsCategories) > 0 ? 'has-sub' : ''; ?>">
                            <a href='<?php echo site_url('?cat=' . $category->id); ?>'><?php echo $category->name ?></a>
                            <?php if (!empty($childsCategories)) { ?>
                                <ul> 
                                    <?php foreach ($childsCategories as $subcat) { ?>
                                        <li><a href="<?php echo site_url('?cat=' . $subcat->id); ?>"><?php echo $subcat->name; ?></a></li>
                                    <?php } ?>
                                </ul>
                            </li>
                            <?php
                        }
                    }
                }
                ?>
            </ul>
        </div> 
    </div>
</nav>