
### [`discordia-appender`](https://github.com/saint-deity/discordia-appender) is a small [`lib`](https://www.idtech.com/blog/what-are-libraries-in-coding#:~:text=Programming%20library%20definition%20Libraries%20in%20programming%20languages%20are,users%20can%20use%20to%20optimize%20tasks.%20Library%20examples) made in lua for the [`lit/luvit`](https://luvit.io/) runtime environment.

This library depends on the [`JSON`](https://luvit.io/api/json.html) and [`PrettyPrint`](https://luvit.io/api/pretty-print.html) [`luvit`](https://luvit.io/) libraries to run.
Make sure that you have them downloaded properly before use, otherwise you may have some problems getting it to work.

To get started with using this library you should:
- Download this repositories [`master-zip`](https://github.com/saint-deity/discordia-appender/archive/refs/heads/main.zip)
- Unzip the contents and delete the [`README.md`](https://github.com/saint-deity/discordia-appender/blob/main/readme.md)
- Place the [`discordia-appender`](https://github.com/saint-deity/discordia-appender/tree/main/discordia-appender) file in your workspaces' `deps` folder.

### Setting it up
Setting it up using [`require`](https://luvit.io/api/require.html) and fetching the [`append`](https://github.com/saint-deity/discordia-appender/blob/main/discordia-appender/init.lua) configuration are the first two steps toward using the now-ready appender.
```lua
local appender = require("discordia-appender")
local append = appender.append
```

