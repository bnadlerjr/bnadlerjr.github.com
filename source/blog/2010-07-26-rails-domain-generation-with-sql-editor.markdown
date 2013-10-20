---
layout: post
title: "Rails Domain Generation with SQL Editor"
date: 2010-07-26 14:17
comments: true
categories:
---
<h2>Update</h2>
<p>I have a new Rails 3 compatible version called model_maker available on <a href="https://github.com/bnadlerjr/third_switch_generators">GitHub</a>.</p>
<h2>A Problem</h2>
<p>I'm a visual person by nature, so when I start a new project I like to spend
some time drawing out screens and domain models. From these I then write
features and scenarios. Today I want to talk specifically about domain
models.</p>
<p>My favorite tool right now for sketching out domain models is a tool called
<a href="http://www.malcolmhardie.com/sqleditor/">SQL Editor</a>. It allows you
to create entities with their corresponding fields, as well as relationships to
other entities. As I begin to flesh out a domain model (or a subset of one) I
like to define the characteristics of the fields such as their default values,
sizes etc. Once I'm done I have a pretty clear idea of what my initial set of
migrations and models need to look like. But there is a problem... now I have
to actually re-create this information in another form.</p>
<h2>A Solution</h2>
<p>SQL Editor has an export function that will create a migration file for you,
but it is very simplistic, and it won't generate models for you. To solve this
problem I created a <a href="http://github.com/bnadlerjr/domain">custom Rails generator</a> that takes a SQL Editor file (it is really just XML), parses it,
and not only generates the migrations, but the models along with validations
and their relationships. Not only that, but it will also generate unit tests
for you, checking for those validations and relationships.</p>
<p>Let's take a look at how this works.</p>
<ol>
<li>First, create your domain model in SQL Editor. Define relationships,
default values, required fields, etc.</li>
<li>Download the generator to a path where Rails can find it (e.g.
<tt>lib/generators</tt>)</li>
<li>Run the generator on the SQL Editor file in your Rails project
directory.</li>
<li>After the files are generated you can edit them as needed.</li>
</ol>
<h2>Some Caveats</h2>
<p>As I mentioned earlier, I use this generator at the beginning of a project,
to flesh out a basic domain quickly. Once this is done I then add to it and
refactor it using BDD or TDD. I do not recommend trying to generate your entire
model up front (unless it's a very small project).</p>
<p>Also, the generator is very basic at this point and makes the assumption
that you're using the <a href="http://github.com/thoughtbot/shoulda">Shoulda framework</a> for testing. The generator will pick up <tt>has_many</tt> and
<tt>belongs_to</tt> relationships, but as yet I have not added
<tt>has_and_belongs_to_many</tt> or <tt>has_many_through</tt>. I do plan on
adding this, however. I'd appreciate any feedback anyone might have, you can
find the project on my <a href="http://github.com/bnadlerjr/domain">GitHub page</a>.</p>
