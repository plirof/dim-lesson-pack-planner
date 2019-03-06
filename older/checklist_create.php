<?php
/* List all SWF files in subfolders
ver 2019018f

NOTE !!!!!  : put few names. Many names make table bigger and flash is bigger than screen

To Do : remove HARD CODED str_replace
*/

//if($_REQUEST) print_r($_REQUEST);

//overflow:scroll;height:100%
if($_REQUEST) {
	// Create HTML

	$li_list="";

	foreach($_REQUEST as $key => $value){
	       // $_REQUEST[$key] = $this->_db->realEscapeString($value);
		if($key=='Submit'||$value=='Submit') continue;
		   $li_list=$li_list. '<li><a href="'.$value.'" target="sideframe1">'.$key.'</a> </li>'."\n";

	}


	$result= '
	<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Directory Listing with rating</title>
	</head>
	<body>
	<TABLE BORDER="2" CELLPADDING="2" CELLSPACING="2"  style="table-layout: fixed;" WIDTH="100%" height=100%>
	<TR>
	<TD style="width: 120px;word-wrap:break-word;"  valign="top"> >
	<b>Eπιλέξτε:</b>
	<div style="height: 600px; overflow: auto">
	<ol>
'. $li_list.'
	</ol>
	</div>
	</TD>

	<TD style="height:100%">
	<iframe WIDTH="98%" height=98% name="sideframe1" src="" frameborder="0" allowfullscreen></iframe>


	</TD>
	</TR>

	</TABLE>


	</body></html>

	';


	echo $result;

} else 
{

	echo "<h2>list all files</h2>";
	echo '<form action="" method="post">';
	$debug=false;
	$show_rating=false;
	$file_extension='.swf'; //TODO to implement this variable
	$submit_button='<input type="submit" name="formSubmit" value="Submit" />';


	//$dir_starting ='/opt/lampp/htdocs/mocha181212swf_only/';
	$dir_starting ='.';
	//$dir_starting ='E:/incoming_/games_fun_/Flash_SWF_Games_/';
	$dir_rating=$dir_starting.'';






	function listFolderFiles($dir){
	global $dir_starting,$debug;
	global $submit_button,$show_rating,$dir_rating,$file_extension;
	    $ffs = scandir($dir);
	    //if($debug) echo "<h3>SCANDIR ".$dir."</h3>";
	    $sub_dir = str_replace($dir_starting, ".", $dir);
	    //if($debug) echo "<h3>SCANDIR ".$sub_dir."</h3>";
	    
		echo '<ol>';
	    foreach($ffs as $ff){
	        if($ff != '.' && $ff != '..'){
	            //echo '<li>'.$ff;
	            if(strpos($ff,$file_extension) ) { //if we have an .swf file
	            	//echo  '<input type="checkbox" name="$ff" value="'.$sub_dir.'/'.$ff.'" />   ';
					echo "<hr><li>".'<input type="checkbox" name="'.$ff.'" value="'.$sub_dir.'/'.$ff.'" />   '." <a href=".$sub_dir.'/'.$ff." target='_blank' > $ff</a> "; //file  ORIG line
	//				echo "<hr><li><a href=opengame.php?file=".$sub_dir.'/'.$ff." target='_blank' >$ff</a> " .$average_rating; //file
				}
				
	            if(is_dir($dir.'/'.$ff)) {
	            	echo "<hr><hr> <li>$ff</a>"; //folder
	            	listFolderFiles($dir.'/'.$ff);
	            	echo $submit_button;
	            	
	            }
	            //if($debug) echo "<h3>".$dir.'/'.$ff."</h3>";
	            echo '</li>';
	            
	        }
	    }
	    echo '</ol>';
	}




	listFolderFiles($dir_starting);

	    
	//print_r($list);
	//var_dump($a);

	echo $submit_button;

	echo '</form>';
	if($debug) echo "<h3>aaaaaaa</h3>";



}

?>