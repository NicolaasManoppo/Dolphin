!STB 0 F    Package    6  String   ScribbleTest1r      ScribbleTest.pacr        STBCollectionProxy     STBClassProxy    r      IdentitySet&  Array    STBSymbolProxy    r      ScribbleTest�       �       r      Set      Association    *      r      Scribble*      r      looseA�      �  *      r      looseC�       �         �       �        r      Dolphinr      Scribble    STBIdentityDictionaryProxy    �       r      IdentityDictionary     *      r      postinstallr       *      r      preuninstall�  *      r      postuninstall�  *      r   
   preinstall�  �       `       �      �  r      Scribble test        � CompositePresenter subclass: #ScribbleTest
	instanceVariableNames: 'scribblePresenter'
	classVariableNames: ''
	poolDictionaries: ''!

'end-class-definition'! X ResourceIdentifier    �       r      Scribble�  F    ViewResource    $ STBResourceSTBByteArrayAccessorProxy    6 	 ByteArray�  !STB 0 N    STBViewProxy     STBClassProxy    6  String   ContainerView&  Array           �      6  LargeInteger      D  `        RGB    �    �                   BorderLayout                          Z       z       �      ScribbleView�   
       `   �      �         D   @  	 ListModel     STBCollectionProxy    z       �      OrderedCollection�             �  �                    MessageSequence    �      �  �       MessageSend     STBSymbolProxy    �      createAt:extent:�       Point    )   )   �      m  �  @   WINDOWPLACEMENT    6 	 ByteArray,   ,          ����������������      J  �   �      �      STBIdentityDictionaryProxy    z       �      IdentityDictionary�      @  �      scribble	 Rectangle    �      )   )   �      )   )   "      �      �  �      b      �  �      �            �      �  �  `   �        ,   ,           ����������������
   
   h    �      �  �      @   Icon           r      ContainerView.ico STBExternalResourceLibraryProxy    r      DolphinDevRes    �      �       r      ScribbleTestr      Default scribble test view�      
      "  �  !STB 0 N    STBViewProxy     STBClassProxy    6  String   ContainerView&  Array           �      6  LargeInteger      D  `                           BorderLayout                          Z       z       �      ReferenceView�          `   �      �         D                             ResourceIdentifier    z       �      Scribble�      Scribble test     MessageSequence     STBCollectionProxy    z       �      OrderedCollection�       MessageSend     STBSymbolProxy    �      createAt:extent:�       Point          �      �  �      WINDOWPLACEMENT    6 	 ByteArray,   ,          ����������������        ^  �   �        STBIdentityDictionaryProxy    z       �      IdentityDictionary�           �      �        �      B      p  �      �      =   G   �      �  �  `   �      �  ,   ,           ����������������   #   |    �        �         B             r      ContainerView.ico�      

ScribbleTest class instanceVariableNames: ''!

ScribbleTest comment: ''!

!ScribbleTest categoriesForClass!No category! !

!ScribbleTest methodsFor!

a
	^'A'!

createComponents
	"Private - Create the presenters contained by the receiver"

	super createComponents. 
	scribblePresenter := self add: Scribble new name: 'scribble'.
!

model: aListModel
	"Connects the receiver to aListModel. Since the receiver has the same model as the
	sketch pad (Scribble) component that it holds we pass this down to it."

	super model: aListModel.
	scribblePresenter model: aListModel.! !

!ScribbleTest categoriesFor: #a!no category! !
!ScribbleTest categoriesFor: #createComponents!initializing! !
!ScribbleTest categoriesFor: #model:!accessing! !

!ScribbleTest class methodsFor!

defaultModel
	"Answer a default model to be assigned to the receiver when it
	is initialized."

	^ListModel with: OrderedCollection new!

defaultView
	^'Default scribble test view'! !

!ScribbleTest class categoriesFor: #defaultModel!models! !
!ScribbleTest class categoriesFor: #defaultView!no category! !

!Scribble methodsFor!

looseA
	^#A! !

!Scribble categoriesFor: #looseA!no category! !

!Scribble methodsFor!

looseC
	^'C'! !

!Scribble categoriesFor: #looseC!no category! !

 