#!/bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
echo " <html>
<body>

<center><h1><b>Congratulations!</h1> <h2>You have successfully deployed a Two-Tier Architecture.</h2></b></center>


</body>
</html>
" > /var/www/html/index.html