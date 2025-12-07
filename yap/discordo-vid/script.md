Using custom Discord clients violates the Discord TOS.

In their TOS they say, and I quote,
"You may not copy, modify, create derivative works based upon, distribute, sell, lease, or sublicense any of our
software or services. You also may not reverse engineer or decompile our software or services, attempt to do so, or
assist anyone in doing so, unless you have our written consent or applicable law permits it."

I'm not responsible in any way, if using a custom discord client affects your account or anything related or unrelated
to it.

So, you use discord, and you like terminals, otherwise why would you watch this video?

Now I have been using and trying to keep up with Discordo development for a while now, at first I discovered it when I
was in my windows days, getting started with programming, discovering the beauty of Neovim and other terminal
applications. Eventually I also maintained a scoop bucket for Discordo and a few other packages

I maintain the package for Gentoo's guru repo, and also use it in a daily basis besides the GUI client Vesktop. And I
personally don't have that much of a problem with it honestly.

Discordo is an extremely well-made terminal discord client that's currently on the ecosystem, and I daresay it's the
best of the best.

Here's the thing for us terminal enthusiasts, it's that if you search up the history of discord clients for terminals
you'll get discouraged really, really soon.
Diamondburned's 6cord? Deprecated
Mitchweaver's Discline? Archived and non-functional
RX14's discord-curses? Last commit was from 9 years ago
Atlx's discord-term? The only way you're probably gonna find this page is through Wayback Machine
Xynxynxyn's terminal-discord? Last commit was from 5 years ago, says to use cordless instead
Bios-Marcel's Cordless? The main dev got banned by discord
Lhitori's ToastCord? Last commit was from 3 years ago.

Not really a flourishing ecosystem, is it?

Discordo aims to change this.

I should mention that there is a Weechat plugin for discord that is currently being worked on again, but still, I'll
take a mostly stable software over a Weechat plugin any day because I'm using my main account for these clients.

Now here's a look at Discordo, do keep in mind it's still heavily work-in-progress, and it says to expect some breaking
changes, and it also has a few PRs open, for example PR 639 which is a cool status bar, PR 603 which is a built-in
terminal file picker with fuzzy searching enabled, or PR 617 which is which adds configurable indentation to guild trees

Now currently there are a few different ways of logging in, you can try to normally log in with your account and
password, which I don't do since I have two-factor on and a bunch of other shenanigans, but there are other ways of
logging into your account, such as passing in the token manually in the shell, which I don't like, or you can keep the
token in your keyring, which is the way I log in. If you need to know how to get your discord token, you can search it
up on the internet, and I don't wanna cover that in here. Read the README to learn more about how to add the token to
your system keyring.

Now my user theme might hurt your eyes, 'cause I get that complain a lot.
So I'm gonna switch to a vanilla kitty terminal, and try out Discordo there.

Now after you log into your discord account, you're gonna be met with this really nice UI, now first of all, Discordo is
keyboard based, but it does have mouse support, so I can just click here, and here, and here, and it all just works

Discordo supports discord flavoured markdown, you can send bold text, you can send italic texts, you can send both bold
and italic texts. You can send normal single code blocks, and you can send multi-line code blocks, it doesn't currently
support syntax highlighting in code blocks, but maybe one day it will, if you're a go dev and know how to make that work,
maybe fiddle around with the project and open a PR about that? IDK.

You can get notifications from Discordo normally like you do in most other discord clients, you can attach files, which
I just realized you can do when researching for this vid, it uses the built-in system file manager, so that's really
nice. Although I do like the idea of the built-in terminal one from that PR, maybe they'll keep both alternatives? IDK.

You can mention people using autocomplete, you can do almost every normal discord features like replying to someone,
editing your previously sent messages, etc, etc.
But you can do a lot more than that, like opening up your message in your favourite text editor like Neovim, and write
your message there then send it

Now I've talked a bit about features, but what about configuration? While Discordo doesn't feature a fully "Go-nuts do
whatever the fuck you wanna do" like how Neovim does with lua, it does hold up by giving us a mostly okay config by
using TOML. And personally I think it's decent enough

I know that some people already are probably thinking, "But hey you're supposed to be doing an honest review, why are
you just talking good about Discordo? Aren't there any bad parts of using it?"

Yes, yes there is.
But talking about those first doesn't do this beautiful project any justice.

First of all, Discordo doesn't show images built in. Yes you can open an image in your built-in image viewer/image
editor, and you can indeed open up links, but Discordo doesn't render the images fully in the terminal itself, like how
other TUI applications like Yazi does. Discordo also doesn't work well with forums, for me, it doesn't show any posts
from any forums, although I believe the devs might be working on fixing that, so let's hope to that. Discordo also
doesn't render audio/video in the program itself, but as I've said before, you can just download the file or just open
it with your default editor/viewer of choice. But hey what are you expecting, It's a lightweight discord client written
in GO, not a bloated electron app.

If those are a huge problem for you that turns the world upside down, and you wanna yap about that, maybe just stick to
a GUI client, or write the feature yourself and open a PR, or hire a GO developer that can do this and they'll make the
PR. Or, just stop bitching about it.

I know that most of my friends and my viewers aren't like that, but I'm still saying it. Because FOSS contributor have
their own lives. They're not getting a cent for most of the things that they're doing. So I urge you to support
Discordo, I urge you to support the development of Blender, Linux, Wine, and every other FOSS project

If you're financially able to support me in my current financial struggle, you can join my Patreon or contact me if you
have any work for me that gives any money, you can also join my discord server to hang around with the community. Since
YouTube isn't counting views with AdBlocks anymore, giving a like, subscribe, commenting and sharing the video with
other people should help me out.

That's all for today, thank you folks for staying this long, and I wish you a good life.
