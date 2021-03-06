﻿"Filed out from Dolphin Smalltalk 7"!

ValueHolder subclass: #ValueBuffer
	instanceVariableNames: 'subject modified gate'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ValueBuffer guid: (GUID fromString: '{87b4c67d-026e-11d3-9fd7-00a0cc3e4a32}')!
ValueBuffer comment: 'A ValueBuffer can be used to buffer changes to a subject <valueModel>. It presents the same <value> protocol as its subject but, when the value is changed, the change is not immediately passed to the subject. This only happens when the ValueBuffer receives an #apply message to indicate that any changes should flushed.

It is important to note that, in order to be used with a ValueBuffer

Instance Variables:
	subject		<valueModel> being buffered.
	modified		<boolean> indicating whether the subject has been modified.
	gate		<valueModel> which, when set true will apply changes back to the subject.


'!
!ValueBuffer categoriesForClass!MVP-Models! !
!ValueBuffer methodsFor!

apply
	"Apply any buffered changes back to the subject."

	modified 
		ifTrue: 
			[subject value: self value.
			modified := false]!

gate
	"Answer the gate value model that controls when (and if) changes will be flushed back to the
	original model."

	^gate!

gate: aValueModelGate
	"Set the gate model to be aValueModelGate. Changes will be flushed back to the original
	model when the value of aValueModelGate is set to true."

	gate := aValueModelGate.
	gate when: #valueChanged send: #onGateChanged to: self.!

isModified
	"Answer whether the buffer is holding a modified value that can be applied. If not then the value is that of the subject."

	^modified!

isValid
	"Answer true if the updates to the model are valid. Provided for protocol compatibility with
	AspectBuffer"

	^true!

onGateChanged
	"Private - Received when the gate has been triggered. Use this to either flush changes back
	to the subject if required"

	self gate value ifTrue: [self apply]!

setValue: anObject 
	"Private - Assigns the value for the receiver without notifying dependents of the change.
	The value is saved in the buffer and not directed to the subject (yet)."

	super setValue: anObject.
	modified := true!

subject
	"Answers the actual subject model"

	^subject!

subject: aSubjectValueModel 
	"Private - Initializes the receiver on aSubjectValueModel"

	gate := false asValue.
	subject := aSubjectValueModel.
	modified := false!

value
	"Answers the value of the receiver. If the value has been modified then answer the buffered
	value otherwise answer that of the subject"

	^modified ifTrue: [super value] ifFalse: [subject value]! !
!ValueBuffer categoriesFor: #apply!accessing!commands!public! !
!ValueBuffer categoriesFor: #gate!accessing!public! !
!ValueBuffer categoriesFor: #gate:!accessing!public! !
!ValueBuffer categoriesFor: #isModified!public!testing! !
!ValueBuffer categoriesFor: #isValid!public!testing! !
!ValueBuffer categoriesFor: #onGateChanged!event handling!private! !
!ValueBuffer categoriesFor: #setValue:!accessing!private! !
!ValueBuffer categoriesFor: #subject!initializing!public! !
!ValueBuffer categoriesFor: #subject:!initializing!private! !
!ValueBuffer categoriesFor: #value!accessing!public! !

!ValueBuffer class methodsFor!

icon
	"Answers an Icon that can be used to represent this class"

	^##(self) defaultIcon!

new
	"Private - Use #subject:"

	^self shouldNotImplement!

subject: aSubjectValueModel 
	"Answer an instance of the receiver that buffers the value of aSubjectValueModel."

	^super new subject: aSubjectValueModel! !
!ValueBuffer class categoriesFor: #icon!constants!public! !
!ValueBuffer class categoriesFor: #new!instance creation!private! !
!ValueBuffer class categoriesFor: #subject:!instance creation!public! !

