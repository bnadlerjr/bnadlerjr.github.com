---
title: "Find Method Usages with ctags and vim"
date: 2012-01-05 15:42
---
<p>I always forget how to set up ctags for a Ruby/Rails app so that I get tags
for not only the project, but also any gems specified in my Gemfile. From the
project root do:</p>
<pre><code>ctags -R `bundle show rails`/../* .</code></pre>
