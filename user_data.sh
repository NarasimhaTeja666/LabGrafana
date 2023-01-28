 #!/bin/bash 
  sudo su
  sudo yum update -y 
  sudo yum install -y docker
  docker run -d --name=grafana -p 3000:3000 grafana/grafana