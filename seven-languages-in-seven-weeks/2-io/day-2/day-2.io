# A Fibonacci sequence starts with two 1s. Each subsequent number is the sum
# of the two numbers that came before: 1, 1, 2, 3, 5, 8, 13, 21, and so on.
# Write a program to find the nth Fibonacci number. 
# fib(1) is 1, and fib(4) is 3. As a bonus, solve the problem with recursion and with loops.
fib := method(n,
    if(n <= 1, n, fib(n - 1) + fib(n - 2))
)
fib(1) println
fib(4) println

fib := method(n,
    a := 1
    b := 0
    for(i, 1, n, 
        temp := a + b
        a = b
        b = temp
    )
    return b
)
fib(1) println
fib(4) println


# How would you change / to return 0 if the denominator is zero?
division := Number getSlot("/")
Number / = method(denominator,
    if(denominator == 0,
        0,
        self division(denominator)
    )
)
(4 / 2) println
(4 / 0) println


# Write a program to add up all of the numbers in a two-dimensional array.
sum2d := method(self flatten sum)
list (list (1, 2, 3),
      list (4, 5, 6),
      list (7, 8, 9)) sum2d println


# Add a slot called myAverage to a list that computes the average of all the numbers in a list.
List myAverage := List getSlot("average")
list (1, 2, 3, 8) myAverage println

List myAverage := method(self sum / self size)
list (1, 2, 3, 8) myAverage println

# What happens if there are no numbers in a list?
    # Exception: Io Assertion 'operation not valid on non-number encodings'

# Bonus: Raise an Io exception if any item in the list is not a number.
sumNumber := method(
    self reduce(total, item,
        if(item isKindOf(Number),
            total + item,
            Exception raise("Some items in the list are not a number")
        )
    )
)
List myAverage := method(self sumNumber / self size)
list (1, 2, 3, 8) myAverage println
# list (1, 2, 3, "a") myAverage println  #==> Exception: Some items in the list are not a number


# Write a prototype for a two-dimensional list. The dim(x, y) method should allocate 
# a list of y lists that are x elements long. set(x, y, value) should set a value,
# and get(x, y) should return that value.
List2D := List clone

List2D dim := method(x, y,
    self setSize(y) mapInPlace(list setSize(x))
)

List2D set := method(x, y, value,
    self at(y) atPut(x, value)
)

List2D get := method(x, y,
    self at(y) at(x)
)

list2D := List2D clone
list2D dim(5, 2)
list2D set(2, 1, "buzz")
list2D get(2, 1) println


# Bonus: Write a transpose method so that (new_matrix get(y, x)) == matrix get(x, y) on the original list.
List2D transpose := method(
    list2dTranspose := List2D clone dim(self size, self first size)
    self foreach(y, row,
        row foreach(x, value,
            list2dTranspose set(y, x, value)
        )
    )
    return list2dTranspose
)

list2D dim(3, 3)
list2D set(0, 0, 0)
list2D set(1, 0, 1)
list2D set(2, 0, 2)
list2D set(0, 1, 3)
list2D set(1, 1, 4)
list2D set(2, 1, 5)
list2D set(0, 2, 6)
list2D set(1, 2, 7)
list2D set(2, 2, 8)
list2D println
list2D transpose println


# Write the matrix to a file, and read a matrix from a file.
File with("matrix.txt") openForUpdating write(list2D serialized) close
doFile("matrix.txt") println


# Write a program that gives you ten tries to guess a random number from 1–100.
# If you would like, give a hint of "hotter" or "colder" after the first guess.
secret := Random value(1, 100) round
guess := -1

10 repeat(
    "Enter a number:" println
    guess = File standardInput readLine asNumber
    if(guess == secret,
        "You found the number" println break,
        (guess > secret) ifTrue("colder" println) ifFalse("hotter" println)
    )
)
