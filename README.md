# carlkibler/homebrew-tap

Homebrew formulae for [carlkibler](https://github.com/carlkibler)'s tools. Works on macOS and Linux (Linuxbrew).

## toolsmith

[Toolsmith](https://github.com/carlkibler/toolsmith) gives AI coding agents surgical file reads and exact, validated edits instead of whole-file reads — cutting token use on large-file operations by ~97% when used.

```bash
brew install carlkibler/tap/toolsmith
# then register it with your agents (Claude Code, Codex, Gemini CLI, …):
toolsmith setup
```

Update later with `brew upgrade carlkibler/tap/toolsmith` (or let it ride your normal `brew upgrade`).

## Notes

- Formulae are tested on macOS and Linux on every push (see `.github/workflows/tests.yml`).
- All GitHub Actions are pinned to full commit SHAs for supply-chain safety.
- `toolsmith` is also on npm: `npm install -g @carlkibler/toolsmith`.
