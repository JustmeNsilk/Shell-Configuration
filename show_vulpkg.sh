#!/usr/bin/bash

is_connected="false"
network_status=$(nmcli networking connectivity)
for idx in {1..3}
do
	if [[ $network_status =~ ^[full|portal] ]]; then
	is_connected="true"
	break
    fi
    echo "You are not connected to internet, trying again in $idx sec"
    sleep "$idx";
done

if [[ "$is_connected" = "false" ]]; then
    echo "You are defenitly not connected to internet, please do 'getwifi' to get connected"
    exit 1
fi

audit_output=$(arch-audit -u)
echo -e "---\tCurrent package vulnerabilities\t---\n"
arch-audit
echo -e "\n---\tCurrent fixed package\t---\n"
if [[ -n "$audit_output" ]]; then
    echo -e "No fixed version currently exist for this/those package/s :(\n"
else
    echo "$audit_output"
fi
exit 0
