# 手动拉取flannel的docker镜像
docker pull easzlab/flannel:v0.11.0-amd64
# 修改镜像名称
docker tag easzlab/flannel:v0.11.0-amd64 quay.io/coreos/flannel:v0.11.0-amd64

# 下面操作在master节点上进行
# 下载flannel资源配置清单
wget  https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

kubectl apply -f kube-flannel.yml
