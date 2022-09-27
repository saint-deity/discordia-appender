
### [`discordia-appender`](https://github.com/saint-deity/discordia-appender) is a small [`lib`](https://www.idtech.com/blog/what-are-libraries-in-coding#:~:text=Programming%20library%20definition%20Libraries%20in%20programming%20languages%20are,users%20can%20use%20to%20optimize%20tasks.%20Library%20examples) made in lua for the [`lit/luvit`](https://luvit.io/) runtime environment.

This library depends on the [`JSON`](https://luvit.io/api/json.html) and [`PrettyPrint`](https://luvit.io/api/pretty-print.html) [`luvit`](https://luvit.io/) libraries to run.
Make sure that you have them downloaded properly before use, otherwise you may have some problems getting it to work.

To get started with using this library you should:
- Download this repositories [`master-zip`](https://github.com/saint-deity/discordia-appender/archive/refs/heads/main.zip)
- Unzip the contents and delete the [`README.md`](https://github.com/saint-deity/discordia-appender/blob/main/readme.md)
- Place the [`discordia-appender`](https://github.com/saint-deity/discordia-appender/tree/main/discordia-appender) file in your workspaces' `deps` folder.


### Setting Up

Setting it up using [`require`](https://luvit.io/api/require.html) and fetching the [`append`](https://github.com/saint-deity/discordia-appender/blob/main/discordia-appender/init.lua) configuration are the first two steps toward using the now-ready appender.

```lua
local appender = require("discordia-appender")
local append = appender.append
```

Alternatively, you can just jump the gun and do:

```lua
local append = require("discordia-appender").append
```


### Providing Data

The only supported method would be to provide a [`decoded`](https://luvit.io/api/json.html#json_json_decode_str_pos_nullval) `JSON` table. Here is an example of how it should look:

```lua
{
    {
        username = "Ken and Richie#8601",
        avatar_url = "https://cdn.discordapp.com/avatars/1023482322890281042/4fb15c961276e9c8e5b35603d266c756.webp?size=240",
        content = "Hello, world!",
        timestamp = "01/01/1970 ",
    },
}
```

If you're using a `JSON` document and want to avoid writing a few extra lines to read the files document, you use `read()` method as shown below, which returns a [`decoded`](https://luvit.io/api/json.html#json_json_decode_str_pos_nullval) `JSON` table (refer to the table above for reference).

```lua
local data = append:read("./file_path")
```


### Getting Your File

You can generate your new document with the appended data with `write()` method, as suggested below.
Note that the `data` variable reference can be found above (for those who skipped past it)

```lua
append:write("./file_path", data)
```

### Make sure to include your file name and file extension `(*HTML)` when using the `read()` and `write()` methods
### Refer to the examples folder for reference and ideas


### The Results

Once you're done, and you've opened your new `HTML` file, the result should look something similar to this:
![image](https://cdn.discordapp.com/attachments/1021675456715563058/1024439017049174126/image.png)
