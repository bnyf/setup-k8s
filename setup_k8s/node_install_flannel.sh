# 手动拉取flannel的docker镜像
docker pull easzlab/flannel:v0.11.0-amd64
# 修改镜像名称
docker tag easzlab/flannel:v0.11.0-amd64 quay.io/coreos/flannel:v0.11.0-amd64
