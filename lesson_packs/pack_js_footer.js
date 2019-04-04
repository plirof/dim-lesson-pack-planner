//<script type="text/javascript">
/*
* pack_js_footer  (put this in same folder as parent html)
*
*
* Changes:
* ver190404 -showdiv
* ver190402 -all scripts are now in footer
* 
* example : index.html?showdiv5\&timer3\&probeserver , 
*/

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

    // (((((((((((((((((((  option to show only specific DIV (((((((((((((((((((
    var url_showdiv_param=location.search.substring(1).indexOf("showdiv");// != to -1 if we have this param
    var url_showdiv1=location.search.substring(1).indexOf("showdiv1");
    var url_showdiv2=location.search.substring(1).indexOf("showdiv2");
    var url_showdiv3=location.search.substring(1).indexOf("showdiv3");
    var url_showdiv4=location.search.substring(1).indexOf("showdiv4");
    var url_showdiv5=location.search.substring(1).indexOf("showdiv5");
    var url_showdiv6=location.search.substring(1).indexOf("showdiv6");
    var url_showdiv7=location.search.substring(1).indexOf("showdiv7");
    // ))))))))))))))))  option to show only specific DIV  )))))))))))))))))))))))




//if we find a parameter that contains word "time" (eg packA01.html?timer) then we hide all the other links
function init_links(){

    if((url_showdiv_param!==-1 ) && (url_time_param==-1 ) ){  //disable show_url IF we have set timer
        //if((url_showdiv1==-1) && (url_time_param==-1 )) document.getElementById("div1").style.visibility = "hidden";
        if(url_showdiv1==-1) document.getElementById("div1").style.visibility = "hidden";
        if(url_showdiv2==-1) document.getElementById("div2").style.visibility = "hidden";
        if(url_showdiv3==-1) document.getElementById("div3").style.visibility = "hidden";
        if(url_showdiv4==-1) document.getElementById("div4").style.visibility = "hidden";
        if(url_showdiv5==-1) document.getElementById("div5").style.visibility = "hidden";
        if(url_showdiv6==-1) document.getElementById("div6").style.visibility = "hidden";
        if(url_showdiv7==-1) document.getElementById("div7").style.visibility = "hidden";    
    }    

    //If we have a timer URL param then HIDE divs
    if(url_time_param!==-1 ) {
        document.getElementById("div2").style.visibility = "hidden";
        document.getElementById("div3").style.visibility = "hidden";
        document.getElementById("div4").style.visibility = "hidden";
        document.getElementById("div5").style.visibility = "hidden";
        document.getElementById("div6").style.visibility = "hidden";
        document.getElementById("div7").style.visibility = "hidden";
        //document.getElementById("div6").style.visibility = "hidden";        
    }


} // end of function init_links(){

function showItTimer() {
    //enable if its 1st click AND we have a timer UTL param
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
        setTimeout(function(){document.getElementById("div2").style.visibility = "visible"}, 5*minute+additional_wait_minutes);
        setTimeout(function(){document.getElementById("div3").style.visibility = "visible"}, 10*minute+additional_wait_minutes);
        setTimeout(function(){document.getElementById("div4").style.visibility = "visible"}, 15*minute+additional_wait_minutes);
        setTimeout(function(){document.getElementById("div5").style.visibility = "visible"}, 20*minute+additional_wait_minutes);
        setTimeout(function(){document.getElementById("div6").style.visibility = "visible"}, 25*minute+additional_wait_minutes);
        setTimeout(function(){document.getElementById("div7").style.visibility = "visible"}, 26*minute+additional_wait_minutes);

        
    }
    first_click=false;

    return false;
} // end of showItTimer()






//+++++++++++++++++++ probeserver v02 190402+++++++++++++++++
var server_probing_enabled=false;
var url_probeserver=location.search.substring(1).indexOf("probeserver");
if (url_probeserver!==-1)server_probing_enabled=true;

var timer_server_probe = 30000; //probe every 30 seconds
var server_probe_file="pack_refresh_browser.txt";
var jsonrequestInterval = function () {
    console.log("The request was send");
    // <hr><div id="probeserver"></div><hr> 
    var jsonrequestIntervaled = new XMLHttpRequest();
    var random_number=Math.random(); // OLD was=Date.prototype.getTime;
    jsonrequestIntervaled.open("GET", server_probe_file+"?"+random_number, true); // Date.prototype.getTime is used to avoid caching
    jsonrequestIntervaled.send();
    jsonrequestIntervaled.onreadystatechange = function () {
        if (jsonrequestIntervaled.readyState == 4) {
            console.log("The request was made and returned results (with random number="+random_number);
            var response_string =jsonrequestIntervaled.responseText;

            //always add our extra text
            document.getElementById("probeserver").innerHTML = response_string;
            
            //in case we put the word reload, refresh browser
            if (response_string.indexOf("reload") !== -1) {
                console.log("refreshing browser");
                //document.getElementById("probeserver").innerHTML = response_string;
                window.location.reload(true);
            }
            
        }
    };
    
};

if(server_probing_enabled) setInterval(jsonrequestInterval, timer_server_probe);

//-------------------probeserver ---------------


//</script>
