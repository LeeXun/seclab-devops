# The load balancer
resource "google_compute_forwarding_rule" "nginx" {
  name                  = "nginx-forwarding-rule"
  load_balancing_scheme = "???" # Add this
  ip_protocol           = "???" # Add this
  port_range            = "???" # Add this
  target                = ??? # Add this
}

resource "google_compute_target_pool" "nginx" {
  name = "nginx-pool"

  health_checks = [
    ???, # Add this
  ]
}

resource "google_compute_http_health_check" "nginx" {
  name               = "nginx"
  request_path       = ??? # Add this
  check_interval_sec = ??? # Add this
  timeout_sec        = ??? # Add this
}

resource "google_compute_firewall" "nginx" {
  project = local.project
  name    = "nginx-allow-health-check"
  network = "default"
  source_ranges = [???] # Add this
  target_tags = [???] # Add this

  allow { [???] } # Add this
}

resource "google_compute_region_instance_group_manager" "nginx" {
  depends_on         = [google_compute_instance_template.nginx]
  name               = "nginx"
  region             = local.region
  base_instance_name = "nginx"
  target_pools       = [???] # Add this
  version {
    instance_template = ??? # Add this
  }
  target_size = 1
}

resource "google_compute_instance_template" "nginx" {
  name         = "nginx-${random_id.instance-template.hex}"
  machine_type = "???" # Add this
  region       = local.region

  disk { [???] } # Add this

  network_interface { [???] } # Add this

  tags = [???] # Add this

  metadata = {
    startup-script = file("${path.module}/startup-script/puppet-agent.sh")
  }

  lifecycle {
    create_before_destroy = ??? # Add this
  }
}