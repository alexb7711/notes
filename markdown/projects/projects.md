<!-- :nav:projects: -->

[TOC]

# Projects
This is effectively a list of all the projects that I am either actively working on, completed, or just maintaining.
Active projects are those that are _actively_ being developed, completed are projects that are basically going to stay
in the state that they are, and maintenance are projects that are completed, but may receive updates from time-to-time.

# Active

## [PyMind](https://alexb7711.github.io/pymind/)
This is yet another static website generator that is written in Python. The website you are looking at is generated
using PyMind. The objective of this project is to be brain dead simple to use and extend while not doing too many
things. We don't like bloat around these parts.

## [SIG](https://github.com/alexb7711/SIG)
This is a project that I have had in my head for a long time, knew that I wanted to do, but could not really formulate
the use case. The conclusion that I came to for the Socket Interface Generator (SIG) project is to output boiler plate
code to send and receive predefined Ethernet messages (starting with UDP) for Python, C/C++, and Rust. The primary
objective is to be able to write one "skeleton" for the set of messages you wish to send then to have the application
generate all the source code required to communicate those messages to other applications generated with SIG (using the
same messages of course).

## [Emacs](https://github.com/alexb7711/emacs)
This is the ever-changing configuration for Emacs. I edit a whole lot of text on a daily basis, and obviously have
crestfallen into the blessing/nightmare that is Emacs. This Emacs configuration is supposed to be dependent on as few
packages as possible while being usable. I suck at writing Elisp (and Lisp in general), so this project is a mixed bag
at best.

Contemplating on renaming the project to RuneMacs. The name stems from the Windows port executable `runemacs`, when I
first read it I read "Rune Macs".

## [Prusa Box](prusa-box.html)
This project is an attempt to make an encasement for my Prusa 3D printer. The high-level objectives are to make this a
cheaply as possible, but not have it be fragile as a house of cards. As well as to include other bells an whistles such
as:

- external power supply mount,
- external screen mounting
- temperature control
- air filtration
- multiple filament mounts

This is a long-term project that is supposed to be a sort of milestone setter to gauge how far I have come in design for
the mechanical (structural), electrical, and software aspects.

# Maintenance

# Complete

## [SA PAP](https://github.com/alexb7711/sa-pap)
This is part of my Master degree thesis. This is application is written in Rust and is a Simulated Annealing optimizer
that, given a static schedule of bus routes, outputs an optimal schedule for charging electric busses.

## [MILP PAP](https://github.com/alexb7711/milp-pap)
This is also part of my Master degree thesis. This is the original implementation for optimizing the scheduling of
electric busses. This uses the Gurobi mixed integer optimizer, so unless you have a student license you won't be able to
run this.
