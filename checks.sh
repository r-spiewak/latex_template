#!/bin/bash

# echo "Add some checks!"
# exit 0

install_package(){
    echo "Installing package..."
    echo "This hasn't actually been implemented yet..."
    # Should ensure LaTeX is installed, 
    # and do the compile to make the .log file.
    # exit_code=$?
    # if [[ $exit_code > 0 ]]
    # then
    #     echo "Failed to install package!"
    #     exit $exit_code
    # fi
    echo "Done."
}

test_check(){
    DEBUG_FLAG="$1"
    echo "Running test"
    if [[ $DEBUG_FLAG == "yes" ]]
    then
        bash utils/parse_tests.sh $*  # There is no debug version yet...
    else
        bash utils/parse_tests.sh $*
    # verbose option?
    fi
    exit_code=$?
    if [[ $exit_code != 0 ]]
    then
        echo "Test failed!"
        exit $exit_code 
    fi
    echo "Done."
}

pre_commit(){
    DEBUG_FLAG="$1"
    TESTS_FLAG="$2"
    shift 2
    if [[ $TESTS_FLAG == "yes" ]]
    then
        test_check $DEBUG_FLAG
    fi
}

pre_merge(){
    test_check
}

help(){
    echo "
    Usage: $(basename $0) COMMAND [OPTIONS]

    COMMAND:
        install|setup   Install package.
        *test           Perform tests.
        *commit         Perform pre-commit options (in-place,
                        where applicable): (optionally) tests.
        *merge          Perform pre-merge options (not
                        in-place): tests.
        help            Print this help message.

    OPTIONS:
        t       Also perform tests/coverage during *commit 
                command.
        d       Include "--pdb" flag in pytest (and also 
                perform test/coverage).
        h       Print help message and exit.
    "
}

DEBUG="no"
TESTS="no"
CMD="$1"; shift
while getopts dth opt; do
    case $opt in
        d)
            DEBUG="yes"
            TESTS="yes"
            shift
            ;;
        t)
            TESTS="yes"
            shift
            ;;
        h)
            help
            exit 0
            ;;
        ?)
            echo "Invalid option $OPTARG."
            help
            exit 1
            ;;
    esac
done
case $CMD in
    install | setup)
        install_package
        exit 0
        ;;
    *test)
        test_check $DEBUG $*
        exit 0
        ;;
    *commit)
        pre_commit $DEBUG $TESTS $*
        exit 0
        ;;
    *merge)
        pre_merge $*
        exit 0
        ;;
    help)
        help
        exit 0
        ;;
    *)
        echo "Invalid command: $CMD."
        help
        exit 1
esac