#Docker
apt-get install -y linux-image-extra-"$(uname -r)"
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
echo 'deb http://get.docker.io/ubuntu docker main' | sudo dd of=/etc/apt/sources.list.d/docker.list
apt-get update
apt-get install -y lxc-docker

#Mesos w/ Deimos
apt-get install -y zookeeperd default-jre python-setuptools python-protobuf curl python-pip
curl -fL http://downloads.mesosphere.io/master/ubuntu/13.10/mesos_0.19.0-xcon3_amd64.deb -o /tmp/mesos.deb
dpkg -i /tmp/mesos.deb
curl -fL http://downloads.mesosphere.io/master/ubuntu/13.10/mesos_0.19.0-xcon3_amd64.egg -o /tmp/mesos.egg
easy_install /tmp/mesos.egg
pip install deimos
curl -fL http://downloads.mesosphere.io/marathon/marathon_0.5.0-xcon2_noarch.deb -o /tmp/marathon.deb
dpkg -i /tmp/marathon.deb
mkdir -p /etc/mesos-slave
echo /usr/local/bin/deimos > /etc/mesos-slave/containerizer_path
echo external              > /etc/mesos-slave/isolation

#Prepare the tests by pre-pulling the Docker images
git clone https://github.com/mesosphere/deimos.git
docker pull zaiste/postgresql
docker pull libmesos/ubuntu:13.10
docker pull hodor/hodor

#Start everything up
start mesos-slave
start mesos-master

echo 'You can use "vagrant ssh" to run "sudo /vagrant/hodor-test/test-suite $(hostname):5050"`
