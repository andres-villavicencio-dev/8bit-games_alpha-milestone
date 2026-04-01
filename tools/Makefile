# Asset Pipeline Tools
# Requires: ImageMagick, python3

SPRITES_DIR := ../game/assets/sprites
TILESETS_DIR := ../game/assets/tilesets

.PHONY: all sprites tilesets clean

all: sprites tilesets

# Resize raw sprites to 8-bit pixel sizes (multiples of 8)
sprites:
	@echo "Processing sprites..."
	@find $(SPRITES_DIR)/raw -name "*.png" 2>/dev/null | while read f; do \
		out="$(SPRITES_DIR)/$$(basename $$f)"; \
		convert "$$f" -filter point -resize 200% "$$out"; \
		echo "  $$f -> $$out"; \
	done

# Convert Tiled .tmx maps to Godot-compatible format
tilesets:
	@echo "Tileset processing: use Godot's built-in Tiled importer plugin"

clean:
	@rm -rf build/
