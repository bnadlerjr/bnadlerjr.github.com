---
title: "Spellbook: Rails 3 Application Generator"
date: 2011-02-21 15:17
---
<p>Spellbook is a Rails 3 application generator that aims to make the tedious
parts of setting up a new Rails app trivial. You define various settings in
YAML and Spellbook runs through each of them prompting you for your choice.
After all your choices have been made Spellbook executes the 'pre_bundle' code
for each one, runs 'bundle install' and then runs any 'post_bundle' code.</p>
<p>It's just a single file gist so you can easily tweak it for your needs.</p>
<p><strong>Edit:</strong> For those that do not know how to run this with the
'rails' command, you pass the '-m' option with the path to this file. For
example, I have this in my bashrc:</p>
<pre><code>function rspell {
  rails new $1 -m ~/dev/spellbook/spellbook.rb $@
}
</code></pre>
{% gist 757372 %}
