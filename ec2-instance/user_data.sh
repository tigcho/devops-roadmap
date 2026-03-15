#!/bin/bash

apt update -y
apt upgrade -y

apt install nginx -y

systemctl start nginx
systemctl enable nginx

cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
<title>Terraform AWS Website</title>
</head>
<body>
<h1>Website deployed using Terraform</h1>
<p>EC2 + Nginx setup successful.</p>
</body>
</html>
EOF
