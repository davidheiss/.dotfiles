#/bin/bash

hour=$(date +%I)

if [ $hour -eq 1 ]; then
    icon=""
elif [ $hour -eq 2 ]; then
    icon=""
elif [ $hour -eq 3 ]; then
    icon=""
elif [ $hour -eq 4 ]; then
    icon=""
elif [ $hour -eq 5 ]; then
    icon=""
elif [ $hour -eq 6 ]; then
    icon=""
elif [ $hour -eq 7 ]; then
    icon=""
elif [ $hour -eq 8 ]; then
    icon=""
elif [ $hour -eq 9 ]; then
    icon=""
elif [ $hour -eq 10 ]; then
    icon=""
elif [ $hour -eq 11 ]; then
    icon=""
elif [ $hour -eq 12 ]; then
    icon=""
fi

date "+{
    \"icon\": \"${icon}\",
    \"weekday\": {
        \"abbreviated\": \"%a\",
        \"full\": \"%A\"
    },
    \"month_text\": {
        \"abbreviated\": \"%b\",
        \"full\": \"%B\"
    },
    \"local\": \"%c\",
    \"century\": %C,
    \"day_of_month\": %d,
    \"date\": {
        \"short\": \"%D\",
        \"full\": \"%F\",
        \"local\": \"%x\"
    },
    \"day_of_month_padded\": \"%e\",
    \"year\": {
        \"iso\": {
            \"short\": %g,
            \"full\": %G
        },
        \"short\": %y,
        \"full\": %Y
    },
    \"hour\": {
        \"half\": \"%I\",
        \"half_padded\": \"%k\",
        \"full\": \"%H\",
        \"full_padded\": \"%l\"
    },
    \"day_of_year\": %j,
    \"month\": %m,
    \"minute\": %M,
    \"nanoseconds\": %N,
    \"quarter\": %q,
    \"time\": {
        \"half\": \"%r\",
        \"short\": \"%R\",
        \"long\": \"%T\",
        \"local\": \"%X\",
        \"ampm\": \"%p\",
        \"ampm_lower\": \"%P\"
    },
    \"epoch\": %s,
    \"seconds\": %S,
    \"day_of_week\": %w,
    \"week_number_of_year\": %W,
    \"time_zone\": {
        \"numeric\": [\"%z\", \"%:z\", \"%::z\", \"%:::z\"],
        \"alphabetic\": \"%Z\"
    }
}" | jq -rcM