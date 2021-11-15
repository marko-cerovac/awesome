os.execute("amixer sget Master | grep -e 'Front Left:' | sed 's/[^\\[]*\\[\\([0-9]\\{1,3\\}\\).*\\(on\\|off\\).*/\\2 \\1/' | sed 's/off /M/' | sed 's/on //'")

-- local str = "M 40%"

-- local result = str:sub(1,1)

-- print (result)
-- print (str)
