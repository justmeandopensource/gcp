resource "google_compute_firewall" "default" {
  name          = "allow-all-for-me"
  network       = var.network
  description   = "Allow all traffic from my public ip"

  allow {
    protocol = "all"
  }

  source_ranges = [local.my_public_ip]
}