#include "veriuser.h"
#include "vxl_veriuser.h"

char *veriuser_version_str = "";

int (*endofcompile_routines[TF_MAXARRAY])() =
{
    /*** my_eoc_routine, ***/
    0 /*** final entry must be 0 ***/
};

bool err_intercept(level,facility,code)
int level; char *facility; char *code;
{ return(true); }

extern int math_check1();
extern int exp_call();
extern int log_call();
extern int log10_call();
extern int math_check2();
extern int pow_call();
extern int sin_call();
extern int sqrt_call();

int Size_32() { return (32); }

s_tfcell veriusertfs[TF_MAXARRAY] =
{
    {userrealfunction, 0, math_check1, Size_32, exp_call, 0, "$exp"},
    {userrealfunction, 0, math_check1, Size_32, log_call, 0, "$log"},
    {userrealfunction, 0, math_check1, Size_32, log10_call, 0, "$log10"},
    {userrealfunction, 0, math_check2, Size_32, pow_call, 0, "$pow"},
    {userrealfunction, 0, math_check1, Size_32, sin_call, 0, "$sin"},
    {userrealfunction, 0, math_check1, Size_32, sqrt_call, 0, "$sqrt"},
    {0}
};

