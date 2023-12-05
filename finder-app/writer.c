#include <stdio.h>
#include <stdlib.h>
#include <libgen.h>
#include <sys/stat.h>
#include <syslog.h>
#include <string.h>

int main(int argc, char* argv[]) {

   openlog("Logs", LOG_PID, LOG_USER);
   if (argc != 3) { 
      syslog(LOG_ERR,"Usage: %d error\n", argc);
      syslog(LOG_ERR,"Expecting Two arguments --------\n");
      syslog(LOG_ERR,"--- argument 1: path to a file\n");
      syslog(LOG_ERR,"--- argument 2: file content\n"); 
      closelog();
      return 1;
   }

   // syslog(LOG_INFO,"Program name is: %s\n", argv[0]);
   // syslog(LOG_INFO,"First argument is: %s\n", argv[1]);
   // syslog(LOG_INFO,"Second argument is: %s\n", argv[2]);

   char *path = argv[1];
   char *path1 = strdup(path);
   char *path2 = strdup(path);
   char *dname = dirname(path1);
   char *bname = basename(path2);
   char *text = argv[2];

   
   struct stat st = {0};

   if (stat(dname, &st) == -1) {
      mkdir(dname, 0777);
   }


   FILE *fp = fopen (path, "w");
   fputs(text, fp);
   syslog(LOG_DEBUG,"Writing \n%s to \n%s \n", text, bname);
   fclose(fp);
   closelog();
   return 0;
}