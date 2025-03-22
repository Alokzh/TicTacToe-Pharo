"
I represent a TicTacToe game board. I store the state of the 3x3 grid and provide methods to check for winning conditions.

The board is indexed from 1 to 9, with the following layout:
1 | 2 | 3
---------
4 | 5 | 6
---------
7 | 8 | 9
"
Class {
	#name : 'TicTacToeBoard',
	#superclass : 'Object',
	#instVars : [
		'cells'
	],
	#category : 'TicTacToe',
	#package : 'TicTacToe'
}

{ #category : 'accessing' }
TicTacToeBoard >> cellAt: index [

	^ cells at: index.
]

{ #category : 'accessing' }
TicTacToeBoard >> cellAt: index put: aValue [

	cells at: index put: aValue.
]

{ #category : 'initialization' }
TicTacToeBoard >> initialize [

	super initialize.
	cells := Array new: 9 withAll: nil
]

{ #category : 'accessing' }
TicTacToeBoard >> isEmpty: index [

	^ (self cellAt: index) isNil.
]
