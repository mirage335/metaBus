
_interpreter_sequence() {
	_start
	
	cat > "$safeTmp"/stdin
	
	# DANGER: May emit inappropriate log messages to actual standard output. Consider instead logging messages to "$safeTmp" , or similar , or suppressing to '/dev/null' .
	"$scriptAbsoluteLocation" _process_interpreter "$safeTmp"/stdin "$safeTmp"/stdout
	
	
	! [[ -e "$safeTmp"/stdout ]] && _stop 1
	cat "$safeTmp"/stdout
	_stop
}

_interpreter() {
	"$scriptAbsoluteLocation" _interpreter_sequence "$@"
}



