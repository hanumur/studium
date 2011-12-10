
# Enhance the XML program to add spaces to show the indentation structure.
Builder := Object clone
Builder tab := method("  " repeated(level))
Builder level := 0

Builder forward := method(
    writeln(tab, "<", call message name, ">")
    level = level + 1

    call message arguments foreach(arg,
        content := doMessage(arg)
        if(content type == "Sequence",
            writeln(tab, content)
        )
    )

    level = level - 1
    writeln(tab, "</", call message name, ">")
)

Builder body(
        ul(
        li("Io"),
        li("Lua"),
        li("JavaScript")))


# Create a list syntax that uses brackets.
squareBrackets := method(call message arguments)
List squareBrackets := method(index, value,
    if(value == nil,
        at(index),
        atPut(index, value)
    )
)

myList := [10, 11, 12]
myList println
myList[1] println
myList[1, 21] println


# Enhance the XML program to handle attributes: if the first argument is a map
# (use the curly brackets syntax), add attributes to the XML program. For example:
# book({"author": "Tate"}...) would print <book author="Tate">
OperatorTable addAssignOperator(":", "addAttribute")

curlyBrackets := method(
    map := Map clone
    call message arguments foreach(arg,
        map doMessage(arg)
    )
)

Map addAttribute := method(
    self atPut(
        call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
        call message argAt(1)
    )
)

Builder forward := method(
    write(tab, "<", call message name)
    firstArgument := call message arguments first
    if(firstArgument name == "curlyBrackets",
        attrs := doMessage(firstArgument)
        attrs foreach(key, value,
            write(" ", key, "=", value)
        )
    )
    writeln(">")
    level = level + 1

    call message arguments foreach(arg,
        content := doMessage(arg)
        if(content type == "Sequence",
            writeln(tab, content)
        )
    )

    level = level - 1
    writeln(tab, "</", call message name, ">")
)

builder := File with("xml.builder") openForReading contents
doString(builder) println
