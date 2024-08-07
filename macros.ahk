﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#Include wheel.ahk
#Include book.ahk
#Include cs.ahk

^+!#A::
PlayCounterStrike()
return

^+!#B::
SpinTheWheel()
return

^+!#C::
RandomBook()
return

^+!#D::
Send, D
return

^+!#E::
Send, E
return

^+!#F::
Send, F
return

^+!#G::
Send, G
return

^+!#H::
Send, H
return

^+!#I::
Run, "C:/Program Files/DisplayFusion/DisplayFusionCommand.exe" -monitorloadprofile Both
return

^+!#J::
Run, "C:/Program Files/DisplayFusion/DisplayFusionCommand.exe" -monitorloadprofile Right
return

^+!#K::
return

^+!#L::
Send, L
return
