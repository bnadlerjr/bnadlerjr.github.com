---
layout: post
title: "JavaScript Patterns: Callback"
date: 2010-11-22 14:53
comments: true
categories:
---
<p>In JavaScript, functions are objects that can be passed as arguments to
other functions. A useful pattern that lets you take advantage of this is the
the <em>Callback Pattern</em>.</p>
<p>For example, let's say you were implementing a graphing library that would
allow you to draw column and line charts. One way of writing it might be
something like this:</p>
{% gist 708799 %}
<p>The problem with this code is that the logic for calculating the x and y
positions is duplicated in each function. Extracting this to another function
is problematic because it may need all of the values that you are trying to
plot in order to calculate the positions. One way around this might be to pass
in all the values, create an array of all the and y coordinates and then draw
those. However, this requires looping twice, once over the values themselves,
and again over all the calculated coordinates.</p>
<p>This problem can be solved more efficiently by using a callback like
this:</p>
{% gist 708800 %}
<p>Here we've extracted the positioning calculations into a separate
<code>plot</code> function. This function takes an array of values to plot as
well as a function. When the <code>plot</code> function is called, we iterate
over the values and calculate the x and y positions. We then pass the x and y
coordinates as well as the actual value to the <code>drawingCallback</code>
function which handles the actual drawing. This way we're able to keep our code
DRY and efficient.</p>
