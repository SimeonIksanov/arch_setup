#!/usr/bin/env bash

fprintd-delete "$USER"
for finger in {left,right}-{thumb,{index,middle,ring,little}-finger}; do
	fprintd-enroll -f "$finger" "$USER";
done
