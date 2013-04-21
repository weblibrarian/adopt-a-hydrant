# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"

  config.vm.provision :shell, inline: "echo 'gem: --no-ri --no-rdoc' >> ~/.gemrc"
  config.vm.provision :shell, inline: "gem install chef"

  config.vm.provision :chef_solo do |chef|
    chef.add_recipe "apt"
    chef.add_recipe "build-essential"
    chef.add_recipe "postgresql"
    chef.add_recipe "postgresql::client"
    chef.add_recipe "postgresql::server"
    chef.add_recipe "postgresql::libpq"
    chef.add_recipe "rvm::vagrant"
    chef.add_recipe "rvm::system"

    chef.json = {
      rvm: {
        default_ruby: "1.9.3-p392"
      },
      postgresql: {
        initdb_options: "--locale=en_US.UTF-8",
        users: [{
          username: "adopt",
          password: "B3ckyRu1z",
          login: true,
          createdb: true
        }],
        databases: [{
          name: "adopt_a_thing_development",
          owner: "adopt",
          template: "template0",
          encoding: "utf8",
          locale: "en_US.UTF8"
        }, {
          name: "adopt_a_thing_test",
          owner: "adopt",
          template: "template0",
          encoding: "utf8",
          locale: "en_US.UTF8"
        }]
      }
    }  
  end

  config.vm.provision :shell, inline: "cd /vagrant && bundle"

  config.vm.provision :shell, inline: "cd /vagrant && bundle exec rake db:create"
  
  config.vm.provision :shell, inline: "cd /vagrant && bundle exec rake db:schema:load"

  config.vm.provision :shell, inline: "cd /vagrant && bundle exec rake db:seed"

  config.vm.network :forwarded_port, guest: 3000, host: 3000
end
