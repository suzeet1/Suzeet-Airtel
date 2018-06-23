 for i in `seq 151 241`; do ping -c 1 10.3.160.$i |grep 64\ bytes 2> /dev/null & done &
 
 ============================Ansible Playbook=========================================
 [root@jump-server mobinet]# cat copy.yaml
---
- name: post scale out tasks
  hosts: bmc
  remote_user: root
  tasks:


    - name: passwd
      copy:
        src:  passwd
        dest: /tmp/passwd
        mode: 0600
        owner: root
        group: root
[root@jump-server mobinet]#
===================================================================
