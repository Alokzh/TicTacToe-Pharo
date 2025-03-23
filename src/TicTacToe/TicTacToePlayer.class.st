"
I represent a player in a TicTacToe game. I have a name and a mark (X or O).
"
Class {
	#name : 'TicTacToePlayer',
	#superclass : 'Object',
	#instVars : [
		'mark',
		'name'
	],
	#category : 'TicTacToe',
	#package : 'TicTacToe'
}

{ #category : 'initialization' }
TicTacToePlayer >> initialize [

	super initialize.
    mark := $X.
    name := 'Player'
]

{ #category : 'accessing' }
TicTacToePlayer >> mark [

	^ mark
]

{ #category : 'accessing' }
TicTacToePlayer >> mark: aMark [

	mark := aMark
]

{ #category : 'accessing' }
TicTacToePlayer >> name [
	
	^ name
]

{ #category : 'accessing' }
TicTacToePlayer >> name: aName [
	
	name := aName
]
