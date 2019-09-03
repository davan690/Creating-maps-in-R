---
layout: post
title: "Jekyll in RStudio"
subtitle: "A collection of resources for blogging in RStudio"
image: /img/tools.jpg
bigimg: /img/RStudio-jekyll-serious-win.PNG
tags: ["compile", "r", "rmd", "RStudio", "tools", "general"]
permalink: /rmd-to-jekyll.html
---

As with all github projects there always seems to be someone else who has managed to explain and write a blog about what you need, just when you need it... I wish :)

This is an collection of resources I have used to make this happen. I think this is a massive leap for reproducible workflow and in particular, science commumication but I will build on this thoughout the website.

## Tutorials and Blogs

- [emily zabor](https://www.emilyzabor.com/tutorials/rmarkdown_websites_tutorial.html)
- [emitanaka](https://emitanaka.rbind.io/post/scientific-and-technical-blogging-radix-vs-blogdown-remix/)
- [yinting chou](https://yintingchou.com/posts/jekyll-website-with-github-github-pages-and-r-markdown/)
- [Another fellow students examples](https://jfiksel.github.io/2017-01-25-hello-world/)

I found this blog explaining how [Jacob Fiksel](https://jfiksel.github.io/) steps through the process very helpful.

## My notes

These are my take home points and things I found hard.

1.  Need all the basics to begin with (GIThub, Jekyll, R, RStudio).

2. Key run code

```
??bundle gem install jekyll??

bundle exec jekyll build

bundle exec jekyll serve --watch
```

3. View/run in RStudio

```R
> servr::jekyll()

Serving the directory C:\GIT\davan690.github.io at http://127.0.0.1:5652
```

4. Stop server

> ```servr::daemon_stop(3)```



### ERRORs

#### 1. missing jekyll

```Warning message:
In system2("jekyll", "build"):
'"jekyll"' not found NULL
```

I found I needed to install ruby gems for jekyll

```??bundle gem install jekyll??```

