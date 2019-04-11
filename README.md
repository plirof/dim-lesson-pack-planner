# dim-lesson-planner
dimotiko lesson planner

 - Also contains pack_Axx.html lesson packs







# To DO :
- make external javascripts pack_header.js and pack_footer.js
-  









# changes 
v20190307 - added probeserver url option
v20190402 - modified probeserver reload url option


# github CDN example
https://raw.githubusercontent.com/plirof/dim-lesson-pack-planner/master/lesson_packs/pack_js_footer.js
MUST be server/CDN as :
https://cdn.jsdelivr.net/gh/plirof/dim-lesson-pack-planner/lesson_packs/pack_js_footer.js

# Script samples
## probeserver
```javascript
//+++++++++++++++++++ probeserver v02 190402+++++++++++++++++
// note : before menu links add this : <hr><div id="probeserver"></div><hr> 
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
```

## If external js fail loading, get it from alternativesource 

```javascript
<script>
    //check if external file is loaded and if not load from CDN (NOTE : also works on Firefox 17)
    if(typeof(first_click) === 'undefined') {
    document.write('<script src="https://cdn.jsdelivr.net/gh/plirof/dim-lesson-pack-planner/lesson_packs/pack_js_footer.js"><\/script>')
    }
</script>    
```

## Modify all href
(the idea is to add opengame?file= to all links )

```javascript
<script>
//source https://stackoverflow.com/questions/4939805/change-all-links-hrefs-urls-with-vanilla-javascript-regex
function replace_url(elem, attr) {
    var elems = document.getElementsByTagName(elem);
    for (var i = 0; i < elems.length; i++)
        elems[i][attr] = elems[i][attr].replace('"./', '"opengame.php?file=./');
}

window.onload = function() {
    replace_url('a', 'href');
    replace_url('img', 'src');
    // etc
}
</script>    
```


##