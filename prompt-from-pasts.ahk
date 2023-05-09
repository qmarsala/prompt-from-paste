#SingleInstance force

SetWorkingDir A_ScriptDir
^+f1::chainOfThought()
^+f2::reflexion()
^+f3::resolver()

newLineSeperator := "+{Enter}+{Enter}"
question := ""
answer := ""
flaws := ""

chainOfThought() {
    pasteQuestion()
    SendInput("Answer: Let's work this out in a step by step way to be sure we have the right answer.")
}

reflexion() {
    pasteAnswerOption()
    SendInput("You are a researcher tasked with investigating the response options provided.+{Enter}List the flaws and faulty logic of each answer option.+{Enter}Let's work this out in a step way to be sure we have all the errors:")
}

resolver() {
    pasteResearchFindings()
    SendInput("You are a resolver tasked with +{Enter}1) finding which of the answer options the researcher thought was the best +{Enter}2) improving that answer; and +{Enter}3) Printing the improved answer in full.+{Enter}Let's work this out in a step by step way to be sure we have the right answer:")
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

pasteResearchFindings() {
    flaws := A_Clipboard
    inputToSend := 
    (
        "`"" 
        . question
        . answer
        . flaws
        . "`""
        . newLineSeperator
    )
    SendInput(inputToSend)
}