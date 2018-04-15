<nav>
	<div class="container">
		<div id='cssmenu'>
			<ul id="menu" class="nav clearfix">
				<li><a href="/SpyPrice"><i class="fa fa-home"></i> Home</a></li>
				<?php
				foreach($categories['result'] as $category){
					$childs = $DB->selectAll('categories',['parent_id'=>$category->id]);
				?>
				<li class="<?php if(count($childs) > 0){ echo 'has-sub';}?>">
					<a href='<?php echo (isset($_SERVER['HTTPS']) ? "https" : "http") .'://'.$_SERVER['HTTP_HOST'].'/SpyPrice?cat='.$category->id?>'><?php echo $category->name?></a>
					<?php 
					if(count($childs['result']) > 0){
						echo '<ul>';
						foreach($childs['result'] as $child){
							echo '<li><a href="?cat='.$child->id.'">'.$child->name.'</a></li>';
						}
						echo '</ul></li>';
					}
				}
				?>
			</ul>
		</div> 
	</div>
</nav>