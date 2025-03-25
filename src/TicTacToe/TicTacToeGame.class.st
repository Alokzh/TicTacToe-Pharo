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

{ #category : 'actions' }
TicTacToeGame >> isGameOver [

	^ board hasWinner or: [board isFull].
]

{ #category : 'actions' }
TicTacToeGame >> makeMove: index [

	self validateMove: index.
	board cellAt: index put: currentPlayer mark.
	self isGameOver ifFalse: [
		self switchPlayer.
	].
	^ self.
]

{ #category : 'actions' }
TicTacToeGame >> switchPlayer [

	currentPlayer := (currentPlayer == players first)
        ifTrue: [ players second ]
        ifFalse: [ players first ].
]

{ #category : 'actions' }
TicTacToeGame >> validateMove: index [
	
	(index between: 1 and: 9) ifFalse: [
		self error: 'Invalid move: index must be between 1 and 9'.
	].
	(board isEmpty: index) ifFalse: [
		self error: 'Invalid move: cell already occupied'.
	].
	self isGameOver ifTrue: [
        self error: 'Game is already over. Please reset to play again.'
    ].
]
