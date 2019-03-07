<?php
$ver="v20190307 - added probeserver url option";
/* List all SWF files in subfolders

Changes:
-v20190307 - added probeserver url option
-

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
	$flag_div6_opened=false;

	foreach($_REQUEST as $key => $value){
	       // $_REQUEST[$key] = $this->_db->realEscapeString($value);

		if($counter==1) $line_to_add="\n".'<div id="div1" onClick="showItTimer(); return true;" > '."\n".'<li><a href="'.$value.'"  target="sideframe1">'.$key.'</a></li>'."\n".'</div>';
		if($counter>1) {

			$line_to_add='';
			if (!$flag_div6_opened) $div_hide_on_init=$div_hide_on_init.'document.getElementById("div'.$counter.'").style.visibility = "hidden";'."\n";

			if (!$flag_div6_opened) $setTimeout_div_text=$setTimeout_div_text.'setTimeout(function(){document.getElementById("div'.$counter.'").style.visibility = "visible"}, '.$time_multiplier.'*minute+additional_wait_minutes);'."\n";

			if (!$flag_div6_opened)$line_to_add='<div id="div'.$counter.'" >';

			if($counter==6) {	$flag_div6_opened=true;} //stop extra divs after the 6th

			$line_to_add=$line_to_add."\n".'<li><a href="'.$value.'" target="sideframe1">'.$key.'</a></li>'."\n";
			
			if (!$flag_div6_opened)$line_to_add=$line_to_add.'</div>';

		}

		//$line_to_add='<a href="'.$value.'" target="sideframe1">'.$key.'</a>' ;

		if($key=='Submit'||$value=='Submit') continue;
		   $li_list=$li_list. ''.$line_to_add.''."\n";
		$counter++;
		$time_multiplier=$time_multiplier+$time_multiplier_increment;
		if($time_multiplier>25)$time_multiplier=25;
	} // end of foreach(

	if ($flag_div6_opened)$li_list=$li_list.'</div>'."\n"; //close div6

	$result= 
'<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Directory Listing with rating</title>
<script type="text/javascript">
   	var first_click=true;
   	var url_time_param=location.search.substring(1).indexOf("time");
   	// (((((((((((((((((((  preset timers (((((((((((((((((((
   	var additional_wait_time=0;
   	var url_timer2=location.search.substring(1).indexOf("timer2");
   	var url_timer3=location.search.substring(1).indexOf("timer3");
   	var url_timer4=location.search.substring(1).indexOf("timer4");
   	var url_timer5=location.search.substring(1).indexOf("timer5");
   	var url_timer6=location.search.substring(1).indexOf("timer6");
   	var url_timer7=location.search.substring(1).indexOf("timer7");

   	if (url_timer2!==-1)additional_wait_time= -3;
   	if (url_timer3!==-1)additional_wait_time= -2;
   	if (url_timer4!==-1)additional_wait_time= -1;
   	if (url_timer5!==-1)additional_wait_time= 0;
   	if (url_timer6!==-1)additional_wait_time= 1;
   	if (url_timer7!==-1)additional_wait_time= 2;
   	var additional_wait_minutes=additional_wait_time*1000*60;
   	// ))))))))))))))))  preset timers )))))))))))))))))))))))

</script>

</head>
<body  onload="init_links()">
<!--'.$ver.' -->
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
		
	
		//if(location.search.substring(1)>0)  alert("location.search.substring(1)="+location.search.substring(1));
	    var minute=1000*60;
	    console.log("first click , timers set every :");
	    console.log((5*minute + additional_wait_minutes)/60/1000);
	    	//############ TEST ###################
          	setTimeout(function(){document.getElementById("div2").style.visibility = "visible"}, 2000);//test
          	setTimeout(function(){document.getElementById("div2").style.visibility = "hidden"}, 5000);//test

          	setTimeout(function(){document.getElementById("div4").style.visibility = "visible"}, minute/60);//test
          	setTimeout(function(){document.getElementById("div4").style.visibility = "hidden"}, 3000);//test
          	// ########### TEST #####################
'.$setTimeout_div_text.'
		
	}
	first_click=false;

    return false;
} // end of showItTimer()


//+++++++++++++++++++ probeserver +++++++++++++++++
var server_probing_enabled=false;
var url_probeserver=location.search.substring(1).indexOf("probeserver");
if (url_probeserver!==-1)server_probing_enabled=true;

var timer_server_probe = 30000; //probe every 30 seconds
var server_probe_file="pack_refresh_browser.txt";
var jsonrequestInterval = function () {
    console.log("The request was send");
    // <hr><div id="bio"></div><hr> 
    var jsonrequestIntervaled = new XMLHttpRequest();
    jsonrequestIntervaled.open("GET", server_probe_file+"?"+Date.prototype.getTime, true); // Date.prototype.getTime is used to avoid caching
    jsonrequestIntervaled.send();
    jsonrequestIntervaled.onreadystatechange = function () {
        if (jsonrequestIntervaled.readyState == 4) {
            console.log("The request was made and returned results");
            var response_string =jsonrequestIntervaled.responseText;
            document.getElementById("bio").innerHTML = response_string;
            
            if (response_string.indexOf("reload") !== -1) {
                console.log("refreshing browser");
                window.location.reload(true);
            }
            
        }
    };
    
};

if(server_probing_enabled) setInterval(jsonrequestInterval, timer_server_probe);

//-------------------probeserver ---------------


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
	$count_files=0;

	//$dir_starting ='/opt/lampp/htdocs/mocha181212swf_only/';
	$dir_starting ='.';
	//$dir_starting ='E:/incoming_/games_fun_/Flash_SWF_Games_/';
	$dir_rating=$dir_starting.'';






	function listFolderFiles($dir){
	global $dir_starting,$debug;
	global $submit_button,$show_rating,$dir_rating,$file_extension,$count_files;
	    $ffs = scandir($dir);
	    //if($debug) echo "<h3>SCANDIR ".$dir."</h3>";
	    $sub_dir = str_replace($dir_starting, ".", $dir);
	    //if($debug) echo "<h3>SCANDIR ".$sub_dir."</h3>";
	    
		echo '<ol>';
	    foreach($ffs as $ff){
	        if($ff != '.' && $ff != '..'){
	            //echo '<li>'.$ff;
	            $count_files++;
	            if(strpos($ff,$file_extension) ) { //if we have an .swf file
	            	//echo  '<input type="checkbox" name="$ff" value="'.$sub_dir.'/'.$ff.'" />   ';
					echo "<hr><li>".'<input type="checkbox" name="'.$ff.$count_files.'" value="'.$sub_dir.'/'.$ff.'" />   '." <a href=".$sub_dir.'/'.$ff." target='_blank' > $ff</a> "; //file  ORIG line
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
