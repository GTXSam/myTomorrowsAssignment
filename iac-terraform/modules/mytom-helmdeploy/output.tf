output "release_status" {
  value = helm_release.my_chart.status
}