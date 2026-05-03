---
name: memory-sync
description: Synchronize Native Memories with project documentation and cross-project knowledge base
disable-model-invocation: true
---

# Memory Sync Skill

Synchronize Cursor Native Memories with other knowledge systems.

## Sync Strategies

### 1. Native → PersonalKnowledge

Export important Native Memories to cross-project KB:

```
When to sync:
- Generic patterns (not project-specific)
- Reusable solutions
- Tech stack insights

Process:
1. /memory-manage export
2. Filter project-specific items
3. Import to PersonalKnowledge
4. Tag as "from-cursor-native"
```

### 2. PersonalKnowledge → Native

Import relevant knowledge for current project:

```
At project start:
1. Search PersonalKnowledge for project type
2. Import relevant patterns as Native Memories
3. Customize for current context
```

### 3. Bidirectional Sync

Keep both in sync:

```
Monthly:
1. Review new Native Memories
2. Export generic ones to PK
3. Import relevant PK updates
4. Document sync in CHANGELOG
```

## Implementation

### Export Script

```python
# scripts/export-memories.py
import json
from pathlib import Path

def export_memories():
    # Read from Cursor settings
    cursor_memories = load_cursor_memories()
    
    # Filter for export
    exportable = [
        m for m in cursor_memories
        if is_generic_pattern(m)
    ]
    
    # Save to PK
    save_to_personal_knowledge(exportable)
```

### Import Script

```python
# scripts/import-memories.py
def import_memories():
    # Read from PK
    pk_knowledge = load_personal_knowledge()
    
    # Filter for current project
    relevant = filter_relevant(pk_knowledge, current_project)
    
    # Import to Native
    import_to_cursor(relevant)
```

## Workflow

### Project Initialization

```
1. Check PK for relevant templates
2. Import to Native Memories
3. Customize for project
4. Start development
```

### During Development

```
When learning important fact:
→ Add to Native (project-specific)
→ If generic, also add to PK
```

### Project Completion

```
1. Export valuable patterns to PK
2. Archive project-specific Native Memories
3. Document in project README
```

## Conflict Resolution

When same fact exists in both:

| Scenario | Action |
|----------|--------|
| Native newer | Update PK |
| PK newer | Update Native |
| Different details | Merge manually |
| One deleted | Confirm deletion of other |

## Automation

Hook into session lifecycle:

```
PreCompact:
  - Suggest syncing new memories

SessionEnd:
  - If new patterns learned
  - Prompt: "Export to PersonalKnowledge?"
```

## Best Practices

1. **Single source of truth**: Use Native for active project
2. **Archive to PK**: At project end for reusable knowledge
3. **Regular sync**: Monthly reviews
4. **Clear categorization**: Tag by project type, tech stack
5. **Avoid duplication**: Check before adding
