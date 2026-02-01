#!/bin/bash
set -e
# mkdir
mkdir -p "icons/_nanomaps"
# TG maps
tools/nanomap_renderer/nanomap-renderer minimap -w 2040 -h 2040 "./_maps/map_files/Deltastation/DeltaStation2.dmm"
tools/nanomap_renderer/nanomap-renderer minimap -w 2040 -h 2040 "./_maps/map_files/IceBoxStation/IceBoxStation.dmm"
tools/nanomap_renderer/nanomap-renderer minimap -w 2040 -h 2040 "./_maps/map_files/MetaStation/MetaStation.dmm"
tools/nanomap_renderer/nanomap-renderer minimap -w 2040 -h 2040 "./_maps/map_files/tramstation/tramstation.dmm"
tools/nanomap_renderer/nanomap-renderer minimap -w 2040 -h 2040 "./_maps/map_files/Mining/Lavaland.dmm"
# Nova-related maps
tools/nanomap_renderer/nanomap-renderer minimap -w 2040 -h 2040 "./_maps/map_files/CatwalkStation/CatwalkStation_2023.dmm"
tools/nanomap_renderer/nanomap-renderer minimap -w 2040 -h 2040 "./_maps/map_files/NebulaStation/NebulaStation.dmm"
tools/nanomap_renderer/nanomap-renderer minimap -w 2040 -h 2040 "./_maps/map_files/NSVBlueshift/Blueshift.dmm"
tools/nanomap_renderer/nanomap-renderer minimap -w 2040 -h 2040 "./_maps/map_files/Ouroboros/Ouroboros.dmm"
tools/nanomap_renderer/nanomap-renderer minimap -w 2040 -h 2040 "./_maps/map_files/SerenityStation/SerenityStation.dmm"
tools/nanomap_renderer/nanomap-renderer minimap -w 2040 -h 2040 "./_maps/map_files/Snowglobe/snowglobe.dmm"
tools/nanomap_renderer/nanomap-renderer minimap -w 2040 -h 2040 "./_maps/map_files/VoidRaptor/VoidRaptor.dmm"
tools/nanomap_renderer/nanomap-renderer minimap -w 2040 -h 2040 "./_maps/map_files/wawastation/wawastation.dmm"
# Modular Centcom
tools/nanomap_renderer/nanomap-renderer minimap -w 2040 -h 2040 "./_maps/map_files/generic/CentCom_interlink_1984.dmm"
tools/nanomap_renderer/nanomap-renderer minimap -w 2040 -h 2040 "./_maps/map_files/generic/CentCom_1984.dmm"
# Move and rename files so the game understands them (filename => map name in _maps .json files, in case they different)
# TG-related (stage 1)
cd "data/nanomaps"
# echo "At..."
# pwd
# echo "Files:"
# ls
mv "DeltaStation2_nanomap_z1.png" "Delta Station_nanomap_z1.png"
mv "IceBoxStation_nanomap_z1.png" "Ice Box Station_nanomap_z1.png"
mv "IceBoxStation_nanomap_z2.png" "Ice Box Station_nanomap_z2.png"
mv "IceBoxStation_nanomap_z3.png" "Ice Box Station_nanomap_z3.png"
mv "tramstation_nanomap_z1.png" "Tramstation_nanomap_z1.png"
mv "tramstation_nanomap_z2.png" "Tramstation_nanomap_z2.png"
# Nova-related (stage 1)
mv "CatwalkStation_2023_nanomap_z1.png" "Catwalk Station_nanomap_z1.png"
mv "CatwalkStation_2023_nanomap_z2.png" "Catwalk Station_nanomap_z2.png"
mv "snowglobe_nanomap_z1.png" "Snowglobe Station_nanomap_z1.png"
mv "snowglobe_nanomap_z2.png" "Snowglobe Station_nanomap_z2.png"
mv "snowglobe_nanomap_z3.png" "Snowglobe Station_nanomap_z3.png"
mv "VoidRaptor_nanomap_z1.png" "Void Raptor_nanomap_z1.png"
mv "wawastation_nanomap_z1.png" "Wawastation_nanomap_z1.png"
mv "wawastation_nanomap_z2.png" "Wawastation_nanomap_z2.png"
# Modular Centcom (stage 1)
mv "CentCom_interlink_1984_nanomap_z1.png" "The Interlink_nanomap_z1.png"
mv "CentCom_1984_nanomap_z1.png" "Fore CentCom Dock_nanomap_z1.png"
# TG-related (stage 2)
cd "../../"
# echo "Moving to..."
# pwd
cp "data/nanomaps/Delta Station_nanomap_z1.png" "icons/_nanomaps"
cp "data/nanomaps/Ice Box Station_nanomap_z1.png" "icons/_nanomaps"
cp "data/nanomaps/Ice Box Station_nanomap_z2.png" "icons/_nanomaps"
cp "data/nanomaps/Ice Box Station_nanomap_z3.png" "icons/_nanomaps"
cp "data/nanomaps/MetaStation_nanomap_z1.png" "icons/_nanomaps"
cp "data/nanomaps/Tramstation_nanomap_z1.png" "icons/_nanomaps"
cp "data/nanomaps/Tramstation_nanomap_z2.png" "icons/_nanomaps"
cp "data/nanomaps/Lavaland_nanomap_z1.png" "icons/_nanomaps"
# Nova-related (stage 2)
cp "data/nanomaps/Catwalk Station_nanomap_z1.png" "icons/_nanomaps"
cp "data/nanomaps/Catwalk Station_nanomap_z2.png" "icons/_nanomaps"
cp "data/nanomaps/Snowglobe Station_nanomap_z1.png" "icons/_nanomaps"
cp "data/nanomaps/Snowglobe Station_nanomap_z2.png" "icons/_nanomaps"
cp "data/nanomaps/Snowglobe Station_nanomap_z3.png" "icons/_nanomaps"
cp "data/nanomaps/Void Raptor_nanomap_z1.png" "icons/_nanomaps"
cp "data/nanomaps/Wawastation_nanomap_z1.png" "icons/_nanomaps"
cp "data/nanomaps/Wawastation_nanomap_z2.png" "icons/_nanomaps"
# Modular Centcom (stage 2)
cp "data/nanomaps/The Interlink_nanomap_z1.png" "icons/_nanomaps"
cp "data/nanomaps/Fore CentCom Dock_nanomap_z1.png" "icons/_nanomaps"
# # Debug stuff
# cd "icons/_nanomaps"
# echo "At..."
# pwd
# echo "Files:"
# ls
# cd "../../" # jump back
