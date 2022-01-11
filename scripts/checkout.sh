#!/bin/bash

ROOTDIR=$1
SOURCE_FOLDER="bronnen"
declare -a changedSources

mkdir -p "$ROOTDIR"

function getAllSources() {
  for source in "$SOURCE_FOLDER"/*/ ; do
    IFS='/' read -r -a parts <<< "$source"
    sourceName=(${parts[1]})
    changedSources+=($sourceName)
  done
}

# Determine the last changed files
curl -o "$ROOTDIR/commit.json" "https://raw.githubusercontent.com/ddvlanck/werkgroep-authentieke-gegevensbronnen/website/commit.json"
sleep 5s

jq . "$ROOTDIR/commit.json"
if [ $? -eq 0 ]; then
  PREV_COMMIT=$(jq -r .commit "$ROOTDIR/commit.json")
  printf "$(git diff --name-only "$PREV_COMMIT")\n" > "$ROOTDIR/changedFiles.txt"

  CHANGED_SOURCES_COUNT="$(cat $ROOTDIR/changedFiles.txt | egrep -i "^[\"]?bronnen/*" | wc -l)"
  TOTAL_FILES="$(wc -l < $ROOTDIR/changedFiles.txt)"

  # Other files than the files in SOURCE_FOLDER were changed
  if (( "$CHANGED_SOURCES_COUNT" != "$TOTAL_FILES" )); then
    getAllSources
  else
    while IFS= read -r file
    do
      if [[ $file =~ ^[\"]?bronnen/* ]]
      then 
        IFS='/' read -r -a parts <<< "$file"
        sourceName=(${parts[1]})
        changedSources+=($sourceName)
      fi
    done < "$ROOTDIR/changedFiles.txt"

    # Get unique changed sources and write them to text file
    changedSources=($(printf "%s\n" "${changedSources[@]}" | sort -u | tr '\n' ' '))
  fi
else
  # No previous commit
  # Doing full rebuild of all files
  getAllSources
fi

printf '%s\n' "${changedSources[@]}" > "$ROOTDIR/changedSources.txt"





