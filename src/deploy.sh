# USERNAME=${{secrets.USERNAME}}
# HOSTNAME=${{secrets.HOSTNAME}}
# BASEPATH=${{secrets.BASE_PATH}}
# APPNAME=${{secrets.APPNAME}}

# Upload
echo 'Uploading tar to server...'
scp -o StrictHostKeyChecking=no -o ConnectTimeout=240 -o ConnectionAttempts=3 ./build-artifacts/$APPNAME.tar $USERNAME@$HOSTNAME:$BASEPATH/tools/.tmp
echo 'Making ssh connection to server...'
ssh -o StrictHostKeyChecking=no -o ConnectTimeout=240 -o ConnectionAttempts=3 -l $USERNAME $HOSTNAME /bin/bash << EOF
    echo 'On remote server...'
    cd $BASEPATH/tools
    mkdir -p ./${APPNAME}
    echo 'Extracting artifacts...'
    tar -C ./${APPNAME} -xvf ./.tmp/${APPNAME}.tar
    echo 'cleaning up...'
    rm ./.tmp/${APPNAME}.tar
EOF
echo 'Done'