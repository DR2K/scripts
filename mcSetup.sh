#!/bin/zsh

#  mcSetup.sh
#  Scripts
#  Created by Devdeep Singh Rajpal on 8/9/20.
#  
mkdir minecraft_files
cd minecraft_files
curl -fsSLo fabric.jar "https://maven.fabricmc.net/net/fabricmc/fabric-installer/0.6.1.45/fabric-installer-0.6.1.45.jar"
read -n 1 -s -r -p "Install Fabric for Client, and just hit install. \n Press any key to continue"
java -jar fabric.jar
while [! -d "$USER/Library/Application\ Support/minecraft/mods"]
do
    read -n 1 -s -r -p "Run the new minecraft profile in your launcher \n Press any key to continue"
done
cd "$USER/Library/Application\ Support/minecraft/mods"
curl -fsSLo retino.jar
curl -fsSLo appleskin.jar
curl -fsSLo connected-block-textures.jar
curl -fsSLo fabric-api.jar
curl -fsSLo lamb-dynamiclights.jar
curl -fsSLo logical-zoom.jar
curl -fsSLo modmenu.jar
curl -fsSLo lithum.jar
curl -fsSLo voyager.jar

echo "Done!"
    read -n 1 -s -r -p "Press any key to continue"
exit;
