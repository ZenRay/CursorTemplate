---
description: Quick diagram generation for specific code sections or relationships
---

# /diagram — Quick Code Diagrams

Generate focused diagrams for specific code relationships.

## Quick Types

| Command | Diagram | Example |
|---------|---------|---------|
| `/diagram class [file]` | Class hierarchy | `/diagram class src/models/User.ts` |
| `/diagram flow [function]` | Control flow | `/diagram flow authMiddleware` |
| `/diagram deps [module]` | Dependencies | `/diagram deps api/users` |
| `/diagram er [models]` | Entity relations | `/diagram er User,Order,Product` |

## Class Diagram

For TypeScript/JavaScript classes:

```mermaid
classDiagram
    class User {
        +string id
        +string email
        +login()
        +logout()
    }
    class Order {
        +string id
        +placeOrder()
    }
    User "1" --> "*" Order : has
```

## Flow Diagram

For function logic:

```mermaid
flowchart LR
    A[Input] --> B{Validate}
    B -->|Valid| C[Process]
    B -->|Invalid| D[Error]
    C --> E[Output]
    D --> E
```

## Dependency Diagram

For module relationships:

```mermaid
graph TD
    A[Controller] --> B[Service]
    B --> C[Repository]
    B --> D[External API]
    C --> E[Database]
```

## ER Diagram

For database entities:

```mermaid
erDiagram
    USER ||--o{ ORDER : places
    USER {
        string id PK
        string email
    }
    ORDER {
        string id PK
        string user_id FK
        decimal total
    }
```

## Usage Examples

```
/diagram class src/services/AuthService.ts
→ Generates class diagram showing AuthService and its dependencies

/diagram flow handleUserRegistration
→ Generates flowchart of the registration process

/diagram deps src/api/routes
→ Generates dependency graph of all API routes

/diagram er User,Profile,Settings
→ Generates ER diagram for user-related entities
```

## Output

Diagrams saved to:
- `docs/diagrams/class-[name].md`
- `docs/diagrams/flow-[name].md`
- `docs/diagrams/deps-[name].md`
- `docs/diagrams/er-[name].md`

Or inline in chat for quick review.
