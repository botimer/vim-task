if exists("b:current_syntax")
  finish
endif

syntax keyword taskKeyword New new Working working Done done Todo TODO todo bug Bug

syntax match taskWorkingIcon "^( )" contained
syntax match taskWorkingIcon "^\s*( )" contained
syntax match taskDoneIcon "^(X)" contained
syntax match taskDoneIcon "^\s*(X)" contained

syntax match taskWorkingItem "^( ).*" contains=taskWorkingIcon,taskKeyword
syntax match taskWorkingItem "^\s*( ).*" contains=taskWorkingIcon,taskKeyword
syntax match taskDoneItem "^(X).*" contains=taskDoneIcon,taskKeyword
syntax match taskDoneItem "^\s*(X).*" contains=taskDoneIcon,taskKeyword

hi link taskKeyword Keyword

hi link taskWorkingItem Normal
hi link taskDoneItem Comment

hi link taskWorkingIcon Type
hi link taskDoneIcon Comment

syntax match sectionTitleLine "^.*:\s*$" contains=sectionTitle
syntax match sectionTitle "\S.*:\s*$"
hi link sectionTitle Identifier

let b:current_syntax = "task"

