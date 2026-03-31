# Core story dialogues for alpha demo
class_name StoryBeats
extends Resource

static func intro() -> Array:
	return [
		{"speaker": "Narrator", "text": "The kingdom of Arenfall has fallen silent."},
		{"speaker": "Narrator", "text": "Three moons ago, the Dark Knight vanished into Darkstone Cavern — and took the Sacred Crystal with him."},
		{"speaker": "Narrator", "text": "Without it, the harvests fail. The rivers run black. Hope fades."},
		{"speaker": "Villager", "portrait": "villager", "text": "Please... you're the only one left willing to venture into that cursed place."},
		{"speaker": "Hero", "portrait": "hero", "text": "I'll get your crystal back. Or die trying."},
		{"speaker": "Narrator", "text": "— DARKSTONE CAVERN —"},
	]

static func boss_pre_battle() -> Array:
	return [
		{"speaker": "Dark Knight", "portrait": "dark_knight", "text": "Another fool sent by the weaklings above?"},
		{"speaker": "Dark Knight", "portrait": "dark_knight", "text": "The Crystal belongs to me. It always has."},
		{"speaker": "Hero", "portrait": "hero", "text": "Return what you stole. This ends now."},
		{"speaker": "Dark Knight", "portrait": "dark_knight", "text": "...Then you will join the others. FOREVER."},
	]

static func victory() -> Array:
	return [
		{"speaker": "Narrator", "text": "The Dark Knight crumbles. The Sacred Crystal rolls across the stone floor."},
		{"speaker": "Hero", "portrait": "hero", "text": "It's over."},
		{"speaker": "Narrator", "text": "As you emerge from the cavern, the sky brightens for the first time in months."},
		{"speaker": "Narrator", "text": "Arenfall will live again."},
		{"speaker": "Narrator", "text": "— TO BE CONTINUED —"},
	]

static func defeat() -> Array:
	return [
		{"speaker": "Narrator", "text": "Darkness closes in around you..."},
		{"speaker": "Narrator", "text": "But the crystal still glimmers in the shadows, waiting."},
		{"speaker": "Narrator", "text": "— TRY AGAIN —"},
	]
