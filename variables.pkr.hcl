##################################################################################
# CREDENTIALS 
##################################################################################

variable "vcenter_username" {
    description = "The username Packer will use to login to vCenter"
    type = string
    sensitive = true
}

variable "vcenter_password" {
    description  = "The password Packer will use to login to vCenter"
    type = string
    sensitive = true
}

variable "winrm_username" {
    description = "The winrm username that is used to connect to the VM. This should match the Autounattend.xml"
    type = string
    default = "Administrator"
    sensitive = true
}

variable "winrm_password" {
    description = "The winrm password that is used to connect to the VM. This should match the Autounattend.xml"
    type = string
    sensitive = true
}
##################################################################################
# VCENTER SETTINGS
##################################################################################
variable "vcenter_insecure_connection" {
  type    = bool
  description = "If true, does not validate the vCenter server's TLS certificate."
  default = true
}

variable "vcenter_server" {
  type    = string
  description = "The fully qualified domain name or IP address of the vCenter Server instance."
  default = ""
}

variable "vcenter_datacenter" {
  type    = string
  description = "Required if there is more than one datacenter in vCenter."
  default = ""
}

variable "vcenter_host" {
  type = string
  description = "The ESXi host where target VM is created."
  default = ""
}
variable "vcenter_cluster" {
  type = string
  description = "The cluster where target VM is created."
  default = ""
}

variable "vcenter_datastore" {
  type    = string
  description = "Required for clusters, or if the target host has multiple datastores."
  default = ""
}

variable "vcenter_network" {
  type    = string
  description = "The network segment or port group name to which the primary virtual network adapter will be connected."
  default = ""
}

variable "vcenter_folder" {
  type    = string
  description = "The VM folder in which the VM template will be created."
  default = ""
}
variable "vm_name" {
  type    = string
  description = "The template vm name"
  default = ""
}
##################################################################################
# VM SETTINGS
##################################################################################

variable "vm_guest_os_type" {
  type    = string
  description = "The guest operating system type, also know as guestid."
  default = ""
}

variable "vm_version" {
  type = number
  description = "The VM virtual hardware version."
  # https://kb.vmware.com/s/article/1003746
}

variable "vm_firmware" {
  type    = string
  description = "The virtual machine firmware. (e.g. 'bios' or 'efi')"
  default = ""
}

variable "vm_cdrom_type" {
  type    = string
  description = "The virtual machine CD-ROM type."
  default = ""
}

variable "vm_cpu_sockets" {
  type = number
  description = "The number of virtual CPUs sockets."
}

variable "vm_cpu_cores" {
  type = number
  description = "The number of virtual CPUs cores per socket."
}

variable "vm_mem_size" {
  type = number
  description = "The size for the virtual memory in MB."
}

variable "vm_disk_size" {
  type = number
  description = "The size for the virtual disk in MB."
}

variable "thin_provision" {
  type = bool
  description = "Thin or Thick provisioning of the disk"
}
variable "config_parameters" {
    description = "The list of extra configuration parameters to add to the vmx file"
    type = map(string)
}

##################################################################################
# REMOVABLE MEDIA SETTINGS
##################################################################################

variable "vcenter_iso_datastore" {
    description = "The name of the Datastore in vCenter the ISOs are located on"
    type = string
}

variable "os_iso_path" {
    description = "The path to the ISO file to be used for OS installation"
    type = string
}
variable "os_iso_file" {
    description = "The name to the ISO file to be used for OS installation"
    type = string
}
variable "vmtools_iso_path" {
    description = "The path to the ISO file to be used for VMware Tools installation"
    type = string
}

variable "vmtools_iso_file" {
    description = "The name to the ISO file to be used for VMware Tools installation"
    type = string
}

variable "vm_cdrom_remove" {
    description = "Should the CDROMs be removed from the VM once build is complete"
    type = bool
    default = true
}
##################################################################################
# BUILD SETTINGS
##################################################################################
variable "build_repo" {
    description = "The URL of the repo the VM was built from"
    type = string
}

variable "vm_convert_template" {
    description = "Convert the VM to a template"
    type = bool
    default = true
}
##################################################################################
# LOCAL VARIABLES 
##################################################################################
locals {
    build_version = formatdate("YY.MM", timestamp())
    build_date = formatdate("YYYY-MM-DD hh:mm ZZZ", timestamp())
}

# Provisioner Settings

variable "powershell_scripts" {
    description = "The list of PowerShell scripts to run when the OS is ready"
    type = list(string)
}

