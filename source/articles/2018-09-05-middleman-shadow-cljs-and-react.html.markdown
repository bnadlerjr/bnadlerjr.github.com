---
id: b7ced522-28e6-4693-a1ac-a43ba53cdbfb
title: Middleman, Shadow-CLJS and React
date: 2018-09-05
description: "Adding React to a Middleman and Shadow-CLJS app via Reagent."
image: "shadows.jpg"
alt: "shadows"
source: "wolfgangfoto"
url: "https://flic.kr/p/4M69SN"
---
A few months ago I [wrote](/articles/2018/01/28/clojurescript-with-middleman-via-shadow-cljs.html) about integrating Middleman with Shadow-CLJS. Today I'm going to expand on that by showing you how to add React to the mix by making a simple [BMI](https://en.m.wikipedia.org/wiki/Body_mass_index) calculator from scratch. I'm not going to spend too much time explaining the Reagent code, there are plenty of great tutorials online for that already. If you want to skip the explanations for now and jump right into the code, you can find it on [GitHub](https://github.com/bnadlerjr/bmi).

Let's start off by creating a new project. I'm going to use my Middleman [template](https://github.com/bnadlerjr/middleman-shadow-cljs) that includes a basic setup for Shadow-CLJS.

```bash
middleman init bmi -T bnadlerjr/middleman-shadow-cljs
```

The first thing we need to do is add our React dependencies as well as [Reagent](https://reagent-project.github.io), which is a CLJS wrapper for React. We add the React dependencies in `package.json`.

```javascript
{
  "private": true,
  "dependencies": {
    "create-react-class": "^15.6.3",
    "react": "^16.4.1",
    "react-dom": "^16.4.1"
  },
  "devDependencies": {
    "shadow-cljs": "^2.0.144"
  }
}
```

Next we add Reagent to `shadow-cljs.edn`.

```clojure
;; shadow-cljs configuration
{:source-paths
 ["source/cljs"]

 :dependencies
 [[reagent "0.8.1"]]

 :builds
 {:app {:target :browser
        :output-dir ".tmp/javascripts"
        :asset-path "/javascripts"
        :modules {:site {:entries [bmi.core]}}
        :devtools {:repl-init-ns bmi.core
                   :before-load bmi.core/stop
                   :after-load bmi.core/start}}}}
```

We're also going to add an entry for [devtools](https://shadow-cljs.github.io/docs/UsersGuide.html#devtools). This will allow us to refresh the app in the browser whenever any code changes are made.

Next we can remove the default generated content in `index.html.erb` and replace it with a single `div` element.

```html
<div id="bmi-component"></div>
```

We haven't written it yet, but let's also setup the call to our initialization function in `layout.erb`

```html
<body>
  <%= yield %>
  <%= javascript_include_tag "site" %>
  <script>bmi.core.init();</script>
</body>
```

We're now ready to start building our first Reagent component. Here's the code:

```clojure
(ns bmi.core
  (:require [reagent.core :as reagent]))

(defn bmi-diagnose
  [bmi]
  (cond
    (< bmi 18.5) ["orange" "underweight"]
    (< bmi 25) ["inherit" "normal"]
    (< bmi 30) ["orange" "overweight"]
    :else ["red" "obese"]))

(defn calculate-bmi
  [height-cm weight-kg]
  (let [height-m (/ height-cm 100)]
    (/ weight-kg (* height-m height-m))))

(defn update-state
  [state param event]
  (swap! state assoc param (.-target.value event)))

(defn bmi-component
  []
  (let [state (reagent/atom {:height 180 :weight 80})]
    (fn []
      (let [{:keys [height weight]} @state
            bmi (calculate-bmi height weight)
            [color description] (bmi-diagnose bmi)]
      [:div
       [:h1 "BMI Calculator"]
       [:div "Height: " height "cm"
        [:input {:type "range"
                 :value height
                 :min 100
                 :max 220
                 :on-change (partial update-state state :height)}]]
       [:div "Weight: " weight "kg"
        [:input {:type "range"
                 :value weight
                 :min 30
                 :max 150
                 :on-change (partial update-state state :weight)}]]
       [:div "BMI: " (int bmi) " " [:span {:style {:color color}} description]]]))))

(defn start
  []
  (reagent/render [bmi-component]
                  (.getElementById js/document "bmi-component")))

(defn stop
  [])

(defn ^:export init
  []
  (start))
```

Let's start from the bottom, where we have our `init`, `start`, and `stop` functions. `init` will be called from `layout.erb` on initial page load. `start` and `stop` are called by Shadow-CLJS whenever any code changes are made in development mode. `start` takes care of hooking up our React component to the DOM. Technically, we don't need `stop` for this app, but I wanted to show a complete example setup.

Above that, we have our Reagent component, which sets up some state and draws two slider inputs for height and weight. Updating one or both of the sliders updates the respective values in the component state. I know I mentioned earlier that I wasn't going into too much detail on the CLJS code, but one pattern that I'll mention here is the use of the `partial` function.

I find this pattern very useful whenever I need to update some state that is triggered by some user interaction. The `on-change` function needs access to the local component state. We could inline it, but that can get messy quickly both from a readability standpoint and a code duplication one. Extracting it to a standalone function means that whatever function we write would have to return a function that closes over whatever arguments the function needs (`state` and `params` in this case). So we could write it like this:

```clojure
(defn update-state
  [state param]
  (fn [event]
    (swap! state assoc param (.-target.value event))))
```

However, in my opinion a more CLJS idiomatic way of doing that is to use `partial` which essentially does the same thing as the example above. It partially applies our `state` and `params` arguments and returns a function that accepts an `event`.

Finally, above that we have our BMI calculation and our "diagnose" function which is used to add some color to our BMI output.

That's the entire application! Again, you can find all the source code on my [GitHub account](https://github.com/bnadlerjr/bmi).
