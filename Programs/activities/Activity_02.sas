/***************************************************/
/* Activity 2:                                     */
/* Accumulating Column within Groups               */
/***************************************************/

/*************************************************************************************************/
/* The pg2.np_yearlyTraffic table contains annual traffic counts at locations in national parks. */ 
/* Park names are grouped into the following park types.                                         */
/*   		National Monument                                                                    */
/*   		National Park                                                                        */
/*  		National Preserve                                                                    */
/*   		National River                                                                       */
/*  		National Seashore                                                                    */
/*************************************************************************************************/

/*****************************************************************************************************/
/*  a) Run the PROC SORT step to sort the pg2.np_yearlyTraffic table by ParkType and ParkName.       */
/*  b) Run the DATA step to view first./ last. columns.                                              */
/*  c) Modify the DATA step as follows:                                                              */
/*     1) Comment out assignment and keep statements.                                                */
/*     2) Add a SUM statement to create a column named TypeCount that is the running total of Count. */
/*     3) Add an IF THEN statement before the SUM statement to reset TypeCount within each ParkType. */
/*        If it's the first row of a new ParkType, then reset the value in TypeCount to 0.           */
/*     4) Uncomment the FORMAT statement to format the values in TypeCount with commas.              */
/*     5) Uncomment the DROP statement to drop Location and ParkName.                                */
/*  d) Run the program and confirm TypeCount is reset at the beginning of each ParkType group.       */
/*  e) Modify the DATA step as follows:                                                              */
/*	   1) Write only the last row for each ParkType to the output table.                             */
/*     2) Drop Count.                                                                                */
/*****************************************************************************************************/

proc sort data=pg2.np_yearlyTraffic   
          out=sortedTraffic(keep=ParkType ParkName Location Count);
	by ParkType ParkName;
run;

data TypeTraffic;
    set sortedTraffic;
    by ParkType;
    
	*format TypeCount comma16.;
	*drop Location ParkName;

/*  Comment out after running:    */
    First_ParkType= first.ParkType;
    Last_ParkType= last.ParkType;
	keep ParkType First_ParkType Last_ParkType;
run;
