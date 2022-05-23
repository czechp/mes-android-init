#!/usr/bin/bash

echo "Script to clearing MES Tablet"

remove_package_list=( "com.samsung.android.app.notes"
	"com.google.android.videos"
	"com.android.chrome"
	"com.google.android.gm"
	"com.sec.android.app.popupcalculator"
	"com.samsung.android.calendar"
	"com.sec.android.app.sbrowser"
	"com.samsung.android.app.contacts"
	"com.sec.android.app.samsungapps"
	"com.android.vending"
	"com.sec.android.app.myfiles"
	"com.sec.android.gallery3d"
	"com.sec.android.app.camera"
	"com.netflix.mediaclient"
	"com.sec.android.daemonapp"
	"com.android.phone"
	"com.samsung.android.dialer"
	"com.samsung.android.messaging"
	"com.samsung.android.game.gos"
	"com.samsung.android.game.gamehome"
	"com.sec.android.app.clockpackage"
	"com.google.android.youtube"
	"com.google.android.apps.youtube.music"
	"com.spotify.music"
	"com.google.android.apps.tachyon"
	"com.google.android.apps.docs"
	"com.google.android.googlequicksearchbox"
	"com.google.android.apps.maps"
	"com.google.android.apps.photos"
	"com.sec.android.app.voicenote"
	"com.samsung.android.galaxy"
	"com.samsung.android.galaxycontinuity"
	"com.samsung.android.voc"
	"com.microsoft.office.officehubrow"
	"com.microsoft.skydrive"
	"com.microsoft.office.outlook"
 )

user_id=1000

function read_user_id(){
	adb shell pm list users
	read -p "Type user id: " user_id
}

function uninstall_info(){
	 echo "Uninstall package:  ${1}"
}

function separator(){
	echo "========================================================="
}

function uninstall_package(){
	uninstall_info $1
	adb shell pm uninstall -k --user $user_id $1
	separator
}

function clearing_finished(){
	echo "Tablet cleared ..."
	read -p "Press any key to continue ..."
	clear
}

function install_mes_app(){
	echo "Installing MES app ..."
	adb install MES.apk
	echo "MES app installed"
}

read_user_id

for i in "${remove_package_list[@]}"
do
	uninstall_package $i
done


install_mes_app

clearing_finished
