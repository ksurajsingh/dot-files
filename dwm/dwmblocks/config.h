//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {

/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
  {"",     "nettraf",  	        1,                 16}, 
  {"",      "memory", 	        1,                  4},
  {"",     "cpubars", 	        1,                  1},
  {"", 	 "cpu-usage",           1,                  1},
  {"",      "volume", 	       -1,                 10},
  {"",       "clock",  	        1,                  1},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
