<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="el-gr" lang="el-gr" >
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <script type="text/javascript" src="ruffle/ruffle.js"></script>
  <title>Spec12.com - Games </title>
 </head>
 <body bgcolor="#000000" >
<!-- bgcolor="#808080"  = grey -->
 <center>

<?php


//$name=$_POST["name"];
//$file=$_POST["file"];
$file=$_REQUEST["file"];
//$file="arrange_castle_doll_house__noNavAdsUrl.swf";
//echo "<h2><font color=red >  Spec12.com - Games - Play : $name </font></h2>";
//echo "<h1>AAAAAAAAAAAAAAA<font color=white> ".$file." </font></h1>";
?>


<embed src="<?php echo "$file"; ?>" width="90%" height="90%" bgcolor="#000000" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash"></embed>

</center> <br>
<!--<font color=lightgrey ><i>If you want to report this item, please contact the site admin. Thanks & enjoy </i></font>-->
<!--
<script>
  /*  window.RufflePlayer = window.RufflePlayer || {};
    window.RufflePlayer.config = {
        "publicPath": "ruffle/ruffle.js",
        "polyfills": true, // Whether polyfills should be run.
    };
    */
</script>
-->




<script type="text/javascript" src="ruffle/ruffle.js"></script>
<!--<script>
    window.RufflePlayer = window.RufflePlayer || {};
    window.addEventListener("load", (event) => {
        const ruffle = window.RufflePlayer.newest();
        const player = ruffle.createPlayer();
        const container = document.getElementById("container");
        container.appendChild(player);
        player.load("<?php echo "$file"; ?>");
    });
</script>
-->
</body>
</html>