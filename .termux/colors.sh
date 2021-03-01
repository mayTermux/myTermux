#!/data/data/com.termux/files/usr/bin/bash
DIR=`cd $(dirname $0); pwd`
COLORS_DIR=$DIR/colors
count=0

echo -e "The default color theme is Tango.\nYou can choose another one from the list below";

for colors in "$COLORS_DIR"/*; do
  colors_name[count]=$( echo $colors | awk -F'/' '{print $NF}' )
  echo -e "($count) ${colors_name[count]}";
  count=$(( $count + 1 ));
done;
count=$(( $count - 1 ));

while true; do
  read -p 'Enter a number, leave blank to not to change:' number;
  if [[ -z "$number" ]]; then
    break;
  elif ! [[ $number =~ ^[0-9]+$ ]]; then
    echo "Please enter the right number!";
  elif (( $number>=0 && $number<=$count )); then
    eval choice=${colors_name[number]};
    cp -fr "$COLORS_DIR/$choice" "$DIR/colors.properties";
    break;
  else
    echo "Please enter the right number!";
  fi
done

termux-reload-settings
