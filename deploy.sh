# Install Dependencies
npm install

# Build
npm run build:prod

cd ./dist/css-minify

# Upload
echo 'Uploading tar to server...'
gcloud compute scp --recurse ./* gharatmanish@w3radar-blog-vm:/var/www/html/tools.w3radar.com/css-minify/

echo 'Done'