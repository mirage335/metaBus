
_start_procedure_reflector() {
	! [[ -e "$1" ]] && _messageError 'fail: missing: in file' && return 1
	[[ -e "$2" ]] && _messageError 'fail: exists: out file' && return 1
	
	_start_metaengine_host
	
	_set_me_null_in
	_assign_me_name_out "01_file_in"
	_processor_launch _me_processor_reflector_file_in "$1"
}

_stop_procedure_reflector() {
	
	_cycle_me
	_set_me_null_out
	_processor_launch _me_processor_reflector_file_out "$metaConfidence" "$2"
	
	#_reset_me_host
	
	_stop_metaengine_wait "$metaConfidence"
	#_stop_metaengine_wait
}


# "$1" == in file
# "$2" == out file
_process_reflector_ask() {
	_start_procedure_reflector "$@"
	
	_cycle_me
	_assign_me_name_out "02_reflector_ask"
	_processor_launch _me_processor_reflector_ask
	
	_stop_procedure_reflector "$@"
}

# "$1" == in file
# "$2" == out file
_process_reflector_present-file() {
	_start_procedure_reflector "$@"
	
	_cycle_me
	_assign_me_name_out "04_reflector_present"
	_processor_launch _me_processor_reflector_present-file
	
	_stop_procedure_reflector "$@"
}

# "$1" == in file
# "$2" == out file
_process_reflector_answer() {
	_start_procedure_reflector "$@"
	
	_cycle_me
	_assign_me_name_out "03_reflector_answer"
	_processor_launch _me_processor_reflector_answer
	
	_stop_procedure_reflector "$@"
}


