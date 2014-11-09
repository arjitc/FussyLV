#!/bin/bash
VOLUME_GROUP=""
LV_NAME=$1
ONE="1"
TWO="2"
dmsetup remove --force $VOLUME_GROUP-$LV_NAME
lvchange -an /dev/$VOLUME_GROUP/$LV_NAME
dmsetup remove --force $VOLUME_GROUP-$LV_NAME$ONE
dmsetup remove --force $VOLUME_GROUP-$LV_NAME$TWO
lvchange -an /dev/$VOLUME_GROUP/$LV_NAME
lvremove -f /dev/$VOLUME_GROUP/$LV_NAME
echo "Done"
