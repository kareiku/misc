---
title: PlantUML Summary
layout: default
---

# PlantUML Summary

## Class Diagrams

### Arrows

- Composition (strong ownership)
    - In PlantUML: `A *-- B`
    - Definition: B objects are created and destroyed at the same time as A.

- Aggregation
    - In PlantUML: `A o-- B`
    - Definition: B objects may or not may be created and/or destroyed at the same time as A, but this last one keeps
      them referenced in bulk.

- Association
    - In PlantUML: `A --> B`
    - Definition: Long time spans in which A will use B. Rule of thumb: A is associated with B and not dependent if it
      keeps the reference in an __attribute__ for a long time.

- Dependency
    - In PlantUML: `A ..> B`
    - Definition: Short time spans in which A will use B. It's the only way of using interfaces. However, it can be
      used, too, to say A uses objects of B at times, like when returning new objects (in factories) or with a
      singleton's _getInstance()_.

- Inner Classes (in-code implementation)
    - In PlantUML: `A +-- B`
    - Definition: B's class is defined inside of A's class rather than in its own file.

- Inheritance (extension)
    - In PlantUML `A <|-- B`
    - Definition: B inherits all of the attributes and functionalities A has.
    - In code: B extends A.

- Inheritance (implementation)
    - In PlantUML: `A <|.. B`
    - Definition: A can act as an interface for B, thus B must redefine everything A has.
    - In code: B implements A.

## Great Skinparams and Other Configurations

- `skin rose`: A rosy theme that makes diagrams more beautiful than the default theme.

- `hide circle`: Make PlantUML class diagrams look like Graphical UML ones!

- `skinparam RoundCorner <amount>`: Make elements (that support it, like classes) have rounded corners.

- `skinparam GroupInheritance <amount>`: Group inheritance arrows for multiple elements deriving from the same base.
