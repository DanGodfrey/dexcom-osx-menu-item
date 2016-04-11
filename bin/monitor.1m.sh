#!/bin/bash
# <bitbar.title>Blood Sugar</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>Dan Godfrey</bitbar.author>
# <bitbar.author.github>DanGodfrey</bitbar.author.github>
# <bitbar.desc>Stuff</bitbar.desc>
# <bitbar.image>http://i.imgur.com/lF8Qdpk.png</bitbar.image>
# <bitbar.dependencies>bash</bitbar.dependencies>
# <bitbar.abouturl>localhost</bitbar.abouturl>

# constants
UP="⬆";
DOWN="⬇";
DBL_UP="⬆⬆";
DBL_DOWN="⬇⬇";
ANGLE_UP="↖";
ANGLE_DOWN="↘";
FLAT="⬅";
UNKNOWN="❓";

# env config
export PATH='/Users/dan/.rbenv/shims:/Users/dan/.rbenv/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin'
cd /workspace/dexcom-osx-menu-item/

# fetch glucose and convert to mmol/L
american_glucose=$(openaps use my_comm iter_glucose 1 | jq '.[0].glucose');
proper_glucose=$(echo "scale=2; $american_glucose/18" | bc)

# fetch trend and map to emoji
trend=$(openaps use my_comm iter_glucose 1 | jq '.[0].trend_arrow');
if [ $trend = '"FLAT"' ]; then
  trend_icon=$FLAT;
  color='green';
elif [ $trend = '"45_UP"' ]; then
  trend_icon=$ANGLE_UP;
  color='orange';
elif [ $trend = '"45_DOWN"' ]; then
  trend_icon=$ANGLE_DOWN;
  color='orange';
elif [ $trend = '"SINGLE_UP"' ]; then
  trend_icon=$UP;
  color='red';
elif [ $trend = '"SINGLE_DOWN"' ]; then
  trend_icon=$DOWN;
  color='red';
elif [ $trend = '"DOUBLE_UP"' ]; then
  trend_icon=$DBL_UP;
  color='red';
elif [ $trend = '"DOUBLE_DOWN"' ]; then
  trend_icon=$DBL_DOWN;
  color='red';
else
  trend_icon=$UNKNOWN;
fi

if [ $trend_icon = "❓" ]; then
  echo 'CGM Disconnected';
else
  echo $trend_icon' '$proper_glucose' mmol/L | color='$color;
fi
