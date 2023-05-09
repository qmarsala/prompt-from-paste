#SingleInstance force

SetWorkingDir A_ScriptDir
^+f1::chainOfThought()
^+f2::reflexion()
;^+f3::resolver()

newLineSeperator := "+{Enter}+{Enter}"
question := ""

chainOfThought() {
    pasteQuestion()
    SendInput("Answer: Let's work this out in a step by step way to be sure we have the right answer.")
}

reflexion() {
    pasteAnswerOption()
    SendInput("You are a researcher tasked with investigating the response options provided.+{Enter}List the flaws and faulty logic of each answer option.+{Enter}Let's work this out in a step way to be sure we have all the errors:")
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

;todo: probably should just write a app that calls the api
; - but it would be cool if we could copy several options and then paste them each with
; - the correct `Option X:` prefix
pasteAnswerOption() {
    answer := A_Clipboard
    inputToSend :=
    ( 
        "`"Question: " 
        . question 
        . newLineSeperator 
        . "Answer Option 1:" 
        . answer
        . "`""
        . newLineSeperator
    )
    SendInput(inputToSend)
}
