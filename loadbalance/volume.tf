resource "digitalocean_volume" "data" {
  region                  = "nyc1"
  name                    = "data"
  size                    = 100
  initial_filesystem_type = "ext4"
  description             = "Data"
}

resource "digitalocean_volume_attachment" "mount_data" {
  droplet_id = "${digitalocean_droplet.www-1.id}"
  volume_id  = "${digitalocean_volume.data.id}"
}
