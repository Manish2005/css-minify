# USERNAME=${{secrets.USERNAME}}
# HOSTNAME=${{secrets.HOSTNAME}}
# BASEPATH=${{secrets.BASE_PATH}}
# APPNAME=${{secrets.APPNAME}}

# Upload
scp -o StrictHostKeyChecking=no ./build-artifacts/$APPNAME.tar $USERNAME@$HOSTNAME:$BASEPATH/.tmp

ssh -o StrictHostKeyChecking=no -l $USERNAME $HOSTNAME /bin/bash << EOF
    pwd
    ls
    cd $BASEPATH
    pwd
    mkdir -p ./${APPNAME}1
    tar -C ./${APPNAME}1 -xvf ./.tmp/${APPNAME}.tar
EOF
