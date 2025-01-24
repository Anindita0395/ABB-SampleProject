# **GIT BRANCHING STRATEGY**
---


The git is a centralized version tool used to keep source codes enabling access to multiple team members across a project. It also helps in maintaining code versions thus helping in traceablity and rollbacks if situation arises. Centralizing the code helps in multiple developers work on it at the same time , thereby keeping a track of  commit histories made by the team.

The branching strategy that I have mostly worked on is:

**MAIN**: This is the master branch in which tested and validated codes are kept ready to be deployed in Production or is already in Production

**DEVELOP**: This is the branch in which codes tested in DEV and QA are merged here at first after testing is performed and validated in lower environments. The code from this branch is executed in the STAGE , to have a final validation before its deployment is PROD.

**FEATURE**: Feature branches are created by team memeber , based out of DEVELOP to build , modify or update the code for some new functionalities based on the requirement. FEATURE branch deploys the code in DEV and QA to build , test and validate the functionality one is trying to build.

The FLow is represented in the as shown in the below diagram:
![alt text](<A devops.PNG.png>)

To merge a code from *FEATURE TO DEVELOP* or from *DEVELOP TO MAIN* , a *PULL REQUEST* is raised which is approved by a *REVIEWER*. Once approved, the code is *SQUASH and MERGED* into the respective branches that they have rasied PR against.

---