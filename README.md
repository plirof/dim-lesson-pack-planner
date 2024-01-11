# dim-lesson-planner
dimotiko lesson planner

 - Also contains pack_Axx.html lesson packs




# To DO :
- run remote eval only ONCE
-
- (ok)make external javascripts pack_header.js and pack_footer.js 




# Changes 
v240110  - Added prefix hash to <div id=probeserver></div>
v201025b - eval (pack_refresh_browser.txt) execute commands dynamic (requires probeserver activated) (not implemented yet)
v201020c - norightclick -disable right click
v190307  - added probeserver url option
v190402  - modified probeserver reload url option


# Script samples

## Add hash prefix to href.innerHtml (made for olohmero entries) 240110
```javascript
// ((((((((((((((((addHashLabels addhashlabellinks 240110(((((((((((((((((
function addHashLabels() {
  const divprobesrv = document.getElementById('probeserver');//get probeserver contents
  //const links = document.getElementsByTagName('a');
  const links = divprobesrv.getElementsByTagName('a'); //get all href entries
  const hashRange = 99 - 1 + 1; // 01 to 99
  for (let i = 0; i < links.length; i++) {
    const url = links[i].getAttribute('href');
    const hash = getHash(url);
    // Generate prefix based on hash number
    const prefixletter=links[i].innerHTML.charAt(0); 
    //console.log("InnetHTML="+prefixletter+ " , innerHTML="+links[i].innerHTML)
    const prefix = prefixletter+('0' + (hash % hashRange + 1)).slice(-2);
    
    // Add prefix to link description
    links[i].innerHTML = prefix + '- ' + links[i].innerHTML;
  }
};

// Function to generate hash from URL
function getHash(url) {
  let hash = 0;
  for (let i = 0; i < url.length; i++) {
    hash = ((hash << 5) - hash) + url.charCodeAt(i);
    hash = hash & hash; // Convert to 32bit integer
  }
  return Math.abs(hash);
}
// )))))))))))))))End Of addHashLabels addhashlabellinks)))))))))))))))))))

```



## Disable right click on main document + iFrame
```javascript
// (((((((((((((((((((((((((( option to disable right click v201020c ((((((((((
    var url_norightclick=location.search.substring(1).indexOf("norightclick");// != to -1 if we have this param
    if(url_norightclick!==-1) {
        document.oncontextmenu=new Function("console.log('main page: right-click-context menu -STOPPED');return false") ; //OK normal page Works  
        setInterval(function(){window.frames["sideframe1"].document.oncontextmenu = function(){console.log("setInterval sideframe1 :right click-DISABLED"); return false;}; }, 5000);
    }
// )))))))))))))))))))))))))) option to disable right click ))))))))
```

## probeserver (main code)
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

## probeserver (eval addition) 201025 (not implemented yet)
```javascript
                var s=response_string; // text of pack_refresh_browser.txt
                //pack_refresh_browser includes something like= execute AAAA:console.log("eval-command-console.log--hello");:BBBB 
                //execut e TEST AAAA:console.log("eval-command-console.log--hello");:BBBB
				//execut e DISABLE RIGHT CLICK AAAA:setInterval(function(){window.frames["sideframe1"].document.oncontextmenu = function(){console.log("setInterval sideframe1 :right click-DISABLED"); return false;}; }, 5000);document.oncontextmenu=new Function("console.log('main page: right-click-context menu -STOPPED');return false") ;console.log("Right click disabled");:BBBB
                //var result = s.match(/AAAA:(.*?):BBBB/i); //OLD - ONLY for single line
                //var result = s.match(/AAAA:([\s\S]*?):BBBB/); //multi line                
                var result = s.match(/EVAL:([\s\S]*?):EVAL/); //multi line                  
                 console.log("DEBUG START +++++++++execute found3="+result_command[1]+"DEBUG END------------------------");
                 eval(result_command[1]);
                //document.getElementById("probeserver").innerHTML = response_string;
            }            
            
        }
    };
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

## Replace all href with button to POST a form (required for code.org el-GR)
```html
    <!-- Code.org Add On START  ----------------------------  -->
<form id="frm" action="https://studio.code.org/locale" method="post" target="newtab2" >
<input type = "hidden" name = "user_return_to" id = "user_return_to" value = "https://studio.code.org/s/course1/lessons/13/levels/1" / >
<input type = "hidden" name = "locale" value = "el-GR"  >
    <!-- Code.org Add On END ----------------------------   -->

<li> <a href="https://studio.code.org/s/course1/stage/3/puzzle/1" target="newtab2">1. Χαρούμενοι Χάρτες , 2. Κούνισέ το , 3. Παζλ: Μάθε την μεταφορά και </a></li>

<li><a href="https://studio.code.org/s/course1/stage/4/puzzle/1" target="newtab2"> 4. Λαβύρινθος angry-birds: Ακολουθία </a></li>

</form>
```


```javascript
    <!-- Code.org Add On START  ----------------------------  -->
<script type="text/javascript">
// Replace all HREF with buttons (angry birds add on)

    var links = document.querySelectorAll("a");
    function get_hrefs(links){
        var links_array = links.forEach(function(elem){ return elem.getAttribute("href"); });
        return links_array;
}
console.log(get_hrefs(links));
console.log((links));


function href_replace(links){
    var i=0;
    var links_array = 
    
    links.forEach(function(elem)
        { 
            console.log(i);
            // Create a new element
            var newNode = document.createElement('div5'+i);
            // Add ID and content
            newNode.id = 'replacehrefwithbutton';
            var text=elem.textContent.trim();
            newNode.innerHTML =
            text+'<BR><input type = "submit" name = "user_return_to" id = "user_return_to" value ='+elem.getAttribute("href")+' >'
            elem.replaceWith(newNode);
            i++;
            return elem.getAttribute("href");         
        });

    return links_array;
}
href_replace(links);
</script>
    <!-- Code.org Add On END  ----------------------------  -->  
```


## Check chrome version
	// Detect chrome version
	function getChromeVersion () {     
	    var raw = navigator.userAgent.match(/Chrom(e|ium)\/([0-9]+)\./);
	    return raw ? parseInt(raw[2], 10) : false;
	}
	console.log(getChromeVersion ());


## Load external Script dynamically and execute it 240110 (not used at the moment)
```javascript
            
// Load Javascript dynamically
if (addhashlabellinks) { //if true THEN load script dynamically
        var secondScript = document.createElement('script');
        secondScript.type = 'text/javascript';
        secondScript.src = 'test_hash.js';
        secondScript.onload = function() {
        // code to execute after the second script is loaded and executed
        addHashLabels();
};
document.head.appendChild(secondScript);
}                        
           
```


# github CDN example
https://raw.githubusercontent.com/plirof/dim-lesson-pack-planner/master/lesson_packs/pack_js_footer.js
MUST be server/CDN as :
https://cdn.jsdelivr.net/gh/plirof/dim-lesson-pack-planner/lesson_packs/pack_js_footer.js



##