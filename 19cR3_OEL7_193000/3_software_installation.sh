#!/bin/bash

. /scripts/19cR3_OEL7_193000/0_env_variables.env

echo ""
echo "*********************************************"
echo "* Unzip software" `date`                   "*"
echo "*********************************************"
echo ""

cd ${ORACLE_HOME}
unzip -oq /${SOFTWARE_DIR}/${DB_SOFTWARE_1}


echo ""
echo "*********************************************"
echo "* Software-only installation" `date`       "*"
echo "*********************************************"
echo ""

${ORACLE_HOME}/runInstaller -ignorePrereq -waitforcompletion -silent           \
    -responseFile ${ORACLE_HOME}/install/response/db_install.rsp               \
    oracle.install.option=INSTALL_DB_SWONLY                                    \
    ORACLE_HOSTNAME=${ORACLE_HOSTNAME}                                         \
    UNIX_GROUP_NAME=oinstall                                                   \
    INVENTORY_LOCATION=${ORA_INVENTORY}                                        \
    SELECTED_LANGUAGES=en,en_GB                                                \
    ORACLE_HOME=${ORACLE_HOME}                                                 \
    ORACLE_BASE=${ORACLE_BASE}                                                 \
    oracle.install.db.InstallEdition=EE                                        \
    oracle.install.db.OSDBA_GROUP=dba                                          \
    oracle.install.db.OSBACKUPDBA_GROUP=dba                                    \
    oracle.install.db.OSDGDBA_GROUP=dba                                        \
    oracle.install.db.OSKMDBA_GROUP=dba                                        \
    oracle.install.db.OSRACDBA_GROUP=dba                                       \
    SECURITY_UPDATES_VIA_MYORACLESUPPORT=false                                 \
    DECLINE_SECURITY_UPDATES=true

