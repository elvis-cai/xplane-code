# Ephemeral Code Challenge

This repository is designed to facilitate the creation of a Kubernetes-based coding challenge environment. Utilizing tools such as k3d, sshx, and Crossplane, it automates the setup of a comprehensive development environment on Google Cloud Platform (GCP). This includes the provisioning of network resources, subnetworks, firewalls, and virtual machines. Within the VM, a k3d cluster is created, and sshx is set up for seamless access.

## How to Run

Follow these steps to set up your code challenge environment:

1. Obtain your GCP credentials file (`gcp-credentials.json`). You can find this file by searching for "gcp-credentials.json (code challenge)" in 1Password.
2. Execute the initialization script with the command `./bootstrap/init.sh`. This script will handle the creation of all necessary cloud resources. Once the script completes, your code challenge environment will be ready for use.
