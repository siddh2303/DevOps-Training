# Project 01

#### You are tasked with deploying a three-tier web application (frontend, backend, and database) using Ansible roles. The frontend is an Nginx web server, the backend is a Node.js application, and the database is a MySQL server. Your solution should use Ansible Galaxy roles where applicable and define appropriate role dependencies. The deployment should be automated to ensure that all components are configured correctly and can communicate with each other.

 1) Define Project Structure: 
 
 ```
 ├── inventory.ini
├── playbooks
│   ├── deploy.yml
└── roles
    ├── mysql
    │   ├── defaults
    │   │   └── main.yml
    │   ├── files
    │   ├── handlers
    │   │   └── main.yml
    │   ├── meta
    │   │   └── main.yml
    │   ├── README.md
    │   ├── tasks
    │   │   └── main.yml
    │   ├── templates
    │   ├── tests
    │   │   ├── inventory
    │   │   └── test.yml
    │   └── vars
    │       └── main.yml
    ├── nginx
    │   ├── defaults
    │   │   └── main.yml
    │   ├── files
    │   ├── handlers
    │   │   └── main.yml
    │   ├── meta
    │   │   └── main.yml
    │   ├── README.md
    │   ├── tasks
    │   │   └── main.yml
    │   ├── templates
    │   ├── tests
    │   │   ├── inventory
    │   │   └── test.yml
    │   └── vars
    │       └── main.yml
    └── nodejs
        ├── defaults
        │   └── main.yml
        ├── files
        ├── handlers
        │   └── main.yml
        ├── meta
        │   └── main.yml
        ├── README.md
        ├── tasks
        │   └── main.yml
        ├── templates
        ├── tests
        │   ├── inventory
        │   └── test.yml
        └── vars
            └── main.yml

 ```

 2) Role Selection and Creation
```
ansible-galaxy init roles/nginx
```

```
ansible-galaxy init roles/nodejs
```

```
ansible-galaxy init roles/mysql
```

![](1.png)

 3) Dependencies Management

 - roles/nodejs/meta/main.yml
 ```
 dependencies: 
  - role: mysql
    when: ansible_os_family == "Debian"
 ```

 4) Inventory Configuration
  - inventory.ini
  ```
  [frontend]
front ansible_host=54.XX1.74.226 ansible_user=ubuntu ansible_ssh_private_key_file=/home/einfochips/.ssh/ansible-new.pem
[backend]
back ansible_host=54.XX1.74.226 ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/ansible-new.pem
[database]
db ansible_host=54.XX1.74.226 ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/ansible-new.pem
  ```

  5) Playbook Creation

  - deploy.yml
  ```
- name: Full Stack Application
  hosts: all
  become: yes
  tasks:
  - name: update_cache
    apt:
      update_cache: yes

- hosts: database
  become: true
  roles:
  - mysql

- hosts: backend
  become: true
  roles:
  - nodejs

- hosts: frontend
  become: true
  roles:
  - nginx

  ```
  6) Role Customization and Variable Definition
  - NGINX
    - index.html
  ```
    <!DOCTYPE html>
<html>
<head>
    <title>My Web Application</title>
</head>
<body>
    <center>
        <h1>Welcome to Project 1 Web App</h1>
        <p>This application is deployed using Ansible using Roles.</p>

        <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/24/Ansible_logo.svg/256px-Ansible_logo.svg.png">
    </center>
</body>
</html>
  ```
  - handlers/main.yml
```
# roles/nginx/handlers/main.yml
---
- name: Restart Nginx
  systemd:
    name: nginx
    state: restarted
```
  - tasks/main.yml
  ```
  ---
- name: Installing Nginx
  apt:
    name: nginx
    state: present
    update_cache: yes

- name: Start Nginx
  systemd:
    name: nginx
    state: started
    enabled: yes

- name: Configure Nginx
  template:
    src: index.html.j2
    dest: /var/www/html/index.html
  notify: Restart Nginx

- name: Nginx is running or not
  service:
    name: nginx
    state: started
    enabled: yes
  ```
  
  - NODEJS
    - tasks/main.yml
```
    - name: Installing Ca-certificates
  apt:
    name: ca-certificates
    state: present
    update_cache: yes

- name: Downloading GPG key
  shell: |
    curl -o /tmp/nodesource.gpg.key https://deb.nodesource.com/gpgkey/nodesource.gpg.key
  args:
    warn: false

- name: Adding GPG key
  apt_key:
    file: "/tmp/nodesource.gpg.key"
    state: present

- name: Installing Node.js LTS repository
  apt_repository:
    repo: "deb https://deb.nodesource.com/node_{{ NODEJS_VERSION }}.x {{ ansible_distribution_release }} main"
    state: present
    update_cache: yes

- name: Install Node.js and npm
  apt:
    name:
    - nodejs
    state: present
```
 - vars/main.yml
 ```
 ---
NODEJS_VERSION: "16"
ansible_distribution_release: "focal"
 ```
 - MYSQL
   - handlers/main.yml
```
---
- name: Restart mysql
  service:
    name: mysql
    state: restarted
``` 
-  tasks/main.yml
```
---
- name: Installing Mysql
  package:
      name: "{{item}}"
      state: present
      update_cache: yes
  loop:
    - mysql-server
    - mysql-client
    - python3-mysqldb
    - libmysqlclient-dev
    
- name: Enabling MySQL service
  service:
      name: mysql
      state: started
      enabled: yes

- name: Setting up user-password
  mysql_user:
    name: root
    password: "{{root_password}}"
    login_unix_socket: /var/run/mysqld/mysqld.sock
    host: localhost
    login_user: root
    login_password: ''
    state: present

- name: Creating admin user (remote access)
  mysql_user:
    name: "{{admin_user}}"
    password: "{{admin_password}}"
    priv: '*.*:ALL'
    host: '%'
    append_privs: yes
    login_user: root
    login_password: "{{root_password}}"
    state: present

- name: Creating Database 
  mysql_db:
    name: "{{db_name}}"
    state: present
    login_user: root
    login_password: "{{root_password}}"

- name: Enabling remote login to mysql
  lineinfile:
    path: /etc/mysql/mysql.conf.d/mysqld.cnf
    regex: '^bind-address\s*=\s*127.0.0.1'
    line: 'bind-address = 0.0.0.0'
    backup: yes
  notify:
    - Restart mysql

- name: Execute MySQL secure installation
  expect:
    command: mysql_secure_installation
    responses:
      'Enter password for user root:': "{{ root_password }}"
      'Press y\|Y for Yes, any other key for No': 'Y'
      'Please enter 0 = LOW, 1 = MEDIUM and 2 = STRONG': "{{ password_validation_policy }}"
      'Change the password for root \? \(\(Press y\|Y for Yes, any other key for No\)': 'n'
      'Remove anonymous users\? \(Press y\|Y for Yes, any other key for No\)': 'Y'
      'Disallow root login remotely\? \(Press y\|Y for Yes, any other key for No\)': 'Y'
      'Remove test database and access to it\? \(Press y\|Y for Yes, any other key for No\)': 'Y'
      'Reload privilege tables now\? \(Press y\|Y for Yes, any other key for No\)': 'Y'
  environment:
    MYSQL_PWD: "{{ root_password }}"
```
- vars/main.yml
```
---
root_password: pass@123
admin_user: Admin
admin_password: Admin@123
db_name: sampledb
password_validation_policy: 1  
```
# Output

![](2.png)
![](3.png)
![](4.png)

