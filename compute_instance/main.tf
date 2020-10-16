resource "google_compute_instance" "jungle" {
  name          = "jungle"
  machine_type  = var.machine_type

  boot_disk {
    initialize_params {
      image = var.machine_image
      size  = var.disk_size
    }
  }

  network_interface {
      subnetwork = var.subnetwork
      access_config {}
  }

  metadata_startup_script = file("scripts/bootstrap.sh")
}