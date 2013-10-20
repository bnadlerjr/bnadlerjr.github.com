---
layout: post
title: "Faking Data with Ranges in Ruby"
date: 2010-08-12 14:38
comments: true
categories:
---
<p>On a recent project I needed to create some fake data for some reporting
screens. I was using <a href="http://staticmatic.rubyforge.org/">StaticMatic</a> to generate a mockup
site and decided to try out the <a href="http://faker.rubyforge.org/">Faker</a>
gem for creating the data. Faker worked out well, but it doesn't have any
support for generating numerical data.</p>
<p>Generating a random number in Ruby is easy with <a
href="http://ruby-doc.org/core/classes/Kernel.html#method-i-rand">Kernel::rand</a>,
but I wanted to generate numbers within a certain range. My first attempt
resulted in a helper method like this:</p>
{% gist 522115 %}
<p>I had the feeling that this was an inelegant solution, but I wasn't sure of
a better approach, so I just moved on. Later that day it hit me: why not use a
<a href="http://ruby-doc.org/core/classes/Range.html">Range</a> object? So I
re-opened the Range class and added this method:</p>
{% gist 518454 %}
<p>The cool part is that this will not only pull a random number from a number
range but it also should work with other types of ranges like dates, for
example.</p>
