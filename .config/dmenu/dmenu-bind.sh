#!/bin/bash
exe=`dmenu_path | dmenu -b -nb '#0E8D84' -nf '#E69017' -sb '#E63E17' -sf '#275855'` && eval "exec $exe"
