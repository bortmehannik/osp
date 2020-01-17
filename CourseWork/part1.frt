: parity 2 % not ;

: prime
	dup 2 < if drop 0 else
		dup 4 < if drop 1 else
			dup
			dup 2 / 1 + ( for i = 2 ; i <= n / 2; i++ )
			2 do ( limit, index)
				r@ % 0
				= if
					drop 0
					r> drop
					r@ >r
				else dup then
			loop
			0 = if 0 else drop 1 then
		then
	then
;

: prime_allot
    prime
    cell% allot dup
    -rot
    !
;

: concat
    dup count
    rot
    dup count
    rot dup
    + 1 + heap-alloc
    rot
    2dup
    string-copy
    drop
    dup
    rot + rot
    string-copy
;

: collatz
    dup
    1 < if ." Number must be positive" drop else
        repeat
            dup 2 % not if 2 / else 3 * 1 + then
            dup . ."  "
        dup 1 = until
    then
;
