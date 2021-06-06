# Функция для установки/загрузки пакетов
package.check <- function(x) {
  if (!require(x, character.only = TRUE)) {
    install.packages(x, dependencies = TRUE)
    library(x, character.only = TRUE)
  }
}

# Устанавливаем нужные пакеты
package.check('ggplot2')
package.check('dplyr')
package.check('tidyr')
package.check('tibble')