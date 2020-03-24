# USERNAME=${{secrets.USERNAME}}
# HOSTNAME=${{secrets.HOSTNAME}}
# BASEPATH=${{secrets.BASE_PATH}}
# APPNAME=${{secrets.APPNAME}}
# SSH_KEY_Private=${{secrets.SSH_KEY_Private}}

# Add SSH key
mkdir -p ./.ssh
touch ./.ssh/id_rsa
cat $SSH_KEY_Private > ./.ssh/id_rsa

# Upload
ssh-add ./.ssh/id_rsa
scp -o StrictHostKeyChecking=no ./build-artifacts/$APPNAME.tar $USERNAME@$HOSTNAME:$BASEPATH/.tmp

ssh -o StrictHostKeyChecking=no -l $USERNAME $HOSTNAME /bin/bash << EOF
    cd $BASEPATH
    mkdir -p ./${APPNAME}1
    tar -C ./${APPNAME}1 -xvf ./.tmp/${APPNAME}.tar
EOF
