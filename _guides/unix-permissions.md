---
title: Unix Permissions Summary
layout: default
---

# Unix Permissions Summary

| Permissions  | Octal |  Context                         |
|--------------|-------|----------------------------------|
| `-rwxr-xr-x` | 755   | System-wide executable files     |
| `-rwx------` | 700   | User-private executable files    |
| `-rw-r--r--` | 644   | System-wide readable files       |
| `-rw-------` | 600   | User-private readable files      |
| `drwxrwxr-x` | 775   | Shared collaborative directories |
| `drwxrwx---` | 770   | Collaborative directories        |
| `drwxr-xr-x` | 755   | Public directories               |
| `drwxr-x---` | 750   | Shared directories in a group    |
| `drwx------` | 700   | Private directories              |
