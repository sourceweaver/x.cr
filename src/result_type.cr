#+------------------------------------------------------------------------+#
#| Copyright © 2022 sourceweaver                                          |#
#| Licensed under the Mozilla Public License, Version 2.0 (the "License").|#
#| You may not use this file except in compliance with the License. You   |#
#| may obtain a copy of the License at http://mozilla.org/MPL/2.0/        |#
#+------------------------------------------------------------------------+#
class Result(T, Exception)
  def initialize(@data : T | Exception); end

  def has_data? : Bool
    @data.is_a?(T)
  end

  def has_error? : Bool
    @data.is_a?(Exception)
  end

  def get_error : Exception
    raise "Error: Result.get_error can only be called on Type: Exception." unless @data.as?(Exception)
    @data.as(Exception)
  end

  def get_data : T
    raise "Error: Result.get_data can only be called on Type: T." unless @data.as?(T)
    @data.as(T)
  end
end

