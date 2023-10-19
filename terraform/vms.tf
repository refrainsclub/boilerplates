variable "public_ssh_key" {
    type = string
}

resource "proxmox_vm_qemu" "srv-prod-1" {
    target_node = "prx-prod-1"
    vmid        = "101"
    name        = "srv-prod-1"
    desc        = "Ubuntu Server"
    onboot      = true
    clone       = "ubuntu-server-jammy-docker"
    agent       = 1
    cores       = 4
    sockets     = 1
    cpu         = "host"
    memory      = 2048
    os_type     = "cloud-init"
    ipconfig0   = "ip=10.0.0.101/24,gw=10.0.0.1"
    ciuser      = "james"
    sshkeys     = <<EOF
    ${var.public_ssh_key}
    EOF
    bootdisk="scsi0"
    scsihw="virtio-scsi-single"
    
    network {
        bridge = "vmbr0"
        model  = "virtio"
    }

    disk {
        slot     = 0
        size     = "20G"
        type     = "scsi"
        storage  = "local-lvm"
        iothread = 1
    }
}
