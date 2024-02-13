# Configuration

Definitions to install and configure Security Modules and VPN

## Base Configs

```bash
# Main packages 
sudo apt update -y 
sudo apt install dirmngr gnupg apt-transport-https ca-certificates software-properties-common 
sudo apt install kernelstub 
sudo apt upgrade -y 
 
# Disable IPV6 
sudo echo "net.ipv6.conf.all.disable_ipv6=1" >> /etc/sysctl.conf 
sudo echo "net.ipv6.conf.default.disable_ipv6=1" >> /etc/sysctl.conf 
sudo echo "net.ipv6.conf.lo.disable_ipv6=1" >> /etc/sysctl.conf 
 
sysctl -p
```

## Kernel Setup

```bash
dpkg --list |grep linux-image
sudo kernelstub --dry-run -v -k /boot/vmlinuz-6.2.0-39-generic -i /boot/initrd.img-6.2.0-39-generic 
sudo reboot 
```

## Cortex

Requirements:

- Kernel Version <= 6.2.0-34-generic
- ipv6 disabled

### Instalation

```bash
cd Cortex_XDR_Linux_Installers/X86_64 
tar xf Linux_8-1-0_42616_deb.tar.gz
sudo mkdir -p /etc/panw/ 
sudo cp cortex.conf /etc/panw/
chmod +x cortex-8.1.1.112729.deb
sudo apt install ./cortex-8.1.1.112729.deb 
```

### General Commands

- Run all tools

```bash
/opt/traps/bin/cytool runtime start all
```

- Generates logs

```bash
/opt/traps/bin/cytool log collect
```

- Run and check a scan

```bash
/opt/traps/bin/cytool scan start
/opt/traps/bin/cytool scan query
```





## SEP

```bash
cd SEP-Linux_Installers 
chmod +x LinuxInstaller 
sudo ./LinuxInstaller  
```

vai dar um erro e criar uma pasta com os arquivos dentro. Entrar nessa pasta criada.

Editar o arquivo `/etc/os-release` da seguinte forma:

```bash
sudo echo "{
NAME='Ubuntu'
VERSION='22.04 LTS'
ID=ubuntu
ID_LIKE='ubuntu debian'
PRETTY_NAME='Ubuntu 22.04 LTS'
VERSION_ID='22.04'
HOME_URL='https://pop.system76.com'
SUPPORT_URL='https://support.system76.com'
BUG_REPORT_URL='https://github.com/pop-os/pop/issues'
PRIVACY_POLICY_URL='https://system76.com/privacy'
VERSION_CODENAME=jammy
UBUNTU_CODENAME=jammy
LOGO=distributor-logo-pop-os
}" > /etc/os-release

```

Editar o arquivo `/etc/lsb-release` da seguinte forma:

```bash
sudo echo "{
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=22.04
DISTRIB_CODENAME=jammy
DISTRIB_DESCRIPTION='Ubuntu 22.04 LTS
}" > /etc/lsb-release
```

Adicionar ao installagent.sh abaixo da linha 710 a seguinte:

```bash
elif grep -qi "Pop!_OS 22.04 LTS" /etc/lsb-release 2>/dev/null; then OS=ubuntu22; PKG_MGR=apt; POSTFIX=list; PKG_MASK='\.ub(untu)?22\.'; 
```

Atualizar a linha 1758 para:

```bash
( [ $OS = ubuntu20 ] || [ $OS = ubuntu22 ] ) &&  package_depends="$package_depends libelf-dev" 
```

Baixar o certificado mais atualizado da symantec `....NEW-SDCSS-KEY.asc`

[https://knowledge.broadcom.com/external/article/172965/verifying-the-signature-of-rpmdev-packag.html]

```bash
sudo apt-key add *NEW-SDCSS-KEY.asc
```

[https://knowledge.broadcom.com/external/article/244417/symantec-endpoint-protection-sep-and-dat.html]

sudo ./installagent.sh





## Global Protect

Adicionar ao arquivo `/usr/lib/ssl/openssl.snf` o conteudo `Options = UnsafeLegacyRenegotiation`

```bash
sudo echo "Options = UnsafeLegacyRenegotiation" >> /usr/lib/ssl/openssl.snf
```



## Configuration for GWA

### Convert Certificate

```bash
sudo openssl pkcs12 -in Marcus.pfx -out Marcus.crt 
sudo openssl x509 -inform der -in GerdauNetRootCA.cer -out GerdauNetRootCA.crt 
```

### Import certificate

```bash
cp carloseduardo.crt /usr/local/share/ca-certificates
cp GerdauNetRootCA.crt /usr/local/share/ca-certificates
sudo update-ca-certificates
```