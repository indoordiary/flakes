# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "usbhid" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = { 
      device = "/dev/disk/by-uuid/fcfad97d-0ac1-4440-af84-13ade7735078";
      fsType = "btrfs";
      options = [
        "subvol=@"
        "compress=zstd"
     ];
    };

  fileSystems."/home" = { 
      device = "/dev/disk/by-uuid/fcfad97d-0ac1-4440-af84-13ade7735078";
      fsType = "btrfs";
      options = [
        "subvol=@home"
        "compress=zstd"
     ];
    };

  fileSystems."/nix" = {
      device = "/dev/disk/by-uuid/fcfad97d-0ac1-4440-af84-13ade7735078";
      fsType = "btrfs";
      options = [
        "subvol=@nix"
        "compress=zstd"
        "noatime"
     ];
    };

  fileSystems."/boot" = {
      device = "/dev/disk/by-uuid/4DE5-6878";
      fsType = "vfat";
    };

  swapDevices = [ { device = "/dev/disk/by-uuid/69f6b62c-faaf-4c03-a15f-8c10d6af490a"; } ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp4s0f4u1u4c2.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp1s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
