---
id: a5bc73e0-bb8b-444a-a0af-69027c873e9a
title: The Most Important Question A Commit Message Should Answer
date: 2019-03-24
description: "The most important question to answer when writing a good commit message."
image: "symbol-of-context.jpg"
alt: "Symbol of context"
source: "stan bonnar"
url: "https://flic.kr/p/2n8WijN"
---
*(Note: I previously wrote this article for a blog that no longer exists, so I'm re-posting it here. I've updated a couple of the examples to use more recent ones.)*

[Many](https://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html) [people](http://who-t.blogspot.com/2009/12/on-commit-messages.html) have written about various [guidelines](https://cbea.ms/git-commit/) for writing a good commit message, [myself included](https://bobnadler.com/articles/2018/10/21/guidelines-for-writing-commit-messsages.html). While following some type of guideline is helpful, most recommendations don't address the mindset I think you should have when writing a commit message. This mindset can be summed up in one word: *context*.

In other words, the most important question that a commit message should answer is:

<blockquote class="blockquote m-lg-5 py-3 ps-4 px-lg-5">
    <p class="mb-2">What is the context I'm trying to convey for these changes?<p>
</blockquote>

Anyone can look at a diff and see what changes were made, but they can't see the reasons behind those changes. These reasons are what your commit message should convey. Let's look at some examples.

## Example A
In this example we're changing the way we deploy an application. Imagine the diff includes things like changes to deploy scripts, etc. However, the diff does cannot convey why we're making these changes, so we should provide that context in our commit message.

```
Deploy to EC2 instead of Heroku.

The application will be required in future work to have access to the <FOO>
database. However, the <FOO> DB resides in a AWS VPC instance and only
applications that reside in the same VPC can access the DB. For security
reasons, it was decided that rather than allowing access to the DB from outside
the VPC to host the widget application inside the VPC. Therefore, this
application can no longer be deployed to Heroku and instead must be deployed to
an AWS EC2 instance within the <FOO> VPC.

Switching away from Heroku requires us to set up infrastructure using Python's
Fabric library. Fabric tasks are now responsible for administering servers and
deploying the application.
```

## Example B
In this example involving some CI setup, I had to deal with some private Terraform modules. I found a blog post describing the strategy I wanted to use and included that information in the commit message. Again, it's easy to see the use of Git's `insteadOf` option in the diff. The context of why I used it is in the message.

```
CircleCI Terraform format and validate

Use the Terrform Orb to check the formatting of Terraform code and
validate it. Several of the Terraform modules we use are defined in the
ops repo which is private. Rather than hard-code the GitHub auth
token needed to access the repo, use git's `insteadOf` option to
re-write the repo's URL to include the token. We only need to do this on
CircleCI since developers already have access to the repo locally. The
GitHub token is pulled from CircleCI as an environment variable.

This [blog post][1] has a good write-up explaining this strategy in more
detail.

[1]:
https://wahlnetwork.com/2020/08/11/using-private-git-repositories-as-terraform-modules/
```

## Example C
In this final example, I try to convey the reasoning behind a particular refactor.

```
Extract and update setup for <foo> logic

Extract setup for <foo> logic from `SetupFoo` IPC
message handler and move it into the model. This gives us a clear
separation of concerns between the handler and the domain logic.

In addition, update and document the decision to not update <foo>
information for a `Bar` that has already been setup for <foo>.
```

## Conclusion
All of the above examples are from real commit messages to projects that I've made. Some names of things like databases, applications, models, etc. have been changed to something more generic since they are from private projects. Hopefully these examples will give you ideas about how to write your own commit messages. Remember, the most important question you need to answer when writing a commit message is: **What is the context I'm trying to convey for these changes?**
