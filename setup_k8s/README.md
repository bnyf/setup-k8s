# Install and Enable K8S on centos

## For every node
```
# 设置主机名
# 每台服务器上设置自己的主机名k8s0、k8s1、k8s2
vi /etc/hostname
k8s0

# 修改hosts文件
# 设定节点ip对应关系,将下面ip给为自己各个节点的ip
vi /etc/hosts
10.250.16.146 k8s0
10.250.16.129 k8s1
10.250.16.134 k8s2

# 关闭防火墙,如果不关闭需要按照官方文档的要求开启相应端口
systemctl stop firewalld
systemctl disable firewalld
```

## For master node
```
source install_k8s.sh #install docker, kubeadm, etc.
source master_init_k8s_sh #init k8s.
source master_install_flannel.sh #pull and start the flannle image -- a Pod network add-on.
```

## For worker node
```
source install_k8s.sh

#join k8s, 根据在master节点上执行 master_init_k8s.sh 末尾提示的内容修改ip,token和hash的值
kubeadm join 10.250.16.146:6443 --token 5w8vmp.zpuwn9chde7vq9j2 \
--discovery-token-ca-cert-hash \
sha256:b577acf7412994b84809120b5a0ba40c27ef0b950838a731964df16a62ef2dc9

source node_install_flannel.sh #pull the flannel image.  
```
