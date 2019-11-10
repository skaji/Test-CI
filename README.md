# NAME

CI - Get details about the current Continuous Integration environment

# SYNOPSIS

    use CI;
    use Test::More;

    plan skip_all => 'This test is only for CI' if !CI::is_ci;

    ...

    done_testing;

# DESCRIPTION

CI gets details about the current Continuous Integration environment.
This is a Perl port of [https://github.com/watson/ci-info](https://github.com/watson/ci-info).

# AUTHOR

Shoichi Kaji <skaji@cpan.org>

# COPYRIGHT AND LICENSE

Copyright 2019 Shoichi Kaji <skaji@cpan.org>

The MIT License (MIT)
