vm_name   = "WIN2022-TEMPLATE"
vm_firmware = "efi"
vm_hardware_version = 17
vm_cpu_sockets = 2
vm_cpu_cores = 1
vm_mem_size = 4096
vm_disk_size = 102400
thin_provision  = true
vm_disk_controller_type     = ["pvscsi"]
vm_network_card             = "vmxnet3"

os_iso_file = ""
vmtools_iso_path = ""
vmtools_iso_file = ""
vm_cdrom_remove = true
vm_convert_template = true
winrm_username = "Administrator"
winrm_password = "VMware1!"