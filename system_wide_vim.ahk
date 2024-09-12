#NoEnv
#Warn
SendMode Input
SetWorkingDir %A_ScriptDir%

; Global variables
vimMode := false
visualMode := false
operatorPending := false
operator := ""

; Toggle Vim mode on/off with CapsLock
CapsLock::
    vimMode := !vimMode
    visualMode := false
    operatorPending := false
    operator := ""
    if (vimMode) {
        SetCapsLockState, AlwaysOff
        ToolTip, Vim Mode: ON
    } else {
        SetCapsLockState, Off
        ToolTip
    }
return

; Double-tap right shift for caps lock toggle, but allow normal shift functionality
RShift::
    if (A_PriorHotkey != "RShift" or A_TimeSincePriorHotkey > 400)
    {
        ; Too much time between presses, so this isn't a double-press
        Send {RShift Down}
        KeyWait, RShift
        Send {RShift Up}
        return
    }
    SetCapsLockState, % GetKeyState("CapsLock", "T") ? "Off" : "On"
return

; Additional shortcuts (always active)
<^+"::Send {Enter}
<^;::Send {Backspace}
<^+;::Send {Delete}
<^'::Send {Enter}

#If vimMode

; Navigation keys
h::Move("{Left}")
l::Move("{Right}")
k::Move("{Up}")
j::Move("{Down}")
w::Move("^{Right}")
+w::Move("+^{Right}")
b::Move("^{Left}")
+b::Move("+^{Left}")
0::Move("{Home}")
$::Move("{End}")
^::Move("{Home}")

; Top and bottom of file
g::
    KeyWait, g
    Input, key, T0.1 L1
    if (key = "g")
        Move("^{Home}")
return

+g::Move("^{End}")

; Delete
x::Send {Delete}
+x::Send {BS}

; Copy/Paste
y::
    if (visualMode) {
        Send ^c
        visualMode := false
        ToolTip
    } else {
        operatorPending := true
        operator := "y"
    }
return

p::Send ^v

; Undo/Redo
u::Send ^z
^r::Send ^y

; Operators
d::
    operatorPending := true
    operator := "d"
return

c::
    operatorPending := true
    operator := "c"
return

v::
    visualMode := !visualMode
    if (visualMode)
        ToolTip, Visual Mode
    else
        ToolTip
return

; New commands to exit NORMAL mode
i::ExitNormalMode("")
+i::ExitNormalMode("{Home}")
a::ExitNormalMode("{Right}")
+a::ExitNormalMode("{End}")
o::ExitNormalMode("{End}{Enter}")
+o::ExitNormalMode("{Home}{Enter}{Up}")

; ESC key to exit visual mode or operator pending mode
Esc::
    visualMode := false
    operatorPending := false
    operator := ""
    ToolTip
return

#If

Move(key) {
    global visualMode, operatorPending, operator, vimMode
    
    if (visualMode) {
        Send +%key%
    } else if (operatorPending) {
        if (operator = "d") {
            Send +%key%
            Send ^x
        } else if (operator = "c") {
            Send +%key%
            Send ^x
            vimMode := false
            ToolTip
        } else if (operator = "y") {
            Send +%key%
            Send ^c
            Send % "{" SubStr(key, 2, -1) " " SubStr(key, 1, 1) "}"
        }
        operatorPending := false
        operator := ""
    } else {
        Send %key%
    }
}

ExitNormalMode(key) {
    global vimMode
    Send %key%
    vimMode := false
    ToolTip
}