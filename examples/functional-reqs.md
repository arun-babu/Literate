# Functional Requirements 

## Introduction

Here are our functional requirements

```
--- reqs/functional.req
[DOCUMENT]
TITLE: Functional Requirements 

---
```

```
--- reqs/functional.req += 
[REQUIREMENT]
UID: FREQ-001 
TITLE: Show Hello World 
STATEMENT: There should be a hello.c file 

---
```

```
--- reqs/functional.req += 
[COMPOSITE_REQUIREMENT]
STATEMENT: Composite requirement statement

[REQUIREMENT]
STATEMENT: req1

[REQUIREMENT]
STATEMENT: req2

[/COMPOSITE_REQUIREMENT]

---
```

```
--- reqs/functional.req += 
[REQUIREMENT]
UID: FREQ-002
REFS:
- TYPE: File
  VALUE: file.py
TITLE: Whole file reference
STATEMENT: This requirement references the file.py file.
COMMENT: >>>
If the file.py contains a source range that is connected back to this
requirement (REQ-002), the link becomes a link to the source range.
<<<

---
```

```
--- reqs/f-other-reqs.req
[DOCUMENT]
TITLE: Other Functional Requirements 

[REQUIREMENT]
UID: FOREQ-001 
TITLE: Show word count 
STATEMENT: There should be a wc.c file 

[REQUIREMENT]
UID: FOREQ-002
REFS:
- TYPE: File
  VALUE: file.py
TITLE: Traceability 
STATEMENT: This requirement references the file.py file.
COMMENT: >>>
If the file.py contains a source range that is connected back to this
requirement (REQ-002), the link becomes a link to the source range.
<<<

---
```

End
