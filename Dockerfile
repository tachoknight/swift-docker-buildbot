FROM fedora:rawhide

RUN dnf -y update
RUN dnf -y install gcc rpm-build rpm-devel rpmlint make python bash diffutils patch rpmdevtools git fedora-packager @development-tools
ADD create-n-build.sh /root
RUN chmod +x /root/create-n-build.sh
