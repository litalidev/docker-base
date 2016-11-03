# docker-base
A simple docker debian based image with sshd using supervisor

To build

  docker build -t litalidev/docker-base .


To test
  1.  docker run -d --restart=always -h debian8d -p 22:22 --name base001 litalidev/docker-base
  2.  putty/ssh to the host computer
  3.  login root/rootpw


Note
  - This image was tested under a Windows system

