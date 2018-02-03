---
id: df7778ff-d191-47f1-903f-6ae2d8150a35
title: Formatting Currency in JavaScript
date: 2018-02-02
description: "Using JavaScripts Intl.Numberformat to format currency."
image: "coins.jpg"
alt: "5 different coins in 5 different currency units (Japanese yen, Taiwanese dollar, Malaysian ringgit, US cent, Thai baht)"
source: "aotaro"
url: "https://flic.kr/p/spKXrh"
---
The other day I needed to format some currency values in JavaScript. I remembered coming across [Intl.NumberFormat](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/NumberFormat) a long time ago on another project, but browser support was sketchy. I looked up the most recent info on [caniuse](http://caniuse.com/#feat=internationalization) and thankfully almost all browsers now support it (the only exception is Opera Mini). Let’s take a look at how we can use it for formatting some currency values.

```javascript
var formatter = new Intl.NumberFormat('en-US', {
  style: 'currency',
  currency: 'USD'
});

formatter.format(4200); /* $4,200.00 */
```

That's it! Check out the [MDN docs](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/NumberFormat) for more info on other options that are also available.
