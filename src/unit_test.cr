#+------------------------------------------------------------------------+#
#| Copyright © 2022 sourceweaver                                          |#
#| Licensed under the Mozilla Public License, Version 2.0 (the "License").|#
#| You may not use this file except in compliance with the License. You   |#
#| may obtain a copy of the License at http://mozilla.org/MPL/2.0/        |#
#+------------------------------------------------------------------------+#
def unit_test
  {% if flag? :unittest %}
    yield
  {% end %}
end

