---
id: 446bd035-bfb0-46ca-9028-b1753a36a3d5
title: Guidelines for Writing Commit Messages
date: 2018-10-21
description: "Middleman project template with Shadow-CLJS support."
image: "guide.jpg"
alt: "Guide"
source: "Quinn Dombrowski"
url: "https://flic.kr/p/dNStav"
---
Many developers take the skill of writing a good commit messages for granted. It is an essential skill that requires discipline. While there are a variety of guidelines and opinions about writing them, I'm going to share my current preferences. These are largely based on [Tim Pope's thoughts](https://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html) as well as [Peter Hutterer](http://who-t.blogspot.com/2009/12/on-commit-messages.html).

A well-written commit message is composed of three parts:

1. Subject
2. Body
3. Footer

Not every commit message needs to have all three, however.

## Subject
The subject line should be a short summary of the changes. It is the only required portion of a message and should be around 50 characters or less. This is arguably the most important line, since it will be seen most often.

It should be written in the imperative voice (i.e. "Fix CTA hover state on landing page" and not "Fixes ..."). This is the same voice that Git uses when it writes a commit message for you (i.e. when merging, reverting, etc.). A rule of thumb is that the subject line should complete this sentence: "If applied, this commit will *your subject line here*".

Don't put any ticket numbers from your project tracking tools in the subject line (i.e. "Closes #42: Fix CTA hover state on landing page"). These clutter up the message, place them in the footer section instead (see below). Also, do not write subject lines that only reference an issue (i.e. "Fix bug #44"). A developer should never have to open another tool just to understand a commit message.

## Body
The body of the message is optional. If present, there should be a blank line between the subject line and the body. Since Git does not wrap text automatically, the body text should be wrapped manually at 72 characters. Git will automatically indent four characters on the left of the message. If we indent four characters on the right for symmetry, we arrive at 72 characters on a standard 80 column terminal.

The body can be divided into as many paragraphs, bullet points, etc. as necessary to describe the changes. It is important that the body be used explain the reasoning behind the changes (i.e. the "what" and "why") and _not_ the "how". Future developers can see the how the changes were made by looking at the diff of the commit. They can't, however, know the reasons why the change was made, the trade-offs considered, etc. from the diff; therefore you need to convey that information in the message body.

## Footer
The footer is also optional. If present, there should be a blank line between the footer and whatever is above it (i.e. either the body or the subject line if a body is not present). It is used for issue tracker or automated bot comments. You can also use it to include other links to outside sources like documentation, blog posts, etc.
