# kill firefox (if you want )
pkill -f firefox
#ironstart https://studio.code.org/s/course1
#ironstart https://studio.code.org/s/course1/stage/4/puzzle/10
#ironstart https://studio.code.org/s/course1/stage/7/puzzle/10

CODEorg=https://studio.code.org/s/course1/stage/
LANDINGpages="$LANDINGpages"
SWFlocal="http://192.168.1.200/swf/"
OOOKIDS="ooo4kids1.3 -n "
OOOKIDSpathprefix="/opt/lampp/htdocs/askiseis_office/"

#date "+%A"   : Δευτέρα , Τρίτη , Τετάρτη , Πέμπτη , Παρασκευή 
DAYOFWEEK=$(date "+%A")  



ironstart() {
# eg  ironstart ""$SWFpath"pack_A01.html "$LANDINGpage"15-ΤΕΤΑΡΤΗ-Β1--hour5.html "$SWFpath"pack_A01.html"
. iron_flash_puppy_pepper_home.sh "$1"
return 5
}

ironstartincognito() {
# eg  ironstart ""$SWFpath"pack_A01.html "$LANDINGpage"15-ΤΕΤΑΡΤΗ-Β1--hour5.html "$SWFpath"pack_A01.html"
. iron_flash_puppy_pepper_home.sh "--incognito ""$1"
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
# eg  lightbot_iron_browser "maps_easy.txt http://192.168.1.200/swf/pack_A02.html"
#. iron_flash_puppy_pepper_home.sh "--incognito http://192.168.1.200/gamesedu/lightbot_haan/index.php?map=""$1"
. iron_flash_puppy_pepper_home.sh "--incognito http://192.168.1.200/gamesedu/lightbot_haan/index.php?map=""$1"
return 5	
}


################  TEST COMMANDS #############
#lightbot_iron_browser "maps_d1.txt http://192.168.1.200/swf/pack_A02.html"
#ironstart ""$SWFlocal"pack_A01.html "$LANDINGpages"ΠΑΡΑΣΚΕΥΗ-A2--hour2__dim10.html "$SWFlocal"fun/finding-santa__christmas_find_noAdURL_!!.swf"
################# END OF TEST COMMANDS ##########

#. /usr/local/bin/tuxpaint-with-conf.sh
#ironstart ""$SWFlocal"swf_giortes/christmas.html http://192.168.1.200/landing_pages/PEMPTH-ST1--hour3__dim10.html"
#. /usr/local/bin/tuxpaint-with-conf.sh
#ironstart ""$SWFlocal"swf_giortes/christmas.html http://192.168.1.200/landing_pages/PEMPTH-E2--hour6__dim10.html"


#ironstart ""$SWFlocal"swf_giortes/christmas.html http://192.168.1.200/landing_pages/ΤΕΤΑΡΤΗ-Γ2--hour1__dim10.html "$SWFlocal"fun/finding-santa__christmas_find_noAdURL_!!.swf"
# A1
#ironstart ""$SWFlocal"swf_giortes/christmas.html "$LANDINGpages"ΤΕΤΑΡΤΗ-Α1--hour2__dim10.html  "$SWFlocal"fun/finding-santa__christmas_find_noAdURL_!!.swf"

if [ $DAYOFWEEK == 'Τετάρτη' ] 
then
#: '#ΤΕΤΑΡΤΗ 10ο ΔΗΜ
#        -----------Γ2--hour1-----------
#$OOOKIDS
#oookidsopen "OFFICE_extra_files/pliktrologisi_j01.1_antigrafi_stratigiki_ekmathisis.doc"
#ironstart ""$CODEorg"10/puzzle/1 http://192.168.1.200/landing_pages/ΤΕΤΑΡΤΗ-Γ2--hour1__dim10.html "$SWFlocal"fun/finding-santa__christmas_find_noAdURL_!!.swf"
lightbot_iron_browser "maps_easy.txt http://192.168.1.200/swf/pack_A02.html"
#        -----------A1-----------
lightbot_iron_browser "maps_easy.txt http://192.168.1.200/swf/pack_A02.html"
#ironstart ""$SWFlocal"ab/funbrain_com/funbrain.html "$LANDINGpages"ΠΑΡΑΣΚΕΥΗ-A2--hour2__dim10.html "$SWFlocal"pack_A01.html"
#ironstart ""$SWFlocal"pack_A02.html http://192.168.1.200/landing_pages/ΤΕΤΑΡΤΗ-Α1--hour2__dim10.html"
#/opt/eduActiv8/eduActiv8
#ΤΕΤΑΡΤΗ 10ο ΔΗΜ '
fi

if [ $DAYOFWEEK == 'Πέμπτη' ] 
then
#: '#ΠΕΜΠΤΗ 10ο ΔΗΜ
#ΠΕΜΠΤΗ------------Δ2--hour1-----------
lightbot_iron_browser "maps_random_2%284x4_3lights%29.txt http://192.168.1.200/swf/pack_A02.html"
#ironstart ""$CODEorg"16/puzzle/1 "$LANDINGpages"ΠΕΜΠΤΗ-Δ2--hour1__dim10.html "$SWFlocal"fun/finding-santa__christmas_find_noAdURL_!!.swf"
#oookidsopen "OFFICE_extra_files/pliktrologisi_j01.1_antigrafi_stratigiki_ekmathisis.doc"
#ΠΕΜΠΤΗ------------Γ1--hour2-----------
lightbot_iron_browser "maps_easy.txt http://192.168.1.200/swf/pack_A02.html"
#ironstart ""$CODEorg"16/puzzle/1 "$LANDINGpages"ΠΕΜΠΤΗ-Γ1--hour2__dim10.html "$SWFlocal"fun/finding-santa__christmas_find_noAdURL_!!.swf"
#oookidsopen "OFFICE_extra_files/pliktrologisi_j01.1_antigrafi_stratigiki_ekmathisis.doc"
#ΠΕΜΠΤΗ------------ΣΤ1--hour3-----------
lightbot_iron_browser "maps_random_2%284x4_3lights%29.txt http://192.168.1.200/swf/pack_A02.html"
#ironstart ""$CODEorg"14/puzzle/6 "$LANDINGpages"ΠΕΜΠΤΗ-ΣΤ1--hour3__dim10.html "$SWFlocal"fun/finding-santa__christmas_find_noAdURL_!!.swf"
#oookidsopen "OFFICE_extra_files/pliktrologisi_j01.1_antigrafi_stratigiki_ekmathisis.doc"
#ΠΕΜΠΤΗ------------Δ1--hour5-----------
lightbot_iron_browser "maps_random_2%284x4_3lights%29.txt http://192.168.1.200/swf/pack_A02.html"
#ironstart ""$CODEorg"13/puzzle/8 "$LANDINGpages"ΠΕΜΠΤΗ-Δ1--hour5__dim10.html "$SWFlocal"fun/finding-santa__christmas_find_noAdURL_!!.swf"
#oookidsopen "OFFICE_extra_files/pliktrologisi_j01.1_antigrafi_stratigiki_ekmathisis.doc"
#ΠΕΜΠΤΗ------------Ε2--hour6-----------
lightbot_iron_browser "maps_random_2%284x4_3lights%29.txt http://192.168.1.200/swf/pack_A02.html"
#ironstart ""$CODEorg"13/puzzle/10 "$LANDINGpages"ΠΕΜΠΤΗ-Ε2--hour6__dim10.html "$SWFlocal"fun/finding-santa__christmas_find_noAdURL_!!.swf"
#oookidsopen "OFFICE_extra_files/pliktrologisi_j02.1_antigrafi_katanomi_wron.doc"
 #ΠΕΜΠΤΗ 10ο ΔΗΜ ' 
fi


if [ $DAYOFWEEK == 'Παρασκευή' ] 
then
#: '#ΠΑΡΑΣΚΕΥΗ 10ο ΔΗΜ
# -----------A2--hour2# -----------
lightbot_iron_browser "maps_easy.txt http://192.168.1.200/swf/pack_A02.html"
#ironstart ""$SWFlocal"ab/funbrain_com/funbrain.html "$LANDINGpages"ΠΑΡΑΣΚΕΥΗ-A2--hour2__dim10.html "$SWFlocal"pack_A01.html"
#/opt/eduActiv8/eduActiv8
#"$LANDINGpages"ΠΑΡΑΣΚΕΥΗ-A2--hour2__dim10.html  "$SWFlocal"fun/maze/Kaban_agriogourouno_maze_ok_more_time!!.swf"
#  -----------ΣΤ2--hour# -----------
lightbot_iron_browser "maps_random_2%284x4_3lights%29.txt http://192.168.1.200/swf/pack_A02.html"
#oookidsopen "OFFICE_extra_files/pliktrologisi_j01.1_antigrafi_stratigiki_ekmathisis.doc"
#ironstart ""$CODEorg"13/puzzle/1 "$LANDINGpages"ΠΑΡΑΣΚΕΥΗ-ΣΤ2--hour3__dim10.html tortuga.patatakia.tk "$SWFlocal"fun/finding-santa__christmas_find_noAdURL_!!.swf"
# -----------Ε1--hour5-----------
lightbot_iron_browser "maps_random_2%284x4_3lights%29.txt http://192.168.1.200/swf/pack_A02.html"
#oookidsopen "OFFICE_extra_files/pliktrologisi_j02.1_antigrafi_katanomi_wron.doc"
#ironstart ""$CODEorg"13/puzzle/1 "$LANDINGpages"ΠΑΡΑΣΚΕΥΗ-Ε1--hour5__dim10.html tortuga.patatakia.tk "$SWFlocal"fun/finding-santa__christmas_find_noAdURL_!!.swf"
# -----------Β--hour6-----------
#/opt/eduActiv8/eduActiv8
lightbot_iron_browser "maps_easy.txt http://192.168.1.200/swf/pack_A02.html"
#ironstart ""$SWFlocal"pack_A01.html "$LANDINGpages"ΠΑΡΑΣΚΕΥΗ-Β--hour6__dim10.html "$SWFlocal"ab/funbrain_com/funbrain.html"
#ΠΑΡΑΣΚΕΥΗ 10ο ΔΗΜ'
fi


#ironstart ""$CODEorg"13/puzzle/1 http://192.168.1.200/ΔΕΥΤΕΡΑ-Γ1--hour3 http://tortuga.patatakia.tk"
#ironstart ""$CODEorg"10/puzzle/1 http://192.168.1.200/ΔΕΥΤΕΡΑ-Γ2--hour4 http://tortuga.patatakia.tk"
#ironstart ""$CODEorg"13/puzzle/1 http://192.168.1.200/ΔΕΥΤΕΡΑ-ΣΤ2--hour5 http://tortuga.patatakia.tk"
#ironstart ""$CODEorg"13/puzzle/1 http://192.168.1.200/ΔΕΥΤΕΡΑ-ΣΤ1--hour6 http://tortuga.patatakia.tk"

# following opens many tabs (note the double quotes "")
#. iron_flash_puppy_pepper_sda1.sh ""$CODEorg"8/puzzle/1 https://studio.code.org/s/course1"

#ZOGRAFIKI
#. /usr/local/bin/tuxpaint-with-conf.sh

#next blocky http://192.168.1.200/gamesedu/blockly-games/el/index.html

############ LIGHTBOT #######################
#lightbot select http://192.168.1.200/gamesedu/lightbot_haan/select.php  
#--
#INTRO class A,B,C : ironstart "http://192.168.1.200/gamesedu/lightbot_haan/index.php?map=maps_easy.txt http://192.168.1.200/swf/pack_A02.html --incognito"
#lightbot_iron_browser "maps_easy.txt http://192.168.1.200/swf/pack_A02.html"
#--
#INTRO d-st : ironstart "
#http://192.168.1.200/gamesedu/lightbot_haan/index.php?map=maps_random_2%284x4_3lights%29.txt http://192.168.1.200/swf/pack_A02.html --incognito" 
#lightbot_iron_browser "maps_random_2%284x4_3lights%29.txt http://192.168.1.200/swf/pack_A02.html"
#--
#NORMAL GAME (bigger classes) ironstart "http://192.168.1.200/gamesedu/lightbot_haan/ http://192.168.1.200/swf/pack_A02.html --incognito"
#--
#ironstart "http://192.168.1.200/gamesedu/lightbot_haan/index.php?map=maps_d1.txt http://192.168.1.200/swf/pack_A02.html --incognito"
#lightbot_iron_browser "maps_d1.txt http://192.168.1.200/swf/pack_A02.html"


if [ $DAYOFWEEK == 'Δευτέρα' ] 
then
echo "Δευτέρα"
fi

if [ $DAYOFWEEK == 'Τρίτη' ] 
then
echo "Τρίτη"
fi

if [ $DAYOFWEEK == 'Τετάρτη' ] 
then
echo "Τετάρτη"
fi

if [ $DAYOFWEEK == 'Πέμπτη' ] 
then
echo "Πέμπτη"
fi

if [ $DAYOFWEEK == 'Παρασκευή' ] 
then
echo "Παρασκευή"
fi

