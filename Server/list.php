<?php
	$list = array(
		array("id"=>0, "name"=>"酸菜鱼", "count"=>4),
		array("id"=>1, "name"=>"手撕包菜", "count"=>3),
		array("id"=>2, "name"=>"黑椒牛柳", "count"=>7),
    array("id"=>3, "name"=>"大肉饭", "count"=>2),
    array("id"=>4, "name"=>"大肉饭2", "count"=>3)
		);

	echo json_encode($list);