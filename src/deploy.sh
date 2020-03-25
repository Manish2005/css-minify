# USERNAME=${{secrets.USERNAME}}
# HOSTNAME=${{secrets.HOSTNAME}}
# BASEPATH=${{secrets.BASE_PATH}}
# APPNAME=${{secrets.APPNAME}}

# Upload
echo 'Uploading tar to server...'
ls
ls ./build-artifacts
scp -o StrictHostKeyChecking=no -o ConnectTimeout=240 ./build-artifacts/$APPNAME.tar $USERNAME@$HOSTNAME:$BASEPATH/tools/.tmp
echo 'Making ssh connection to server...'
ssh -o StrictHostKeyChecking=no -o ConnectTimeout=240 -l $USERNAME $HOSTNAME /bin/bash << EOF
    cd $BASEPATH/tools
    mkdir -p ./${APPNAME}1
    tar -C ./${APPNAME}1 -xvf ./.tmp/${APPNAME}.tar
EOF
