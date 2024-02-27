# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `debase` gem.
# Please instead update this file by running `bin/tapioca gem debase`.

# source://debase//lib/debase/version.rb#1
module Debase
  private

  def breakpoints; end
  def catchpoints; end
  def contexts; end
  def current_context; end
  def debug_load(*_arg0); end
  def enable_file_filtering(_arg0); end
  def enable_trace_points; end
  def init_variables; end
  def prepare_context; end
  def remove_tracepoints; end
  def set_trace_flag_to_iseq(_arg0); end
  def setup_tracepoints; end
  def started?; end
  def unset_iseq_flags(_arg0); end
  def verbose=(_arg0); end
  def verbose?; end

  class << self
    # @param file [String]
    # @param line [Fixnum]
    # @param expr [String]
    #
    # source://debase//lib/debase.rb#43
    def add_breakpoint(file, line, expr = T.unsafe(nil)); end

    # source://debase//lib/debase.rb#64
    def add_catchpoint(exception); end

    # source://ruby-debug-ide/0.7.3/lib/ruby-debug-ide.rb#53
    def attached; end

    # source://ruby-debug-ide/0.7.3/lib/ruby-debug-ide.rb#53
    def attached=(_arg0); end

    # Returns the value of attribute breakpoints.
    def breakpoints; end

    # source://ruby-debug-ide/0.7.3/lib/ruby-debug-ide.rb#60
    def catchpoint_deleted_event; end

    # source://ruby-debug-ide/0.7.3/lib/ruby-debug-ide.rb#60
    def catchpoint_deleted_event=(_arg0); end

    def catchpoints; end

    # source://ruby-debug-ide/0.7.3/lib/ruby-debug-ide.rb#38
    def cleanup_backtrace(backtrace); end

    # source://debase//lib/debase.rb#73
    def clear_catchpoints; end

    # source://ruby-debug-ide/0.7.3/lib/ruby-debug-ide.rb#55
    def cli_debug; end

    # source://ruby-debug-ide/0.7.3/lib/ruby-debug-ide.rb#55
    def cli_debug=(_arg0); end

    def contexts; end

    # source://ruby-debug-ide/0.7.3/lib/ruby-debug-ide.rb#57
    def control_thread; end

    # source://ruby-debug-ide/0.7.3/lib/ruby-debug-ide.rb#57
    def control_thread=(_arg0); end

    # Returns the value of attribute current_context.
    def current_context; end

    # source://debase//lib/debase.rb#60
    def debug; end

    def debug_load(*_arg0); end

    # source://ruby-debug-ide/0.7.3/lib/ruby-debug-ide.rb#102
    def debug_program(options); end

    # source://ruby-debug-ide/0.7.3/lib/ruby-debug-ide.rb#56
    def debugger_memory_limit; end

    # source://ruby-debug-ide/0.7.3/lib/ruby-debug-ide.rb#56
    def debugger_memory_limit=(_arg0); end

    def enable_file_filtering(_arg0); end
    def enable_trace_points; end

    # source://ruby-debug-ide/0.7.3/lib/ruby-debug-ide.rb#55
    def evaluation_timeout; end

    # source://ruby-debug-ide/0.7.3/lib/ruby-debug-ide.rb#55
    def evaluation_timeout=(_arg0); end

    # source://debase//lib/debase.rb#95
    def file_filter; end

    # source://ruby-debug-ide/0.7.3/lib/ruby-debug-ide.rb#21
    def find_free_port(host); end

    # Returns the value of attribute handler.
    #
    # source://debase//lib/debase.rb#11
    def handler; end

    # Sets the attribute handler
    #
    # @param value the value to set the attribute handler to.
    #
    # source://debase//lib/debase.rb#11
    def handler=(_arg0); end

    def init_variables; end

    # source://ruby-debug-ide/0.7.3/lib/ruby-debug-ide.rb#56
    def inspect_time_limit; end

    # source://ruby-debug-ide/0.7.3/lib/ruby-debug-ide.rb#56
    def inspect_time_limit=(_arg0); end

    # source://ruby-debug-ide/0.7.3/lib/ruby-debug-ide.rb#58
    def interface; end

    # source://ruby-debug-ide/0.7.3/lib/ruby-debug-ide.rb#66
    def interrupt_last; end

    # possibly deprecated options
    #
    # source://debase//lib/debase.rb#17
    def keep_frame_binding; end

    # possibly deprecated options
    #
    # source://debase//lib/debase.rb#17
    def keep_frame_binding=(_arg0); end

    # source://ruby-debug-ide/0.7.3/lib/ruby-debug-ide.rb#54
    def key_value_mode; end

    # source://ruby-debug-ide/0.7.3/lib/ruby-debug-ide.rb#54
    def key_value_mode=(_arg0); end

    # call-seq:
    #   Debugger.last_interrupted -> context
    #
    # Returns last debugged context.
    #
    # source://debase//lib/debase.rb#90
    def last_context; end

    # source://debase//lib/debase.rb#29
    def monkey_patch_prepend; end

    # @return [Boolean]
    #
    # source://debase//lib/debase.rb#56
    def post_mortem?; end

    def prepare_context; end

    # source://ruby-debug-ide/0.7.3/lib/ruby-debug-ide.rb#84
    def prepare_debugger(options); end

    # source://ruby-debug-ide/0.7.3/lib/ruby-debug-ide.rb#29
    def print_debug(*args); end

    # source://ruby-debug-ide/0.7.3/lib/ruby-debug-ide/greeter.rb#13
    def print_greeting_msg(stream, host, port, debugger_name = T.unsafe(nil), socket_path = T.unsafe(nil)); end

    # source://debase//lib/debase.rb#50
    def remove_breakpoint(id); end

    # source://debase//lib/debase.rb#69
    def remove_catchpoint(exception); end

    def remove_tracepoints; end

    # source://ruby-debug-ide/0.7.3/lib/ruby-debug-ide.rb#113
    def run_prog_script; end

    def set_trace_flag_to_iseq(_arg0); end
    def setup_tracepoints; end

    # call-seq:
    #   Debase.skip { block } -> obj or nil
    #
    # The code inside of the block is escaped from the debugger.
    #
    # source://debase//lib/debase.rb#81
    def skip; end

    # source://debase//lib/debase.rb#54
    def source_reload; end

    # source://debase//lib/debase.rb#19
    def start(options = T.unsafe(nil), &block); end

    def start_; end

    # source://ruby-debug-ide/0.7.3/lib/ruby-debug-ide.rb#120
    def start_control(host, port, notify_dispatcher); end

    # source://ruby-debug-ide/0.7.3/lib/ruby-debug-ide.rb#124
    def start_control_unix(socket_path, notify_dispatcher); end

    # source://ruby-debug-ide/0.7.3/lib/ruby-debug-ide.rb#76
    def start_server(host = T.unsafe(nil), port = T.unsafe(nil), notify_dispatcher = T.unsafe(nil)); end

    # source://ruby-debug-ide/0.7.3/lib/ruby-debug-ide.rb#80
    def start_server_unix(socket_path, notify_dispatcher = T.unsafe(nil)); end

    # @return [Boolean]
    def started?; end

    def stop; end

    # source://ruby-debug-ide/0.7.3/lib/ruby-debug-ide.rb#56
    def trace_to_s; end

    # source://ruby-debug-ide/0.7.3/lib/ruby-debug-ide.rb#56
    def trace_to_s=(_arg0); end

    # possibly deprecated options
    #
    # source://debase//lib/debase.rb#17
    def tracing; end

    # possibly deprecated options
    #
    # source://debase//lib/debase.rb#17
    def tracing=(_arg0); end

    def unset_iseq_flags(_arg0); end

    # source://ruby-debug-ide/0.7.3/lib/ruby-debug-ide.rb#60
    def value_as_nested_element; end

    # source://ruby-debug-ide/0.7.3/lib/ruby-debug-ide.rb#60
    def value_as_nested_element=(_arg0); end

    def verbose=(_arg0); end
    def verbose?; end

    # source://ruby-debug-ide/0.7.3/lib/ruby-debug-ide.rb#55
    def xml_debug; end

    # source://ruby-debug-ide/0.7.3/lib/ruby-debug-ide.rb#55
    def xml_debug=(_arg0); end

    private

    # source://ruby-debug-ide/0.7.3/lib/ruby-debug-ide.rb#136
    def _start_control_common(host, port, socket_path, notify_dispatcher); end

    # source://ruby-debug-ide/0.7.3/lib/ruby-debug-ide.rb#130
    def _start_server_common(host, port, socket_path, notify_dispatcher); end

    # source://ruby-debug-ide/0.7.3/lib/ruby-debug-ide.rb#191
    def notify_dispatcher_if_needed(host, port, need_notify); end
  end
end

class Debase::Breakpoint
  # @return [Breakpoint] a new instance of Breakpoint
  def initialize(_arg0, _arg1, _arg2); end

  # Returns the value of attribute enabled.
  def enabled; end

  # Sets the attribute enabled
  #
  # @param value the value to set the attribute enabled to.
  def enabled=(_arg0); end

  # Returns the value of attribute expr.
  def expr; end

  # Sets the attribute expr
  #
  # @param value the value to set the attribute expr to.
  def expr=(_arg0); end

  # Returns the value of attribute id.
  def id; end

  # Returns the value of attribute pos.
  def pos; end

  # Returns the value of attribute source.
  def source; end

  class << self
    def find(_arg0, _arg1, _arg2, _arg3); end
    def remove(_arg0, _arg1); end
  end
end

# source://debase//lib/debase/context.rb#2
class Debase::Context
  # source://debase//lib/debase/context.rb#21
  def at_breakpoint(breakpoint); end

  # source://debase//lib/debase/context.rb#25
  def at_catchpoint(excpt); end

  # source://debase//lib/debase/context.rb#34
  def at_line(file, line); end

  # source://debase//lib/debase/context.rb#38
  def at_return(file, line); end

  # source://debase//lib/debase/context.rb#29
  def at_tracing(file, line); end

  # @return [Boolean]
  def dead?; end

  # source://debase//lib/debase/context.rb#13
  def frame_args_info(frame_no = T.unsafe(nil)); end

  def frame_binding(*_arg0); end

  # source://debase//lib/debase/context.rb#9
  def frame_class(frame_no = T.unsafe(nil)); end

  def frame_file(*_arg0); end
  def frame_line(*_arg0); end

  # source://debase//lib/debase/context.rb#3
  def frame_locals(frame_no = T.unsafe(nil)); end

  def frame_self(*_arg0); end

  # source://debase//lib/debase/context.rb#17
  def handler; end

  # @return [Boolean]
  def ignored?; end

  def pause; end
  def stack_size; end
  def step(*_arg0); end
  def step_over(*_arg0); end
  def stop_frame=(_arg0); end
  def stop_next=(*_arg0); end
  def stop_reason; end

  # Returns the value of attribute thnum.
  def thnum; end

  # Returns the value of attribute thread.
  def thread; end
end

# source://debase//lib/debase.rb#154
class Debase::DebugThread < ::Thread
  class << self
    # @private
    # @raise [RuntimeError]
    #
    # source://debase//lib/debase.rb#155
    def inherited; end
  end
end

# source://debase//lib/debase.rb#115
class Debase::FileFilter
  # @return [FileFilter] a new instance of FileFilter
  #
  # source://debase//lib/debase.rb#116
  def initialize; end

  # @return [Boolean]
  #
  # source://debase//lib/debase.rb#138
  def accept?(file_path); end

  # source://debase//lib/debase.rb#133
  def disable; end

  # source://debase//lib/debase.rb#128
  def enable; end

  # source://debase//lib/debase.rb#124
  def exclude(file_path); end

  # source://debase//lib/debase.rb#120
  def include(file_path); end

  private

  # source://debase//lib/debase.rb#149
  def excluded; end

  # source://debase//lib/debase.rb#145
  def included; end
end

# source://debase//lib/debase/version.rb#2
Debase::VERSION = T.let(T.unsafe(nil), String)

# source://debase//lib/debase.rb#161
#Debugger = Debase