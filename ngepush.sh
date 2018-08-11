#!/bin/bash

#cp -r ../BMKG-SULSEL/* .
cp -r ../../transmet/Code/Maps_files .
cp -r ../../transmet/Code/Maps.html .
git status
git add .
git commit -m "BISMILLAH"
git push -f --repo https://bmkg-sulsel:brambang_07@github.com/bmkg-sulsel/bmkg-sulsel.github.io.git
