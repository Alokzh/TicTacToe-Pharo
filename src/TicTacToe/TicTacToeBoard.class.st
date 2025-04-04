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

{ #category : 'testing' }
TicTacToeBoard >> hasWinner [

	^ self winner notNil
]

{ #category : 'initialization' }
TicTacToeBoard >> initialize [

	super initialize.
	cells := Array new: 9 withAll: nil
]

{ #category : 'testing' }
TicTacToeBoard >> isDraw [

	^ self isFull and: [self hasWinner not]
]

{ #category : 'accessing' }
TicTacToeBoard >> isEmpty: index [

	^ (self cellAt: index) isNil.
]

{ #category : 'accessing' }
TicTacToeBoard >> isFull [

	^ cells allSatisfy: [:each | each notNil]
]

{ #category : 'printing' }
TicTacToeBoard >> printOn: aStream [

	| index |
	index := 1.
	aStream nextPutAll: '-------'; cr.
	1 to: 3 do: [:row |
		aStream nextPut: $|.
		1 to: 3 do: [:col |
			| cell |
			cell := cells at: index.
			aStream nextPut: (cell ifNil: [$ ] ifNotNil: [cell]).
			aStream nextPut: $|.
			index := index + 1.
		].
		aStream cr.
		aStream nextPutAll: '-------'; cr.
	]
]

{ #category : 'initialization' }
TicTacToeBoard >> reset [

	1 to: 9 do: [:index |
		self cellAt: index put: nil.
	]
]

{ #category : 'testing' }
TicTacToeBoard >> winner [

	self winningPatterns do: [:pattern |
        | firstCell |
        firstCell := self cellAt: pattern first.
        (firstCell notNil and: [
            pattern allSatisfy: [:index | (self cellAt: index) = firstCell]
        ]) ifTrue: [ ^ firstCell ].
    ].
    ^ nil
]

{ #category : 'private' }
TicTacToeBoard >> winningPatterns [

	^ #(
		#(1 2 3) #(4 5 6) #(7 8 9)
		#(1 4 7) #(2 5 8) #(3 6 9)
		#(1 5 9) #(3 5 7)
	)
]
