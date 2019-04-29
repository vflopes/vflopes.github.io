---
title: 'Git Ops: git with operations powers'
date: 2019-04-28 11:18:57
tags:
- git
- ops
- ci
- cd
- sre
categories:
- SRE
---

I've always had the philosophy that everything that is needed to run a project should be in your repository. A developer must be able to deliver their release with all reliability steps (CI/CD) performing all operations if they form self-contained.

This philosophy is very similar to the feature that some projects have called zero configuration. Projects have dependencies. Notice when you have a package.json you don't have to configure each dependency manually, just run `npm install` and you will have everything you need in your repository.

What about the CI/CD? Well, today we can create the pipelines through files in your project, this works for Jenkins, GitLab, Travis and others. But you will still get to rely on the external tool and configured properly to run the pipelines. This creates one of the biggest drawbacks of today's projects: lock-in.

If I configure **.gitlab-ci.yaml** how do I run the same pipeline if I need my project to go through Jenkins? And worse, if I want to test my pipeline locally do I need to have GitLab send run on my machine? I'm not saying that these tools are not good for this reason, it's a matter of choice about having a self-contained project or not.

### How I solved this problem

Anyone who has had experience with continuous integration, deployment, delivery knows what it takes to run a pipeline to ensure your testing, builds, releases, deployments, and so on. In all these steps we deal with various configurations, variables, constants, sensitive data (think about SSH keys, certificates, passwords, API keys).

So I listed some common attributes to create a self-contained CI/CD tool in the project:

* **Security:** Sensitive data or dependencies can be generated from or used by pipelines, for that I used the format KDBX.
* **Versioned database:** Each pipeline execution can generate data that must be stored and versioned in the repository itself (think about changelogs), once again the KDBX can be stored in the repository itself.
* **Ease of management:** No one wants something complicated or difficult or with a list of huge commands to decorate to simply create their pipelines, so I created the "ops pack" a way to create the KDBX through a project that informs how the database file should be composed.
* **Scripting:** Of course, this is the heart of the pipelines, you need to be able to create the scripts to perform the confidence steps, so I added support for shell scripting and Javascript (NodeJS 10).
* **Friendly:** To have a painless adoption by developers, devops and SREs should be something very friendly, for this I created this software as a git subcommand.

### What is the result?

The [git-ops](https://github.com/exocet-engineering/git-ops) project in the project README in 2 minutes you will be able to have all this in your project without getting stuck with any tool.
