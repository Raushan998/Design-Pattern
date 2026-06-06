# Design Patterns

A collection of design pattern implementations and object-oriented design exercises in **Ruby** and **Python**. Each directory is a self-contained example demonstrating a single pattern or principle.

## Patterns

### Creational
| Pattern | Directory | Language |
|---------|-----------|----------|
| Builder | `Builder/`, `builder-design-pattern/` | Ruby, Python |
| Factory | `factory/` | Ruby, Python |
| Prototype | `prototype/` | — |
| Singleton | `singleton_design_pattern/` | — |

### Structural
| Pattern | Directory | Language |
|---------|-----------|----------|
| Adapter | `adapter-design-pattern/` | Python |
| Decorator | `Decorator/`, `decorator-design-pattern/` | Ruby, Python |
| Proxy | `proxy-pattern/` | Python |

### Behavioral
| Pattern | Directory | Language |
|---------|-----------|----------|
| Command | `command_pattern/` | Ruby |
| Iterator | `iterator_pattern/` | Python |
| Mediator | `mediator-pattern/` | Python |
| Memento | `memento/` | — |
| Observer | `observer/`, `observer-pattern/` | — |
| State | `state-pattern/` | — |
| Strategy | `strategy/` | Ruby |
| Template Method | `template_pattern/` | — |

## Other Topics

| Topic | Directory |
|-------|-----------|
| SOLID principles | `solid_principle/` |
| Practical Object-Oriented Design | `practical_object_oriented_design/` |
| Advanced Ruby | `Advanced-Ruby/` |
| Game engine (Tic-Tac-Toe) | `GameEngine/` |
| Payment service | `paymentservice/` |
| Practice problems | `problems/` |

## Running the Examples

**Ruby**
```bash
ruby path/to/client.rb
```

**Python**
```bash
python3 path/to/example.py
```

Each example typically has a `client.rb` or a `main`/runnable entry file that wires the pattern together.

## Structure

Every pattern lives in its own top-level directory. Where present, `client.rb` is the entry point that demonstrates usage. Some patterns include multiple examples (e.g. `factory/example-1` … `factory/example-4`) and a few include RSpec tests under `spec/`.
