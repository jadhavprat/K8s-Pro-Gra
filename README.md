Web Application Deployment on AWS EKS with Prometheus Monitoring
This repository contains the configuration and code necessary to deploy a web application on Amazon Elastic Kubernetes Service (EKS). It also integrates Prometheus for monitoring the application's health, performance, and resource usage. The deployment is fully automated using Kubernetes, Helm, and Terraform.

<H1>Overview </H1>
This project covers the following key aspects:

AWS EKS Cluster Setup: The project uses Terraform to create an EKS cluster on AWS.
Web Application Deployment: The web application is packaged into Docker containers and deployed on EKS using Kubernetes Deployment and Service configurations.
Prometheus Monitoring: Prometheus is used to collect metrics and monitor the application and infrastructure performance. Grafana is integrated for visualizing the metrics collected by Prometheus.
LoadBalancer Access: The web application is exposed via a Kubernetes LoadBalancer, making it accessible from the internet.
Technologies Used
Amazon Web Services (AWS): Used to provision infrastructure, including VPC, subnets, and security groups.
Terraform: Infrastructure as Code (IaC) tool to create and manage AWS resources like EKS, EC2, VPC, and IAM roles.
Kubernetes: Orchestration platform for deploying and managing the web application.
Prometheus: Open-source monitoring system and time-series database for collecting metrics.
Grafana: Visualization tool to create dashboards and view metrics collected by Prometheus.
Helm: Package manager for Kubernetes, used for installing Prometheus and Grafana.
Prerequisites
Before starting, ensure you have the following tools installed:

AWS CLI: For interacting with AWS resources.
Terraform: For deploying the infrastructure (EKS).
kubectl: Command-line tool for interacting with the Kubernetes cluster.
Helm: For installing and managing Kubernetes applications (like Prometheus and Grafana).

Steps to Deploy
Set Up AWS EKS Cluster with Terraform:
Initialize Terraform:
terraform init
Apply the Terraform configuration to create the EKS cluster:
terraform apply

Configure kubectl: After the EKS cluster is created, configure your kubectl to interact with the cluster:
aws eks --region <region> update-kubeconfig --name <cluster-name>

Deploy the Web Application:
Create the Kubernetes resources for the web app:
Deployment: web-app-deployment.yaml
Service: web-app-service.yaml

Apply the Kubernetes YAML files:
kubectl apply -f web-app-deployment.yaml
kubectl apply -f web-app-service.yaml

Set Up Prometheus Monitoring:
Install Prometheus using Helm:
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
kubectl create namespace prometheus
helm install prometheus prometheus-community/kube-prometheus-stack

Access Your Web Application:
Get the external IP of your web application:
kubectl get svc my-web-app-service
Access the application via the LoadBalancer IP in your browser.

Access Prometheus and Grafana:
Prometheus: Port-forward to access the Prometheus UI:
kubectl port-forward svc/prometheus-kube-prometheus-prometheus -n monitoring 9090:9090
You can access Prometheus metrics at http://localhost:9090.
Grafana: Port-forward to access the Grafana dashboard:
kubectl port-forward svc/prometheus-grafana -n monitoring 3000:80
Login to Grafana with the credentials retrieved from the secret and access your application's metrics.
Customization
EKS Cluster Configuration: You can modify the eks_cluster.tf and eks_node_group.tf files to adjust the number of nodes, instance types, and other parameters of your EKS cluster.
Web Application: Customize the web app's Docker image by updating the image property in the web-app-deployment.yaml file.
Prometheus Alerts: Customize Prometheus alert rules to receive notifications based on the metrics you collect.
Monitoring with Prometheus
Prometheus is configured to collect various metrics from your EKS cluster and deployed applications. These metrics can be used to monitor:

CPU and memory usage of the web application.
Network traffic and pod health.
Custom application metrics exposed by your web application.
You can create custom Grafana dashboards to visualize the collected metrics, set up alerts for any performance anomalies, and gain insights into your application's behavior.

Conclusion
This repository provides an end-to-end solution for deploying and monitoring a web application on AWS using EKS, Prometheus, and Grafana. The infrastructure is managed using Terraform, and Kubernetes resources like Deployments and Services are used to deploy the application. Prometheus provides monitoring capabilities to ensure the health and performance of the application.

