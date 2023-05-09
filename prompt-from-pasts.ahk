#SingleInstance force

SetWorkingDir A_ScriptDir
;todo: diff hotkeys
^+f1::chainOfThought()
^+f2::reflexion()
^+f3::resolver()
^!c::pushAnswer()

newLineSeperator := "`n`n"
question := "default q"
answer := "default a"
flaws := "default f"
answers := []

chainOfThought() {
    global answers := []
    global question := "Question: " . A_Clipboard
    inputToSend := question . newLineSeperator
    paste(inputToSend)
    paste("Answer: Let's work this out in a step by step way to be sure we have the right answer.")
}

reflexion() {
    if (answers.Length < 1)
    {
        answers.Push(A_Clipboard)
    }

    currentAnswer := ""
    count := 1
    for a in answers
    {
        currentAnswer .= "Answer Option " count ":" a newLineSeperator
        count++
    }
    global answer := RTrim(currentAnswer, "`n")
    inputToSend := quote(question) . newLineSeperator . quote(answer) . newLineSeperator
    paste(inputToSend)
    paste("You are a researcher tasked with investigating the response options provided.`nList the flaws and faulty logic of each answer option.`nLet's work this out in a step way to be sure we have all the errors:")
}

resolver() {
    global flaws := A_Clipboard
    inputToSend := quote(question) . newLineSeperator . quote(answer) . newLineSeperator . quote(flaws) . newLineSeperator
    paste(inputToSend)
    paste("You are a resolver tasked with `n1) finding which of the answer options the researcher thought was the best `n2) improving that answer; and `n3) Printing the improved answer in full.`nLet's work this out in a step by step way to be sure we have the right answer:")
}

pushAnswer() {
    SendInput("^c")
    Sleep(25)
    answers.Push(A_Clipboard)
}

quote(text) {
    return "`"" . text . "`""
}

paste(text) {
    A_Clipboard := text
    Sleep(25)
    SendInput("^v")
    Sleep(25)
}