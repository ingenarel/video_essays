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

Now what exactly is the require function? if we check the docs by doing `:help require` here's what the doc says:

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
you're not doing some weird stuff, most of the time, your neovim plugins will just autoload if you're using a plugin
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

Now that we've gone through the docs, let's explain this in layman's terms:

this is your file structure, you have an init.lua, and a lua dir in the root dir, and 3 files in the lua dir called,
a.lua, b.lua, and c.lua

If you want to 




There should be a separate config directory, which hosts your own config unrelated to plugins and/or extra stuff, which
could work in a clean Neovim setup. Now you could surely put some plugin related code in here if you really have to, but
I try to keep that to a minimum as much as I can. Makes stuff really easily debuggable

Now in that directory, I have a init.lua which just has my vim options changes, and then requires the other files from
that dir, now for the sake of modularity, I could've made the "vim options change part" thing a separate file, but at
times if you wish you can just break the modular philosophy, in the end it depends on how you feel, as you can see from
this example.


