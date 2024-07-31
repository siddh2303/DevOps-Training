#!/bin/bash
#Command to check disk usage
ansible green -i inventory.ini -m shell -a "df -h"

#Command to install nginx service in worker node
ansible green -i inventory.ini -m apt -a 'name=nginx state=present' --become

#Command to restart nginx service
ansible green -i inventory.ini -m service -a 'name=nginx state=restarted' --become

#Command to update the services
ansible green -i inventory.ini -m apt -a 'upgrade=dist' --become