# Proxmox Full-Clone
# ---
# Create a new VM from a clone

resource "proxmox_vm_qemu" "srv-prod-1" {
    
    # VM General Settings
    target_node = "prx-prod-1"
    vmid = "102"
    name = "srv-prod-1"
    desc = "Ubuntu Server"

    # VM Advanced General Settings
    onboot = true 

    # VM OS Settings
    clone = "ubuntu-server-jammy"

    # VM System Settings
    agent = 1
    
    # VM CPU Settings
    cores = 1
    sockets = 1
    cpu = "host"    
    
    # VM Memory Settings
    memory = 1024

    # VM Network Settings
    network {
        bridge = "vmbr0"
        model  = "virtio"
    }

    # VM Disk Settings
    disk {
        slot = 0
        size = "10G"
        type = "virtio"
    }

    bootdisk = "virtio0"

    # VM Cloud-Init Settings
    os_type = "cloud-init"

    # (Optional) IP Address and Gateway
    ipconfig0 = "ip=10.0.0.50/0,gw=10.0.0.1"
    
    # (Optional) Default User
    ciuser = "james"
    
    # (Optional) Add your SSH KEY
    sshkeys = <<EOF
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKo33D+SDzlil4wbP+KLzW+FNGV2g22Gc01hweOGnSWG james@blair.nz
    EOF
}