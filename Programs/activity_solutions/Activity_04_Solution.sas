/***************************************************/
/* Activity 4:                                     */
/* Manipulating Data with Character Functions      */
/***************************************************/

/*************************************************************************************************/
/* The pg2.np_monthlytraffic table contains monthly traffic statistics for national parks.       */
/* However, the national park names and park types are included in the same column.              */
/*************************************************************************************************/

/********************************************************************************************************************/
/*  a) Notice that the DATA step creates a table named PARKS and reads only those rows where ParkName ends with NP. */
/*  b) Modify the DATA step to create or modify the following columns:                                              */
/*     1) Create a new column named Type.                                                                           */
/*        Use the SCAN function to scan ParkName for the last word.                                                 */
/*     2) Create a new column named NPLocation.                                                              	    */
/*  	  Use the FIND function to identify the position number of the NP string in the Parkname column.            */
/*	   3) Create a new column named NameLength.                                                                     */
/*        Subtract 2 from the value in NPLocation.                                                                  */
/*        This will be the dynamic length of each park name.                                                        */
/*     4) Create a new column named Park.                                                                           */
/*        Use the SUBSTR function to read the ParkName column, start at the first position and                      */
/*        extract the number characters found in NameLength.                                                        */
/*        This will extract the park name without the park type abbreviation at the end.                            */
/*     5) Uncomment the assignment statement to create Park2 with nested functions, producing the same result.      */
/*     6) Uncomment the final DROP statement to drop NPLocation, NameLength, ParkName and Park2.                    */
/********************************************************************************************************************/

data parks;
	set pg2.np_monthlytraffic;
	where ParkName like '%NP';
	drop ParkCode Region Location NPLocation NameLength ParkName Park2;
/*       scan(colName, number of word to extract) */
	Type=scan(ParkName, -1);
/*             find(colName, "string to find starting position of") */
	NPLocation=find(ParkName, "NP");
	
	NameLength=NPLocation-2;
/*       substr(colName, start position number, number of characters to extract) */
	Park=substr(ParkName, 1, NameLength);

	Park2=substr(ParkName,1, find(ParkName, "NP")-2);
run;


