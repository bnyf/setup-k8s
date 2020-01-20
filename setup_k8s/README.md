#install and enable K8S
##for master
source install_k8s.sh # install docker, kubeadm ctc.  
source master_init_k8s_sh # init k8s.   
source master_install_flannel.sh # pull and start the flannle image -- a Pod network add-on.    
##for node
source install_k8s.sh   

join k8s: kubeadm join 10.250.16.146:6443 --token 5w8vmp.zpuwn9chde7vq9j2 --discovery-token-ca-cert-hash sha256:b577acf7412994b84809120b5a0ba40c27ef0b950838a731964df16a62ef2dc9 #根据执行master_init_k8s_sh后末尾提示的内容修改ip,token和hash的值   

source node_install_flannel.sh # pull the flannel image.  