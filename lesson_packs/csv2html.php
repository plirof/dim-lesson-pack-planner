<?php
/*
-250525 -v014e- Show until the end or adjustWeekFinalNum_for_week 999 (after last week 23,24 )
-250115 -v014c- $show_next_week_num
//v014d 230124 fixed: Show previous and nect entries
//v014c 230122 - Replacing $SERVER variable also
//v014b - added remove_unwanted_lines() ,$ignore_bash_script_unwanted_lines=true
//v014a - added <li> (maybe not usefull)
//v013b get adjest week
//v011 autolink !!
//v010 seems to work
//v009
//v008
//v004
//v001

// Desc: Convert john_start_kill bash to html links (shows only near weeks)
*/

/*

ALSO try these : 
http://code.seebz.net/p/autolink-php/  ****
javascript http://code.seebz.net/p/autolink-js/

*/

$file_to_parse="./john_start_kill_apps.sh";
#$file_to_parse="./order_lesson.txt";

$delimiters = array('|_|'); // How each line is divided
$count=0;

$show_prev_week_num=2;
$show_next_week_num=4;//up to how many next weeks should I show?

$ignore_bash_script_unwanted_lines=true; // ignores lines starting with # (for .sh scripts)
$weekofyear = date("W");
echo $weekofyear;
$check_week=true; // show week of year only values

//REPLACEMENTS
//$SERVER_current="http://192.168.1.200/"; // doesn't work check function replaceDelimiters()


function remove_unwanted_lines($str){
    //Pass1: Remove lines starting with #
    //pass2: Keep lines with adjust and http
    // if ($ignore_bash_script_unwanted_liness) 
    //if($data[$c][0]"#")echo "HELLO";//NOT WORKING
    //$str=$data[$c]
    //echo("<h3>$str</h3><hr size=10>");


    if(strpos($str,"adjustWeekFinalNum")!==false){
            //return "HELLO"    ;
            return '<h3>'.$str.'</h3>';

    } 
    if(strpos($str,"#")===0 )return "IGNORED";

        if(strpos($str,"http")!==false){
            //return "HELLO"    ;
            return $str;

        }

    if(strpos($str,"#")!=0 || strpos($str,"#")===false ){
        if(strpos($str,"http")!==false){
            //return "HELLO"    ;
            return $str;

        }
           
    }// END of if(strpos($str,"#")==0){
    return "IGNORED";
    return $str;       

}


function autolink($str, $attributes=array()) {
    $attrs = '';
    foreach ($attributes as $attribute => $value) {
        $attrs .= " {$attribute}=\"{$value}\"";
    }

    $str = ' ' . $str;

    $replacement_string='<li>'.'$1<a target=_blank href="$2"'.$attrs.'>$2</a></li>';
    //$replacement_string=$replacement_string."\n";

 // ORIG ok working jon 210525
    $str = preg_replace(
        '`([^"=\'>])((http|https|ftp)://[^\s<]+[^\s<\.)])`i',
         $replacement_string,
        $str
    );


    $str=$str."\n";
    $str = substr($str, 1);
    
    return $str;
}



//$string_of_file = file_get_contents('./order_lesson.txt', true);

$string_of_file = file_get_contents($file_to_parse, true);


$string_modified=replaceDelimiters($string_of_file); //replaces delimites and bash variables
//echo "$string_modified";
//$string_modified=makeHref($string_modified); //problematic

//if ($ignore_bash_script_unwanted_lines) $string_modified=remove_unwanted_lines($string_modified);

//$string_modified=autolink($string_modified); //Seems to work !!!!!!!!


if ($check_week){
    $substring = "adjustWeekFinalNum_for_week";
    //$result = get_string_between($string_modified , $substring." ".($weekofyear-1), $substring." ".($weekofyear+2) //Orig 
	///$result = get_string_between($string_modified , $substring." ".($weekofyear-1)."\n", $substring." ".($weekofyear+2)."\n" ); // 230124 Show previous and next entries
    $result = get_string_between($string_modified , $substring." ".($weekofyear-$show_prev_week_num)."\n", $substring." ".($weekofyear+$show_next_week_num)."\n" ); // 230124 

    //echo "<h1> <hr>".$substring." ".($weekofyear-1)."<hr>".$substring." ".($weekofyear+2)."<hr>".$result."</h1>" ;
    $string_modified=$result;
}



//$string_modified=formatUrlsInText($string_modified); //Seems to work ok issues with some splitting


//str_replace($search, $replace, $subject);

//$string_modified=str_replace('[', '<BR>', $string_modified); echo("ZZZZZZZZZ".$string_modified); //DEBUG
//echo "<hr size =100>";



$AllData = str_getcsv($string_modified, "\n"); //parse the rows
//print_r($AllData);


 echo '<ol type="1"> <table border="1"> ';

//exit ();
//=============== FORMAT to tables ===========================
$row = 2;





//foreach($AllData as &$Row) $Row = str_getcsv($Row, "[") {
foreach($AllData as $data1) { 
        //echo "<h1>$data1</h1>";


        if ($ignore_bash_script_unwanted_lines) $data1=remove_unwanted_lines($data1);

        if($data1=="IGNORED") continue;
        $data1=autolink($data1); //Seems to work !!!!!!!!
        $data = str_getcsv($data1, "[")   ;  
        
        //print_r($data);
        

        $num = count($data);
        //echo "<h1>num=$num ________  data1=$data1</h1>";


        if ($row == 1) {
            echo '<thead><tr>';
        }else{
            echo '<tr>';
        }
       
        for ($c=0; $c < $num; $c++) {
           // if ($ignore_bash_script_unwanted_liness) if($data[$c][0]"#")echo "HELLO";//NOT WORKING
            //if ($ignore_bash_script_unwanted_lines) $data[$c]=remove_unwanted_lines($data[$c]);
            //if($data[$c]=="IGNORED") continue;
            //echo $data[$c] . "<br />\n";
            if(empty($data[$c])) {
               $value = "&nbsp;";
            }else{
               $value = $data[$c];
            }
            if ($row == 1) {
                echo '<th>'.$value.'</th>';
            }else{
                echo '<td>'.$value.'</td>'."\n";
            }
        }
       
        if ($row == 1) {
            echo '</tr></thead><tbody>';
        }else{
            echo '</tr>';
        }
        $row++;

}
 //parse the items in rows







/**
 * Will replace a number of CSV delimiters to one specific character 
 * AND replaces bash variables
 * @param $file     CSV file
 */
//function replaceDelimiters($str,$prefixserverurl='http://192.168.1.200/')
function replaceDelimiters($str,$prefixserverurl='http://192.168.1.200/')
{
    // Delimiters to be replaced: pipe, comma, semicolon, caret, tabs
   //$delimiters = array('|', ';', '^', "\t");
 
    //$delimiters = array('|_|');
    global $delimiters;
    $delimiter = '[';
    //str_replace($search, $replace, $subject);
    //$str = file_get_contents($file);
    $str = str_replace($delimiters, $delimiter, $str);


    $str = str_replace('""$SWFlocal"', $prefixserverurl."swf/", $str);
    //$str = str_replace(' "$SWFlocal"', " http://192.168.1.200/swf/", $str);
    $str = str_replace(' "$SWFlocal"', " http://192.168.1.200/swf/", $str);
    $str = str_replace('"$SWFpath"', $prefixserverurl."swf/", $str);
    $str = str_replace('$SWFgiortes"', $prefixserverurl."swf/swf_giortes/", $str);
    $str = str_replace('$RAMKIDpathprefix"', $prefixserverurl."ramkid/", $str);
    $str = str_replace('lightbot_iron_browser "', $prefixserverurl."gamesedu/lightbot_haan/index.html?map=", $str);
    $str = str_replace('""$GAMESEDU"', $prefixserverurl."gamesedu/", $str);
    $str = str_replace('"$GAMESEDU"', $prefixserverurl."gamesedu/", $str);
    $str = str_replace('"$SERVER"', $prefixserverurl, $str);

    $str = str_replace('ironstart ', "", $str);
    $str = str_replace('ironstartincognito ', "", $str);


    $str = str_replace('\&', "&", $str);
    $str = str_replace('"', " ", $str);
    

    $str = str_replace('html"', "html", $str); // IMPORTANT !!!



    



    $str = str_replace('aaaaaaa', "", $str);
    $str = str_replace('aaaaaaa', "", $str);
    $str = str_replace('aaaaaaa', "", $str);


    $delimiters = array('|_|');
    $delimiter = '[';



    //file_put_contents($file, $str);
    return $str;
}



/*


function get_string_between($string, $start, $end){
    global $weekofyear,$check_week;



    $string = ' ' . $string;
    $ini = strpos($string, $start);
    if ($ini == 0) return '';
    $ini += strlen($start);
    $len = strpos($string, $end, $ini) - $ini;
    return substr($string, $ini, $len);
}

*/


/*
//shows all the rest of the entries if not found END week
function get_string_between($string, $start, $end){
    global $weekofyear, $check_week;

    $string = ' ' . $string;

    $ini = strpos($string, $start);
    if ($ini === false) {
        // Start not found
        return '';
    }
    $ini += strlen($start);

    // Attempt to find the $end
    $pos_end = strpos($string, $end, $ini);

    if ($pos_end === false) {
        // $end not found; extract until the end of the string
        return trim(substr($string, $ini));
    } else {
        // Extract between start and end
        return trim(substr($string, $ini, $pos_end - $ini));
    }
}
*/

function get_string_between($string, $start, $end){
    global $weekofyear, $check_week;

    $string = ' ' . $string;

    $ini = strpos($string, $start);
    if ($ini === false) {
        // Start not found
        return '';
    }
    $ini += strlen($start);

    // Attempt to find the $end
    $pos_end = strpos($string, $end, $ini);

    // If $end is not found, default to 'adjustWeekFinalNum_for_week 999'
    if ($pos_end === false) {
        $end = 'adjustWeekFinalNum_for_week 999';
        $pos_end = strpos($string, $end, $ini);
        if ($pos_end === false) {
            // Still not found; return empty
            return '';
        }
    }

    $len = $pos_end - $ini;

    return substr($string, $ini, $len);
}

?>
