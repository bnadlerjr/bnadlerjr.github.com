---
id: 2204b654-883b-4bcf-a976-e3ec9a2fa5a9
title: One Tip for Writing Better Git Commit Messages
date: 2024-05-26
description: "Learn how to improve your Git commit messages by avoiding the -m flag. Use your editor to craft detailed and useful commit messages. Find out why this method is more effective and how it can benefit your development workflow."
image: "caution-bronze-may-be-hot.jpg"
alt: "A caution sign on a wooden bench warning that the bronze may be hot."
source: "Kevin Spencer"
url: "https://flic.kr/p/HRBWtM"
---
Want to improve the quality of your Git commit messages? Here's a quick tip: don't rely on the `-m` flag when writing the message.

Over the years I've noticed something about the people I worked with that wrote great commit messages. None of them relied on the `-m` flag. Instead they used their configured `$EDITOR` (or IDE) to write the message.

Here's what I mean. Most people I've seen write their commit messages using the `-m` flag like this:

```bash
git commit -m "User name is no longer required"
```

There's another way though, if you have an `$EDITOR` configured and omit the `-m` flag, Git will open your configured `$EDITOR` with a diff of the changes like this:

```bash
git commit
```

```

# Please enter the commit message for your changes. Lines starting
# with '#' will be ignored, and an empty message aborts the commit.
#
# On branch main
# Your branch is up to date with 'origin/main'.
#
# Changes to be committed:
#	modified:   lib/gql_example/user.rb
#
# ------------------------ >8 ------------------------
# Do not modify or remove the line above.
# Everything below it will be ignored.
diff --git a/lib/gql_example/user.rb b/lib/gql_example/user.rb
index 42382f8..df64a0d 100644
--- a/lib/gql_example/user.rb
+++ b/lib/gql_example/user.rb
@@ -17,7 +17,7 @@ module GqlExample
     def validate
       super
 
-      validates_presence %i[email name]
+      validates_presence %i[email]
       validates_unique :email
     end
```

In the above example, I've specified vim as my `$EDITOR`, but this also works with other editors and IDEs. As you can see, I get a place for my commit message at the top, and a diff of my changes at the bottom. Now I can add my message:

```
User name is no longer required

Since we're changing the navigation bar to include the user's email instead of their name, we no longer need to require their name.
# Please enter the commit message for your changes. Lines starting
# with '#' will be ignored, and an empty message aborts the commit.
#
# On branch main
# Your branch is up to date with 'origin/main'.
#
# Changes to be committed:
#	modified:   lib/gql_example/user.rb
#
# ------------------------ >8 ------------------------
# Do not modify or remove the line above.
# Everything below it will be ignored.
diff --git a/lib/gql_example/user.rb b/lib/gql_example/user.rb
index 42382f8..df64a0d 100644
--- a/lib/gql_example/user.rb
+++ b/lib/gql_example/user.rb
@@ -17,7 +17,7 @@ module GqlExample
     def validate
       super
 
-      validates_presence %i[email name]
+      validates_presence %i[email]
       validates_unique :email
     end
```

The above example is a made up change, but you get the idea.

When I began writing my commit messages this way, I started to receive feedback about how more useful my commit messages had become. I think it was for several reasons.

First, by using my `$EDITOR` I had a diff I could easily refer to when writing the message. This helped me make sure I wasn't forgetting anything important about the changes that were made.

Second, and more importantly, it allowed me to focus on the the [most important question a git commit message should answer](https://bobnadler.com/articles/2019/03/24/the-most-important-question-a-commit-message-should-answer.html). It became easy for me to see when I was parroting what the changes (since I could see them in the editor) were in the message instead of why I was making them.

Have you tried switching from `-m` to using your `$EDITOR` for Git commit messages? Share your experiences and tips below!
