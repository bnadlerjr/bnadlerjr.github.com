---
title: "JavaScript Patterns: Revealing Module"
date: 2011-04-03 15:28
---
<p>Awhile ago I wrote about the <a href="blog/2010/12/12/javascript-patterns-module/">Module Pattern</a> in JavaScript.
There is an alternative that is quite popular called the Revealing Module
Pattern that looks like this:</p>
{% gist 889245 %}
<p>The problem is, I don't like it. My main issue with this pattern is
readability: it makes it easy to fall into the trap of confusing which
functions are private vs. public. This is especially true when you come across
code that alternates private and public functions haphazardly like this:</p>
{% gist 889249 %}
<p>Yes, I know that you can just scroll down to the "return" statement to see
which functions are public, but I find that having the public function
definitions in the "return" block more intuitive when reading code. The whole
point of private functions is to provide abstraction.</p>
<p>When using the regular Module Pattern I can read the public function and
scroll up to the private definitions if needed. When reading the module from
the top I don't need to keep a mental model to track which functions are public
vs. private.</p>
