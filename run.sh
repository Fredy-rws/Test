#!/bin/bash

USER_NAME=username
USER_ID=userid
USER_HOME=/home/${USER_NAME}
USER_SHELL=/bin/bash
GROUP_NAME=groupname
GROUP_ID=groupid

function adduser()
{
    groupadd -g ${GROUP_ID} ${GROUP_NAME}
    useradd -MN -s /bin/bash -G sudo -g ${GROUP_NAME} -u ${USER_ID} -d ${USER_HOME} -c "docker user" ${USER_NAME}
    mkdir -p ${USER_HOME} && chown -R ${USER_NAME}:${GROUP_NAME} ${USER_HOME}
    echo "${USER_NAME}:123" | chpasswd
}

if [ ! -d ${USER_HOME} ]; then
    adduser
fi

log_file=/var/log/boot_log.log
echo "Info: start at $(date)" >> ${log_file}

sleep 10
echo "end" > ${USER_HOME}/workspace/status.txt
exit 0
