# A Tic-Tac-Toe Game built using Pharo

[![Pharo Version](https://img.shields.io/badge/Pharo-10+-blue)](https://pharo.org)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

## Why This Project?

I built this to:
- Master Pharo's syntax and environment through practical implementation
- Demonstrate test-driven development
- Showcase my ability to deliver complete, documented solutions


---

**Demo Video:**

[Screencast from 28-03-25 10:23:52 AM IST.webm](https://github.com/user-attachments/assets/7bd714e3-5858-4e73-a2b2-b26f514a3e78)


### Core Implementation

A complete implementation of the classic Tic-Tac-Toe game in Pharo Smalltalk, featuring:
- 3x3 game board
- Two-player (X and O) turns
- Win/Draw detection
- Game history tracking
- Comprehensive Test Suites to test the implementation.


## Installation

1. Download and install [Pharo](https://pharo.org/download)
2. Launch Pharo and open a workspace
3. Install the game using Metacello:


```smalltalk
Metacello new
  baseline: 'TicTacToe';
  repository: 'github://Alokzh/TicTacToe-Pharo/src';
  load.
```

**Note:** 
If you want to run & play the game directly just open the Playgorund & run

```smalltalk
TicTacToeGame new play.
```


## Learning Resources

- [Pharo MOOC](https://mooc.pharo.org) - Free interactive course  
- [Pharo by Example](https://books.pharo.org) - The definitive book (Free PDF)  
- [Awesome Wiki](https://github.com/pharo-open-documentation/pharo-wiki) - Wiki related to the Pharo programming language and environment
