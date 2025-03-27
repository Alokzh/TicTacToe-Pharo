"
A TicTacToeBoardTest is a test class for testing the behavior of TicTacToeBoard
"
Class {
	#name : 'TicTacToeBoardTest',
	#superclass : 'TestCase',
	#instVars : [
		'board'
	],
	#category : 'TicTacToe-Tests',
	#package : 'TicTacToe-Tests'
}

{ #category : 'running' }
TicTacToeBoardTest >> setUp [
board := TicTacToeBoard new.

]

{ #category : 'running' }
TicTacToeBoardTest >> testCellAccess [

	board cellAt: 5 put: $X.
    self assert: (board cellAt: 5) equals: $X.
    self deny: (board isEmpty: 5).
    
    board cellAt: 5 put: nil.
    self assert: (board isEmpty: 5).
]

{ #category : 'running' }
TicTacToeBoardTest >> testDiagonalWins [

	board
		cellAt: 1 put: $X;
		cellAt: 5 put: $X;
		cellAt: 9 put: $X.
	self assert: board hasWinner.
	self assert: board winner equals: $X.

	board reset.
	board
		cellAt: 3 put: $O;
		cellAt: 5 put: $O;
		cellAt: 7 put: $O.
	self assert: board hasWinner.
	self assert: board winner equals: $O
]

{ #category : 'running' }
TicTacToeBoardTest >> testDrawCondition [

	board cellAt: 1 put: $X.
	board cellAt: 2 put: $O.
	board cellAt: 3 put: $X.
	board cellAt: 4 put: $O.
	board cellAt: 5 put: $X.
	board cellAt: 6 put: $X.
	board cellAt: 7 put: $O.
	board cellAt: 8 put: $X.
	board cellAt: 9 put: $O.

	self assert: board isFull.
	self deny: board hasWinner.
	self assert: board isDraw
]

{ #category : 'running' }
TicTacToeBoardTest >> testHorizontalWins [

	#(#(1 2 3) #(4 5 6) #(7 8 9)) do: [:pattern |
        board reset.
        pattern do: [:index | board cellAt: index put: $X].
        self assert: (board hasWinner).
        self assert: (board winner) equals: $X.
    ].
]

{ #category : 'running' }
TicTacToeBoardTest >> testInitialization [

	1 to: 9 do: [:index |
        self assert: (board isEmpty: index).
    ].
]

{ #category : 'running' }
TicTacToeBoardTest >> testIsEmpty [

	self assert: (board isEmpty: 1).
    board cellAt: 1 put: $X.
    self deny: (board isEmpty: 1).
]

{ #category : 'running' }
TicTacToeBoardTest >> testIsFull [

	self deny: board isFull.
    1 to: 9 do: [:index | board cellAt: index put: $X].
    self assert: board isFull.
]

{ #category : 'running' }
TicTacToeBoardTest >> testReset [

	1 to: 9 do: [:index | board cellAt: index put: $X].
    board reset.
    1 to: 9 do: [:index | self assert: (board isEmpty: index)].
]

{ #category : 'running' }
TicTacToeBoardTest >> testVerticalWins [

	#(#(1 4 7) #(2 5 8) #(3 6 9)) do: [:pattern |
        board reset.
        pattern do: [:index | board cellAt: index put: $O].
        self assert: (board hasWinner).
        self assert: (board winner) equals: $O.
    ].
]
