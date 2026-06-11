"""Document Editor using the Flyweight Design Pattern.

Intrinsic (shared) state  -> font_size, color, font_style  (CharacterFlyWeight)
Extrinsic (unique) state  -> the actual character glyph + its position in the document.

The CharacterFactory caches one CharacterFlyWeight per unique formatting
combination, so thousands of characters sharing the same formatting reuse a
single object instead of allocating one each.
"""


class CharacterFlyWeight:
    """Holds the shared (intrinsic) formatting attributes."""

    def __init__(self, font_size, color, font_style):
        self.font_size = font_size
        self.color = color
        self.font_style = font_style

    def render(self, character):
        """Render a glyph (extrinsic) using this shared formatting."""
        return (
            f"'{character}' "
            f"[font_style={self.font_style}, "
            f"font_size={self.font_size}, "
            f"color={self.color}]"
        )

    def __repr__(self):
        return (
            f"CharacterFlyWeight(font_size={self.font_size!r}, "
            f"color={self.color!r}, font_style={self.font_style!r})"
        )


class CharacterFactory:
    """Creates and shares CharacterFlyWeight instances by formatting key."""

    _characters_store = {}

    @classmethod
    def get_character(cls, font_size, color, font_style):
        key = (font_size, color, font_style)
        if key not in cls._characters_store:
            cls._characters_store[key] = CharacterFlyWeight(font_size, color, font_style)
        return cls._characters_store[key]

    @classmethod
    def total_flyweights(cls):
        return len(cls._characters_store)


class Document:
    """A text document built from shared character flyweights."""

    def __init__(self):
        # each entry: (glyph, flyweight) -> flyweight carries shared formatting
        self.characters = []

    def add_character(self, character, font_size, color, font_style):
        flyweight = CharacterFactory.get_character(font_size, color, font_style)
        self.characters.append((character, flyweight))

    def add_text(self, text, font_size, color, font_style):
        for ch in text:
            self.add_character(ch, font_size, color, font_style)

    def render(self):
        print("----- Document Render -----")
        for character, flyweight in self.characters:
            print(flyweight.render(character))
        print("---------------------------")

    def memory_report(self):
        total = len(self.characters)
        shared = CharacterFactory.total_flyweights()
        print(f"Total characters in document : {total}")
        print(f"Unique flyweight objects     : {shared}")
        print(f"Objects saved by sharing     : {total - shared}")


if __name__ == "__main__":
    doc = Document()

    # Same formatting -> all share ONE flyweight
    doc.add_text("Hello", font_size="12", color="black", font_style="Arial")

    # Different formatting -> new flyweight
    doc.add_text(" World", font_size="14", color="red", font_style="Times")

    # Reuse the first formatting again -> NO new flyweight created
    doc.add_text("!!!", font_size="12", color="black", font_style="Arial")

    doc.render()
    print()
    doc.memory_report()

    # Confirm sharing: same key returns the SAME object
    a = CharacterFactory.get_character("12", "black", "Arial")
    b = CharacterFactory.get_character("12", "black", "Arial")
    print(f"\nShared instance check (a is b): {a is b}")
