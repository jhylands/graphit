#!/bin/bash
while true;
do
    in="$(cat /hostpipe/graphpipe)";
    out=$(echo $in| graph-easy --as=ascii);
    echo -e "$in\n$out" >/hostpipe/outpipe;
done
