This is a PLI application for adding math functions to a Verilog
simulator.  You can easily add new functions (such as cosine) by
copying the existing code in math.c and math.tab

The only tricky part to this application is reading and writing real
values.  In VCS you have to use "size=r" in the math.tab file.  In XL
and NC-Verilog, you have to use userrealfunction in veriusertfs,
located at the end of math.c, or the file veriuser.c  *** If you forget
this step, these functions will return integers instead of reals. ***

It is currently written for VCS from Synopsys, but can be used with
NC-Verilog & Verilog-XL by uncommenting out the last section.
Building a new NCV / Verilog-XL is left as an exercise for the
reader...  If you do get this working in another simulator, please
send me info so I can update this code.

Copyright (C) 1999, 2004 Christian B. Spear Hey - let's not be formal,
you can call me Chris!

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or (at
your option) any later version.

This program is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

/******************************************************************
Chris Spear               Verification Specialist     ..  __o
Synopsys, Inc.            Email: spear@synopsys.com     _`\<,_ 
377 Simarano Drive        Phone: 508-263-8114       .. (*)/ (*)
Marlboro, MA 01752-4615   Fax:   508-263-8123      My cogs go to 11
http://chris.spear.net	  Car:   508-254-7223
*******************************************************************/
