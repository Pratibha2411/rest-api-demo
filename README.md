## **Deploying REST API App on Kubernetes with Helm Charts and ArgoCD**

### **Introduction:**

This documentation provides step-by-step instructions for deploying a REST API application on Kubernetes using Helm charts and managing it with ArgoCD for GitOps. The application is built with Node.js and Dockerized for containerized deployment.

### **Prerequisites:**

- Docker installed on the local machine for building Docker images.
- Kubernetes cluster set up (e.g., using Minikube) for deployment.
- Helm installed on the local machine for managing Kubernetes applications.
- ArgoCD installed in the Kubernetes cluster for GitOps management.

### **Tools Used:**

- Docker: Containerization platform for building, packaging, and deploying applications.
- Kubernetes: Container orchestration platform for managing containerized applications.
- Helm: Package manager for Kubernetes applications.
- ArgoCD: GitOps continuous delivery tool for Kubernetes.
- **Docker/Minikube/Kubectl Installation:** [https://www.notion.so/Minikube-Installation-Guide-for-Ubuntu-f0778b09e52e44a0800620a699b4726f?pvs=4](https://www.notion.so/Minikube-Installation-Guide-for-Ubuntu-f0778b09e52e44a0800620a699b4726f?pvs=21)
- **ArgoCD Installed:** Set up ArgoCD for GitOps management of your Kubernetes deployments. You can find guide from [https://www.notion.so/Helm-Installation-9a327f6d97964fbaa6bb981ee41889d1?pvs=4](https://www.notion.so/Helm-Installation-9a327f6d97964fbaa6bb981ee41889d1?pvs=21)

**Steps:**

1. **Clone the Repository:**
    
    ```bash
    git clone https://github.com/rwieruch/node-express-server-rest-api.git
    cd node-express-server-rest-api
    
    ```
    
2. **Build Docker Image:**
    
    ```bash
    docker build -t your_docker_username/rest-api-demo .
    
    ```
    
3. **Install ArgoCD:**
    
    ```ruby
    kubectl create namespace argocd
    kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/
    ```
    
4. **Deploy Application using ArgoCD:**
- Access ArgoCD UI.
- Add your Kubernetes cluster as a target.
- Add your application repository and specify the Helm chart directory.
- ArgoCD will automatically deploy the application based on changes in the Git repository.
1. **Deploy REST API Application using Helm Charts and ArgoCD:**
- Apply the Helm chart to deploy the application:
    
    ```bash
    helm install <release_name> ./rest-api-helmdemo
    
    ```
    
- Sync the application with ArgoCD:
    
    ```bash
    argocd app sync <application_name>
    
    ```
    

**Access the Application:**

- Access your REST API application using the exposed service.
- **Deploy Helm Chart:**
    
    Ensure Helm and Tiller are configured in your Kubernetes cluster.
    

```bash
helm install <release_name> ./rest-api-helmdemo --namespace <your_namespace>

```

**Monitor Application with Prometheus, Grafana, and Loki.**
For More: https://www.notion.so/Deploying-REST-API-App-on-Kubernetes-with-Helm-Charts-and-ArgoCD-47b4c220f249472abed198b8f788f380?pvs=4

### **Conclusion:**

By following these steps, you can deploy your REST API application on Kubernetes using Helm charts and manage it with ArgoCD for GitOps. Additionally, you can monitor your application's performance and logs using Prometheus, Grafana, and Loki.

**Note:** Since Minikube was used for the Kubernetes cluster, Terraform was not utilized for infrastructure provisioning.
