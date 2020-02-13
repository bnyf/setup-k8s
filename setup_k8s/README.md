# Install and Enable K8S on centos

## For every node
1. 设置主机名，每台服务器上设置自己的主机名k8s0、k8s1、k8s2 
```
vi /etc/hostname
k8s0
```

2. 修改hosts文件, 将节点IP和名称一一对应
```
vi /etc/hosts
10.250.16.146 k8s0
10.250.16.129 k8s1
10.250.16.134 k8s2
```

3. 关闭防火墙,如果不关闭需要按照官方文档的要求开启相应端口
```
systemctl stop firewalld
systemctl disable firewalld
```

## For master node
1. 安装 docker, kubeadm 等必要组件
```
source install_k8s.sh
```

2. 初始化k8s  
```
source master_init_k8s_sh
```

3. 安装网络插件Flannel
```
source master_install_flannel.sh
```

## For worker node
1. 安装 docker, kubeadm 等必要组件。
```
source install_k8s.sh
```

2. worker节点加入 k8s集群, 以下指令为master节点执行 master_init_k8s.sh 脚本成功后给的提示，根据提示的内容修改ip,token和hash的值
```
kubeadm join 10.250.16.146:6443 --token 5w8vmp.zpuwn9chde7vq9j2 \
--discovery-token-ca-cert-hash \
sha256:b577acf7412994b84809120b5a0ba40c27ef0b950838a731964df16a62ef2dc9
```

3. 安装网络插件Flannel
```
source node_install_flannel.sh
```
