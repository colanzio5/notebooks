#!/bin/sh

pip install -r requirements.txt

BUILD_DIRECTORY="/home/ccasazza/code/notebooks/dist"
WEBSITE_NOTEBOOK_ASSET_PATH="/home/ccasazza/code/colincasazza.info/public/notebooks"
CSSHTMLHeaderPreprocessor="solarized-dark"

jupyter nbconvert \
  --to html --template lab \
  --HTMLExporter.theme=dark \
  --ExecutePreprocessor.allow_errors=False \
  --ExecutePreprocessor.timeout=-1 \
  --FilesWriter.build_directory="/home/ccasazza/code/notebooks/dist" \
  --CSSHTMLHeaderPreprocessor.style=$CSSHTMLHeaderPreprocessor \
  --execute ./*/*.ipynb

rm -rf $WEBSITE_NOTEBOOK_ASSET_PATH/*
cp $BUILD_DIRECTORY/* $WEBSITE_NOTEBOOK_ASSET_PATH