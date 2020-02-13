# k8s 配置文档

在 centos 虚拟机上搭建k8s集群。

1. 首先根据setup_k8s文件夹下的README，安装并启动k8s环境

2. 执行下面命令查看节点状态，status全部都是Ready说明环境搭建成功
```
[root@k8s0 ~]kubectl get nodes
NAME   STATUS   ROLES    AGE   VERSION
k8s0   Ready    master   24d   v1.17.1
k8s1   Ready    <none>   24d   v1.17.1
k8s2   Ready    <none>   24d   v1.17.1
```

3. 创建一个配置nginx为3副本的replication controller对象
```
kubectl create -f nginx-rc.yml
```

4. 查看当前rc信息
```
[root@k8s0 ~]# kubectl get rc -o wide
NAME               DESIRED   CURRENT   READY   AGE   CONTAINERS   IMAGES   SELECTOR
nginx-controller   3         3         3       10h   nginx        nginx    name=nginx
```

5. 查看当前pod信息
```
[root@k8s0 ~]# kubectl get pod -o wide
NAME                     READY   STATUS    RESTARTS   AGE   IP           NODE   NOMINATED NODE   READINESS GATES
nginx-controller-6zmch   1/1     Running   0          10h   10.244.1.4   k8s1   <none>           <none>
nginx-controller-q9qvv   1/1     Running   0          10h   10.244.1.3   k8s1   <none>           <none>
nginx-controller-r9j6s   1/1     Running   0          10h   10.244.2.4   k8s2   <none>           <none>
``` 
