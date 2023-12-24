@test "valid perl syntax" {
   run perl ./check-perl-syntax.pl bats/tests/valid.pl
   [ "$status" -eq 0 ]
}

@test "invalid perl syntax" {
   run perl ./check-perl-syntax.pl bats/tests/invalid.pl
   [ "$status" -ne 0 ]
}