: collatz
    dup
    1 < if ." Number must be positive" drop else
        repeat
            dup 2 % not if 2 / else 3 * 1 + then
            dup . ."  "
        dup 1 = until
    then
;
