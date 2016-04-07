#!/bin/bash
#konvertiere alle jpgs in Ordner zu FullHD film mit 10fps
ffmpeg -f image2 -i "%05d.JPG" -b:v 15M -pix_fmt yuv420p -filter:v "scale=iw*min(1920/iw\,1080/ih):ih*min(1920/iw\,1080/ih), pad=1920:1080:(1920-iw*min(1920/iw\,1080/ih))/2:(1080-ih*min(1920/iw\,1080/ih))/2, setpts=(1/0.4)*PTS" output-10fps.mov