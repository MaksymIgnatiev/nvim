local map = vim.keymap.set
local modes = {'n', 'o', 'v', 'x', 'c'}

-- First row
map(modes, 'ё', '`')
map(modes, 'Ё', '~')

-- Second row

-- lowercase
map(modes, 'й', 'q')
map(modes, 'ц', 'w')
map(modes, 'у', 'e')
map(modes, 'к', 'r')
map(modes, 'е', 't')
map(modes, 'н', 'y')
map(modes, 'г', 'u')
map(modes, 'ш', 'i')
map(modes, 'щ', 'o')
map(modes, 'з', 'p')
map(modes, 'х', '[')
map(modes, 'ъ', ']')

-- uppercase
map(modes, 'Й', 'Q')
map(modes, 'Ц', 'W')
map(modes, 'У', 'E')
map(modes, 'К', 'R')
map(modes, 'Е', 'T')
map(modes, 'Н', 'Y')
map(modes, 'Г', 'U')
map(modes, 'Ш', 'I')
map(modes, 'Щ', 'O')
map(modes, 'З', 'P')
map(modes, 'Х', '{')
map(modes, 'Ъ', '}')

-- Third row

-- lowercase
map(modes, 'ф', 'a')
map(modes, 'ы', 's')
map(modes, 'в', 'd')
map(modes, 'а', 'f')
map(modes, 'п', 'g')
map(modes, 'р', 'h')
map(modes, 'о', 'j')
map(modes, 'л', 'k')
map(modes, 'д', 'l')
map(modes, 'ж', ';')
map(modes, 'э', "'")

-- uppercase
map(modes, 'Ф', 'A')
map(modes, 'Ы', 'S')
map(modes, 'В', 'D')
map(modes, 'А', 'F')
map(modes, 'П', 'G')
map(modes, 'Р', 'H')
map(modes, 'О', 'J')
map(modes, 'Л', 'K')
map(modes, 'Д', 'L')
map(modes, 'Ж', ':')
map(modes, 'Э', '"')


-- Fourth row

-- lowercase
map(modes, 'я', 'z')
map(modes, 'ч', 'x')
map(modes, 'с', 'c')
map(modes, 'м', 'v')
map(modes, 'и', 'b')
map(modes, 'т', 'n')
map(modes, 'ь', 'm')
map(modes, 'б', ',')
map(modes, 'ю', '.')

-- uppercase
map(modes, 'Я', 'Z')
map(modes, 'Ч', 'X')
map(modes, 'С', 'C')
map(modes, 'М', 'V')
map(modes, 'И', 'B')
map(modes, 'Т', 'N')
map(modes, 'Ь', 'M')
map(modes, 'Б', '<')
map(modes, 'Ю', '>')

-- Other

-- special
map(modes, '№', '#')
