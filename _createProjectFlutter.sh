#!/bin/bash

echo "Create flutter project"
echo ""

# Configs
source .myshell_config

# Template
echo "Choose a template." 
select TEMP in app module package plugin
do
  echo $TEMP
  break
done

echo ""

# Organization
echo "Choose a organization."
select ORG in $MY_ORG com.example any
do
  if [ "$ORG" = "any" ]; then
    read ORG
  fi
  echo $ORG
  break
done

echo ""

# Project name
read -p "Enter the project name. > " NAME
echo $NAME

echo ""

# Description
echo "Choose a description."
select DESCRIPTION in "$TEMP_DESC" any
do
  if [ "$DESCRIPTION" = "any" ]; then
    read DESCRIPTION
  fi
  echo "$DESCRIPTION"
  break
done

echo ""

# Check
echo "Template: $TEMP"
echo "Organization: $ORG"
echo "Project name: $NAME"
echo "Description: $DESCRIPTION"
echo "PATH: $PJ_PATH/$NAME"
echo ""
read -p "Do you want to create it with this content? (y/N) > " YESNO

# Exec
case "$YESNO" in
  [yY]*) flutter create -t "$TEMP" --org "$ORG" --project-name "$NAME" -i swift -a kotlin --description "$DESCRIPTION" "$PJ_PATH/$NAME";;
  *) echo "Bye."
esac
