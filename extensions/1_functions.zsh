timer() {
    if [[ -z $1 ]]; then
        echo "Usage: timer <command>"
        return 1
    fi

    local start_time=$(date +%s)
    eval $@
    local end_time=$(date +%s)

    local elapsed_time=$((end_time - start_time))
    echo "Elapsed time: $elapsed_time seconds"
}

addpath() {
    if [[ -z $1 ]]; then
        echo "Usage: addpath <path>"
        return 1
    fi

    if [[ ! -d $1 ]]; then
        echo "Error: $1 is not a directory"
        return 1
    fi

    if [[ $PATH == *$1* ]]; then
        echo "Error: $1 is already in PATH"
        return 1
    fi

    export PATH=$1:$PATH
}

delpath() {
    if [[ -z $1 ]]; then
        echo "Usage: delpath <path>"
        return 1
    fi

    if [[ $PATH != *$1* ]]; then
        echo "Error: $1 is not in PATH"
        return 1
    fi

    export PATH=$(echo $PATH | tr : '\n' | grep -v $1 | tr '\n' : | sed 's/:$//')
}

extract() {
    if [[ -z $1 ]]; then
        echo "Usage: extract <file>"
        return 1
    fi

    if [[ ! -f $1 ]]; then
        echo "Error: $1 is not a file"
        return 1
    fi

    local filename=$(basename $1)
    local extension="${filename##*.}"

    case $extension in
        zip) unzip $1 ;;
        tar) tar -xvf $1 ;;
        tar.gz) tar -xzvf $1 ;;
        tar.bz2) tar -xjvf $1 ;;
        *) echo "Error: $1 has an unsupported extension" 
        return 1 ;;
    esac
}

tgz() {
    local base=$(basename $(pwd))
    local parent=$(dirname $(pwd))
    local archive="$parent/$base.tar.gz"
    tar  --exclude='.git' --exclude='.DS_Store' -czvf $archive $base
}
