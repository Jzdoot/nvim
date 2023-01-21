#!/bin/bash
declare -a options=(
"after/plugin/*"
"ftplugin/*"
"lua/jzdoot/*"
)

find ${options[@]} | cat | wc -l
