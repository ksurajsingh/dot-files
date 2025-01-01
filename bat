#!/bin/bash

# battery status
getbatstat(){
  bat=$(termux-battery-status | jq '.percentage' )
  stat=$(termux-battery-status | jq -r '.status' )
}

# location status
getloc(){
  latitude=$(termux-location | jq '.latitude')
  longitude=$(termux-location | jq '.longitude')
  altitude=$(termux-location | jq '.altitude')
  speed=$(termux-location | jq '.speed')
}


# fam numbers
numbers=("9985369781" "7996070950" )

while true; do
  echo -e "\n running . . . . \n" 
  getbatstat
  # when less than 10 %
  while  [ "$bat" -lt 10  ]; do
    echo -e "\n\n !!! * * * LESS THAN 10% * * * !!!\n\n"

    # when phone is not plugged in
    while  [ $stat == "DISCHARGING" ] ; do 
      echo -e "\n \n * * * Discharging * * *\n\n"

      for number in "${numbers[@]}"; do
        echo "sending to "$number""

        # fetch values
        echo -e "\n fetching location"
        getloc 
        echo -e "\nlocation fetched \n fetching battery status "
        getbatstat

        msg=$(echo -e "my battery is at $bat,\n\nMy location -\n\nLongitude: $longitude \nLatitude: $latitude \nHeight= $altitude \nSpeed= $speed") 
       
        echo -e "\n\nthis is the msg: $msg \n\n\n"

        termux-sms-send -n "$number" $msg 

        # acknowledgement
        echo -e "\n msg sent successfully! to "$number" \n\n "
      done

      # wait for 4 minutes so that you don't spam again
      sleep 240

    done 

    echo -e "\n\n* * * Plugged in * * *\n\n"
    # wait for 5 minutes before checking if the phone is discharging again
    sleep 300

  done

  echo -e "* * * more than 10% * * *"
  # wait for 5 minutes before checking if battery has discharged below 10 
  sleep 300
  echo -e "\n\n Running . . . \n\n"

done
