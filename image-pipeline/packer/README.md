# Multi-Cloud Image Pipeline with Hashicorp Packer

# Download and Install:
- Download from: https://www.packer.io/downloads.html
- Unzip the downloaded package into a directory where Packer will be installed. 
- On Unix systems, ~/packer or /usr/local/packer is generally good, depending on whether you want to restrict the install to just your user or install it system-wide. 
- On Windows systems, you can put it anywhere
- After unzipping the package, the directory should contain a single binary program called packer. 
- The final step to installation is to make sure the directory you installed Packer to is on the PATH
- Linux: https://stackoverflow.com/questions/14637979/how-to-permanently-set-path-on-linux
- Windows: https://stackoverflow.com/questions/1618280/where-can-i-set-path-to-make-exe-on-windows

#Run it:
~~~~~~
$ packer
usage: packer [--version] [--help] <command> [<args>]

Available commands are:
    build       build image(s) from template
    fix         fixes templates from old versions of packer
    inspect     see components of a template
    push        push template files to a Packer build service
    validate    check that a template is valid
    version     Prints the Packer version
~~~~~~	
