﻿"Filed out from Dolphin Smalltalk 7"!

CommonDialogStructure subclass: #OPENFILENAMEW
	instanceVariableNames: 'fileName title filter defExt initialDir'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
OPENFILENAMEW guid: (GUID fromString: '{87b4c603-026e-11d3-9fd7-00a0cc3e4a32}')!
OPENFILENAMEW comment: 'OPENFILENAME is a <Win32Structure> which represent the Windows Common Dialog structure of the same name. It is used in conjunction with the GetOpenFileName() and GetSaveFileName() APIs which pop a common file dialog to browser for a file to load or save respectively. See the <FileDialog> and the Win32 documentation for further details.

The following instance variables hold <String> objects whose addresses have been stored into the structure. This is necessary to prevent premature garbage collection of these objects occurring during an external API call.

Instance Variables:
	fileName		<String>
	title 		<String>
	filter 		<String>
	defExt 		<String>
	fileTitle		<String>
	initialDir		<String>'!
!OPENFILENAMEW categoriesForClass!Win32-Structs! !
!OPENFILENAMEW methodsFor!

defaultExtension
	"Answer the default extension for the file open/save, or nil if none is set."

	^defExt!

defaultExtension: aString
	"Set the default extension for the file open/save.
	We store down the String in an instance variable to prevent it being GC'd."

	defExt := aString asUtf16String.
	self lpstrDefExt: defExt!

dwSize: anInteger
	"Set the receiver's 'dwSize' field to the value of the argument, anInteger"

	bytes dwordAtOffset: 0 put: anInteger!

fileName: aString
	"Set the file name to be opened/saved.
	We store down the String in an instance variable to prevent it being GC'd."

	fileName := aString asUtf16String.
	self lpstrFile: fileName!

fileTypes: aString
	"Set the file type filter to be used for the the common file dialog.
	We store down the String in an instance variable to prevent it being GC'd."

	filter := aString asUtf16String.
	self lpstrFilter: filter!

flags
	"Answer the <Integer> value of the receiver's 'flags' field."

	^bytes dwordAtOffset: ##(self offsetOf: #flags)!

flags: anInteger
	"Set the receiver's 'flags' field to the value of the argument, anInteger"

	bytes dwordAtOffset: ##(self offsetOf: #flags) put: anInteger!

flagsEx
	"Answer the <Integer> value of the receiver's 'flagsEx' field."

	^bytes dwordAtOffset: ##(self offsetOf: #flagsEx)!

flagsEx: anInteger
	"Set the receiver's 'flagsEx' field to the value of the argument, anInteger"

	bytes dwordAtOffset: ##(self offsetOf: #flagsEx) put: anInteger!

hookFlag
	^OFN_ENABLEHOOK!

hwndOwner: anExternalHandle
	"Set the receiver's 'hwndOwner' field to the value of the argument, anExternalHandle"

	bytes uintPtrAtOffset: ##(self offsetOf: #hwndOwner) put: anExternalHandle!

initialDirectory: aString
	"Set the initial directory path name to be opened/saved.
	We store down the String in an instance variable to prevent it being GC'd."

	initialDir := aString asUtf16String.
	self lpstrInitialDir: initialDir!

lpfnHook: anExternalAddress
	"Set the receiver's 'lpfnHook' field to the value of the argument, anExternalAddress"

	bytes uintPtrAtOffset: ##(self offsetOf: #lpfnHook) put: anExternalAddress!

lpstrDefExt: anUtf16String
	"Set the receiver's 'lpstrDefExt' field to the value of the argument, anUtf16String"

	bytes uintPtrAtOffset: ##(self offsetOf: #lpstrDefExt) put: anUtf16String yourAddress!

lpstrFile
	"Answer the <Utf16String> value of the receiver's 'lpstrFile' field."

	^Utf16String fromAddress: (bytes intPtrAtOffset: ##(self offsetOf: #lpstrFile))!

lpstrFile: anUtf16String
	"Set the receiver's 'lpstrFile' field to the value of the argument, anUtf16String"

	bytes uintPtrAtOffset: ##(self offsetOf: #lpstrFile) put: anUtf16String yourAddress!

lpstrFileTitle
	"Answer the <Utf16String> value of the receiver's 'lpstrFileTitle' field."

	^Utf16String fromAddress: (bytes intPtrAtOffset: ##(self offsetOf: #lpstrFileTitle))!

lpstrFileTitle: anUtf16String
	"Set the receiver's 'lpstrFileTitle' field to the value of the argument, anUtf16String"

	bytes uintPtrAtOffset: ##(self offsetOf: #lpstrFileTitle) put: anUtf16String yourAddress!

lpstrFilter: anUtf16String
	"Set the receiver's 'lpstrFilter' field to the value of the argument, anUtf16String"

	bytes uintPtrAtOffset: ##(self offsetOf: #lpstrFilter) put: anUtf16String yourAddress!

lpstrInitialDir: anUtf16String
	"Set the receiver's 'lpstrInitialDir' field to the value of the argument, anUtf16String"

	bytes uintPtrAtOffset: ##(self offsetOf: #lpstrInitialDir) put: anUtf16String yourAddress!

lpstrTitle: anUtf16String
	"Set the receiver's 'lpstrTitle' field to the value of the argument, anUtf16String"

	bytes uintPtrAtOffset: ##(self offsetOf: #lpstrTitle) put: anUtf16String yourAddress!

nFilterIndex
	"Answer the <Integer> value of the receiver's 'nFilterIndex' field."

	^bytes dwordAtOffset: ##(self offsetOf: #nFilterIndex)!

nFilterIndex: anInteger
	"Set the receiver's 'nFilterIndex' field to the value of the argument, anInteger"

	bytes dwordAtOffset: ##(self offsetOf: #nFilterIndex) put: anInteger!

nMaxFile: anInteger
	"Set the receiver's 'nMaxFile' field to the value of the argument, anInteger"

	bytes dwordAtOffset: ##(self offsetOf: #nMaxFile) put: anInteger!

nMaxFileTitle: anInteger
	"Set the receiver's 'nMaxFileTitle' field to the value of the argument, anInteger"

	bytes dwordAtOffset: ##(self offsetOf: #nMaxFileTitle) put: anInteger!

ownerView: aView
	"Set the parent window for the dialog to aView."

	| hWnd |
	hWnd := aView asParameter.
	hWnd isNull
		ifTrue: [self hwndOwner: 0]
		ifFalse: [self hwndOwner: hWnd].!

title: aString
	"Set the title to be used for the the common file dialog caption.
	We store down the String in an instance variable to prevent it being GC'd."

	title := aString asUtf16String.
	self lpstrTitle: title! !
!OPENFILENAMEW categoriesFor: #defaultExtension!accessing!public! !
!OPENFILENAMEW categoriesFor: #defaultExtension:!accessing!public! !
!OPENFILENAMEW categoriesFor: #dwSize:!**compiled accessors**!public! !
!OPENFILENAMEW categoriesFor: #fileName:!accessing!public! !
!OPENFILENAMEW categoriesFor: #fileTypes:!accessing!public! !
!OPENFILENAMEW categoriesFor: #flags!**compiled accessors**!public! !
!OPENFILENAMEW categoriesFor: #flags:!**compiled accessors**!public! !
!OPENFILENAMEW categoriesFor: #flagsEx!**compiled accessors**!public! !
!OPENFILENAMEW categoriesFor: #flagsEx:!**compiled accessors**!public! !
!OPENFILENAMEW categoriesFor: #hookFlag!accessing!public! !
!OPENFILENAMEW categoriesFor: #hwndOwner:!**compiled accessors**!public! !
!OPENFILENAMEW categoriesFor: #initialDirectory:!accessing!public! !
!OPENFILENAMEW categoriesFor: #lpfnHook:!**compiled accessors**!public! !
!OPENFILENAMEW categoriesFor: #lpstrDefExt:!**compiled accessors**!public! !
!OPENFILENAMEW categoriesFor: #lpstrFile!**compiled accessors**!public! !
!OPENFILENAMEW categoriesFor: #lpstrFile:!**compiled accessors**!public! !
!OPENFILENAMEW categoriesFor: #lpstrFileTitle!**compiled accessors**!public! !
!OPENFILENAMEW categoriesFor: #lpstrFileTitle:!**compiled accessors**!public! !
!OPENFILENAMEW categoriesFor: #lpstrFilter:!**compiled accessors**!public! !
!OPENFILENAMEW categoriesFor: #lpstrInitialDir:!**compiled accessors**!public! !
!OPENFILENAMEW categoriesFor: #lpstrTitle:!**compiled accessors**!public! !
!OPENFILENAMEW categoriesFor: #nFilterIndex!**compiled accessors**!public! !
!OPENFILENAMEW categoriesFor: #nFilterIndex:!**compiled accessors**!public! !
!OPENFILENAMEW categoriesFor: #nMaxFile:!**compiled accessors**!public! !
!OPENFILENAMEW categoriesFor: #nMaxFileTitle:!**compiled accessors**!public! !
!OPENFILENAMEW categoriesFor: #ownerView:!accessing!public! !
!OPENFILENAMEW categoriesFor: #title:!accessing!public! !

!OPENFILENAMEW class methodsFor!

defineFields
	"Define the fields of the OPENFILENAME structure.

	OPENFILENAME  compileDefinition

		typedef [uuid(87B4C603-026E-11D3-9FD7-00A0CC3E4A32)]
		struct tagOPENFILENAME {
			DWORD lStructSize;
			HWND hwndOwner;
			HINSTANCE HINSTANCE;
			LPWSTR lpstrFilter;
			LPWSTR lpstrCustomFilter;
			DWORD nMaxCustFilter;
			DWORD nFilterIndex;
			LPWSTR lpstrFile;
			DWORD nMaxFile;
			LPWSTR lpstrFileTitle;
			DWORD nMaxFileTitle;
			LPWSTR lpstrInitialDir;
			LPWSTR lpstrTitle;
			DWORD flags;
			WORD nFileOffset;
			WORD nFileExtension;
			LPWSTR lpstrDefExt;
			DWORD lCustData;
			LPVOID lpfnHook;
			LPWSTR lpTemplateName;
			void* pvReserved;
			DWORD dwReserved;
			DWORD FlagsEx;
		} OPENFILENAMEW;
"

	self
		defineField: #dwSize type: DWORDField writeOnly beOverride;
		defineField: #hwndOwner type: HANDLEField writeOnly;
		defineField: #hInstance type: HANDLEField filler;
		defineField: #lpstrFilter type: (PointerField type: Utf16String) beWriteOnly;
		defineField: #lpstrCustomFilter type: (PointerField type: Utf16String) beFiller;
		defineField: #nMaxCustFilter type: DWORDField filler;
		defineField: #nFilterIndex type: DWORDField new;
		defineField: #lpstrFile type: (PointerField type: Utf16String);
		defineField: #nMaxFile type: DWORDField writeOnly;
		defineField: #lpstrFileTitle type: (PointerField type: Utf16String);
		defineField: #nMaxFileTitle type: DWORDField writeOnly;
		defineField: #lpstrInitialDir type: (PointerField type: Utf16String) beWriteOnly;
		defineField: #lpstrTitle type: (PointerField type: Utf16String) beWriteOnly;
		defineField: #flags type: DWORDField new beOverride;
		defineField: #nFileOffset type: WORDField new beUncompiled;
		defineField: #nFileExtension type: WORDField new beUncompiled;
		defineField: #lpstrDefExt type: (PointerField type: Utf16String) beWriteOnly;
		defineField: #lCustData type: DWORDField filler;
		defineField: #lpfnHook type: LPVOIDField writeOnly beOverride;
		defineField: #lpTemplateName type: (PointerField type: Utf16String) beFiller;
		defineField: #pvReserved type: LPVOIDField filler;
		defineField: #dwReserved type: DWORDField filler;
		defineField: #flagsEx type: DWORDField new! !
!OPENFILENAMEW class categoriesFor: #defineFields!initializing!public! !

