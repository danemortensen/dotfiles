local utils = require('utils')

-- LINE NUMBERS
utils.opt('w', 'number', true)
utils.opt('w', 'relativenumber', true)

utils.opt('o', 'gdefault', true) -- Always perform global substitutions
