# https://www.terraform.io/docs/providers/google/r/compute_instance.html
# Read the document above to set up the instance.

# GCE instance
resource "google_compute_instance" "nginx" {
  name         = "nginx"
  machine_type = "???" # Add this
  zone         = "???" # Add this

  network_interface { [???] } # Add this

  boot_disk { [???] } # Add this

  metadata_startup_script = file("")

  tags = [
    "nginx",
  ]

}

# GCE firewall
resource "google_compute_firewall" "nginx-allow-80" {
  name    = "nginx-allow-80"
  network = "default"

  allow { [???] } # Add this

  source_ranges = [???] # Add this
  target_tags   = [???] # Add this
}