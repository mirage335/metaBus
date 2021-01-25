
_interpreter_filter_diag_procedure() {
	case "$1" in
		PASS)
			echo -n 'PASS'
			return 0
			;;
	esac
	
	return 1
}

_interpreter_filter_reserved_procedure() {
	case "$1" in
		PING)
			return 1
			;;
	esac
	
	return 0
}

_interpreter_filter() {
	local currentCommand
	currentCommand=$(cat -)
	
	_interpreter_filter_diag_procedure "$currentCommand" && return 0
	
	#_interpreter_filter_reserved_procedure "$currentCommand" && return 0
	
	return 1
}

