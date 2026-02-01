terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "homeassistant" {
  name = "ghcr.io/home-assistant/home-assistant:stable"
}

resource "docker_container" "homeassistant" {
  name  = "homeassistant"
  image = docker_image.homeassistant.image_id

  restart      = "unless-stopped"
  network_mode = "host"
  privileged = true
  volumes {
    host_path      = "/home/pi/homeassistant/config"
    container_path = "/config"
  }

  volumes {
    host_path      = "/etc/localtime"
    container_path = "/etc/localtime"
    read_only      = true
  }

  volumes {
    host_path      = "/run/dbus"
    container_path = "/run/dbus"
    read_only      = true
  }

  env = [
    "TZ=Europe/London"
  ]
}

resource "docker_image" "nodered" {
  name = "nodered/node-red:latest"
}

# Node-RED Container
resource "docker_container" "nodered" {
  name  = "nodered"
  image = docker_image.nodered.image_id

  restart = "unless-stopped"

  ports {
    internal = 1880
    external = 1880
  }

  volumes {
    host_path      = "/home/pi/nodered/data"
    container_path = "/data"
  }

  env = [
    "TZ=Europe/London"
  ]
}