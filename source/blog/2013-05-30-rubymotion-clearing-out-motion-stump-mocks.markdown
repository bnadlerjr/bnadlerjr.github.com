---
layout: post
title: "RubyMotion: Clearing Out motion-stump Mocks"
date: 2013-05-30 17:07
comments: true
categories: rubymotion
---
This one had me "stumped" for awhile. When using
[motion-stump](https://github.com/siuying/motion-stump) mocks, you need to clear
them in an after block like this:

    after do
      Stump::Mocks.clear!
    end

Someone has submitted a
[pull request](https://github.com/siuying/motion-stump/pull/5) to motion-stump
for this to happen automatically but it hasn't been merged yet.
