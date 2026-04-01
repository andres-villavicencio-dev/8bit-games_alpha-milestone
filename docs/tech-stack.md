# Tech Stack

## Game Engine
- **Godot 4.2** (GDScript, GL Compatibility renderer)
- Viewport: 320×180 (16:9, scales to 960×540 at 3x)
- Pixel art mode: nearest-neighbor filtering

## Asset Pipeline
- **Sprites**: PNG, 8px grid, exported via ImageMagick pipeline (`tools/Makefile`)
- **Tilemaps**: Tiled (.tmx) → Godot TileMap via built-in importer
- **Audio**: OGG Vorbis for music, WAV for SFX
- **Git LFS**: All binary assets tracked via LFS

## CI/CD
- **GitHub Actions**: lint (gdtoolkit) → web export
- **Artifacts**: Web build uploaded per commit
- **Branch strategy**: `main` = stable, feature branches for new systems

## Development
- Godot 4.2 editor (local)
- GDScript (primary language)
- gdtoolkit for linting
