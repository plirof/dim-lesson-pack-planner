rm /root/.config/xfce4/panel/launcher-2/13879159301.desktop
leafpad "rm"
# Script called by client
# WILL NOT Stop the parent script from executing (so don't try pkill -chrome)
# put this file in /opt/lampp/htdocs/swf
# Script 
#changes 
#v201030b - added norightclick to some & nocopy to rudolf xmas
#v201012a - added 28oct jspaint(v01),tinymce word
#v200924 - minor change
#v200916b - added olohmero check (check day + if hour passed 13:15)
#v200908a - added funbrain to first lesson
#v200903  dim101-21 new year start (COVID 14sept start year)
#v200419 adjustWeekFinalNum_for_week() , also added Constants for Giortes
#v200301 if..then..fi needs something inside or it produces errors (added echo "empty line") PROGLEM of Weeks 03-09 EXISTS AGAIN
#v200217 fixed error in week 08
#v200210a apokries-pasxa -added tinymce (weeks01-09tempfix)
#v200107 : temp hardcoded fix : first 9 weeks (o..9) have problem Cause of the starting 0  : 02==2  , 03==3
# this modifies the weekofyear (eg +1,-1)
STARTWEEKCOUNT=0


#leafpad "test";
# kill firefox (if you want )
#pkill -f firefox
#pkill -f chrome
#clear cache
#rm -rf /mnt/home/downloads_linux/.cache/iron_flash/

# SPECIAL WEEKS (ADJUCT THESE TO CURRENT SCHOOL YEAR EG 2021-22) NOTE!!!! use double digit eg 05
HALLOWEEN_ENGLISH_WEEK_01=43
APOKRIES_PREWEEK_01=09
APOKRIES_PREWEEK_02=10
EASTER_PREWEEK_01=15
EASTER_PREWEEK_02=16
XMAS_PREWEEK_01=50
XMAS_PREWEEK_02=51
XMAS_AFTER_01=02
RECYCLE_DAY=00
INTERNET_SAFETY_01=00
INTERNET_SAFETY_02=00

#ironstart https://studio.code.org/s/course1
#ironstart https://studio.code.org/s/course1/stage/4/puzzle/10
#ironstart https://studio.code.org/s/course1/stage/7/puzzle/10
#dim-worklog.matheme.win

SERVER="http://192.168.1.200/";
CODEorg=https://studio.code.org/s/course1/stage/
LANDINGpages=""$SERVER"uploads/landing_pages/"
SWFlocal=""$SERVER"swf/"
SWFpath=""$SERVER"swf/"
SWFgiortes=""$SERVER"swf/swf_giortes/"
#---------
GAMESEDU=""$SERVER"gamesedu/"
GAMESEDUtortuga=""$GAMESEDU"tortuga-kids-logo-gr"
GAMESEDUtank=""$GAMESEDU"Code-Commander-gr/index_dot_links.html"
#----------

OOOKIDS="ooo4kids1.3 -n "
OOOKIDSpathprefix="/opt/lampp/htdocs/askiseis_office/"
RAMKIDpathprefix=""$SERVER"ramkid/"

#date "+%A"   : Δευτέρα , Τρίτη , Τετάρτη , Πέμπτη , Παρασκευή 
# echo $(date -d "+1 days" "+%A")
DAYOFWEEK=$(date "+%A")  
WEEKNUMBER=`date +%V`

# date --date="1984-12-18" +"%V"

# To avoid Week Choosing :
#WEEKNUMBER=99



WEEKFINALNUM=0
# Calculate the WeekLesson to start : $STARTWEEKCOUNT + Normal Lesson Week)
adjustWeekFinalNum_for_week() {
# adjustWeekFinalNum_for_week 5 = $WEEKFINALNUM adjustWeekFinalNum_for_week 5))
WEEKFINALNUM=$(($STARTWEEKCOUNT+$1));printf -v WEEKFINALNUM "%02d" $WEEKFINALNUM
echo "DEBUG adjustWeekFinalNum_for_week() WEEKFINALNUM return ="$WEEKFINALNUM
return 5
}

load_extra_apps(){
# used to activate events (eg pasxa, halloween, etc)	
cd /tmp
wget ""$SERVER"uploads/john_extra_apps.sh" --directory-prefix=/tmp/
chmod a+x /tmp/john_extra_apps.sh
. /tmp/john_extra_apps.sh

}

ironstart() {
# eg  ironstart ""$SWFlocal"pack_A01.html "$LANDINGpage"15-ΤΕΤΑΡΤΗ-Β1--hour5.html "$SWFlocal"pack_A01.html"
. iron_flash_puppy_pepper_home.sh "$1"
return 5
}

ironstartincognito() {
# eg  ironstart ""$SWFlocal"pack_A01.html "$LANDINGpage"15-ΤΕΤΑΡΤΗ-Β1--hour5.html "$SWFlocal"pack_A01.html"
. iron_flash_puppy_pepper_home.sh "--incognito ""$1"
return 5
}

ironchangesdat() {
# eg  ironstart ""$SWFlocal"pack_A01.html "$LANDINGpage"15-ΤΕΤΑΡΤΗ-Β1--hour5.html "$SWFlocal"pack_A01.html"
. iron_flash_puppy_pepper.sh "--incognito ""$1"
return 5
}

oookidsopen()
{
# eg oookidsopen "OFFICE_extra_files/pliktrologisi_j02.1_antigrafi_katanomi_wron.doc"
$OOOKIDS$OOOKIDSpathprefix"$1"
return 5
}

lightbot_iron_browser() {
# NOTE : ONLY foir custom MAPS. for normal just run : . iron_flash_puppy_pepper_home.sh "--incognito http://192.168.1.200/gamesedu/lightbot_haan/
# eg  lightbot_iron_browser "maps_easy.txt "$SWFlocal"pack_A02.html"
#. iron_flash_puppy_pepper_home.sh "--incognito http://192.168.1.200/gamesedu/lightbot_haan/index.php?map=""$1"
. iron_flash_puppy_pepper_home.sh "--incognito http://192.168.1.200/gamesedu/lightbot_haan/index.html?map=""$1"" "
return 5	
}

firefox10() {
#. firefox10-puppy-home.sh "$1"
#eg firefox10 $SWFgiortes"other/ramkid_invitation_party/index.html" $SWFpath"ramkid_giortes_apokries_pt1.html"
su -l puppy -c '/opt/firefox10/firefox -new-window -no-remote -profile "/mnt/home/downloads_linux/.data/firefox10" -new-tab -url "'$1'" -new-tab -url "'$2'"  -new-tab -url "'$3'"  -new-tab -url "'$4'"'
return 5
}

firefox24() {
pkill -f firefox
pkill -f firefox24
#. firefox24-puppy-home.sh "$1"
#eg firefox24 $SWFgiortes"other/ramkid_invitation_party/index.html" $SWFpath"ramkid_giortes_apokries_pt1.html"
#su -l puppy -c '/opt/firefox24/firefox -private -new-window -no-remote -profile "/mnt/home/downloads_linux/.data/firefox24" -new-tab -url "'$1'" -new-tab -url "'$2'"  -new-tab -url "'$3'"  -new-tab -url "'$4'"'
firefox24-puppy-home-many-tabs.sh $1 $2 $3 $4
return 5
}  

create_download_linux_home_folders(){
xhost +local:puppy
mkdir -p /mnt/home/downloads_linux/.data/$1
mkdir -p /mnt/home/downloads_linux/.cache/$1
#chown -R puppy:puppy /mnt/home/downloads_linux/.data
#chown -R puppy:puppy /mnt/home/downloads_linux/.cache
cp -n /usr/bin/firefox24_default_home_prefs.js /mnt/home/downloads_linux/.data/$1/prefs.js
}

probe_the_server()
{
	#every 2 minutes gets the file /uploads/john_exec_cmd_on_client.sh and executes it
	# you should call it with probe_the_server &  (to run in background) 
	cd /tmp
	while /bin/true; do
		cd /tmp
	    rm /tmp/john_exec_cmd_on_client.sh
		wget ""$SWFlocal"john_exec_cmd_on_client.sh" --directory-prefix=/tmp/
		chmod a+x /tmp/john_exec_cmd_on_client.sh
		. /tmp/john_exec_cmd_on_client.sh
	    #something_in_the_background
	    sleep 2m # Waits 2 minutes.
	done &
	return 5
}

# 200916b - Check Olohmero (used to check if oloimero hour has started - Combine it with a DAYOFWEEK check)
check_oloimero_time()
{
    currTime=`date +%k%M`
    tempTime=$1
    #if [ $tempTime -gt 200 -a $tempTime -lt 2200 ]; then 
    if [ $currTime -gt $tempTime ]; then 
        echo "OKpassedCheck"
        exit 1
    else
        echo "Time is after 10 PM and before 2 AM. Running normally."
        exit 2
    fi
}
#pkill -f firefox
#pkill -f chrome



#leafpad "Run Command time:"$(date +"%T")"  -  Week number: $WEEKNUMBER" &
#ironstartincognito ""$SWFlocal"pack_gfx2.html?timer3\&probeserver"
#oookidsopen "OFFICE_extra_files/pliktrologisi_j02.1_antigrafi_katanomi_wron.doc"
#/opt/eduActiv8/eduActiv8
#. /usr/local/bin/tuxpaint-with-conf.sh 
#ironchangesdat ""$GAMESEDU"Code-Commander-gr/index_dot_links.html"
#gcompris
#scratch