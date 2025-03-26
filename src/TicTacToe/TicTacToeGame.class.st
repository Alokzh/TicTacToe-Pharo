"
I represent a Tic-Tac-Toe game controller. I manage the game state, players, and rules.
"
Class {
	#name : 'TicTacToeGame',
	#superclass : 'Object',
	#instVars : [
		'board',
		'currentPlayer',
		'players',
		'history'
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

{ #category : 'accessing' }
TicTacToeGame >> history [

	^ history
]

{ #category : 'initialization' }
TicTacToeGame >> initialize [

	super initialize.
	board := TicTacToeBoard new.
	players := OrderedCollection new.
	history := OrderedCollection new.
	self initializePlayers.
	currentPlayer := players first
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
	history add: { currentPlayer. index }.
	self isGameOver ifFalse: [ self switchPlayer ].
	^ self
]

{ #category : 'printing' }
TicTacToeGame >> printHistoryOn: aStream [

	history doWithIndex: [:move :index |
        aStream
            nextPutAll: 'Move '; print: index; nextPutAll: ': ';
            print: move first; nextPutAll: ' placed '; print: move first mark;
            nextPutAll: ' at position '; print: move second; cr.
    ].
]

{ #category : 'printing' }
TicTacToeGame >> printOn: aStream [

	aStream
        nextPutAll: 'TicTacToeGame'; cr;
        nextPutAll: 'Current Player: '; print: currentPlayer; cr;
        nextPutAll: 'Board:'; cr;
        print: board; cr;
        nextPutAll: 'Move History:'; cr.
    self printHistoryOn: aStream.
]

{ #category : 'initialization' }
TicTacToeGame >> reset [

	board reset.
	currentPlayer := players first.
	history removeAll.
	^ self
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
