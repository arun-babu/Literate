# Multiple Files

## Showcase

This is an example which showcases how to generate multiple files from one literate source
file. Any codeblock with an extension is considered to be a file, and will be generated when
literate is run.

```c
--- Reused Code
for i in range(0,100):
	for j in range(0,100):
		print("Hello")
---
```

```c
--- example_file.txt
This is an example text file
---
```

Any number of files can be made with any extensions

```c
--- hello.py
print "hello world"
---
```

If you want to create a file that has no extension, you can put it in quotes.

```c
--- "SomeFile"
This file is still generated even though it has no extension
---
```