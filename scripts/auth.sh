#!/bin/bash

# Parse the command 
cmd=$1

# Handle cat
if [ "$cmd" == "new" ]; then
    echo "new"

    $username = $2
    $password = $3

    if [ -z "$username" ]; then
        echo "Username is required"
        exit 1
    fi

    if [ -z "$password" ]; then
        # generate a random password
        password=$(openssl rand -base64 12)
        echo "Generated password: $password"
        echo "Please save this password in a secure location"
    fi

    # hash the password
    password_hash=$(openssl passwd -apr1 $password)

    # TODO: create a new basic auth user

    ansible-playbook -i $inventory ./ansible/nginx/basic_auth.yml --extra-vars "username=$username hashed_password=$password_hash"
fi