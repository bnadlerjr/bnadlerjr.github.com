---
id: b0333d86-d1ec-418b-bc62-430e730a07ed
title: Why I Use Test Driven Development
date: 2024-06-08
description: "Discover why I believe Test Driven Development is beneficial for software development. Learn how TDD ensures testable code and encourages better interfaces."
image: "vintage-space-orbit-display-device.jpg"
alt: "Vintage space orbit display device with a globe and control knobs indicating orbit time, polar alignment, and inclination degrees."
source: "Steve Jurvetson"
url: "https://flic.kr/p/2owNqf1"
published: true
---
I first heard about Test Driven Development (TDD) in 2003. I have been using it ever since. People ask me from time to time about TDD and why I find it useful. This post is an attempt to answer that question that I can point to when someone asks.

First off, I want to make it clear that although I enjoy writing code using TDD, I don't do it 100% of the time. That being said, I believe I use it more than the average developer.

One assumption I'm going to make is that you agree with the idea that writing some kind of automated tests is useful. If you don't agree, this article won't try to convince you otherwise.

### Ensuring Testable Code

One reason I write tests first is that ensures the code I'm writing is inherently testable. By writing tests first, I avoid having to change the implementation just to get certain tests to work. I also know that the test code is (most likely) not tightly coupled to the implementation code. This is a good thing, because it means I can refactor my code as needed without breaking tests. The tests don't care about how a certain feature is implemented, they only care about the results. This decoupling is beneficial because it allows for easier refactoring without breaking tests.

### Encouraging Better Interfaces

Writing tests first encourages me to think about and create more usable and consistent internal interfaces. I can't remember where I first read it, but early on when I was first learning about TDD, I remember reading about how tests were the first API client of your code. When tests are highly coupled to the implementation, they tend to have poor internal interfaces and leak implementation details, which makes them harder to work with and refactor. Writing a test first forces you to think about how the internal API should work. You might not get it right the first time, but in my experience, you'll create better internal interfaces on average.

### Inherently Testable Systems

Finally, TDD ensures that the system is inherently testable. By writing tests first, you're building testability into the design of your system. This approach makes it easier to maintain and extend your system over time.

For me, TDD offers several advantages: ensuring testable code, encouraging better interfaces, and creating testable systems. While I don't use TDD 100% of the time, it's a valuable approach that I use frequently to improve the quality and maintainability of the code I write.

I've intentionally avoided discussing the types of tests that you can write when practicing TDD (i.e. unit, functional, integration, etc.). This is a big topic that I'll try to write a separate post on.
