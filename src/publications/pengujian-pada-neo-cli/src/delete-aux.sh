#!/bin/bash
find . -regextype posix-egrep -regex ".*\.(log|toc|aux|bbl|blg|lof|lot|out|bcf)$" -type f -delete
