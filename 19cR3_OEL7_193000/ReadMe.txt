1. Edit file "0_env_variables.env" as per your specific environment.
  
2. create location to move your installation scripts as a root user.
	mkdir /scrips

3. place oracle software to SOFTWARE_DIR
   /tmp
   create SOFTWARE_DIR as root user if diferent to /tmp location

4. run installation scipt
	cd /scripts/19cR3_OEL7_193000
	sh install_19c.sh