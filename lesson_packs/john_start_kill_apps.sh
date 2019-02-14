# kill firefox (if you want )
pkill -f firefox
#ironstart https://studio.code.org/s/course1
#ironstart https://studio.code.org/s/course1/stage/4/puzzle/10
#ironstart https://studio.code.org/s/course1/stage/7/puzzle/10

CODEorg=https://studio.code.org/s/course1/stage/
LANDINGpages="http://192.168.1.200/uploads/landing_pages/"
SWFlocal="http://192.168.1.200/swf/"
SWFpath="http://192.168.1.200/swf/"
SWFgiortes="http://192.168.1.200/swf/swf_giortes/"

OOOKIDS="ooo4kids1.3 -n "
OOOKIDSpathprefix="/opt/lampp/htdocs/askiseis_office/"
RAMKIDpathprefix="http://192.168.1.200/ramkid/"

#date "+%A"   : Δευτέρα , Τρίτη , Τετάρτη , Πέμπτη , Παρασκευή 
# echo $(date -d "+1 days" "+%A")
DAYOFWEEK=$(date "+%A")  



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

#. iron_flash_puppy_pepper_home.sh "--incognito http://192.168.1.200/gamesedu/lightbot_haan/index.php?map=""$1"" NOTE-uses_PHP-must_enable_XAMPP"
. iron_flash_puppy_pepper_home.sh "--incognito http://192.168.1.200/gamesedu/lightbot_haan/index.html?map=""$1"" "

return 5	
}


################  TEST COMMANDS #############
#ironstartincognito ""$RAMKIDpathprefix"KidsPedia/kids_ePedia32cd/Volume13/index_kd_vol.html ΑΠΟΚΡΙΕΣ-ramkidpedia http://192.168.1.200/swf/pack_A02.html"
#lightbot_iron_browser "maps_easy.txt http://192.168.1.200/swf/pack_A02.html"
#ironstart ""$SWFlocal"pack_A01.html "$LANDINGpages"ΠΑΡΑΣΚΕΥΗ-A2--hour2__dim10.html "$SWFlocal"fun/finding-santa__christmas_find_noAdURL_!!.swf"
################# END OF TEST COMMANDS ##########

#. /usr/local/bin/tuxpaint-with-conf.sh
#ironstart ""$SWFlocal"swf_giortes/christmas.html http://192.168.1.200/landing_pages/PEMPTH-ST1--hour3__dim10.html"
#. /usr/local/bin/tuxpaint-with-conf.sh
#ironstart ""$SWFlocal"swf_giortes/christmas.html http://192.168.1.200/landing_pages/PEMPTH-E2--hour6__dim10.html"


#ironstart ""$SWFlocal"swf_giortes/christmas.html http://192.168.1.200/landing_pages/ΤΕΤΑΡΤΗ-Γ2--hour1__dim10.html "$SWFlocal"fun/finding-santa__christmas_find_noAdURL_!!.swf"
# A1
#ironstart ""$SWFlocal"swf_giortes/christmas.html "$LANDINGpages"ΤΕΤΑΡΤΗ-Α1--hour2__dim10.html  "$SWFlocal"fun/finding-santa__christmas_find_noAdURL_!!.swf"


#--------------- SPECIAL EVENTS --------------------------
: '# ΑΠΟΚΡΙΕΣ 1
#"http://192.168.1.200/swf/swf_giortes/other/ramkid_invitation_party/ "
ironstartincognito ""$SWFgiortes"other/ramkid_invitation_party/index.html "$RAMKIDpathprefix"KidsPedia/kids_ePedia32cd/Volume13/index_kd_vol.html ΑΠΟΚΡΙΕΣ-ramkidpedia "$SWFpath"swf_ramkid_cds2k5/Ramkid_12feb_apokries/ "$SWFpath"pack_A02.html"
ironstartincognito ""$SWFgiortes"other/ramkid_invitation_party/index.html "$RAMKIDpathprefix"KidsPedia/kids_ePedia32cd/Volume13/index_kd_vol.html ΑΠΟΚΡΙΕΣ-ramkidpedia "$SWFpath"swf_ramkid_cds2k5/Ramkid_12feb_apokries/ "$SWFpath"pack_A02.html"
ironstartincognito ""$SWFgiortes"other/ramkid_invitation_party/index.html "$RAMKIDpathprefix"KidsPedia/kids_ePedia32cd/Volume13/index_kd_vol.html ΑΠΟΚΡΙΕΣ-ramkidpedia "$SWFpath"swf_ramkid_cds2k5/Ramkid_12feb_apokries/ "$SWFpath"pack_A02.html"
ironstartincognito ""$SWFgiortes"other/ramkid_invitation_party/index.html "$RAMKIDpathprefix"KidsPedia/kids_ePedia32cd/Volume13/index_kd_vol.html ΑΠΟΚΡΙΕΣ-ramkidpedia "$SWFpath"swf_ramkid_cds2k5/Ramkid_12feb_apokries/ "$SWFpath"pack_A02.html"
ironstartincognito ""$SWFgiortes"other/ramkid_invitation_party/index.html "$RAMKIDpathprefix"KidsPedia/kids_ePedia32cd/Volume13/index_kd_vol.html ΑΠΟΚΡΙΕΣ-ramkidpedia "$SWFpath"swf_ramkid_cds2k5/Ramkid_12feb_apokries/ "$SWFpath"pack_A02.html"
# ΑΠΟΚΡΙΕΣ 1 '

: '# ΑΠΟΚΡΙΕΣ 2
ironstartincognito ""$SWFgiortes"index_halloween.html?timer3" &
. /usr/local/bin/tuxpaint-with-conf.sh &
wait
ironstartincognito ""$SWFgiortes"index_halloween.html?timer3" &
. /usr/local/bin/tuxpaint-with-conf.sh &
wait
ironstartincognito ""$SWFgiortes"index_halloween.html?timer3" &
. /usr/local/bin/tuxpaint-with-conf.sh &
wait
ironstartincognito ""$SWFgiortes"index_halloween.html?timer3" &
. /usr/local/bin/tuxpaint-with-conf.sh &
wait
ironstartincognito ""$SWFgiortes"index_halloween.html?timer3" &
. /usr/local/bin/tuxpaint-with-conf.sh &
wait
# ΑΠΟΚΡΙΕΣ 2 '

: '# ΑΠΟΚΡΙΕΣ 3
ironstartincognito ""$SWFgiortes"index_halloween.html"
ironstartincognito ""$SWFgiortes"index_halloween.html"
ironstartincognito ""$SWFgiortes"index_halloween.html"
ironstartincognito ""$SWFgiortes"index_halloween.html"
ironstartincognito ""$SWFgiortes"index_halloween.html"
# ΑΠΟΚΡΙΕΣ 3'




if [ $DAYOFWEEK == 'Τετάρτη' ] || [ $DAYOFWEEK == 'Wednesday' ]
then
echo "Τετάρτη"
#: '# ΤΕΤΑΡΤΗ

#: '#ΤΕΤΑΡΤΗ 10ο ΔΗΜ
#---------------------------- Γ2--hour1-----------
#$OOOKIDS
#oookidsopen "OFFICE_extra_files/pliktrologisi_j01.1_antigrafi_stratigiki_ekmathisis.doc"
#ironstart ""$CODEorg"10/puzzle/1 http://192.168.1.200/landing_pages/ΤΕΤΑΡΤΗ-Γ2--hour1__dim10.html "$SWFlocal"fun/finding-santa__christmas_find_noAdURL_!!.swf"
lightbot_iron_browser "maps_easy.txt "$SWFpath"pack_A02.html"
#---------------------------- A1-----------
ironstart ""$SWFlocal"pack_A03.html "$LANDINGpage"15-ΤΡΙΤΗ-A--hour2.html http://ts.sch.gr/repo/online-packages/dim-glossa-a-b/start.html "$SWFlocal"pack_A01.html"
#ironstart ""$SWFlocal"ab/funbrain_com/funbrain.html "$LANDINGpages"ΠΑΡΑΣΚΕΥΗ-A2--hour2__dim10.html "$SWFlocal"pack_A01.html"
#ironstart ""$SWFlocal"pack_A02.html http://192.168.1.200/landing_pages/ΤΕΤΑΡΤΗ-Α1--hour2__dim10.html"
#/opt/eduActiv8/eduActiv8
#ΤΕΤΑΡΤΗ 10ο ΔΗΜ '

fi

if [ $DAYOFWEEK == 'Πέμπτη' ] || [ $DAYOFWEEK == 'Thursday' ]
then
#: '#ΠΕΜΠΤΗ 10ο ΔΗΜ
#---------------------------- Δ2--hour1-----------
lightbot_iron_browser "maps_easy.txt "$SWFpath"pack_A02.html"
#ironstart ""$CODEorg"16/puzzle/1 "$LANDINGpages"ΠΕΜΠΤΗ-Δ2--hour1__dim10.html "$SWFlocal"fun/finding-santa__christmas_find_noAdURL_!!.swf"
#oookidsopen "OFFICE_extra_files/pliktrologisi_j01.1_antigrafi_stratigiki_ekmathisis.doc"
#---------------------------- Γ1
lightbot_iron_browser "maps_easy.txt "$SWFpath"pack_A02.html"
#ironstart ""$CODEorg"16/puzzle/1 "$LANDINGpages"ΠΕΜΠΤΗ-Γ1--hour2__dim10.html "$SWFlocal"fun/finding-santa__christmas_find_noAdURL_!!.swf"
#oookidsopen "OFFICE_extra_files/pliktrologisi_j01.1_antigrafi_stratigiki_ekmathisis.doc"
#---------------------------- ΣΤ1--hour3-----------
lightbot_iron_browser "maps_random_2%284x4_3lights%29.txt "$SWFpath"pack_A02.html"
#ironstart ""$CODEorg"14/puzzle/6 "$LANDINGpages"ΠΕΜΠΤΗ-ΣΤ1--hour3__dim10.html "$SWFlocal"fun/finding-santa__christmas_find_noAdURL_!!.swf"
#oookidsopen "OFFICE_extra_files/pliktrologisi_j01.1_antigrafi_stratigiki_ekmathisis.doc"
#---------------------------- Δ1--hour5-----------
lightbot_iron_browser "maps_easy.txt "$SWFpath"pack_A02.html"
#ironstart ""$CODEorg"13/puzzle/8 "$LANDINGpages"ΠΕΜΠΤΗ-Δ1--hour5__dim10.html "$SWFlocal"fun/finding-santa__christmas_find_noAdURL_!!.swf"
#oookidsopen "OFFICE_extra_files/pliktrologisi_j01.1_antigrafi_stratigiki_ekmathisis.doc"
#---------------------------- Ε2--hour6-----------
lightbot_iron_browser "maps_easy.txt "$SWFpath"pack_A02.html"
#ironstart ""$CODEorg"13/puzzle/10 "$LANDINGpages"ΠΕΜΠΤΗ-Ε2--hour6__dim10.html "$SWFlocal"fun/finding-santa__christmas_find_noAdURL_!!.swf"
#oookidsopen "OFFICE_extra_files/pliktrologisi_j02.1_antigrafi_katanomi_wron.doc"
 #ΠΕΜΠΤΗ 10ο ΔΗΜ ' 

fi

if [ $DAYOFWEEK == 'Παρασκευή' ] || [ $DAYOFWEEK == 'Friday' ]
then
#: '#ΠΑΡΑΣΚΕΥΗ 10ο ΔΗΜ
# -----------A2--hour2# -----------
ironstart ""$SWFlocal"pack_A03.html "$LANDINGpage"ΠΑΡΑΣΚΕΥΗ-A2--hour2__dim10.html http://ts.sch.gr/repo/online-packages/dim-glossa-a-b/start.html "$SWFlocal"pack_A01.html"
#ironstart ""$SWFlocal"ab/funbrain_com/funbrain.html "$LANDINGpages"ΠΑΡΑΣΚΕΥΗ-A2--hour2__dim10.html "$SWFlocal"pack_A01.html"
#/opt/eduActiv8/eduActiv8
#"$LANDINGpages"ΠΑΡΑΣΚΕΥΗ-A2--hour2__dim10.html  "$SWFlocal"fun/maze/Kaban_agriogourouno_maze_ok_more_time!!.swf"
#  -----------ΣΤ2--hour# -----------
lightbot_iron_browser "maps_easy.txt "$SWFpath"pack_A02.html"
#oookidsopen "OFFICE_extra_files/pliktrologisi_j01.1_antigrafi_stratigiki_ekmathisis.doc"
#ironstart ""$CODEorg"13/puzzle/1 "$LANDINGpages"ΠΑΡΑΣΚΕΥΗ-ΣΤ2--hour3__dim10.html tortuga.dimotiko.tk "$SWFlocal"fun/finding-santa__christmas_find_noAdURL_!!.swf"
# -----------Ε1--hour5-----------
lightbot_iron_browser "maps_easy.txt "$SWFpath"pack_A02.html"
#oookidsopen "OFFICE_extra_files/pliktrologisi_j02.1_antigrafi_katanomi_wron.doc"
#ironstart ""$CODEorg"13/puzzle/1 "$LANDINGpages"ΠΑΡΑΣΚΕΥΗ-Ε1--hour5__dim10.html tortuga.dimotiko.tk "$SWFlocal"fun/finding-santa__christmas_find_noAdURL_!!.swf"
# -----------Β--hour6-----------
#/opt/eduActiv8/eduActiv8
ironstart ""$SWFlocal"pack_A03.html "$LANDINGpage"ΠΑΡΑΣΚΕΥΗ-Β--hour6__dim10.html http://ts.sch.gr/repo/online-packages/dim-glossa-a-b/start.html "$SWFlocal"pack_A01.html"
#ironstart ""$SWFlocal"pack_A01.html "$LANDINGpages"ΠΑΡΑΣΚΕΥΗ-Β--hour6__dim10.html "$SWFlocal"ab/funbrain_com/funbrain.html"
#ΠΑΡΑΣΚΕΥΗ 10ο ΔΗΜ'
fi



if [ $DAYOFWEEK == 'Δευτέρα' ] || [ $DAYOFWEEK == 'Monday' ]
then
echo "Δευτέρα 15o"
: '# ΔΕΥΤΕΡΑ
#---------------------------- Γ1
#. iron_flash_puppy_pepper_home.sh $CODEORGcourse1"14/puzzle/5 "$LANDINGpage"15-ΔΕΥΤΕΡΑ-Γ1--hour3.html "$SWFlocal"fun/frogger3d.swf"
#oookidsopen "OFFICE_extra_files/pliktrologisi_j02.1_antigrafi_katanomi_wron.doc"
lightbot_iron_browser "maps_d1.txt http://192.168.1.200/swf/pack_A02.html"
#. iron_flash_puppy_pepper_home.sh "http://192.168.1.200/gamesedu/lightbot_haan/index.php?map=maps_easy.txt http://192.168.1.200/swf/pack_A02.html --incognito"
#---------------------------- Γ2
#ironstart $CODEORGcourse1"14/puzzle/6 "$LANDINGpage"15-ΔΕΥΤΕΡΑ-Γ2--hour4.html "$SWFlocal"fun/frogger3d.swf"
#oookidsopen "OFFICE_extra_files/pliktrologisi_j02.1_antigrafi_katanomi_wron.doc"
lightbot_iron_browser "maps_d1.txt http://192.168.1.200/swf/pack_A02.html"
#. iron_flash_puppy_pepper_home.sh "http://192.168.1.200/gamesedu/lightbot_haan/index.php?map=maps_easy.txt http://192.168.1.200/swf/pack_A02.html --incognito"
#---------------------------- ΣΤ2
#ironstart $CODEORGcourse1"14/puzzle/6 "$LANDINGpage"15-ΔΕΥΤΕΡΑ-ΣΤ2--hour5.html "$SWFlocal"fun/frogger3d.swf"
#oookidsopen "OFFICE_extra_files/pliktrologisi_j02.1_antigrafi_katanomi_wron.doc"
lightbot_iron_browser "maps_easy.txt http://192.168.1.200/swf/pack_A02.html"
#. iron_flash_puppy_pepper_home.sh "--incognito http://192.168.1.200/gamesedu/lightbot_haan/index.php?map=maps_random_2%284x4_3lights%29.txt http://192.168.1.200/swf/pack_A02.html"
#---------------------------- ΣΤ1
#ironstart $CODEORGcourse1"14/puzzle/6 "$LANDINGpage"15-ΔΕΥΤΕΡΑ-ΣΤ1--hour6.html "$SWFlocal"fun/frogger3d.swf"
#oookidsopen "OFFICE_extra_files/pliktrologisi_j02.1_antigrafi_katanomi_wron.doc"
lightbot_iron_browser "maps_easy.txt http://192.168.1.200/swf/pack_A02.html"
#. iron_flash_puppy_pepper_home.sh "--incognito http://192.168.1.200/gamesedu/lightbot_haan/index.php?map=maps_random_2%284x4_3lights%29.txt http://192.168.1.200/swf/pack_A02.html"
# ΔΕΥΤΕΡΑ '

fi

if [ $DAYOFWEEK == 'Τρίτη' ] || [ $DAYOFWEEK == 'Tuesday' ]
then
echo "Τρίτη 15o"
: '# ΤΡΙΤΗ
#----------------------------Δ2
#oookidsopen "OFFICE_extra_files/pliktrologisi_j02.1_antigrafi_katanomi_wron.doc"
#ironstart $CODEORGcourse1"13/puzzle/8 "$LANDINGpage"15-ΤΡΙΤΗ-Δ2--hour1.html "$SWFlocal"fun/frogger3d.swf"
#. iron_flash_puppy_pepper_home.sh ""$SWFlocal"fun/frogger3d.swf "$LANDINGpage"15-ΤΡΙΤΗ-Δ2--hour1.html  http://tortuga.dimotiko.tk"
lightbot_iron_browser "maps_random_2%284x4_3lights%29.txt http://192.168.1.200/swf/pack_A02.html"

#----------------------------A ταξη
#ironstart "http://192.168.1.200/gamesedu/faces-guess-who-gr/faces.html  , http://192.168.1.200/gamesedu/blockly-games/el/index.html"
#ironstart http://192.168.1.200/swf/fun/maze/mouse_maze_game_play_10_1_!!.swf "$LANDINGpage"15-ΤΡΙΤΗ-A--hour2.html http://tortuga.dimotiko.tk"
#ironstart ""$SWFlocal"ab/coloring-inside-out__noADsURL.swf "$LANDINGpage"15-ΤΡΙΤΗ-A--hour2.html "$SWFlocal"ab/coloring_walking_frankie_coloring_page_noAdsUrl_!!.swf"
#/opt/eduActiv8/eduActiv8
##ironstart ""$SWFlocal"pack_A01.html "$LANDINGpage"15-ΤΡΙΤΗ-A--hour2.html http://ts.sch.gr/repo/online-packages/dim-glossa-a-b/start.html "$SWFlocal"pack_A01.html"

#----------------------------Ε1
#oookidsopen "OFFICE_extra_files/pliktrologisi_j02.1_antigrafi_katanomi_wron.doc"
lightbot_iron_browser "maps_random_2%284x4_3lights%29.txt http://192.168.1.200/swf/pack_A02.html"
#. iron_flash_puppy_pepper_home.sh ""$SWFlocal"fun/frogger3d.swf "$LANDINGpage"15-ΤΡΙΤΗ-Ε1--hour4.html http://tortuga.dimotiko.tk"
#. iron_flash_puppy_pepper_home.sh $CODEORGcourse1"14/puzzle/10 "$LANDINGpage"15-ΤΡΙΤΗ-Ε1--hour4.html "$SWFlocal"fun/frogger3d.swf"

#---------------------------- Δ1
#oookidsopen "OFFICE_extra_files/pliktrologisi_j02.1_antigrafi_katanomi_wron.doc"
lightbot_iron_browser "maps_random_2%284x4_3lights%29.txt http://192.168.1.200/swf/pack_A02.html"
#ironstart ""$SWFlocal"fun/frogger3d.swf "$LANDINGpage"15-ΤΡΙΤΗ-Δ1--hour5.html http://tortuga.dimotiko.tk"
#. iron_flash_puppy_pepper_home.sh $CODEORGcourse1"13/puzzle/1 "$LANDINGpage"15-ΤΡΙΤΗ-Δ1--hour5.html "$SWFlocal"fun/frogger3d.swf"

#----------------------------Ε2
#oookidsopen "OFFICE_extra_files/pliktrologisi_j02.1_antigrafi_katanomi_wron.doc"
lightbot_iron_browser "maps_random_2%284x4_3lights%29.txt http://192.168.1.200/swf/pack_A02.html"
#ironstart ""$SWFlocal"fun/frogger3d.swf "$LANDINGpage"15-ΤΡΙΤΗ-Ε2--hour6.html http://tortuga.dimotiko.tk"
#. iron_flash_puppy_pepper_home.sh $CODEORGcourse1"14/puzzle/1 "$LANDINGpage"15-ΤΡΙΤΗ-Ε2--hour6.html "$SWFlocal"fun/frogger3d.swf"
# ΤΡΙΤΗ'
fi






if [ $DAYOFWEEK == 'Δευτέρα' ] || [ $DAYOFWEEK == 'Monday' ]
then
echo "Δευτέρα"
fi

if [ $DAYOFWEEK == 'Τρίτη' ] || [ $DAYOFWEEK == 'Tuesday' ]
then
echo "Τρίτη"
fi

if [ $DAYOFWEEK == 'Τετάρτη' ] || [ $DAYOFWEEK == 'Wednesday' ]
then
echo "Τετάρτη"
fi

if [ $DAYOFWEEK == 'Πέμπτη' ] || [ $DAYOFWEEK == 'Thursday' ]
then
echo "Πέμπτη"
fi

if [ $DAYOFWEEK == 'Παρασκευή' ] || [ $DAYOFWEEK == 'Friday' ]
then
echo "Παρασκευή"
fi

# following opens many tabs (note the double quotes "")
#. iron_flash_puppy_pepper_sda1.sh $CODEORGcourse1"8/puzzle/1 https://studio.code.org/s/course1"
# lightbot :
#. iron_flash_puppy_pepper_home.sh $GAMESEDU"lightbot_haan/index.php http://192.168.1.200/lightbot_NORMAL_LEVELs --incognito"
#. iron_flash_puppy_pepper_home.sh $GAMESEDU"lightbot_haan/index.php?map=maps_d1.txt http://192.168.1.200/lightbot_NumberEASY_LEVELs --incognito"
#. iron_flash_puppy_pepper_home.sh $GAMESEDU"lightbot_haan/index.php?map=maps_random_1(4x4_3lights).txt http://192.168.1.200/lightbot_maps_random_1(4x4_3lights).txtEASY_LEVELs --incognito"
#. iron_flash_puppy_pepper_home.sh $GAMESEDU"lightbot_haan/index.php?map=maps_random_3(5lights).txt http://192.168.1.200/lightbot_maps_random_3(5lights).txt_moderate_LEVELs --incognito"


# . iron_flash_puppy_pepper_home.sh "http://192.168.1.200/gamesedu/Code-Commander-gr/index_dot_links.html http://192.168.1.200/Code-Commander-gr --incognito"


#christmas :
#. iron_flash_puppy_pepper_home.sh $CODEORGcourse1"14/puzzle/5 "$LANDINGpage"15-ΔΕΥΤΕΡΑ-Γ1--hour3.html "$SWFlocal"fun/finding-santa__christmas_find_noAdURL_!!.swf"

#Office file load (writer)
#$OOOKIDS$OOOKIDSpathprefix"OFFICE_extra_files/pliktrologisi_j02.1_antigrafi_katanomi_wron.doc"


#pack load
#. iron_flash_puppy_pepper_home.sh ""$SWFlocal"pack_A01.html "


# just for christmas :
#. $IRON" "$SWFlocal"swf_giortes/christmas.html"
#. /usr/local/bin/tuxpaint-with-conf.sh
#. /usr/local/bin/tuxpaint-with-conf.sh
#. iron_flash_puppy_pepper_home.sh $SWFlocal"swf_giortes/christmas.html"
#. /usr/local/bin/tuxpaint-with-conf.sh
#. iron_flash_puppy_pepper_home.sh $SWFlocal"swf_giortes/christmas.html"

#. iron_flash_puppy_pepper_home.sh $SWFlocal"swf_giortes/christmas.html "$LANDINGpage"15-ΔΕΥΤΕΡΑ-Γ1--hour3.html "
#. iron_flash_puppy_pepper_home.sh $SWFlocal"swf_giortes/christmas.html "$LANDINGpage"15-ΔΕΥΤΕΡΑ-Γ2--hour4.html "
#. iron_flash_puppy_pepper_home.sh $SWFlocal"swf_giortes/christmas.html "$LANDINGpage"15-ΔΕΥΤΕΡΑ-ΣΤ2--hour5.html "
#. iron_flash_puppy_pepper_home.sh $SWFlocal"swf_giortes/christmas.html "$LANDINGpage"15-ΔΕΥΤΕΡΑ-ΣΤ1--hour6.html "
#$OOOKIDS$OOOKIDSpathprefix"OFFICE_extra_files/pliktrologisi_j02.1_antigrafi_katanomi_wron.doc"
#. iron_flash_puppy_pepper_home.sh ""$SWFlocal"pack_A01.html "


: '# ΠΑΣΧΑ easter
# ΠΑΣΧΑ easter 1
ironstartincognito ""$RAMKIDpathprefix"/KidsPedia/kids_ePedia32cd/Volume20/index_kd_vol.html ΠΑΣΧΑ-ramkidpedia http://192.168.1.200/swf/pack_A02.html"
ironstartincognito ""$RAMKIDpathprefix"/KidsPedia/kids_ePedia32cd/Volume20/index_kd_vol.html ΠΑΣΧΑ-ramkidpedia http://192.168.1.200/swf/pack_A02.html"
ironstartincognito ""$RAMKIDpathprefix"/KidsPedia/kids_ePedia32cd/Volume20/index_kd_vol.html ΠΑΣΧΑ-ramkidpedia http://192.168.1.200/swf/pack_A02.html"
ironstartincognito ""$RAMKIDpathprefix"/KidsPedia/kids_ePedia32cd/Volume20/index_kd_vol.html ΠΑΣΧΑ-ramkidpedia http://192.168.1.200/swf/pack_A02.html"
ironstartincognito ""$RAMKIDpathprefix"/KidsPedia/kids_ePedia32cd/Volume20/index_kd_vol.html ΠΑΣΧΑ-ramkidpedia http://192.168.1.200/swf/pack_A02.html"
# ΠΑΣΧΑ easter 2

# ΠΑΣΧΑ easter 3
#ironstart ""$SWFlocal"swf_giortes/index_easter.html
#ironstart ""$SWFlocal"swf_giortes/index_easter.html
#ironstart ""$SWFlocal"swf_giortes/index_easter.html
#ironstart ""$SWFlocal"swf_giortes/index_easter.html

#ΑΠΟΚΡΙΕΣ'

