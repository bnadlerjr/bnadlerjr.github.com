---
title: "Rails 3 Generators: Lookup Paths"
date: 2010-12-30 15:11
---
<p>Apparently the new Rails 3 generators do not support looking up custom
generators in <code>~/.rails/generators</code> anymore. Here is a bash function
that copies a generator from <code>~/.rails/generators/GENERATOR</code> into
your rails app so that it can be used without having to turn it into a plugin /
gem.</p>
{% gist 759924 %}
<p>Note that Rails 3 does not support older 2.x style generators so you have
have to re-write those using the new Thor syntax. Here are some helpful
links:</p>
<ul>
<li><a href="http://edgeguides.rubyonrails.org/generators.html">Rails Guides</a></li>
<li><a href="http://api.rubyonrails.org/classes/Rails/Generators/Actions.html">Rails specific Thor actions</a></li>
<li><a href="http://rdoc.info/github/wycats/thor">Thor Docs</a></li>
</ul>
