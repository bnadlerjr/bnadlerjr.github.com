---
layout: post
title: "Turn a Ruby Array into a Hash"
date: 2013-03-03 16:10
comments: true
categories:
---
I always forget the syntax for this:

``` ruby
ary = [:a, 1, :b, 2, :c, 3]
Hash[*ary] # => { :a => 1, :b => 2, :c => 3 }
```
