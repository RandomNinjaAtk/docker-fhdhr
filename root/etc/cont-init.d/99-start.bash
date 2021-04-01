#!/usr/bin/with-contenv bash
echo "------------------------------------------------------------"
echo "|~) _ ._  _| _ ._ _ |\ |o._  o _ |~|_|_| "
echo "|~\(_|| |(_|(_)| | || \||| |_|(_||~| | |<"
echo "Presenets: fhdhr"
echo "------------------------------------------------------------"
echo "Sponsor: https://github.com/sponsors/RandomNinjaAtk"
echo "Project: https://github.com/RandomNinjaAtk/docker-fhdhr"
echo "Support: https://discord.gg/JumQXDc"
echo "------------------------------------------------------------"

echo "Starting fHDHR..."
python3 /config/fHDHR/main.py -c=/config/config.ini

exit $?
