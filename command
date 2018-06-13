 for i in `seq 151 241`; do ping -c 1 10.3.160.$i |grep 64\ bytes 2> /dev/null & done &
