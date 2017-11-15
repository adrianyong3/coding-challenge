# Run the test in different browsers

Note: The env.rb contains the configuration for setting up different browsers.

Clone the repo

```
git clone git@github.com:adrianyong3/coding-challenge.git
```

Run the test in Chrome v60-62:
```
$ bundle install
$ cd cucumber
$ cucumber BROWSER=chrome
```

Run the test in Firefox v55 or greater:
```
$ bundle install
$ cd cucumber
$ cucumber BROWSER=firefox
```

Unfortunately I couldn't configure Safari to play nicely but if you have setup Safari to be controller by Selenium then it should work.
```
$ bundle install
$ cd cucumber
$ cucumber BROWSER=safari
```

There are 3 scenarios in the test, to run each scenario seperately do this:

```
$ cucumber BROWSER=chrome -t @navigation
$ cucumber BROWSER=chrome -t @main_features
$ cucumber BROWSER=chrome -t @filter
```

# Difficulties faced

1. The todo list items had system generated id attributes that made it diffcult to write a selector for each todo list item. Therefore I used xpath selector and based it on the todo name

2. The delete icon was only visible when you hover over the todo item

3. The app remembered the previous session todo items which meant I had to clear the todo list
