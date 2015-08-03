#
# \brief        sed(1) script to patch SimGen's system_setup.do for
#               testbench integration
# \note         To promote safe in-place editing, edit commands should
#               be kept idempotent such that subsequent executions do
#               not produce redundant or unexpected side effects.
#
#               Usage of sed(1) features should be restricted to the
#               subset defined by POSIX.1-2008.
#
# \author       Albert Ou <aou@eecs.berkeley.edu>
# \copyright    BSD 2-Clause License <http://opensource.org/licenses/BSD-2-Clause>
#

# Disable "s" alias; Makefile handles vsim invocation
s/\(alias[[:space:]]\{1,\}s[[:space:]]\{1,\}\)"[^"]*"/\1"echo Run `make modelsim` to load design"/
# Adjust existing tbpath values
s/\(set[[:space:]]\{1,\}tbpath[[:space:]]\{1,\}\)"[^"]*"/\1"system_tb\/dut"/
# Append global tbpath variable assignment if absent
${/^set[[:space:]]\{1,\}tbpath/h
x;s/^set//;{g;t 1;};a\
set tbpath "system_tb/dut"
}
:1
