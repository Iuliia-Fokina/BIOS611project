#!/bin/bash

docker build . -t 611

docker run -v $(pwd):/home/rstudio/work -p 8787:8787 -e PASSWORD=abcd -it 611