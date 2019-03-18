// /root/scripts/zabbix-service.c
#include <stdio.h>
#include <string.h>
#include <unistd.h>

const char *opt = NULL;

//compile: gcc -o zabbix-service zabbix-service.c
//copy: cp zabbix-service /home/zapper/utils/zabbix-service
//suid: chmod a+s /home/zapper/utils/zabbix-service

int main(int argc, const char **argv) {
        setuid(0);
        setgid(0);

        if (argc == 1) {
                // no argument was passed in, get input
                char input[10];
                printf( "start or stop?: " );
                fgets(input, sizeof(input),  stdin);
                input[strcspn(input, "\n")] = 0;
                opt = input;
        } else {
                opt = argv[1];
        }

        if (strcmp(opt, "start") == 0) {
                system("systemctl daemon-reload && systemctl start zabbix-agent");
        } else if (strcmp(opt, "stop") == 0) {
                system("systemctl stop zabbix-agent");
        } else {
                printf("[!] ERROR: Unrecognized Option\n");
                return 1;
        }
        return 0;
}
