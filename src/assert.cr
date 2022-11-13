#+------------------------------------------------------------------------+#
#| Copyright © 2022 sourceweaver                                          |#
#| Licensed under the Mozilla Public License, Version 2.0 (the "License").|#
#| You may not use this file except in compliance with the License. You   |#
#| may obtain a copy of the License at http://mozilla.org/MPL/2.0/        |#
#+------------------------------------------------------------------------+#
require "colorize"

module Assertion
  extend self

  class Error < Exception; end

  def success(cond : String) : String
    msg = String.build do |msg|
      msg << "Assertion ".colorize(:green)
      msg << "#{cond.colorize(:yellow).underline}"
      msg << " passed.".colorize(:green)
    end
  end

  def fail(cond : String, desc : String?) : String
    msg = String.build do |msg|
      msg << "Assertion: ".colorize(:red)
      msg << "#{cond.colorize(:yellow).underline}"
      if desc
        msg << " failed: ".colorize(:red)
        msg << desc.colorize(:red)
      else
        msg << " failed.".colorize(:red)
      end
    end
  end
end

macro assert(cond, desc = nil)
  unless {{cond}}
    raise Assertion::Error.new(
      Assertion.fail({{cond.stringify}}, {{desc}})
    )
  end
  puts Assertion.success({{cond.stringify}})
end
