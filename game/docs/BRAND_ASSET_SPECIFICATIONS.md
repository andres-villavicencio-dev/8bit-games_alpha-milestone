# Brand Asset Specifications
## 8-Bit RPG Game - Complete Asset Requirements

**Version:** 1.0
**Created:** 2026-04-04
**Status:** Ready for Asset Creation

---

## Purpose

This document provides exact specifications for all brand assets required for social media, marketing, and promotional materials. Assets should be created using the game's existing 320x180 pixel art style.

---

## 1. Logo Assets

### Primary Logo

**File:** `logo/8bitrpg-logo-primary.png`
**Dimensions:** 1920x1080 (16:9 aspect ratio, scalable)
**Resolution:** 300 DPI minimum for print
**Colors:** Game's primary color palette (see color specification)
**Background:** Transparent PNG
**Usage:** Website headers, press kit, presentations

**Logo Elements:**
- Game title "8-BIT RPG" in pixel-style font
- Optional subtitle or tagline
- Game-inspired pixel art accent (character sprite, item, or icon)
- Clean, readable at both small and large sizes

### Logo Variations

| Variation | File | Background | Use Case |
|-----------|------|------------|----------|
| Primary | logo-primary.png | Transparent | Light backgrounds, websites |
| Dark BG | logo-dark.png | Transparent | Dark backgrounds |
| White | logo-white.png | Solid color | Watermark, overlays |
| Icon | logo-icon.png | Transparent | Favicon, small avatars |
| Horizontal | logo-horizontal.png | Transparent | Narrow spaces, headers |

**Icon Variant Specs:**
- 512x512 minimum
- Square aspect ratio
- Works at 32x32, 64x64, 128x128, 512x512
- Should contain game icon or recognizable element from `res://assets/sprites/icon.png`

---

## 2. Social Media Profile Assets

### Profile Pictures

**Platforms:** Twitter, Instagram, TikTok, YouTube, Discord, Reddit

| Platform | Size | File |
|----------|------|------|
| Twitter | 400x400 (min) | social/avatar-twitter.png |
| Instagram | 320x320 (min) | social/avatar-instagram.png |
| TikTok | 200x200 (min) | social/avatar-tiktok.png |
| YouTube | 800x800 (recommended) | social/avatar-youtube.png |
| Discord | 128x128 (min) | social/avatar-discord.png |
| Reddit | 256x256 (min) | social/avatar-reddit.png |

**Design Requirements:**
- Use existing game icon: `assets/sprites/icon.png` (upscale to required sizes)
- Maintain pixel art aesthetic (nearest-neighbor scaling)
- Visible at small sizes
- High contrast for recognizability

### Header/Banner Images

**Twitter/X Header:**
- **File:** `social/header-twitter.png`
- **Size:** 1500x500 pixels
- **Content:** Game world panorama, key art, or gameplay scene
- **Safe zone:** Keep important content in center 1000x500 (avoid cropping on mobile)

**YouTube Channel Art:**
- **File:** `social/youtube-channel-art.png`
- **Size:** 2560x1440 pixels
- **Safe zones:**
  - TV: 2560x1440 (full image)
  - Desktop: 2560x423 (center strip)
  - Mobile: 1546x423 (center)
- **Content:** Full brand layout with game logo, tagline, and call-to-action
- **Link area:** Lower right corner for social links

**YouTube Video Thumbnail Template:**
- **Size:** 1280x720 pixels
- **Template:** `social/youtube-thumbnail-template.png`
- **Elements:**
  - Screenshot placeholder (center, 960x540)
  - Logo (upper left, 320x180)
  - Title text area (bottom, 1280x90, pixel font)
  - Border: 4-pixel pixel-art border

---

## 3. Screenshot Requirements

### Screenshot Specifications

**All screenshots should capture:**
- Native resolution: 320x180 (upscaled 3x to 960x540 for sharing)
- Show the game in its best moments
- Clear UI elements visible
- Action-packed scenes (not static screens)

**Screenshot Categories:**

| Category | Count | File Prefix | Content |
|----------|-------|-------------|---------|
| Title Screen | 1-2 | screenshot-title-XX.png | Main menu, title screen |
| Overworld | 3-4 | screenshot-overworld-XX.png | Exploration, world map |
| Combat | 3-4 | screenshot-combat-XX.png | Battle encounters, combat UI |
| Dialogue | 2-3 | screenshot-dialogue-XX.png | NPC conversations, story moments |
| Characters | 2-3 | screenshot-character-XX.png | Character/party screens |
| Menus | 2 | screenshot-menu-XX.png | Inventory, settings, systems |
| Special | 2-3 | screenshot-special-XX.png | Boss battles, special moments |

**Screenshot Capture Guidelines:**
1. Capture during interesting moments (not static screens)
2. Ensure UI is visible and readable
3. Show character sprites clearly
4. Vary environments (overworld, battle, menu)
5. Capture during day/night cycle if applicable
6. Show action moments (combat attack animations, menu transitions)

### Screenshot Export Format

**For Social Media (Twitter/Instagram):**
- Final size: 1920x1080 (upscaled 6x from native)
- Format: PNG for quality
- Alternative: JPG for smaller file size (80% quality minimum)

**For Press Kit:**
- Original: 960x540 (3x upscale) - PNG
- High-res: 1920x1080 (6x upscale) - PNG
- Provide both versions for flexibility

---

## 4. GIF Assets

### Gameplay GIFs

**Format:** GIF
**Frame Rate:** 15-30 FPS
**Duration:** 3-10 seconds
**File Size:** Under 15MB (ideally under 5MB for Twitter)
**Dimensions:** 960x540 (3x upscale) or 1280x720 (4x upscale)

**Required GIFs:**

| GIF Name | Duration | Content | File |
|----------|----------|---------|------|
| Walking Animation | 3s | Character walking loop | gif/walking-loop.gif |
| Combat Attack | 5s | Attack animation in battle | gif/combat-attack.gif |
| Menu Opening | 3s | Menu/opening animation | gif/menu-open.gif |
| Battle Start | 4s | Transition to battle | gif/battle-start.gif |
| Character Idle | 2s | Character idle animation | gif/character-idle.gif |
| World Transition | 3s | Scene/environment change | gif/world-transition.gif |
| Spell Effect | 4s | Magic/special ability | gif/spell-effect.gif |
| Item Pickup | 3s | Collecting items/treasure | gif/item-pickup.gif |

**GIF Creation Tools:**
- OBS Studio (recording)
- FFmpeg (conversion: `ffmpeg -i video.mp4 -vf "fps=15,scale=960:-1" output.gif`)
- Photoshop (frame-by-frame control)
- ezgif.com (online optimization)
- ScreenToGif (Windows)

**GIF Quality Guidelines:**
- Use dithering to maintain color quality
- Reduce frame count if file size is too large
- Ensure smooth loops where possible
- Keep important action in center frame
- Add subtle text overlays for context (optional)

---

## 5. Video Assets

### Announcement Trailer

**File:** `video/trailer-announcement.mp4`
**Duration:** 60-90 seconds
**Resolution:** 1920x1080 (1080p) minimum
**Frame Rate:** 30 FPS
**Format:** MP4 (H.264 codec, AAC audio)

**Structure:**
```
0:00-0:05 - Logo reveal with tagline
0:05-0:15 - Overworld exploration montage
0:15-0:30 - Combat gameplay clips
0:30-0:45 - Story/character moments
0:45-0:55 - Feature highlights (fast cuts)
0:55-0:60 - Call-to-action (wishlist, release info)
0:60-End - Logo + website/socials
```

**Audio:**
- Background music from game soundtrack
- Sound effects from gameplay
- Optional: Voice-over (if applicable)

**Text Overlays:**
- Game title appears at start
- Key features (2-3 bullet points)
- Platform: "PC"
- Release: "Coming [Year]"
- Call-to-action: "Wishlist on Steam" / "Visit [URL]"

### Launch Trailer

**File:** `video/trailer-launch.mp4`
**Duration:** 30-60 seconds
**Resolution:** 1920x1080 (or 2560x1440 for 2K)
**Frame Rate:** 30-60 FPS

**Structure:**
```
0:00-0:03 - Logo + "Available Now"
0:03-0:15 - Best gameplay moments
0:15-0:25 - Story highlights (no spoilers)
0:25-0:30 - Critical acclaim (if available)
0:30-End - Final call-to-action + links
```

### Dev Diary Videos

**File Prefix:** `video/dev-diary-XX.mp4`
**Duration:** 5-10 minutes
**Resolution:** 1920x1080
**Format:** MP4

**Structure:**
```
Intro (30s) - Host introduction, episode topic
B-Roll (2-3m) - Gameplay footage, development
Discussion (3-5m) - Deep dive into topic/feature
Demo (1-2m) - Live demonstration if applicable
Wrap-up (30s) - Summary, next steps, community links
```

---

## 6. Press Kit Assets

### File Structure

```
press-kit/
├── README.txt                      # Quick start guide
├── fact-sheet.pdf                  # One-page game overview
├── logo/
│   ├── logo-primary.png            # Main logo, transparent
│   ├── logo-dark.png               # Logo for dark backgrounds
│   ├── logo-white.png              # Logo (white version)
│   ├── logo-icon-512.png           # Icon 512x512
│   ├── logo-icon-256.png           # Icon 256x256
│   ├── logo-icon-128.png           # Icon 128x128
│   ├── logo-icon-64.png            # Icon 64x64
│   ├── logo-icon-32.png            # Icon 32x32
│   └── logo-horizontal.png          # Horizontal layout
├── screenshots/
│   ├── screenshot-title-01.png     # Title screen (960x540)
│   ├── screenshot-title-02.png     # Alternate title
│   ├── screenshot-overworld-01.png # Overworld exploration
│   ├── screenshot-overworld-02.png # Overworld variant
│   ├── screenshot-overworld-03.png # Overworld variant
│   ├── screenshot-combat-01.png    # Battle encounter
│   ├── screenshot-combat-02.png    # Combat variant
│   ├── screenshot-combat-03.png    # Combat variant
│   ├── screenshot-dialogue-01.png  # NPC conversation
│   ├── screenshot-dialogue-02.png  # Dialogue variant
│   ├── screenshot-character-01.png # Character screen
│   ├── screenshot-menu-01.png      # Inventory/menu
│   └── screenshot-special-01.png   # Boss battle
├── screenshots-hd/
│   └── [Same as above, 1920x1080]  # High-res versions
├── gifs/
│   ├── walking-loop.gif           # Walking animation
│   ├── combat-attack.gif          # Combat animation
│   ├── menu-open.gif              # Menu transition
│   ├── battle-start.gif           # Battle transition
│   └── character-idle.gif         # Idle animation
├── videos/
│   ├── trailer-announcement.mp4   # Announcement trailer
│   ├── trailer-launch.mp4         # Launch trailer (if ready)
│   └── dev-diary-01.mp4           # First dev diary
├── artwork/
│   ├── character-sprites.zip      # All character sprites
│   ├── environment-art.zip        # Background/environment art
│   ├── tileset-preview.png        # Tileset samples
│   └── concept-art.zip            # Early concept art (if available)
└── audio/
    ├── soundtrack-preview.zip     # Sample music tracks
    └── sfx-preview.zip             # Sample sound effects
```

### Fact Sheet Content

**File:** `press-kit/fact-sheet.pdf`

```
================================================================================
                            8-BIT RPG - FACT SHEET
================================================================================

GAME INFORMATION
================================================================================
Title:              8-Bit RPG [working title]
Developer:          [Developer/Studio Name]
Release Date:      [Target Release Window]
Platform:           PC (Windows, macOS, Linux)
Engine:             Godot 4.2
Price:              $9.99 - $14.99 (TBD)
Genre:              Single-Player RPG
Playtime:           8-12 hours (main story)
Rating:             [ESRB/PEGI - TBD]

SYNOPSIS
================================================================================
[Game description - 2-3 sentences capturing the essence]

FEATURES
================================================================================
• Authentic 8-bit pixel art (320x180 resolution)
• Classic turn-based combat with modern quality-of-life features
• Rich narrative with memorable characters
• [Feature 4]
• [Feature 5]

HISTORY
================================================================================
[Development timeline, inspiration, team background - brief paragraph]

LINKS
================================================================================
Website:            [URL]
Twitter:            @8bitrpg_game
Discord:            [Invite link]
Developer:          [Developer website]
Press Contact:      [Email]

SCREENSHOTS & ASSETS
================================================================================
Press kit available at: [URL]

================================================================================
                           © [Year] [Developer Name]
================================================================================
```

---

## 7. Social Media Templates

### Twitter Post Template

**File:** `social/twitter-template.md`

```
🎮 [Announcement/Update Title]

[1-2 sentence description of news/feature]

✨ [Key feature 1]
⚔️ [Key feature 2]
🗺️ [Key feature 3]

[Call-to-action]

#indiegame #pixelart #retrogame #Godot #8bit
```

**Example Posts:**
```
🎮 ANNOUNCEMENT: Introducing 8-bit RPG!

A nostalgic journey through pixel-perfect worlds with classic 
turn-based combat and modern polish.

✨ Authentic 8-bit art (320x180!)
⚔️ Classic RPG combat
🗺️ Rich story & characters
🛠️ Built in Godot 4.2

Wishlist coming soon! 

#indiegame #pixelart #retrogame #Godot #8bit
```

### Instagram Caption Template

**File:** `social/instagram-template.md`

```
[Emoji] [Post Title]

[Description with line breaks]

[3-5 relevant hashtags in comments]
.
.
.
Follow for dev updates! Link in bio.

#indiegame #pixelart #8bit #gamedev #godotengine
```

### YouTube Description Template

**File:** `social/youtube-description-template.md`

```
[Video Title] | 8-Bit RPG Dev Diary #[Episode Number]

[Video description - 2-3 sentences]

📅 TIMESTAMPS
0:00 - Introduction
0:30 - [Topic 1]
2:00 - [Topic 2]
4:30 - [Topic 3]
6:00 - Wrap-up

🎮 ABOUT THE GAME
[Game description - elevator pitch]

📱 FOLLOW THE DEVELOPMENT
Twitter: @8bitrpg_game
Discord: [Link]
itch.io: [Link]

🎮 WISHLIST ON STEAM
[Steam link when available]

🔊 MUSIC & AUDIO
Music by: [Credit if applicable]

📧 BUSINESS INQUIRIES
[Email address]

#indiegame #gamedev #pixelart #Godot #8bitRPG
```

---

## 8. Color Palette Specification

### Primary Colors

Based on authentic 8-bit palette (limited to 32 colors or less):

| Color Name | Hex | RGB | Usage |
|------------|-----|-----|-------|
| Background | #000000 | 0, 0, 0 | Primary UI background |
| Dark | #1a1a2e | 26, 26, 46 | Secondary background |
| Accent 1 | #16213e | 22, 33, 62 | Tertiary background |
| Accent 2 | #0f3460 | 15, 52, 96 | Highlights, borders |
| Primary | #e94560 | 233, 69, 96 | Important UI elements |
| Secondary | #533483 | 83, 52, 131 | Secondary elements |
| Text | #ffffff | 255, 255, 255 | Primary text |
| ... | ... | ... | ... |

**Note:** Replace with actual game color palette. Document final palette here for brand consistency.

---

## 9. Typography Guidelines

### Primary Font: Pixel/Bitmap Font

**Requirements:**
- Must be readable at small sizes (16px minimum)
- Consistent with game's pixel art style
- Monospace or proportional bitmap font
- Examples: Press Start 2P, m5x7, Kenny Future, etc.

**Usage:**
- Headlines: Bold/bright colors
- Body text: Neutral colors (white, light gray)
- Accent text: Accent colors from palette

### Secondary Font: Clean Sans-Serif

**For external marketing materials:**
- Use for press releases, presentations
- Must be clean and readable
- Examples: Inter, Roboto, Open Sans
- Never mix with pixel fonts in the same design except for contrast

---

## 10. Asset Creation Checklist

### Ready for Social Media Launch

- [ ] Logo primary (transparent, all sizes)
- [ ] Logo dark background variant
- [ ] Logo white variant
- [ ] Logo icon (512x512 and smaller sizes)
- [ ] Twitter profile picture (400x400)
- [ ] Twitter header image (1500x500)
- [ ] YouTube channel art (2560x1440)
- [ ] YouTube profile picture (800x800)
- [ ] Instagram profile picture (320x320)
- [ ] TikTok profile picture (200x200)
- [ ] Discord server icon (128x128)
- [ ] 10-15 gameplay screenshots (960x540)
- [ ] 10-15 gameplay screenshots HD (1920x1080)
- [ ] 5-10 GIF gameplay clips
- [ ] Announcement trailer (60-90 seconds)
- [ ] Press kit README
- [ ] Fact sheet PDF

### Asset Verification Checklist

- [ ] All images correctly sized for platforms
- [ ] All logos readable at small sizes
- [ ] All screenshots show gameplay (not static)
- [ ] All GIFs under 15MB (ideally under 5MB)
- [ ] All videos in MP4 format (H.264)
- [ ] All files properly named (lowercase, hyphens)
- [ ] Press kit zip file created and tested
- [ ] Color palette documented
- [ ] Typography choices documented

---

## 11. Asset Delivery

### Organization for Delivery

All assets should be organized in the `assets/marketing/` directory:

```
game/
├── assets/
│   ├── audio/
│   ├── fonts/
│   ├── sprites/
│   ├── tilesets/
│   └── marketing/          # NEW - Marketing assets
│       ├── logo/
│       ├── social/
│       ├── screenshots/
│       ├── screenshots-hd/
│       ├── gifs/
│       ├── videos/
│       └── press-kit/
```

### Naming Convention

All files should follow lowercase, hyphen-separated naming:
- `logo-primary.png` (not `Logo_Primary.PNG` or `logo primary.png`)
- `screenshot-overworld-01.png` (not `screen1.png`)
- `trailer-announcement.mp4` (not `Announcement_Trailer.mp4`)

---

## 12. Dependencies on Game State

### Prerequisites for Asset Creation

**Required from Game Development:**
1. **Playable Build** - To capture screenshots and video
2. **Main Menu Scene** - For title screenshots
3. **Overworld Implemented** - For exploration shots
4. **Combat System** - For battle GIF/trailer
5. **Character Sprites** - For character reveals
6. **UI/HUD Elements** - For menu screenshots
7. **Soundtrack Preview** - For trailer music

**Blockers:**
If game is not in playable state, certain assets cannot be created:
- Screenshots require playable build
- GIFs require animated gameplay
- Trailer requires varied gameplay moments

**Workaround:**
Use placeholder/mock assets for planning purposes, then replace with actual gameplay once available.

---

## Document History

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 1.0 | 2026-04-04 | CMO | Initial brand asset specifications |

**Status:** Ready for Asset Creation Team
**Next Review:** After first asset creation pass
**Owner:** Marketing Team / Asset Creation Team