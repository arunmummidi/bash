## Runs through script.sh and passes values based on string

set timeout 10

expect <<END
            spawn ./script.sh
            expect "username"
            send "arun\r"
            expect "password"
            send "uday\r"
            expect eof
