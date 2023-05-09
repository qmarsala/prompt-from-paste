#SingleInstance force

SetWorkingDir A_ScriptDir
^+f1::chainOfThought()
;^+f2::reflexion()
;^+f3::resolver()

newLineSeperator := "+{Enter}+{Enter}"
question := ""

chainOfThought() {
    pasteQuestion()
    SendInput("Answer: Let's work this out in a step by step way to be sure we have the right answer.")
}

pasteQuestion() {
    question := A_Clipboard
    inputToSend := 
    (
        "Question: " 
        . question 
        . newLineSeperator
    )
    SendInput(inputToSend)
}
