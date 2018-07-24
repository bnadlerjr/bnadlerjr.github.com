---
id: 594778db-f003-4b8e-8cd7-560004d2dcc9
title: Middleman Shadow-CLJS Project Template
date: 2018-07-24
description: "Middleman project template with Shadow-CLJS support."
image: "rear-booster.jpg"
alt: "MSZ-008 Z II(rear booster #9)"
source: "5th Luna"
url: "https://flic.kr/p/7CLTAY"
---
Awhile ago I [wrote](/articles/2018/01/28/clojurescript-with-middleman-via-shadow-cljs.html) about how to set up Shadow-CLJS with Middleman. I finally got around to making a Middleman project template to ease the process of setting up Shadow-CLJS. The source is available on [GitHub](https://github.com/bnadlerjr/middleman-shadow-cljs).

To use the template, you'll need to have Middleman and Yarn installed. You can generate a new project using [Middleman's `-T` option](https://middlemanapp.com/advanced/project-templates/) like this:

```
middleman init my_project -T bnadlerjr/middleman-shadow-cljs
```

When you run `middleman server`, your CLJS code will compiled automatically. I hope this allows more people who are familiar with Middleman to give Shadow-CLJS a try.
