/*******************************************************************************
    math.c - Verilog PLI code to implement various math functions
    Grab the latest from http://chris.spear.net

    Copyright (C) 1999, 2004 Christian B. Spear
    Hey - let's not be formal, you can call me Chris!

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.


The hardest part of these routines is reading the real args and
returning real values.

*******************************************************************************/

#include "math.h"	/* C Math routines			*/
#include "veriuser.h"	/* Base Verilog PLI definitions		*/


/* Definitions specific for math.c                              */
#define ARG1	1	/* First argument			*/
#define ARG2	2	/* Second argument			*/
#define RETURNV	0	/* Return value				*/

/****************************************************************/
/* Checktf() routine to check for a single real argument	*/
int math_check1() 
{
  if (tf_nump() != ARG1) {
    tf_error("Wrong number of arguments, expecting 1");
    return;
  }

  if (tf_typep(ARG1) != tf_readonlyreal && 
      tf_typep(ARG1) != tf_readwritereal) 
    tf_error("The argument must be a real number.");

}


/****************************************************************/
/* Checktf() routine to check for a single real argument	*/
int math_check2() 
{
  if (tf_nump() != ARG2) {
    tf_error("Wrong number of arguments, expecting 2");
    return;
  }

  if (tf_typep(ARG1) != tf_readonlyreal && 
      tf_typep(ARG1) != tf_readwritereal) 
    tf_error("The first argument must be a real number.");

  if (tf_typep(ARG2) != tf_readonlyreal && 
      tf_typep(ARG2) != tf_readwritereal) 
    tf_error("The second argument must be a real number.");

}

/****************************************************************/
/* Calltf routine for exp or e**x                               */
exp_call()
{
    tf_putrealp (RETURNV, exp(tf_getrealp(ARG1)));
}


/****************************************************************/
/* Calltf routine for natural log                               */
log_call()
{
    tf_putrealp (RETURNV, log(tf_getrealp(ARG1)));
}


/****************************************************************/
/* Calltf routine for log base 10                               */
log10_call()
{
    tf_putrealp (RETURNV, log10(tf_getrealp(ARG1)));

}


/****************************************************************/
/* Calltf routine for sine function                             */
sin_call()
{
    tf_putrealp (RETURNV, sin(tf_getrealp(ARG1)));
}


/****************************************************************/
/* Calltf routine for sqrt function                             */
sqrt_call()
{
    tf_putrealp (RETURNV, sqrt(tf_getrealp(ARG1)));
}

/****************************************************************/
/* Calltf routine for pow function                              */
pow_call()
{
    tf_putrealp (RETURNV, pow(tf_getrealp(ARG1), tf_getrealp(ARG2)));
}


/*******************************************************************************
Everything after this point is for Verilog-XL

// XL uses a routine to get the size of the return argument - is this right?
int math_size()
{
    return 64;
}

// veriusertfs structure
s_tfcell veriusertfs[] = {
    {userrealfunction, 0, math_check1, math_size, exp_call,   0, "$exp"},
    {userrealfunction, 0, math_check1, math_size, log_call,   0, "$log"},
    {userrealfunction, 0, math_check1, math_size, log10_call, 0, "$log10"},
    {userrealfunction, 0, math_check1, math_size, sin_call,   0, "$sin"},
    {userrealfunction, 0, math_check1, math_size, sqrt_call,  0, "$sqrt"},
    {userrealfunction, 0, math_check2, math_size, pow_call,   0, "$pow"},
    {0} // final entry must be 0
};


*******************************************************************************/
