# Mastermind

![Ruby](https://img.shields.io/badge/Ruby-CC342D?style=flat&logo=ruby&logoColor=white)
![The Odin Project](https://img.shields.io/badge/The%20Odin%20Project-Curriculum-brightgreen)
![Version](https://img.shields.io/badge/Version-1.0.0-blue)
![Status](https://img.shields.io/badge/Status-Complete-success)

## Description

A command-line implementation of the classic Mastermind code-breaking game, built as part of [The Odin Project](https://www.theodinproject.com/) Ruby curriculum. The computer generates a secret code of 4 colors and the player has 12 turns to crack it, receiving feedback on each guess.

---

## Table of Contents

- [Gameplay](#gameplay)
- [Features](#features)
- [How It Works](#how-it-works)
- [Feedback System](#feedback-system)
- [Installation](#installation)
- [Usage](#usage)
- [Roadmap](#roadmap)
- [What I Learned](#what-i-learned)

---

## Gameplay

![Mastermind gameplay](assets/gameplay.gif)

---

## Features

- Computer randomly generates a secret 4-color code (colors can repeat)
- Player has 12 turns to guess the correct code
- Color-coded display using Unicode dots and terminal colors
- Input validation — rejects invalid length or out-of-range numbers
- Feedback system showing exact matches and color-only matches per turn
- Turn counter showing remaining attempts

---

## How It Works

1. The computer generates a secret code of 4 colors from a palette of 6
2. The player is shown a color menu and prompted to enter a 4-digit guess
3. After each guess, feedback is given:
   - How many colors are in the **exact right position**
   - How many colors are **correct but in the wrong position**
4. The game ends when the player cracks the code or runs out of turns

---

## Feedback System

After each guess the player receives two pieces of information:

| Feedback | Meaning |
|---|---|
| Exact matches | Right color, right position |
| Color-only matches | Right color, wrong position |

Feedback counts are shown without revealing which positions were correct — keeping the deduction challenge intact.

### Example

```
Secret code: ● ● ● ●  (hidden)

Guess:    ● ● ● ●
Feedback: 1 right guess and 2 color-only matches
```

---

## Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/mastermind.git
```

2. Navigate into the project:
```bash
cd mastermind
```

3. Install dependencies:
```bash
bundle install
```

4. Run the game:
```bash
ruby main.rb
```

### Dependencies

```ruby
gem 'colorize'     # colored dot display
gem 'ruby_figlet'  # ASCII art title
```

---

## Usage

- Enter your guess as 4 digits with no spaces (e.g. `1325`)
- Each digit represents a color from the menu (1-6)
- Colors can repeat in both the secret code and your guess
- Invalid input is rejected with an error message

### Color Menu

```
1: ● red
2: ● blue
3: ● green
4: ● yellow
5: ● magenta
6: ● white
```

---

## Roadmap

### v2.0.0 — Role Selection
- [ ] Player chooses to be codebreaker OR codemaker
- [ ] Computer guesses if player is codemaker
- [ ] `tty-prompt` interactive menu for role selection

### v3.0.0 — UI Polish
- [ ] Figlet title with centered description
- [ ] Screen clearing between turns
- [ ] Display full guess and feedback history per turn
- [ ] `game_over` method with play-again prompt

---

## What I Learned

- How to design a multi-class Ruby project with clear responsibilities (`Game`, `Secret`)
- The two-pass algorithm for Mastermind feedback (exact matches first, then color-only)
- Why mutating arrays mid-iteration causes index drift and how to avoid it
- How to use `Array#zip` to compare two arrays element by element
- How to prevent double-counting duplicate colors using `delete_at` after each match
- Input validation with a `loop/break` pattern and a dedicated `valid_input?` method
- How to expose class internals selectively using `attr_reader` vs dedicated methods

---

## Project

This project is part of the [Ruby Programming path](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby) on The Odin Project.