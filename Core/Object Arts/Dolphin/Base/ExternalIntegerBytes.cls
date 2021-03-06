﻿"Filed out from Dolphin Smalltalk 7"!

ByteArray variableByteSubclass: #ExternalIntegerBytes
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ExternalIntegerBytes guid: (GUID fromString: '{f5016870-059b-445b-a045-9e17ef13beec}')!
ExternalIntegerBytes isAbstract: true!
ExternalIntegerBytes comment: ''!
!ExternalIntegerBytes categoriesForClass!External-Data-Unstructured! !
!ExternalIntegerBytes methodsFor!

= anObject
	"Answer whether the receiver is equivalent to anObject."

	^anObject = self asInteger!

asInteger
	^self subclassResponsibility!

asObject
	"Answer the <Object> value represented by the receiver."

	^self value!

asSignedInteger
	^self subclassResponsibility!

asUIntPtr
	"Answer the receiver in a form suitable for passing/returning as a Windows LRESULT
	(32 or 64-bit, depending on host OS) return value. The default is self (which will cause the
	default window proc. of the window to be called for most objects other than Integers when
	used as a return value)."

	^self asInteger!

byteSize
	"Answer the size in bytes of this structure."

	^self size!

clear
	"Initialize the receiver's value to zero."

	self value: 0!

displayOn: aStream
	"Append a textual representation of the receiver to aStream."

	self asInteger printOn: aStream base: 16 showRadix: true!

hash
	"Answer the SmallInteger hash value for the receiver."

	^self asInteger hash!

isNull
	"Answer whether the receiver is Null (i.e. equal to 0). 
	This message is useful way of testing for NULL pointers or handles.
	Implementation Note: The speed of this test is important."

	<primitive: 171>
	^self asInteger == 0!

printOn: aStream
	"Append a textual representation of the receiver to aStream."

	aStream
		basicPrint: self;
		nextPut: $(; display: self; nextPut: $)
!

value
	"Answer the 32-bit unsigned <integer> value stored in the receiver."

	^self asInteger!

value: anObject 
	^self subclassResponsibility! !
!ExternalIntegerBytes categoriesFor: #=!comparing!public! !
!ExternalIntegerBytes categoriesFor: #asInteger!converting!public! !
!ExternalIntegerBytes categoriesFor: #asObject!accessing!public! !
!ExternalIntegerBytes categoriesFor: #asSignedInteger!converting!public! !
!ExternalIntegerBytes categoriesFor: #asUIntPtr!converting!public! !
!ExternalIntegerBytes categoriesFor: #byteSize!accessing!public! !
!ExternalIntegerBytes categoriesFor: #clear!initializing!public! !
!ExternalIntegerBytes categoriesFor: #displayOn:!displaying!public! !
!ExternalIntegerBytes categoriesFor: #hash!comparing!public! !
!ExternalIntegerBytes categoriesFor: #isNull!public!testing! !
!ExternalIntegerBytes categoriesFor: #printOn:!printing!public! !
!ExternalIntegerBytes categoriesFor: #value!accessing!public! !
!ExternalIntegerBytes categoriesFor: #value:!accessing!public! !

!ExternalIntegerBytes class methodsFor!

atAddress: anAddress 
	"Answer a new instance of the receiver with contents copied from
	the external integer pointed at by anAddress."

	^self fromInteger: (self valueAtAddress: anAddress)!

fieldType
	^self subclassResponsibility!

fromAddress: anAddress 
	"Answer a new instance of the receiver with contents *copied* from
	the external integer pointed at by anAddress (this is not a reference object
	and so must copy in response to #fromAddress:)"

	^self atAddress: anAddress!

fromInteger: anInteger
	"Answer a new instance of the receiver with contents copied from anInteger"

	^self new value: anInteger!

initialize
	"Private - Initialize the receiver's class variables.
		DWORDBytes initialize
	"

	self withAllSubclassesDo: [:e | e extraInstanceSpec: self elementSize]!

new
	"Answer a new instance of the receiver of the required size."

	^self newFixed: self elementSize!

valueAtAddress: anAddress 
	^self subclassResponsibility! !
!ExternalIntegerBytes class categoriesFor: #atAddress:!instance creation!public! !
!ExternalIntegerBytes class categoriesFor: #fieldType!constants!development!private! !
!ExternalIntegerBytes class categoriesFor: #fromAddress:!instance creation!public! !
!ExternalIntegerBytes class categoriesFor: #fromInteger:!instance creation!public! !
!ExternalIntegerBytes class categoriesFor: #initialize!development!initializing!private! !
!ExternalIntegerBytes class categoriesFor: #new!instance creation!public! !
!ExternalIntegerBytes class categoriesFor: #valueAtAddress:!helpers!private! !

