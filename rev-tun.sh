#!/bin/bash
FORWARD_PORT=19581

host moto.delporto.com | grep '10.1.2' > /dev/null
if [ $? -ne 0 ]; then
  external=0
else
  external=1
fi

if [ ${external} == 0 ]; then
  ## external
  ssh -i ~/.ssh/id_rsa_tun -N -R 127.0.0.1:${FORWARD_PORT}:127.0.0.1:22 -p 5149 pi@moto.delporto.com
else
  ## internal
  ssh -i ~/.ssh/id_rsa_tun -N -R 127.0.0.1:${FORWARD_PORT}:127.0.0.1:22  pi@moto.delporto.com
fi


