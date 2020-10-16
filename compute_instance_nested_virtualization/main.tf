resource "google_compute_disk" "jungle-disk" {
  name        = "jungle-disk"
  description = "Created by Terraform"
  type        = "pd-ssd"
  zone        = var.zone
  image       = var.machine_image
}

resource "google_compute_image" "jungle-disk-image" {
  name        = "jungle-disk-image"
  description = "Created by Terraform"
  source_disk = google_compute_disk.jungle-disk.self_link
  licenses = [
    "https://www.googleapis.com/compute/v1/projects/vm-options/global/licenses/enable-vmx",
  ]
}

resource "google_compute_instance" "jungle" {
  name          = "jungle"
  machine_type  = var.machine_type

  min_cpu_platform = "Intel Haswell"

  boot_disk {
    initialize_params {
      image = google_compute_image.jungle-disk-image.self_link
      type  = "pd-ssd"
      size  = var.disk_size
    }
  }

  network_interface {
      subnetwork = var.subnetwork
      access_config {}
  }

  metadata_startup_script = file("scripts/bootstrap.sh")
}