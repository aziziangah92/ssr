# ssr

export KUBECONFIG=/home/user/.bluemix/plugins/container-service/clusters/us/kube-config-hou02-us.yml

kubectl run sss --image=yuxizhe/sss --port=443
kubectl run ssr --image=yuxizhe/ssr --port=443 

kubectl expose deployment sss --target-port=443 --type=LoadBalancer

kubectl exec -it sss-6474467cf6-qxj2b -- /bin/bash
kubectl exec -it ssr-6d4588f96f-wm7xg sh
---
ssserver -c /etc/shadowsocks.json -d start
python server.py -c config.json
---
kubectl get service sss
