# This script takes care of testing your crate

set -ex

# TODO This is the "test phase", tweak it as you see fit
main() {
    cross build --target $TARGET --release

    if [ -z $DISABLE_TESTS ]; then
        cross test --target $TARGET --features=integration-test --release
    fi
}

# despite using `mv --update & --force` travi-ci throws an error, so need to use verbose conditional
if [ "jcli" != "$CLI_NAME" ]; then
  mv src/bin/jcli.rs src/bin/$CLI_NAME.rs
fi;

# we don't run the "test phase" when doing deploys
if [ -z $TRAVIS_TAG ]; then
    main
fi
