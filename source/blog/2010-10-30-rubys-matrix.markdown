---
layout: post
title: "Ruby's Matrix"
date: 2010-10-30 14:45
comments: true
categories:
---
<h3>The Game of Life</h3>
<p>I attended a <a href="http://coderetreat.org/">Code Retreat</a> a few weeks ago where the exercise was to implement <a href="http://en.wikipedia.org/wiki/Conway's_Game_of_Life">Conway's Game of Life</a>. The Code Retreat was awesome and I definately recommend you check one
out. I wasn't familiar with the Game of Life before attending so afterwards I
decided to play around with different ways of implementing it.</p>
<p>I won't do into the mechanics of the game here, but one of the ways to
implement the game is to use a two-dimensional array to represent the game
"board". The heart of the game's decision engine revolves around figuring out
the neighboring values of individual cells in the array. My first thought when
I looked at it was that the game board is just a matrix, and the neighboring
cell values can be determined by extracting a sub-matrix centered around the
cell I'm looking at.</p>
<h3>StdLib FTW</h3>
<p>Since I'm doing this in Ruby, I decided to look around to see if there were
any gems that implemented basic matrices. After a little digging, I found out
that Ruby's standard library already has a <a href="http://www.ruby-doc.org/stdlib-1.9.3/libdoc/matrix/rdoc/Matrix.html">Matrix class</a>! The
Matrix class has two methods that I'm interested in, the first <a href="http://www.ruby-doc.org/stdlib-1.9.3/libdoc/matrix/rdoc/Matrix.html#method-i-minor">Matrix#minor</a>
will give me a sub-matrix. The second, <a href="http://www.ruby-doc.org/stdlib-1.9.3/libdoc/matrix/rdoc/Matrix.html#method-i-to_a">Matrix#to_a</a>,
converts a matrix to an array, which can easily be summed.</p>
<h3>Matrix Mixing</h3>
<p>I decided to write a matrix extension module that will be mixed into the
Matrix class. Here's the code:</p>
{% gist 655309 %}
<p>Using these methods allows me to implement the game board as a matrix and
leverage the standard library. I've put up a full Ruby implementation of the
game on <a href="http://github.com/bnadlerjr/game_of_life">Github</a>.</p>
