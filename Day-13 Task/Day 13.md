### <a name="_gnmjblebwbbw"></a>**Multi-Branch Project**
#### <a name="_hkli004jp0u3"></a>**Project Overview**
- Create a simple Java Maven project.
- Version-control the project using Git with multiple branches.
- Set up Jenkins multi-branch pipeline for automated build and deployment.
- Utilize Jenkins environment variables in the Jenkinsfile.
#### <a name="_t6dvywegyy0e"></a>**Project Objectives**
- Version-control using Git.
- Jenkins multi-branch pipeline setup.
- Environment variable management using Jenkinsfile.
#### <a name="_boctaqfm7dic"></a>**Project Deliverables**
1. **Git Repository:**
   1. Local Git repository initialized.
   1. Branches: development, staging, and production.
   1. Repository pushed to remote Git server (e.g., GitHub, GitLab, Bitbucket).

![](1.png)

![](2.png)

![](3.png)

![](4.png)

**Main.java:**

![](5.png)

1. **Jenkins Setup:**
   1. Multi-branch pipeline job configured in Jenkins.
   1. Jenkinsfile defining build and deployment steps.
   1. Environment variables managed using Jenkins environment variable settings.

**Jenkinsfile:**



![](6.png)**To create environment variable inside Jenkins:**

![](7.png)**Create a Jenkins project having type Multibranch Pipeline**

![](8.png)**Add git repository:**

![](9.png)**Build-1 Development branch:**

![](10.png)**Build-2 Staging:**

![](11.png)**Build-3 Production:**

![](12.png)
