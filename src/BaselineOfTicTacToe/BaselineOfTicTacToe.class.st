Class {
	#name : 'BaselineOfTicTacToe',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfTicTacToe',
	#package : 'BaselineOfTicTacToe'
}

{ #category : 'baselines' }
BaselineOfTicTacToe >> baseline: spec [

	<baseline>
	spec for: #common do: [ "Packages" spec package: 'TicTacToe' ]
]
