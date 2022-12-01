#+------------------------------------------------------------------------+#
#| Copyright © 2022 sourceweaver                                          |#
#| Licensed under the Mozilla Public License, Version 2.0 (the "License").|#
#| You may not use this file except in compliance with the License. You   |#
#| may obtain a copy of the License at http://mozilla.org/MPL/2.0/        |#
#+------------------------------------------------------------------------+#
require "colorize"

macro debug(*items)
  {% unless flag? :release %}
    {% for item in items %}
      %value, %name = {{ item.id }}, {{ item.stringify }}

      %location_info = "#{{{ item.filename }}}:#{{{ item.line_number }}}:#{{{ item.column_number }}}".colorize.underline.to_s
      %line_info     = "> #{{{ item.line_number }}} | debug!(#{%name})".colorize(:white).to_s
      %debug_value   = "Value of #{%name.colorize(:yellow).underline.to_s} is: #{%value.colorize(:yellow).underline.to_s}"
      %debug_type    = "Type of  #{%name.colorize(:yellow).underline.to_s} is: #{typeof(%value).colorize(:yellow).underline.to_s}"

      %debug = <<-DEBUG
        #{"DEBUG BEGIN---------------------------->".colorize(:red).to_s}
        Debugger called in:
        #{%location_info}

        #{%line_info}

        #{%debug_value}
        #{%debug_type}
        #{"<-----------------------------DEBUG END".colorize(:red).to_s}
        DEBUG
        puts %debug
    {% end %}
  {% end %}
end
