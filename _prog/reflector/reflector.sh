_reflector_ask_sequence() {
	_start
	
	cat > "$safeTmp"/stdin
	
	# DANGER: May emit inappropriate log messages to actual standard output. Consider instead logging messages to "$safeTmp" , or similar , or suppressing to '/dev/null' .
	"$scriptAbsoluteLocation" _process_reflector_ask "$safeTmp"/stdin "$safeTmp"/stdout
	
	
	! [[ -e "$safeTmp"/stdout ]] && _stop 1
	cat "$safeTmp"/stdout
	_stop
}

_reflector_ask() {
	"$scriptAbsoluteLocation" _reflector_ask_sequence "$@"
}



_reflector_present_sequence() {
	_start
	
	cat > "$safeTmp"/stdin
	
	# DANGER: May emit inappropriate log messages to actual standard output. Consider instead logging messages to "$safeTmp" , or similar , or suppressing to '/dev/null' .
	"$scriptAbsoluteLocation" _process_reflector_present-file "$safeTmp"/stdin "$safeTmp"/stdout
	
	
	! [[ -e "$safeTmp"/stdout ]] && _stop 1
	cat "$safeTmp"/stdout
	_stop
}

_reflector_present() {
	"$scriptAbsoluteLocation" _reflector_present_sequence "$@"
}




_reflector_answer_sequence() {
	_start
	
	cat > "$safeTmp"/stdin
	
	# DANGER: May emit inappropriate log messages to actual standard output. Consider instead logging messages to "$safeTmp" , or similar , or suppressing to '/dev/null' .
	"$scriptAbsoluteLocation" _process_reflector_answer "$safeTmp"/stdin "$safeTmp"/stdout
	
	
	! [[ -e "$safeTmp"/stdout ]] && _stop 1
	cat "$safeTmp"/stdout
	_stop
}

_reflector_answer() {
	"$scriptAbsoluteLocation" _reflector_answer_sequence "$@"
}


