#!/bin/bash

. /scripts/19cR3_OEL7_193000/0_env_variables.env

#below script will install OS packages
sh /scripts/19cR3_OEL7_193000/1_os_packages.sh

# Create required directories
mkdir -p ${ORACLE_HOME}
mkdir -p ${SCRIPTS_DIR}
mkdir -p ${DATA_DIR}
chown -R oracle.oinstall ${SCRIPTS_DIR} /u01 /u02
chown -R oracle:oinstall /home/oracle/scripts	
chown -R oracle:oinstall ${SOFTWARE_DIR}
chmod -R 775 ${SOFTWARE_DIR}

echo "*******************************************************************************************"
echo "Prepare environment and install the software." `date`
echo "*******************************************************************************************"
echo

# Below script to create oracle environment variable
su - oracle -c 'sh /scripts/19cR3_OEL7_193000/2_oracle_env_variable.sh'

echo
# Below script to install Oracle software
su - oracle -c 'sh /scripts/19cR3_OEL7_193000/3_software_installation.sh'

echo
echo "****************************************************************************************"
echo "Run root scripts." `date`
echo "****************************************************************************************"
echo

sh ${ORA_INVENTORY}/orainstRoot.sh
sh ${ORACLE_HOME}/root.sh

#echo "****************************************************************************************"
#echo "Create the database." `date`
#echo "****************************************************************************************"

#Below script will create Oracle Database
su - oracle -c 'sh /scripts/19cR3_OEL7_193000/4_create_database.sh'
