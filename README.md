A simple way to test out Deimos via Vagrant.  After building with "vagrant up", use "vagrant ssh" to run "sudo /vagrant/hodor-test/test-suite $(hostname):5050", and then check http://192.168.33.10:5050 in your browser.

The Vagrant image is built following the instructions [this gist](https://gist.github.com/solidsnack/10944095).
