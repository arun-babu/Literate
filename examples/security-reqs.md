# Security Requirements 

## Introduction

Here are our Security requirements.

```
--- reqs/security.req
[DOCUMENT]
TITLE: Security Requirements 

---
```

```
--- reqs/security.req += 
[REQUIREMENT]
UID: SREQ-001 
TITLE: Show Hello World 
STATEMENT: There should be a hello.c file 

---
```
```
--- reqs/security.req += 
[REQUIREMENT]
UID: SREQ-002
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
--- reqs/s-other-reqs.req
[DOCUMENT]
TITLE: Other Security Requirements 

[REQUIREMENT]
UID: SOREQ-001 
TITLE: Show word count 
STATEMENT: There should be a wc.c file 

[REQUIREMENT]
UID: SOREQ-002
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

