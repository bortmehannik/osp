: concat
    dup count
    rot
    dup count
    rot dup
    + heap-alloc
    rot 2dup
    string-copy
    drop dup rot + rot
    string-copy
;
