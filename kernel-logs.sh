#!/bin/bash

now=$(date +"%Y-%m-%dT%H-%M")

log_file="kernel-logs-$now.txt"
log_path="/var/log/$log_file"

compressed_file="kernel-logs-$now.tar.bz2"
compressed_path="/var/log/$compressed_file"

journalctl -k --since "1 hour ago" > "$log_path"
tar -cjf "$compressed_path" "$log_path"
dbxcli put  "$compressed_path" "/dbxcli/kernel/$compressed_file"

