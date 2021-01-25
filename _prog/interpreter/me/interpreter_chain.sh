_process_interpreter() {
	! [[ -e "$1" ]] && _messageError 'fail: missing: in file' && return 1
	[[ -e "$2" ]] && _messageError 'fail: exists: out file' && return 1
	
	_start_metaengine_host
	
	_set_me_null_in
	_assign_me_name_out "01_file_in"
	_processor_launch _me_processor_interpreter_file_in "$1"
	
	
	
	
	_cycle_me
	_assign_me_name_out "03_interpreter"
	_processor_launch _me_processor_interpreter
	
	
	
	_cycle_me
	_set_me_null_out
	_processor_launch _me_processor_interpreter_file_out "$metaConfidence" "$2"
	
	#_reset_me_host
	
	_stop_metaengine_wait "$metaConfidence"
	#_stop_metaengine_wait
}
