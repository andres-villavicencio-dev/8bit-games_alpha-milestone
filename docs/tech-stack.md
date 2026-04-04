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

## Testing Framework
- **Unit Testing**: Jest for JavaScript-based tools and utilities
- **Integration Testing**: Jest with custom environment setup
- **End-to-End Testing**: Playwright for browser-based testing
- **Test Runner**: npm scripts with Jest and Playwright
- **Test Coverage**: Istanbul (via Jest) for code coverage reporting

## CI/CD
- **GitHub Actions**: lint (gdtoolkit) → test → web export
- **Artifacts**: Web build uploaded per commit
- **Branch strategy**: `main` = stable, feature branches for new systems

## Development
- Godot 4.2 editor (local)
- GDScript (primary language)
- gdtoolkit for linting
- Node.js for testing tools and utilities