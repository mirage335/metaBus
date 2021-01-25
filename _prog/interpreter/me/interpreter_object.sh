
_begin_procedure_me_processor_interpreter() {
	_messageNormal 'launch: '"$1"
	
	! _wait_metaengine && _stop 1
	_start_metaengine
	_relink_metaengine_in
	_relink_metaengine_out
	
	#_messageError 'fail: experiment' && _stop 1
}

_end_procedure_me_processor_interpreter() {
	true
	
	#optional, closes host upon completion
	#_stop
}

#IN
	# "$1" == talk (file)
	# "$2" == chrono (file)
#OUT
	#"$metaDir"/ao/talk
	#"$metaDir"/bo/chrono (date +%s%N) (or free-running equivalent)
	#"$metaDir"/bo/confidence ("0" || "1" || 1.0-1.999999999 equivalent to 0.0-0.999999999 interval)
_me_processor_interpreter_file_in() {
	_begin_procedure_me_processor_interpreter "${FUNCNAME[0]}"
	
	[[ "$1" != "" ]] && [[ -e "$1" ]] && cat "$1" > "$metaDir"/ao/talk
	! [[ -e "$metaDir"/ao/talk ]] && echo -n > "$metaDir"/ao/talk
	
	[[ "$2" != "" ]] && [[ -e "$2" ]] && cat "$2" > "$metaDir"/ao/chrono
	! [[ -e "$metaDir"/ao/chrono ]] && echo -n > "$metaDir"/ao/chrono
	
	echo -n '1' > "$metaDir"/bo/confidence
	
	_end_procedure_me_processor_interpreter
}

#IN
	#"$metaDir"/ai/talk
	#"$metaDir"/bi/chrono
	#"$metaDir"/bi/confidence ("0" || "1" || 1.0-1.999999999 equivalent to 0.0-0.999999999 interval)
#OUT
	# "$1" == confidence (file)
	# "$2" == talk (file)
	# "$3" == chrono (file)
_me_processor_interpreter_file_out() {
	_begin_procedure_me_processor_interpreter "${FUNCNAME[0]}"
	
	
	if [[ "$2" != "" ]]
	then
		cat "$metaDir"/ai/talk > "$2".tmp
		mv "$2".tmp "$2"
	fi
	
	if [[ "$3" != "" ]]
	then
		cat "$metaDir"/bi/chrono > "$3".tmp
		mv "$3".tmp "$3"
	fi
	
	
	#Confidence.
	[[ "$1" != "" ]] && echo -n '1' > "$1"
	
	_end_procedure_me_processor_interpreter
}


#IN
	#"$metaDir"/ai/talk
	#"$metaDir"/bi/chrono (date +%s%N) (or free-running equivalent)
	#"$metaDir"/bi/confidence ("0" || "1" || 1.0-1.999999999 equivalent to 0.0-0.999999999 interval)
#OUT
	#"$metaDir"/ao/talk
	#"$metaDir"/bo/chrono (date +%s%N) (or free-running equivalent)
	#"$metaDir"/bo/confidence ("0" || "1" || 1.0-1.999999999 equivalent to 0.0-0.999999999 interval)
_me_processor_interpreter() {
	_begin_procedure_me_processor_interpreter
	
	
	_messagePlain_nominal 'init: _interpreter_filter'
	cat "$metaDir"/ai/talk | _interpreter_filter > "$metaDir"/ao/temp 2>/dev/null
	rm -f "$metaDir"/ao/talk
	mv "$metaDir"/ao/temp "$metaDir"/ao/talk
	
	
	cp "$metaDir"/bi/chrono "$metaDir"/bo/chrono > /dev/null 2>&1
	echo -n '1' > "$metaDir"/bo/confidence
	
	
	_end_procedure_me_processor_interpreter
}





