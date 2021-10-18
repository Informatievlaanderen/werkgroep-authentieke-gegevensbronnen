#!/bin/bash

ROOTDIR=$1

CONFIGURATION_FILE="configuratie.json"
DESCRIPTION_FILE="beschrijving.md"
ROOT_SOURCE_FOLDER="bronnen"
BASE_URI="https://github.com/informatievlaanderen/werkgroep-authentieke-gegevensbronnen/blob/master"

while IFS= read -r sourceFolder
do
  configuration="$ROOT_SOURCE_FOLDER/$sourceFolder/$CONFIGURATION_FILE"
  tmpfile=$(mktemp)

  for row in $(echo "${documents}" | jq -r '.[] | @base64'); do
    _jq() {
     echo ${row} | base64 --decode | jq -r ${1}
    }

    displayName=$(_jq '.weergaveNaam')
    documentName=$(_jq '.documentNaam')
    documentNameUri="$BASE_URI/$ROOT_SOURCE_FOLDER/$sourceFolder/documenten/$documentName"
    jq --arg name "$documentName" --arg uri "$documentNameUri" '( .documenten[] | select(.documentNaam == $name) ).documentNaam |= $uri' "$configuration" > "$tmpfile"
    mv -- "$tmpfile" "$configuration"

  done

  ## Copy updated configuration.json and beschrijving.md to ROOTDIR
  mkdir "$ROOTDIR/$ROOT_SOURCE_FOLDER/$sourceFolder"
  cp "$ROOT_SOURCE_FOLDER/$sourceFolder/$CONFIGURATION_FILE" "$ROOT_SOURCE_FOLDER/$sourceFolder/$DESCRIPTION_FILE" "$ROOTDIR/$ROOT_SOURCE_FOLDER/$sourceFolder"
done < "$ROOTDIR/changedSources.txt"