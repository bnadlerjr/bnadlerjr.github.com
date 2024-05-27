---
title: "Rails Domain Generation with SQL Editor"
date: 2010-07-26
description: "Generating Rails models with SQL Editor"
---
*Update: I have a new Rails 3 compatible version called [model_maker](https://github.com/bnadlerjr/third_switch_generators) available on GitHub.*

##A Problem
I'm a visual person by nature, so when I start a new project I like to spend some time drawing out screens and domain models. From these I then write features and scenarios. Today I want to talk specifically about domain models.

My favorite tool right now for sketching out domain models is a tool called [SQL Editor](https://www.malcolmhardie.com/sqleditor/). It allows you to create entities with their corresponding fields, as well as relationships to other entities. As I begin to flesh out a domain model (or a subset of one) I like to define the characteristics of the fields such as their default values, sizes etc. Once I'm done I have a pretty clear idea of what my initial set of migrations and models need to look like. But there is a problem... now I have to actually re-create this information in another form.

##A Solution
SQL Editor has an export function that will create a migration file for you, but it is very simplistic, and it won't generate models for you. To solve this problem I created a [custom Rails generator](https://github.com/bnadlerjr/domain) that takes a SQL Editor file (it is really just XML), parses it, and not only generates the migrations, but the models along with validations and their relationships. Not only that, but it will also generate unit tests for you, checking for those validations and relationships.

Let's take a look at how this works.

1. First, create your domain model in SQL Editor. Define relationships, default values, required fields, etc.
2. Download the generator to a path where Rails can find it (e.g. <code>lib/generators</code>)
3. Run the generator on the SQL Editor file in your Rails project directory.
4. After the files are generated you can edit them as needed.

##Some Caveats
As I mentioned earlier, I use this generator at the beginning of a project, to flesh out a basic domain quickly. Once this is done I then add to it and refactor it using BDD or TDD. I do not recommend trying to generate your entire model up front (unless it's a very small project).

Also, the generator is very basic at this point and makes the assumption that you're using the [Shoulda framework](https://github.com/thoughtbot/shoulda) for testing. The generator will pick up <code>has\_many</code> and <code>belongs\_to</code> relationships, but as yet I have not added <code>has\_and\_belongs\_to\_many</code> or <code>has\_many\_through</code>. I do plan on adding this, however. I'd appreciate any feedback anyone might have, you can find the project on my [GitHub page](https://github.com/bnadlerjr/domain).
