<?php 
	// Pagination Code
	
	$paginate_url = (isset($_SERVER['HTTPS']) ? "https" : "http") . "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
	$paginate = explode('?',$paginate_url);
	$page_url = '';
	$output = '';
	if(count($paginate) > 1){
		parse_str($paginate[1], $output);
		$page_url = $paginate[0].'?';
		foreach($output as $k1=>$v1){
			if($k1 == 'cat'){
				$page_url .= $k1.'='.$v1; 
			}
		}
		trim($page_url,'&');
	}else{
		$page_url = $paginate[0];
	}
	$pages = $products['count']/pagination_limit;
	if($products['count']%pagination_limit != 0){$pages++;} 
	$pages = floor($pages);
	
	if (isset($_GET['page'])) {
		if ($_GET['page'] < $pages) {
			$next = $_GET['page']+1;
			if ($_GET['page'] == 1) {
				$previous = 1;
			}else{
				$previous = $_GET['page'] - 1;
			}												
		} elseif ($_GET['page'] == $pages) {
			$next = $_GET['page'];
			$previous = $_GET['page']-1;
			if ($previous==0) {
				$previous++;
			}
		}
		$current = $_GET['page'];
	}else{
		$current = 1;
		$previous = 1;
		$next = 2;
	}
	
	if($pages > 0){
?>
	<div class="pagination">
		<ul class="clearfix">
			<li><a class="page_change" href="javascript:void(0)" data-url="<?php echo $page_url ?>" data-page="<?php echo $previous; ?>">Previous</a></li>
			<?php for ($i=1; $i <= $pages ; $i++) { ?>
				<?php if ($current == $i) { ?>
					<li><span class="disabled"><?php echo $i; ?></span></li>
				<?php }else{ ?>
					<li><a class="page_change" href="javascript:void(0)" data-url="<?php echo $page_url ?>" data-page="<?php echo $i; ?>"><?php echo $i; ?></a></li>
				<?php } ?>
			<?php } ?>
			<li><a class="page_change" href="javascript:void(0)" data-url="<?php echo $page_url ?>" data-page="<?php echo $next; ?>">Next</a></li>
		</ul>
	</div>
<?php
	}
?>