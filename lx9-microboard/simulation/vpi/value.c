/**
 * \brief       Verilog Procedural Interface (VPI) implementation of the
 *              $value$plusargs system function
 *
 * \author      Albert Ou <aou@eecs.berkeley.edu>
 * \copyright   BSD 2-Clause License <http://opensource.org/licenses/BSD-2-Clause>
 * \see         IEEE Standard 1364-2005
 */
#include <stdlib.h>
#include <string.h>
#include <errno.h>

#include "veriuser.h"
#include "acc_user.h"

typedef void (*p_fmtfn)(p_setval_value, char *);

typedef struct t_plusarg
{
	p_fmtfn fmt;
	char pfx[];
} s_plusarg, *p_plusarg;


static void _value_format_b(p_setval_value val, char *str)
{
	val->format = accBinStrVal;
}

static void _value_format_d(p_setval_value val, char *str)
{
	val->format = accDecStrVal;
}

static void _value_format_efg(p_setval_value val, char *str)
{
	val->format = accRealVal;
	val->value.real = strtod(str, NULL);
}

static void _value_format_h(p_setval_value val, char *str)
{
	val->format = accHexStrVal;
}

static void _value_format_o(p_setval_value val, char *str)
{
	val->format = accOctStrVal;
}

static void _value_format_s(p_setval_value val, char *str)
{
	val->format = accStringVal;
}

static PLI_INT32 value_checktf(void)
{
	PLI_INT32 rc;
	char *str;
	char *fmt;
	size_t len;
	p_plusarg plusarg;
	p_fmtfn fn;

	if (tf_nump() != 2) {
		tf_error("$value$plusargs: two arguments required");
		goto out;
	}
	if (tf_typep(1) != tf_string) {
		tf_error("$value$plusargs: argument 1 must be a string");
		goto out;
	}
	if (rc = tf_typep(2), ((rc != tf_readwrite) && (rc != tf_readwritereal))) {
		tf_error("$value$plusargs: argument 2 must be a reg or real");
		goto out;
	}

	str = tf_getcstringp(1);
	fmt = strchr(str, '%');
	if (fmt == NULL) {
		tf_error("$value$plusargs: missing format string");
		goto out;
	}
	if (fmt == str) {
		tf_error("$value$plusargs: empty plusarg string");
		goto out;
	}

	len = fmt - str;
	if (*(++fmt) == '0')
		fmt++; /* Skip optional '0' */

	if ((fmt[0] == '\0') || (fmt[1] != '\0')) {
		tf_error("$value$plusargs: invalid format string");
		goto out;
	}

	switch (*fmt) {
		case 'B':
		case 'b':
			fn = _value_format_b;
			break;
		case 'D':
		case 'd':
			fn = _value_format_d;
			break;
		case 'E':
		case 'e':
		case 'F':
		case 'f':
		case 'G':
		case 'g':
			fn = _value_format_efg;
			break;
		case 'H':
		case 'h':
			fn = _value_format_h;
			break;
		case 'O':
		case 'o':
			fn = _value_format_o;
			break;
		case 'S':
		case 's':
			fn = _value_format_s;
			break;
		default:
			tf_error("$value$plusargs: unrecognized format specifier: %c", *fmt);
			goto out;
	}


	plusarg = malloc(sizeof(s_plusarg) + len + 1);
	if (plusarg == NULL) {
		tf_error("$value$plusargs: %s", strerror(errno));
		goto out;
	}
	memcpy(plusarg->pfx, str, len);
	plusarg->pfx[len] = '\0';
	plusarg->fmt = fn;

	tf_setworkarea(plusarg);

out:
	return 0;
}

static PLI_INT32 value_calltf(void)
{
	s_setval_value val;
	s_setval_delay del = {
		.time = { 0 },
		.model = accNoDelay,
	};
	p_plusarg plusarg;
	char *str;

	plusarg = tf_getworkarea();
	if ((str = mc_scan_plusargs(plusarg->pfx)) == NULL) {
		tf_putp(0, 0);
		return 0;
	}

	val.value.str = str;
	plusarg->fmt(&val, str);
	if (acc_set_value(acc_handle_tfarg(2), &val, &del)) {
		tf_warning("$value$plusarg: acc_set_value() failed");
	}

	tf_putp(0, 1);
	return 0;
}

s_tfcell veriusertfs[] = {
	{ userfunction, 0, value_checktf, NULL, value_calltf, NULL, "$value$plusargs" },
	{ 0 },
};
