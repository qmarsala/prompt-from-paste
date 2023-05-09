#SingleInstance force

SetWorkingDir A_ScriptDir
^+f1::chainOfThought()
^+f2::reflexion()
^+f3::resolver()

newLineSeperator := "`n`n"
question := "default q"
answer := "default a"
flaws := "default f"

chainOfThought() {
    pasteQuestion()
    paste("Answer: Let's work this out in a step by step way to be sure we have the right answer.")
}

reflexion() {
    pasteAnswerOption()
    paste("You are a researcher tasked with investigating the response options provided.`nList the flaws and faulty logic of each answer option.`nLet's work this out in a step way to be sure we have all the errors:")
}

resolver() {
    pasteResearchFindings()
    paste("You are a resolver tasked with `n1) finding which of the answer options the researcher thought was the best `n2) improving that answer; and `n3) Printing the improved answer in full.`nLet's work this out in a step by step way to be sure we have the right answer:")
}

pasteQuestion() {
    global question := "Question: " . A_Clipboard
    paste(question)
    paste(newLineSeperator)
}

;todo: probably should just write a app that calls the api
; - but it would be cool if we could copy several options and then paste them each with
; - the correct `Option X:` prefix
pasteAnswerOption() {
    global answer := "Answer Option 1:" . A_Clipboard
    inputToSend :=
    (
        "`""
        . question
        . newLineSeperator
        . answer
        . "`""
        . newLineSeperator
    )
    paste(inputToSend)
}

pasteResearchFindings() {
    global flaws := A_Clipboard
    inputToSend :=
    (
        "`""
        . question
        . newLineSeperator
        . answer
        . newLineSeperator
        . flaws
        . "`""
        . newLineSeperator
    )
    paste(inputToSend)
}

paste(thing) {
    A_Clipboard := thing
    Sleep(25)
    SendInput("^v")  
    Sleep(25)
}