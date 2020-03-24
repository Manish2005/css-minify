# USERNAME=${{secrets.USERNAME}}
# HOSTNAME=${{secrets.HOSTNAME}}
# BASEPATH=${{secrets.BASE_PATH}}
# APPNAME=${{secrets.APPNAME}}

# Upload
scp -o StrictHostKeyChecking=no -o ConnectTimeout=120 ./build-artifacts/$APPNAME.tar $USERNAME@$HOSTNAME:$BASEPATH/.tmp

ssh -o StrictHostKeyChecking=no -o ConnectTimeout=120 -l $USERNAME $HOSTNAME /bin/bash << EOF
    cd $BASEPATH/tools
    mkdir -p ./${APPNAME}1
    tar -C ./${APPNAME}1 -xvf ./.tmp/${APPNAME}.tar
EOF
