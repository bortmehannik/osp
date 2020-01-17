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
