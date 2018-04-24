---
id: e725948a-7607-4e86-8507-33420dd91fe9
title: Write the Assertion First
date: 2018-04-24
description: "When writing automated tests, it's helpful to right the assertion first."
image: "tests.jpg"
alt: "Running test suite on computer screen"
source: "Lachlan Hardy"
url: "https://flic.kr/p/7jN85M"
---
When writing automated tests (whether in a TDD fashion or otherwise) I find it helpful to write the assertion first, before any setup code. There are two main reasons I think it is helpful.

One, I think it's useful to [begin with the end in mind](https://www.stephencovey.com/7habits/7habits-habit2.php). Writing the assertion first helps me to focus on what piece of the feature I'm testing.

Two, it allows me to think my way through a complicated test setup. Complicated setups involving multiple objects, mocks, etc. are a test smell. However, sometimes they cannot be avoided. When working with untested legacy code, it is sometimes necessary to begin with writing coarse-grained tests that involve multiple objects. Writing the test assertion first allows me to backtrack through the various dependency points which then enables me to start thinking about which dependencies can be broken out.
