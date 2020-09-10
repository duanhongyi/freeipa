docker run --sysctl net.ipv6.conf.all.disable_ipv6=0 \
    --name freeipa-init \
    -h $1 \
    -ti --read-only \
    -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
    -v $PWD/ipa-data:/data:Z \
    -e PASSWORD=$2 \
    freeipa/freeipa-server:centos-7 \
    ipa-server-install -U -r $3 --no-ntp
