<?php
/* List all SWF files in subfolders
ver 2019024



To Do : remove HARD CODED str_replace
*/

//if($_REQUEST) print_r($_REQUEST);

//overflow:scroll;height:100%
if($_REQUEST) {
	// Create HTML


	$li_list="\n"; //list of links (<li>)

	$div_hide_on_init="\n" ;//document.getElementById("div2").style.visibility = "hidden";
	$setTimeout_div_text="\n";//setTimeout(function(){document.getElementById("div2").style.visibility = "visible"}, 5*minute);

	$counter=1;
	$time_multiplier=0;
	$time_multiplier_increment=5;


	foreach($_REQUEST as $key => $value){
	       // $_REQUEST[$key] = $this->_db->realEscapeString($value);


		if($counter==1) $line_to_add="\n".'<div id="div1" onClick="showItTimer(); return true;" > '."\n".'<a href="'.$value.'"  target="sideframe1">'.$key.'</a>'."\n".'</div>';
		if($counter>1) {
			$line_to_add='<div id="div'.$counter.'" >'."\n".'<a href="'.$value.'" target="sideframe1">'.$key.'</a>'."\n".'</div>';

			$div_hide_on_init=$div_hide_on_init.'document.getElementById("div'.$counter.'").style.visibility = "hidden";'."\n";

			$setTimeout_div_text=$setTimeout_div_text.'setTimeout(function(){document.getElementById("div'.$counter.'").style.visibility = "visible"}, '.$time_multiplier.'*minute);'."\n";


		}

		//$line_to_add='<a href="'.$value.'" target="sideframe1">'.$key.'</a>' ;

		if($key=='Submit'||$value=='Submit') continue;
		   $li_list=$li_list. '<li>'.$line_to_add.'</li>'."\n";
		$counter++;
		$time_multiplier=$time_multiplier+$time_multiplier_increment;
		if($time_multiplier>25)$time_multiplier=25;
	}


	$result= 
'<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Directory Listing with rating</title>
<script type="text/javascript">
   	var first_click=true;
   	var url_time_param=location.search.substring(1).indexOf("time");
</script>

</head>
<body  onload="init_links()">
<TABLE BORDER="2" CELLPADDING="2" CELLSPACING="2"  style="table-layout: fixed;" WIDTH="100%" height=100%>
<tbody><tr style="vertical-align:top" valign="top">
<td style="width: 120px;word-wrap:break-word;" valign="top">

<b>Eπιλέξτε:</b>
<div style="height: 600px; overflow: auto">
<ol>
<!--   MAIN MENU LINKS ############################### -->		
	'. $li_list.'
<!--   MAIN MENU LINKS ############################### -->			
</ol>
</div>
</TD>

<TD style="vertical-align:top;height:100%"  valign="top">
<iframe name="sideframe1" src="" allowfullscreen="" height="98%" frameborder="0" width="98%"></iframe>

</TD>
</TR>

</TABLE>

<!-- FUNCTIONS #################### -->
<script type="text/javascript">


   	//if we find a parameter that contains word "time" (eg packA01.html?timer) then we hide all the other links
function init_links(){
   	if(url_time_param!==-1 ) {
'.$div_hide_on_init.'   		
		/*document.getElementById("div2").style.visibility = "hidden";
		document.getElementById("div3").style.visibility = "hidden";
		document.getElementById("div4").style.visibility = "hidden";
		document.getElementById("div5").style.visibility = "hidden";
		*/
		//document.getElementById("div6").style.visibility = "hidden";
		
	}
}

function showItTimer() {

	if(first_click && url_time_param !==-1 ) {
		//alert("first_timer=true   , "+"location.search.substring(1)="+location.search.substring(1));
		console.log("first click");
	
		//if(location.search.substring(1)>0)  alert("location.search.substring(1)="+location.search.substring(1));
	    var minute=1000*60;
          	setTimeout(function(){document.getElementById("div2").style.visibility = "visible"}, 2000);//test
          	setTimeout(function(){document.getElementById("div2").style.visibility = "hidden"}, 5000);//test

          	setTimeout(function(){document.getElementById("div4").style.visibility = "visible"}, minute/60);//test
          	setTimeout(function(){document.getElementById("div4").style.visibility = "hidden"}, 3000);//test
'.$setTimeout_div_text.'
	   /* setTimeout(function(){document.getElementById("div2").style.visibility = "visible"}, 5*minute);
		setTimeout(function(){document.getElementById("div3").style.visibility = "visible"}, 10*minute);
		setTimeout(function(){document.getElementById("div4").style.visibility = "visible"}, 15*minute);
		setTimeout(function(){document.getElementById("div5").style.visibility = "visible"}, 20*minute);
		//setTimeout(function(){document.getElementById("div6").style.visibility = "visible"}, 20*minute);
		*/
		
	}
	first_click=false;

    return false;
} // end of showItTimer()
</script>

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
	            	echo "<hr><hr> <li><details><summary>$ff</summary></a>"; //folder
	            	listFolderFiles($dir.'/'.$ff);
	            	echo "</details>";
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
