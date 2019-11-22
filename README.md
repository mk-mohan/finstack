# Announcements

The bulk of the README has moved to the Wiki. Please check it out [here](https://github.com/gcgarner/my-pistack/wiki)

* BUGFIX: fixed issue where rsync gave issue on 'Preserve Environment and Config files'
* BUGFIX: I incorrecly changed mosquittos volume mapping and it caused the container to restart. Reverted to the old volume mapping
* Added RTL_433 native and docker installs
* Added update project through the menu
* Added bash aliases for easier docker stop and start commands
* The project up procedure has been rewritten #73 (now git pull), please check your duck.sh file because the old method reset it
* BUGFIX: incorrect permissions in docker_backup: PR @Paraphraser
* BUGFIX: Timezone not correct on Node-RED and Pihole
* docker_backup.sh now stores last 5 backups with timestamps : PR @877dev
* Added Pi-Hole
* Added zigbee2mqtt (needs wiki) BUG:does not start due to missing device
* Added rclone for Google Drive Backups
* Fixed Hass.io (now has a seperate menu installation)
* Added Telegraf (needs wiki)
* Plex added
* Tasmoadmin (needs wiki)
* Fixed Tasmoadmin not starting after reboot

***

## Highlighted topics

* [Bluetooth and Node-RED](https://github.com/gcgarner/my-pistack/wiki/Node-RED#using-bluetooth)
* [Saving files to disk inside containers](https://github.com/gcgarner/my-pistack/wiki/Node-RED#sharing-files-between-node-red-and-the-host)
* [Updating the Project](https://github.com/gcgarner/my-pistack/wiki/Updating-the-Project)

 ***

# Coming soon

* [EspurinoHub](https://hub.docker.com/r/humbertosales/espruinohub-docker-rpi)

***

# my-pistack

Docker stack for getting started on IoT on the Raspberry Pi.

This Docker stack consists of:

* Node-RED
* Grafana
* InfluxDB
* Postgres
* Mosquitto mqtt
* Portainer
* Adminer
* openHAB
* Home Assistant (HASSIO)
* zigbee2mqtt
* Pi-Hole
* TasmoAdmin (parial wiki)
* Plex media server
* Telegraf (wiki coming soon)
* RTL_433

In addition, there is a write-up and some scripts to get a dynamic DNS via duckdns and VPN up and running.

Firstly what is docker? The correct question is "what are containers?". Docker is just one of the utilities to run a container.

A Container can be thought of as ultra-minimal virtual machines, they are a collection of binaries that run in a sandbox environment. You download a preconfigured base image and create a new container. Only the differences between the base and your "VM" are stored.
Containers don't have [GUI](https://en.wikipedia.org/wiki/Graphical_user_interface)s so generally the way you interact with them is via web services or you can launch into a terminal.
One of the major advantages is that the image comes mostly preconfigured.  

There are pro's and cons for using native installs vs containers. For me, one of the best parts of containers is that it doesn't "clutter" your device. If you don't need Postgres anymore then just stop and delete the container. It will be like the container was never there.

The container will fail if you try to run the docker and native vesions as the same time. It is best to install this on a fresh system.

For those looking for a script that installs native applications check out [Peter Scargill's script](https://tech.scargill.net/the-script/)
  
# Tested platform

Raspberry Pi 3B and 4B Raspbian (Buster)

## Older Pi's

Docker will not run on a PiZero or A model 1 because of the CPU. It has not been tested on a Model 2. You can still use Peter Scargill's [script](https://tech.scargill.net/the-script/)

## Running under a virtual machine

For those wanting to test out the script in a Virtual Machine before installing on their Pi there are some limitations. The script is designed to work with Debian based distributions. Not all the container have x86_64 images. For example Portainer does not and will give an error when you try and start the stack. Please see the pinned issue [#29](https://github.com/gcgarner/my-pistack/issues/29), there is more info there.

# Feature Requests

Please direct all feature requests to [Discord](https://discord.gg/W45tD83)
  
# Youtube reference

This repo was originally inspired by Andreas Spiess's video on using some of these tools. Some containers have been added to extend its functionality.

[YouTube video](https://www.youtube.com/watch?v=JdV4x925au0): This is an alternative approach to the setup. Be sure to watch the video for the instructions. Just note that the network addresses are different, see note below

# Download the project

1.On the lite image you will need to install git first 

```bash
sudo apt-get install git
```

2.Download the repository with:

```bash
git clone https://github.com/gcgarner/my-pistack.git ~/my-pistack
```

Due to some script restraints, this project needs to be stored in ~/my-pistack

3.To enter the directory run:

```bash
cd ~/my-pistack
```

# The Menu

I've added a menu to make things easier. It is good to familiarise yourself with the installation process.
The menu can be used to install docker and build the docker-compose.yml file necessary for starting the stack. It also runs a few common commands. I do recommend you start to learn the docker and docker-compose commands if you plan on using docker in the long run. I've added several helper scripts, have a look inside.

Navigate to the project folder and run `./menu.sh`

## Installing from the menu

Select the first option and follow the prompts

## Build the docker-compose file

docker-compose uses the `docker-compose.yml` file to configure all the services. Run through the menu to select the options you want to install.

## Docker commands

This menu executes shell scripts in the root of the project. It is not necessary to run them from the menu. Open up the shell script files to see what is inside and what they do.

## Miscellaneous commands

Some helpful commands have been added like disabling swap.

# Running Docker commands

From this point on make sure you are executing the commands from inside the project folder. Docker-compose commands need to be run from the folder where the docker-compose.yml is located. If you want to move the folder make sure you move the whole project folder.

## Starting and Stopping containers

to start the stack navigate to the project folder containing the docker-compose.yml file

To start the stack run:
`docker-compose up -d` or `./scripts/start.sh`

To stop:
`docker-compose down` or `./scripts/stop.sh`

The first time you run 'start' the stack docker will download all the images for the web. Depending on how many containers you selected and your internet speed this can take a long while.

The 'docker-compose down' command stops the containers then deletes them. To stop the container but not delete it, run 'docker-compose stop'.

## Persistent data

Docker allows you to map folders inside your containers to folders on the disk. This is done with the "volume" key. There are two types of volumes. Modification to the container are reflected in the volume.

# See Wiki for further info

[Wiki](https://github.com/gcgarner/my-pistack/wiki)

# Add to the project

Feel free to add your comments on features or images that you think should be added.

# Contributions

@mrmx, @oscrx, @brianimmel, @Slyke, @AugustasV, @Paulf007, @affankingkhan, @877dev, @Paraphraser
