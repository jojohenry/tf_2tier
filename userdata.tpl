#!/bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
echo "<html>
<head>
<style>
body {
  background-image: url('https://img.freepik.com/free-vector/hand-painted-watercolor-pastel-sky-cloud-background_41066-1919.jpg');
}
</style>
</head>
<body>

<h1><center>Congrats!</h1></center>
<h2>You have successfully deployed a Two-Tier Architecture via Terraform Cloud </h2>


</body>
</html>" > /var/www/html/index.html