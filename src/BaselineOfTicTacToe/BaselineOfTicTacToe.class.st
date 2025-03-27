Class {
	#name : 'BaselineOfTicTacToe',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfTicTacToe',
	#package : 'BaselineOfTicTacToe'
}

{ #category : 'baselines' }
BaselineOfTicTacToe >> baseline: spec [

	<baseline>
	spec for: #common do: [ "Packages"
		spec package: 'TicTacToe'.
		spec
			package: 'TicTacToe-Tests'
			with: [ spec requires: #( 'TicTacToe' ) ] ]
]
