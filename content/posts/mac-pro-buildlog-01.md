+++
title = "macpro build - what and why"
date = 2020-05-12
categories = ["macprobuildlog"]
weight = 4005
draft = false
toc = false
+++

In March of 2020, I went looking for a project.  I was looking for something
that I could focus some extra time and energy on (that _wasn't_ just frantically
refreshing news sites).  I was working from home full time for the first time in
my life, a change which necessitated some alterations to my workspace.  Graduate
school was finished, so I could afford some instability on my personal machine,
and the 5k iMac that had served as the anchor of my home computing life was now
in the way (I couldn't use it for work, so it ended up awkwardly shunted aside
most days, and moving it back into place every night was _just_ annoying enough
to be untenable.  It was easier to just leave my work machine plugged in and
running, but _that_ lead to the temptation to do juuuust a little more work
whenever I sat down at my desk; you can imagine the impact that had on work-life
balance).

Enter the 5,1 Mac Pro.


## the cheese grater {#the-cheese-grater}

The 5,1 Mac Pro, released in 2010, with a minor spec bump shipped in 2012 and
ultimately replaced by late 2013's trash can, is a very special machine.  Due to
the design choices (and expense) of the models that replaced it, it's had a long
and vibrant life as an expandable, flexible, workstation that can be kitted out
for a variety of use cases.  It holds a special place in my heart as the most
powerful machine Apple was shipping during my time as a Genius; it was the most
complicated machine to troubleshoot, given the flexibility and complexity of its
internals, but it was always a thrill to see one sidle up to the bar.  It was a
machine that _did work_ (or at least, purported to. I fully recognize the myth
of the Mac Pro, which was always more costly than it had any right to be).

Could it be my 2020 computer?

{{<figure src="/images/mp_01.svg" caption="cMP 5,1">}}


## what's the goal? {#what-s-the-goal}

What am I trying to do here, exactly?  I'm looking to wrangle up a Mac desktop,
responsive enough for day to day use, with enough compute and memory to handle
my polyglot programming (virtualization and containerization, some Go, a
smattering of C++/Clojure/Swift/Python, depending on what I'm picking at on a
particular day), and the graphical power to run the handful of games (some
Blizzard titles, Total War: Warhammer and its sequels, Tabletop Simulator).

I'm loosely describing my requirements as: a desktop,  running macOS, built by
Apple.

_Why a desktop?_

In my experience, laptops add a thin layer of unreliability when being used
permanently docked at a desk.  Peripheral negotiation is often fussy, cooling
can be a problem, and ultimately it feels to me like a misuse of the object.
Look at a laptop; it's fundamentally designed for portability. Using it
permanently tethered feels like hammering nails in with the back end of a
screwdriver.

_Why macOS?_

Windows is a tire fire.  The software ecosystem is a Hieronymus Bosch style
rhizome of misery and suffering, and software development on Windows outside of
the Microsoft ecosystem just sucks.  That's all a deliberately inflammatory
description, but it captures how I feel (and the bulk of my experience trying to
develop for Linux systems on Windows in my previous job).  Window management is
remedial (whoever thought full screen and half screen splits were a good idea,
and parasitically infected other operating systems with that idea should be
tried at the Hague), keyboard shortcuts across the OS for text wrangling suck,
and Emacs on Windows suffers from all sorts of painful compromises.

A more measured answer to "Why not Windows?" is that I don't have room in my brain at the moment
for a detailed enough mental model of the foibles and pit traps of Windows 10.  I'm
not particularly interested in building that model, to be totally honest, since I
find the essential primitives of Windows as an operating system (the registry?
really?) and the user punishing choices (adware in the start menu, user hostile
updates) alien and off putting.  It's the only way to play PC games, so I'll
always have it installed somewhere in the house, but I'd like it as cordoned off
as possible.

The desktop experiences of the non-macOS \*nixs are unpleasant for me. Window
management and keyboard shortcuts tend to ape Windows out of the box (yes, there
are distros and customization paths to mimic macOS, but they're never quite 100%
reliable in my experience).  I'll continue to happily run Linux and BSD servers, both in
the house on a handful of headless machines and in VPS's, but for a desktop
machine macOS is the best choice for me.

_Why not a Hackintosh?_

Given the decision to run macOS and the computational/GPU requirements, an
obvious question would be "Why not build a Hackintosh?" OpenCore has come a long
way, the community is active and communicative, AMD has some rad chip offerings
bringing high core counts way down in price - there are a lot of compelling
reasons to build a Hackintosh.  I've done it before, almost half a decade ago,
and found Clover pretty straightforward to configure, and the resulting machine
was powerful and flexible.  But honestly, I've built more than enough PCs.  It's
boring, in many ways, and I don't think building a generic PC and installing
macOS on it would be the engaging project that I'm looking for amidst all of
this chaos.

I have a great deal of affection for the 5,1 Mac Pro.  The high core count, high
memory configuration is surprisingly effective in 2020, and fits my use cases
especially well.  Most intriguingly, the vibrant Mac Pro community has made huge
leaps in recent months, bringing Catalina support, hardware acceleration and,
most importantly to me, Thunderbolt 3.  Thunderbolt support would mean one cable
to plug in my work laptop during the day, and a single cable moving over to
switch to my main machine outside of work.
