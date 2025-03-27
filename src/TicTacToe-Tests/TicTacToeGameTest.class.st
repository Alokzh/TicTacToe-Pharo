"
A TicTacToeGameTest is a test class for testing the behavior of TicTacToeGame
"
Class {
	#name : 'TicTacToeGameTest',
	#superclass : 'TestCase',
	#instVars : [
		'game'
	],
	#category : 'TicTacToe-Tests',
	#package : 'TicTacToe-Tests'
}

{ #category : 'running' }
TicTacToeGameTest >> setUp [

	game := TicTacToeGame new
]

{ #category : 'tests' }
TicTacToeGameTest >> testGameOverWhenBoardIsFull [

	#(1 2 3 5 4 6 8 7 9) do: [:index | game makeMove: index].
    self assert: game isGameOver.
    self deny: game board hasWinner.
    self assert: game board isFull.
]

{ #category : 'tests' }
TicTacToeGameTest >> testGameOverWithDraw [

	#(1 2 3 5 4 6 8 7 9) do: [:index | game makeMove: index].
    self assert: game isGameOver.
    self deny: game board hasWinner.
    self assert: game board isFull.
]

{ #category : 'tests' }
TicTacToeGameTest >> testGameOverWithWin [

	#(1 4 2 5 3) do: [:index | game makeMove: index].
    self assert: game isGameOver.
    self assert: game board hasWinner.
    self assert: game board winner equals: $X.
]

{ #category : 'tests' }
TicTacToeGameTest >> testHistoryRecordsMoves [

	game makeMove: 1.
    game makeMove: 2.
    self assert: game history size equals: 2.
    self assert: (game history first first mark) equals: $X.
    self assert: (game history second first mark) equals: $O.
]

{ #category : 'tests' }
TicTacToeGameTest >> testInitialization [

	self assert: game board class equals: TicTacToeBoard.
    self assert: game currentPlayer mark equals: $X.
    self assert: game history isEmpty.
    self deny: game isGameOver.
]

{ #category : 'tests' }
TicTacToeGameTest >> testInvalidMoveAfterGameOver [

	game makeMove: 5.
    self should: [game makeMove: 5] raise: Error.
    
    self assert: ([game makeMove: 5] on: Error do: [:ex | ex messageText]) 
        equals: 'Invalid move: cell already occupied'.
]

{ #category : 'tests' }
TicTacToeGameTest >> testInvalidMoveOccupiedCell [

	game makeMove: 5.
    self should: [game makeMove: 5] raise: Error.
    
    self assert: ([game makeMove: 5] on: Error do: [:ex | ex messageText]) 
        equals: 'Invalid move: cell already occupied'.
]

{ #category : 'tests' }
TicTacToeGameTest >> testInvalidMoveOutOfBounds [

	self should: [game makeMove: 0] raise: Error.
    self should: [game makeMove: 10] raise: Error.
    
    self assert: ([game makeMove: 0] on: Error do: [:ex | ex messageText]) 
        equals: 'Invalid move: index must be between 1 and 9'.
    self assert: ([game makeMove: 10] on: Error do: [:ex | ex messageText]) 
        equals: 'Invalid move: index must be between 1 and 9'.
]

{ #category : 'tests' }
TicTacToeGameTest >> testMultipleMoves [

	game makeMove: 1.
    game makeMove: 2.
    self assert: (game board cellAt: 1) equals: $X.
    self assert: (game board cellAt: 2) equals: $O.
    self assert: game history size equals: 2.
]

{ #category : 'tests' }
TicTacToeGameTest >> testResetGame [

	game makeMove: 1.
    game makeMove: 2.
    game reset.
    self assert: game board isFull not.
    self assert: game currentPlayer mark equals: $X.
    self assert: game history isEmpty.
    self deny: game isGameOver.
]

{ #category : 'tests' }
TicTacToeGameTest >> testStatusMessages [

	self assert: game status equals: 'Player X''s turn (X)'.
    
    game makeMove: 1.
    self assert: game status equals: 'Player O''s turn (O)'.
    
    game makeMove: 2.
    game makeMove: 4.
    game makeMove: 3.
    game makeMove: 7.
    self assert: game status equals: 'Game over! X wins!'.
    
    game reset.
    #(1 2 3 5 4 6 8 7 9) do: [:index | game makeMove: index].
    self assert: game status equals: 'Game over! It''s a draw!'.
]

{ #category : 'tests' }
TicTacToeGameTest >> testSwitchPlayer [

	self assert: (game currentPlayer mark) equals: $X.
    game switchPlayer.
    self assert: (game currentPlayer mark) equals: $O.
    game switchPlayer.
    self assert: (game currentPlayer mark) equals: $X.
]
