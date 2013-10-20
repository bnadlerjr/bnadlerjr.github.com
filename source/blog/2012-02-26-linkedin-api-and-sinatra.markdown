---
title: "LinkedIn API and Sinatra"
date: 2012-02-26 15:50
---
<p>I've been playing around with the LinkedIn API and Sinatra for about a week
and wrote a tiny app. After you authenticate using your LinkedIn credentials,
the app allows you to search your connections for those that have a skill you
specify. The <a href="https://github.com/bnadlerjr/skillmatch">source code</a> can be found on
GitHub.</p>
<p>Since this was more about using the LinkedIn API gem with Sinatra the
matching algorithm is <em>very</em> naive. One interesting thing I found though
is the <a href="https://rubygems.org/gems/amatch">amatch gem</a> which is a set
of extensions that allow you to do approximate matching, searching and
comparing of strings. In the app I used the gem's Jaro-Winkler metric to
compare the search term.</p>
