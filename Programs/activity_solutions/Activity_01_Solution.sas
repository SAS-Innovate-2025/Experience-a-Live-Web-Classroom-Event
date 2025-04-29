/***************************************************/
/* Activity 1:                                     */
/* Populating Multiple Tables with Explicit Output */
/***************************************************/

/*************************************************************************************************/
/* The pg2.np_yearlytraffic table contains annual traffic counts at locations in national parks. */ 
/* Parks are classified as one of five types in the ParkType column:                             */
/*   		National Monument                                                                    */
/*   		National Park                                                                        */
/*  		National Preserve                                                                    */
/*   		National River                                                                       */
/*  		National Seashore                                                                    */
/*************************************************************************************************/

/********************************************************************************/                                 
/*  a) Modify the DATA step to create three tables: monument, park, and other.  */
/*  b) Use the value of ParkType to determine which table the row is output to. */
/*  c) Uncomment the DROP statement to drop Region from all three tables.       */
/*  d) Submit the program and verify the output.                                */
/********************************************************************************/

data monument park other ;
	set pg2.np_yearlytraffic;
	if ParkType="National Monument" then output monument;
	else if ParkType="National Park" then output park;
	else output other;
	drop Region;
run;

