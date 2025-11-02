We've talked about Lua. We've talked about plugins. Now let's talk about modularizing your config.

When modularizing a project's files or functions, many people follow different structures.

A modular structure in your Neovim config means that you can easily interchange and swap out modules/plugins based on
your wish, and you could even automate that if that is your wish.

Now here's my Neovim's config structure for example, as you can see it's pretty modular, maybe too much. But it's how I
like it.

Now I'm not gonna tell you how you should structure your Neovim config, that's totally up to you. But what I'm gonna do
is show you how you can modularize your Neovim config, and maybe you could even apply the core ideas to even your other
projects. If you wish to keep your Neovim config in a single file, and you don't like the philosophy of modularity, you
can skip this video, and maybe come back to it if you change your mind.

Enough yapping, let's get to the good stuff.

Now if you've followed the previous videos, and/or fiddled around with Neovim by yourself, here should be a basic
average config.

At first, we're probably gonna have a few vim options set up, then the logic to bootstrap lazy, the plugins, and a bit
of their configs, then some key binds

My philosophy of modularizing your Neovim config follows this idea:
The init file should only contain global functions that were created by you, and only have `require()` functions calling
your other modules

Now what exactly is the require function? If we check the docs by doing `:help require` here's what the doc says:

```
Loads the given module. The function starts by looking into the `package.loaded` table to determine whether {modname} is
already loaded.
```

Now what exactly is package.loaded you may ask? Well we can just check the docs like how we just did for the require
function

```
A table used by `require` to control which modules are already loaded. When you require a module `modname` and
`package.loaded[modname]` is not false, `require` simply returns the value stored there.
```

Okay so require checks if the package or module is already loaded or not, nice.
So,
```
If it is, then `require` returns the value stored at `package.loaded[modname]`. Otherwise, it tries to find a `loader`
for the module. To find a loader, first `require` queries `package.preload[modname]`.
```
If we check the docs for package.preload it says,
```
A table to store loaders for specific modules (see |require()|).
```
so when require checks `package.loaded[modname]`'s value
```
If it has a value, this value (which should be a function) is the loader. Otherwise `require` searches for a Lua loader
using the path stored in `package.path`.
```
If we check out the docs for package.path, it says that it's
```
The path used by `require` to search for a Lua loader.
```
It then explains the environment variables that affect it, and the template, you don't need to fiddle around with it if
you're not doing some weird stuff, most of the time, your Neovim plugins will just autoload if you're using a plugin
manager and/or they're in the RTP.

So back to the "require"'s docs, it does a package.loaded check, if it fails, it tries to search for a Lua loader.
```
If that also fails, it searches for a C loader using the path stored in `package.cpath`.
```
Another new info that we probably don't know about, well if we check the docs we'll see that 
```
The path used by `require` to search for a C loader. Lua initializes the C path `package.cpath` in the same way it
initializes the Lua path `package.path`, using the environment variable `LUA_CPATH` (plus another default path defined
in `luaconf.h`).
```
so to sum it up again, package.loaded check, if not, package.path check, if not, package.cpath check
```
If that also fails,
it tries an `all-in-one` loader (see below).
```
Then it explains a bunch of stuff related to modules written in C, which we currently won't go through that much since
it's much more complex than this series' scope for the time being, and also I'm not that good enough in C to comfortably
explain stuff about it.

```
Once a loader is found, `require` calls the loader with a single argument, {modname}. If the loader returns any value,
`require` assigns the returned value to `package.loaded[modname]`. If the loader returns no value and has not assigned
any value to `package.loaded[modname]`, then `require` assigns `true` to this entry. In any case, `require` returns the
final value of `package.loaded[modname]`.

If there is any error loading or running the module, or if it cannot find any loader for the module, then `require`
signals an error.
```

Now that we've gone through the docs, let's explain how you would use this in your day to day lua

This is your file structure, you have an init.lua, and a Lua dir in the root dir, and 3 files in the Lua dir called,
a.lua, b.lua, and c.lua

If you want to load module you would do `require("a")`, that's the same for b and c.

Now let's do a bit more complex directory structure, inside the Lua dir, we're gonna have the x, y and z dir, with an
init.lua file, and directories called a, b, c, and inside THOSE directories, we have the p, q, r file, with an
init.lua

Now remember that every single one of those files, except for the init.lua, can have separate names, and for the
init.lua file, we're gonna talk about it later.

If you want to require the module x, you can do `require("x")`, and the thing is, if x, is a dir, which it is in the
current structure, you need to have an init.lua in root of the x dir, like we have here

to require the y module's b module's r file, you can do `require("y.b.r")`

Now here's the modularity structure that I use

In the `x` module's `a` module's init.lua file, I'll just require the files inside the x/a directory, then I can do the
same for the x/b and x/c, and then just require the a, b, and c module in the x module's init.lua

And here's a good thing about modularity, for example, nvim-web-devicon is a dependency for a lot of different plugins
that has something in their UI that uses those icons. Now for example, imagine if you wanted to configure the
nvim-web-devicon itself, and if you're using lazy, the recommended way to load dependencies is using the `dependencies`
key in your config table.

If you're doing a single file setup, you can make the config table a separate var, then load the var as dependencies of
each plugin that nvim-web-devicon is a dependency of.

Because we're doing a file based modular setup, we can just put nvim-web-devicon's config in a single file, that returns
the table, and then just require the file in as dependencies of each plugin that nvim-web-devicon is a dependency of.

Now you've learned the basics and philosophy of file based modularization, let's talk about how I would modularize my
own config:

There should be a separate configs directory, which hosts your own config unrelated to plugins and/or extra stuff, which
could work in a clean Neovim setup. Now you could surely put some plugin related code in here if you really have to, but
I try to keep that to a minimum as much as I can. Makes stuff really easily debuggable

Now in that directory, I have an init.lua which just has my vim options changes, and then requires the other files from
that dir, now for the sake of modularity, I could've made the "vim options change part" thing a separate file, but at
times if you wish you can just break the modular philosophy, in the end it depends on how you feel, as you can see from
this example.

I also have a `keybinds` directory inside the config module, and an init.lua file and other file(s) inside of it

Now in the root lua dir, we also have a plugins dir, which in turn just for now, should have an init.lua file, and maybe
just a few other file(s)

So after I've explained a bit about the dir structure, let's do some configuring

In the end of your init.lua file, we're going to require the configs module, then in a different split we're going to
open lua/configs/init.lua

Now we're going to move our vim option changes from our init.lua file to lua/configs/init.lua, exit Neovim and open it
again, boom, no errors, our config still works, and we've reached our first step towards modularization.

We're now going to move our basic Neovim key binds to lua/configs/keybinds/init.lua, and load the keybinds module in
lua/configs/init.lua 

Next, we move the whole plugins setup in lua/plugins/init.lua for now, and require the plugins module in the root init.lua

Now my friend, you have a properly modularized config, and have a really good understanding of modularization

Videos like this and the FOSS work I do takes a lot of effort, time, and commitment, I hope this was worthwhile to you,
If you think that it's worthwhile and okay for you to help me in overcoming my current financial situation which I have
talked about in this video, you can help me by signing up for my Patreon, which is linked in my YouTube bio, You don't
really have to do this by the way, I basically had to force myself in asking for money because I do the stuff I do for
the sake of doing it, and I'm still too damn proud to ask for donations. None of my content and/or the work that I do
for the people will ever be locked behind a paywall while I'm still fucking breathing. If you wanna hang around with me
and the community and basically keep up to date with my stuff, you should definitely join our discord server, which is
also linked in my YouTube bio.

Thanks for staying this long, I wish you a good life.
