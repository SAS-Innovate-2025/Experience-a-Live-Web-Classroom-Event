/***************************************************/
/* Activity 7:                                     */
/* Concatenating Tables                            */
/***************************************************/

/*************************************************************************************************/
/* The pg2.np_2014, pg2.np_2015 and pg2.np_2016 tables contain monthly public use statistics     */
/* from the National Park Service.                                                               */
/*************************************************************************************************/

/***************************************************************************************/
/* a) Run the PROC PRINTs to view the pg2.np_2014, pg2.np_2015 and pg2.np_2016 tables. */
/*    What two column names are different in np_2014?                                  */
/* b) In the DATA step, use the RENAME= data set option to rename Park to ParkCode     */
/*    and Type to ParkType in np_2014.                                                 */
/***************************************************************************************/

title "pg2.np_2014";
proc print data=pg2.np_2014 (obs=10);
run;
title;

title "pg2.np_2015";
proc print data=pg2.np_2015 (obs=10);
run;
title;

title "pg2.np_2016";
proc print data=pg2.np_2016 (obs=10);
run;
title;

data work.np_combine;
    set pg2.np_2014
		pg2.np_2015
		pg2.np_2016;
    where Month in (6, 7, 8) and ParkType="National Park";
run;
