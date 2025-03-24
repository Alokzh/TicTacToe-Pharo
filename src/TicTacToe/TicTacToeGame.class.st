"
I represent a Tic-Tac-Toe game controller. I manage the game state, players, and rules.
"
Class {
	#name : 'TicTacToeGame',
	#superclass : 'Object',
	#instVars : [
		'board',
		'currentPlayer',
		'players'
	],
	#category : 'TicTacToe',
	#package : 'TicTacToe'
}

{ #category : 'accessing' }
TicTacToeGame >> board [

	^ board
]

{ #category : 'accessing' }
TicTacToeGame >> currentPlayer [

	^ currentPlayer
]

{ #category : 'initialization' }
TicTacToeGame >> initialize [

	super initialize.
	board := TicTacToeBoard new.
	players := OrderedCollection new.
	self initializePlayers.
	currentPlayer := players first.
]

{ #category : 'initialization' }
TicTacToeGame >> initializePlayers [

	| player1 player2 |
    player1 := TicTacToePlayer new mark: $X; name: 'Player X'; yourself.
    player2 := TicTacToePlayer new mark: $O; name: 'Player O'; yourself.
    players add: player1.
    players add: player2.
]
