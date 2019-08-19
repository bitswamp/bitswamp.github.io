---
layout: post
title: Run QMK Keyboard Firmware Builder locally with Docker
---

Run a copy of https://kbfirmware.com locally in Docker containers with minimal config required.

### Background

The other day I was getting an error trying to download .hex files from https://kbfirmware.com (it's fine now).

I'd been meaning to set up a copy on my computer, because I want to try some changes to the default wiring method.

The original source https://github.com/ruiqimao/qmkbuilder is easy enough for a developer to use, but the setup still involves a few steps.

### The project

I created a Dockerfile and a compose file at https://github.com/bitswamp/qmkbuilder-docker to automate it. Now you can run your own copy like:

* Install [Docker](https://www.docker.com/get-started)
* Download or clone https://github.com/bitswamp/qmkbuilder-docker
* Start it up with `docker-compose up`

It creates 2 docker containers, downloads all the dependencies for QMK and qmkbuilder, and serves it up as a website on the local network. 

You don't need node.js or any of the build tools on the host computer, you only need Docker. Tested on Windows and Mac, ought to work the same on Linux. See the project readme for more details, and report any issues to me on github.
