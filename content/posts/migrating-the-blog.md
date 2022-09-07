+++
title = "migrating the blog"
date = 2022-09-06
draft = false
weight = 4001
toc = false
+++

## how was this all running? {#how-was-this-all-running}

I've been running some version of this blog for...seven years now?  I think?  I'm tremendously inconsistent, and I think no content remains from the initial version (early posts were all about work related discoveries, and I don't really have the appetite for that at the moment).  I think it has been a [hugo](https://gohugo.io) generated static site for the entire time, but the infrastructure has shifted underneath it a few times.

I believe that I first deployed this site to a Digital Ocean droplet running FreeBSD.  I had fallen in love with the idea of a simple to administer server with some nebulous, BSD based benefits -  "Imagine knowing exactly what every running service does!", "Oh, the user space tools are written by the same folks that write the kernel, what grand vision they must have!", etc.  I think I'd misremembered the correct parameter order for a systemd command one too many times, and was all sorts of fed up. I had experience running NGINX, and it seemed like it would tick all of the boxes, so I created the site with Hugo, and wrote some bash wrapper scripts to rsync the static site files onto the BSD droplet and reload NGINX as necessary.  The first configuration also had me manually running Let's Encrypt's certbot commands every 90 days, which was truly foolish.  Thankfully, I got that automated pretty quickly, and it's been humming along merrily ever since.

This was largely **fine**, although a bit annoying and manual to deploy, and the FreeBSD box had to be tended to differently than my other local and remote VMs.  I wasn't using BSD frequently enough to really remember what it needed and how it was all working, so every time I had to actual do anything on the box, I had to go back to notes or old terminal sessions to try to scrape together the incantations for the care and feeding of my blog host.  When I deployed [AWX](https://www.ansible.com/products/awx-project/faq) to automatically manage and run my ansible playbooks, I had to create a bunch of special cases to keep the BSD box happy in a sea of mostly centos and ubuntu VMs.  (AWX was its own administrative nightmare, and it seems pretty clear that IBM wants it gone...I'm not feeling particularly confident in the future of that product).

So at some point in a fit of pique, I decided I should suck it up and migrate the blog over to an OS I was using more often.  At the time, everything at work was Ubuntu based, so that's what I went with.  Migrating an NGINX and certbot config from one nix system to another is wonderfully straightforward, so with just some adjustments to my scripts, I was able to remove the BSD induced administrative headache without too much trouble.

At some point, I decided that the blog I never update that nobody reads definitely needs a CDN (I mean, what if the blog posts that I don't write end up being shared far and wide on social media platforms that I don't use or interact with?  That's definitely a thing that could happen, and a normal person should absolutely spend their precious time on this earth configuring that).  Cloudflare's free tier seemed to tick all the boxes, and they have a nice developer onboarding experience, so without much more ado the Digital Ocean droplet was now fronted by a CDN.


## what's changed? {#what-s-changed}

I've been feeling a little gross about Cloudflare of late (for obvious reasons), and I'm also feeling like I've been wasting money paying for a droplet that just requires me to spend more of my time managing it.  So I thought I would close my Cloudflare account, migrate my site to one of the static site hosting services and stop spending my time administering the server itself.  I'm not getting anything out of running it myself; I know how to run a nix box, I know how to run NGINX...and there's nothing valuable to me in making myself do it.  Rather than set up a deployment pipeline of my own (I've got some new pipelines setup for my internal home proxy, which has been pretty cool), I decided to use a static site hosting service with a generous free tier.

I had heard a bit about [Render](<http://www.render.com >) on a discord server that I hang out on, so I thought it could be worth a try.  (Folks that know about Render can probably spot a big ol' ironic twist waiting in the wings).  So I moved my site from Gitlab (where I keep private things) to Github (and in the process finally settled on my new, clean, Github account, and sunset the almost decade old, semi-used account I had half set up in the past), and got it slurped up into Render.  Everything looked good, so I made the DNS changes with my registrar, and boom! A new static site looking exactly like the old one.  But with a much lower maintenance requirement, and a more pleasant writing/deploying experience.

Out of curiosity, I thought I'd look at the issued cert, just to see what kind of setup they've got in place.  Low and behold, Render farms that all out...to Cloudflare.  Bummer. Looking at their documentation, they're quite up front about the whole thing, but I must have missed it when I glanced through.  A testament to their dev experience generally, I didn't really need to dive deep into the docs.  I'm going back and forth on whether or not it makes sense to move the site again;  I've accomplished a few of my goals (reduced cost and maintenance burden, more pleasant deployments), but I haven't managed to fully extricate myself from a company I find kind of gross.

All told, I'd consider this to be a middling success.  I'm happy to make it easier to write here, glad that I'm not paying for the privilege of admining a linux box for the millionth time, and a little bummed that I'm only one step removed from doing business with a company I'd rather avoid.
