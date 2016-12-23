#!/usr/bin/awk -f

# Define a bunch of colors right away.
BEGIN {
	no = "\033[0m"

	rd = "\033[0;31m"
	gr = "\033[0;32m"
	ye = "\033[0;33m"
	bl = "\033[0;34m"
	ma = "\033[0;35m"
	cy = "\033[0;36m"
	wh = "\033[0;37m"

	bold_rd = "\033[1;31m"
	bold_gr = "\033[1;32m"
	bold_ye = "\033[1;33m"
	bold_bl = "\033[1;34m"
	bold_ma = "\033[1;35m"
	bold_cy = "\033[1;36m"
	bold_wh = "\033[1;37m"
}

# Disassembly of ..
/^Disassembly of/ {
	print bl $0 no
	next
}

# Section start
/^[0-9a-f]{1,16} .+:$/ {
	print gr $1, ye $2 no
	next
}

# Regular disassembled line
/^ *[0-9a-f]{1,16}:/ {
	len = length($0)
	colon = index($0, ":")
	comment = index($0, "#")
	if (comment == 0) {
		printf "%s%s%s%s\n", \
			  cy, substr($0, 1, colon - 1), \
			  no, substr($0, colon)
	}
	else {
		printf "%s%s%s%s%s%s%s\n", \
			  cy, substr($0, 1, colon - 1), \
			  no, substr($0, colon, comment - colon - 1), \
			  bl, substr($0, comment), \
			  no
	}
	next
}

# Everything else.
// {
	print
}
