# dim-lesson-planner
dimotiko lesson planner

 - Also contains pack_Axx.html lesson packs


















# changes 
v20190307 - added probeserver url option

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