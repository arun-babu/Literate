# Performance Requirements 

## Introduction

These are our perfromance requirements.

```
--- reqs/performance.req
[DOCUMENT]
TITLE: Performance Requirements 

---
```

```
--- reqs/performance.req += 
[REQUIREMENT]
UID: PREQ-001 
TITLE: Show Hello World 
STATEMENT: There should be a hello.c file 

---
```

```md
--- reqs/performance.req += 
[REQUIREMENT]
UID: PREQ-002
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
--- reqs/p-other-reqs.req
[DOCUMENT]
TITLE: Other PErromance Requirements 

[REQUIREMENT]
UID: POREQ-001 
TITLE: Show word count 
STATEMENT: There should be a wc.c file 

[REQUIREMENT]
UID: POREQ-002
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