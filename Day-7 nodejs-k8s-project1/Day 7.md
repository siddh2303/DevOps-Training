**Project 01**


In this project, you will develop a simple Node.js application, deploy it on a local Kubernetes cluster using Minikube, and configure various Kubernetes features. The project includes Git version control practices, creating and managing branches, and performing rebases. Additionally, you will work with ConfigMaps, Secrets, environment variables, and set up vertical and horizontal pod autoscaling.
## <a name="_o8l9cqx5ntwe"></a>**Project Steps**
### <a name="_wmhiyxmdw008"></a>**1. Setup Minikube and Git Repository**

![](1.png)

![](2.png)
### <a name="_agam96qgx2ow"></a>**2. Develop a Node.js Application**
#### ![](3.png)
### <a name="_tii3mvd1bko9"></a>**3. Create Dockerfile and Docker Compose**
#### ![](4.png)
### <a name="_vqtrdt917dke"></a>**4. Build and Push Docker Image**
#### ![](5.png)
### ![](6.png)
### <a name="_f90u2bvyuuaj"></a>**5. Create Kubernetes Configurations**
#### ![](7.png)
### <a name="_4h5pphrw9w12"></a>**6. Implement Autoscaling**
#### <a name="_yqu6af6rp6do"></a>**6.1 Create Horizontal Pod Autoscaler**
**Create kubernetes/hpa.yaml**:

![](8.png)
#### <a name="_9gh7fo4a7ayk"></a>**6.2 Create Vertical Pod Autoscaler**
**Create kubernetes/vpa.yaml**:

apiVersion: autoscaling.k8s.io/v1beta2

kind: VerticalPodAutoscaler

metadata:

`  `name: nodejs-app-vpa

spec:

`  `targetRef:

`    `apiVersion: apps/v1

`    `kind: Deployment

`    `name: nodejs-app-deployment

`  `updatePolicy:

`    `updateMode: "Auto"

**Apply the VPA**:

kubectl apply -f kubernetes/vpa.yaml

### <a name="_5v86s28fz07c"></a>**7. Test the Deployment**
#### ![](9.png)
### <a name="_p3upnd1za7cl"></a>**8. Git Version Control**
#### ![](10.png)
### ![](11.png)
### ![](12.png)
### <a name="_tzpzhsxz7asq"></a>**9. Final Commit and Cleanup**
![](13.png)

![](14.png)

**Project 02**

Deploy a Node.js application to Kubernetes with advanced usage of ConfigMaps and Secrets. Implement Horizontal Pod Autoscaler (HPA) with both scale-up and scale-down policies. The project will include a multi-environment configuration strategy, integrating a Redis cache, and monitoring application metrics.
## <a name="_vxos5xaqk977"></a>**Project Setup**
### <a name="_fwdw7oyvv0c5"></a>**1.1 Initialize a Git Repository**
![](15.png)

![](16.png)

![](17.png)

![](18.png)

**2. Advanced Kubernetes Configuration**

![](19.png)

![](20.png)

