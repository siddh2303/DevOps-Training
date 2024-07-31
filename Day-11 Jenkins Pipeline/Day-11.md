Jenkins Sample Demo

To start Jenkins:

![](1.png)After Starting Jenkins:

![](2.png)

This will be the home page.

Create a sample jenkins project to test java app which is stored inside a git repository.

![](3.png)Output of this build:

![](4.png)Create A Maven based Compile and Test build application in Jenkins for testing in a pipeline.

**Dev Compile:**

![](5.png)This will fetch the code from git repository.

![](6.png)It states version of Maven used for build. We need to set goals as compile as it will just compile the application.

![](7.png)This step needs to be done, if there is Dev Test build available. It means that whenever Dev Compile build will successfully take place, Dev Test build will be called automatically.



**Dev Test:**

![](8.png)Fetch the code from git repository.

![](9.png)Type same branch which is available inside git repository.

![](10.png)

![](11.png)

Creating a build using private repository in Git.

![](12.png)Inside this repository, there is one shell script file which will be executed inside build in Jenkins.


**To create a build:**

![](13.png)Here, along with git repository url, credentials are also passed so that the files inside it are accessed.

![](14.png)This command will run the script file whenever it is build.

![](15.png)**Create a pipeline view:**

![](16.png)This will create pipeline view which overviews about the build occuring in a sequence.

![](17.png)
