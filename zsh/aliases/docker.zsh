dcl() {
    if [ $# -eq 0 ]; then
        echo "Usage: dcl <container-name-pattern>"
        return 1
    fi
    
    local pattern="$1"
    local containers
    containers=$(docker ps --format "{{.Names}}" | grep "$pattern")
    
    if [ -z "$containers" ]; then
        echo "No containers found matching pattern: $pattern"
        return 1
    fi
    
    local count
    count=$(echo "$containers" | wc -l)
    
    if [ "$count" -eq 1 ]; then
        docker logs "$containers"
    else
        echo "Multiple containers found:"
        select container in ${(f)containers}; do
            if [ -n "$container" ]; then
                docker logs "$container"
                break
            else
                echo "Invalid selection"
            fi
        done
    fi
}

dclf() {
    if [ $# -eq 0 ]; then
        echo "Usage: dclf <container-name-pattern>"
        return 1
    fi
    
    local pattern="$1"
    local containers
    containers=$(docker ps --format "{{.Names}}" | grep "$pattern")
    
    if [ -z "$containers" ]; then
        echo "No containers found matching pattern: $pattern"
        return 1
    fi
    
    local count
    count=$(echo "$containers" | wc -l)
    
    if [ "$count" -eq 1 ]; then
        docker logs -f "$containers"
    else
        echo "Multiple containers found:"
        select container in ${(f)containers}; do
            if [ -n "$container" ]; then
                docker logs -f "$container"
                break
            else
                echo "Invalid selection"
            fi
        done
    fi
}

alias dcp="docker container ps"
alias dcpa="docker container ps -a"
