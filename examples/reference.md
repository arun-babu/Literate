# Reference

## Introduction

If you want to see an actual example of a literate program, check out
`wc.lit` or `hangman.lit`.

This file attempts to showcase most of, if not all of the features
of Literate. It is meant to be used as a reference for writing
your own literate programs so you can see how certain features are
used.

## Math Equations

To use math equations in your code, Literate uses 
[katex](https://github.com/Khan/KaTeX). To write an equation simply
place dollar signs (`\$`) around the equation and use Latex/Tex formatting. 
Here is an example equation: $f(x) = \int_{-\infty}^\infty\hat f(\xi)\,e^{2 \pi i \xi x}\,d\xi$.

If you want the equation to be centered instead of inlined, use double
dollar signs (`\$\$`):

$$f(x) = \int_{-\infty}^\infty\hat f(\xi)\,e^{2 \pi i \xi x}\,d\xi$$

## Including your own CSS

<iframe width="420" height="315"
src="https://www.youtube.com/embed/XGSy3_Czz8k?autoplay=0">
</iframe><br/><br/>

If you don't like the default CSS styling that literate uses, you can
override or add to it. There are three different commands associated with
the CSS: `@add_css` `@override_css` `@colorscheme`. The first two deal with
the CSS for the overall file, and the last specifies the CSS to use for
syntax highlighted code blocks. You can get colorschemes from 
[here](https://jmblog.github.io/color-themes-for-google-code-prettify/)

For example here is the colorscheme file for a github syntax highlighting
theme that I downloaded from there:

```css
--- github.css
/* GitHub Theme */
.prettyprint {
  background: white;
  font-family: Menlo, 'Bitstream Vera Sans Mono', 'DejaVu Sans Mono', Monaco, Consolas, monospace;
  font-size: 12px;
  line-height: 1.5;
  border: 1px solid #ccc;
  padding: 10px;
}

.pln {
  color: #333333;
}

@media screen {
  .str {
    color: #dd1144;
  }

  .kwd {
    color: #333333;
  }

  .com {
    color: #999988;
  }

  .typ {
    color: #445588;
  }

  .lit {
    color: #445588;
  }

  .pun {
    color: #333333;
  }

  .opn {
    color: #333333;
  }

  .clo {
    color: #333333;
  }

  .tag {
    color: navy;
  }

  .atn {
    color: teal;
  }

  .atv {
    color: #dd1144;
  }

  .dec {
    color: #333333;
  }

  .var {
    color: teal;
  }

  .fun {
    color: #990000;
  }
}
@media print, projection {
  .str {
    color: #006600;
  }

  .kwd {
    color: #006;
    font-weight: bold;
  }

  .com {
    color: #600;
    font-style: italic;
  }

  .typ {
    color: #404;
    font-weight: bold;
  }

  .lit {
    color: #004444;
  }

  .pun, .opn, .clo {
    color: #444400;
  }

  .tag {
    color: #006;
    font-weight: bold;
  }

  .atn {
    color: #440044;
  }

  .atv {
    color: #006600;
  }
}
/* Specify class=linenums on a pre to get line numbering */
ol.linenums {
  margin-top: 0;
  margin-bottom: 0;
}

/* IE indents via margin-left */
li.L0,
li.L1,
li.L2,
li.L3,
li.L4,
li.L5,
li.L6,
li.L7,
li.L8,
li.L9 {
  /* */
}

/* Alternate shading for lines */
li.L1,
li.L3,
li.L5,
li.L7,
li.L9 {
  /* */
}
---
```

I've enabled this colorscheme at the top of the file.

## Including HTML

you'd like to include a table:<br/><br/>

<style>
table, th, td {
    border: 1px solid black;
    padding: 5px;
}
table {
    border-spacing: 15px;
}
</style>

<table style="width:100%">
  <tr>
    <td>Jill</td>
    <td>Smith</td>      
    <td>50</td>
  </tr>
  <tr>
    <td>Eve</td>
    <td>Jackson</td>        
    <td>94</td>
  </tr>
  <tr>
    <td>John</td>
    <td>Doe</td>        
    <td>80</td>
  </tr>
</table><br><br>

## Reporting Compiler Errors

Here is an example C program with an error (missing semicolon):

```c
--- error.c
#include <stdio.h>

int main() {
    printf("Hello world\n")
}
---
```

Because of the `@compiler` command at the top of this file, if you run:

    $ lit --compiler large_example.lit

It should report the error to the correct line (232). In fact, if you have the vim plugin
installed and Neomake, and you run `:Neomake`, an error should pop up next to that line in
the sidebar. You can run `:lopen` which will open a list of all the errors in the document.

---

I hope that this is at least a somewhat useful resource if you are trying to learn how to use
Literate. You can also check out the [manual](http://zbyedidia.webfactional.com/literate/manual.php) for more information.
