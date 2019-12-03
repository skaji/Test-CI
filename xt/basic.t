use strict;
use warnings;
use Test::More;

sub run {
    my ($env, $code) = @_;
    local %ENV = (%ENV, %$env);
    0 == system $^X, "-Ilib", "-MCI=:constant,name,is_pr,is_ci", "-we", "exit( ($code) ? 0 : 1)";
}

my @del = (qw(CI CONTINUOUS_INTEGRATION RUN_ID), grep { /TRAVIS/ || /GITHUB/ } keys %ENV);
delete @ENV{@del};

ok run(
    {},
    qq(is_ci == 0 && NEVERCODE == 0 && !defined name && !defined is_pr),
);
ok run(
    { NEVERCODE => "true" },
    qq(is_ci && NEVERCODE && name eq "Nevercode" && is_pr == 0),
);
ok run(
    { NEVERCODE => "true", NEVERCODE_PULL_REQUEST => "true" },
    qq(is_ci && NEVERCODE && name eq "Nevercode" && is_pr == 1),
);
ok run(
    { STRIDER => "true" },
    qq(is_ci && STRIDER && name eq 'Strider CD' && !defined is_pr),
);

done_testing;
