# Max's Emacs Configuration

An in-progressing emacs configuration.

## My config principle

Try to use the third package as little as possible. Vanilla Emacs
forever!

When I start using emacs, I watch many videos and read many tutorials
that teach you how to config your emacs. In most of those tutorials,
they will teach you to install a package to get a function, install b
package to add a minor feature on a function, naturally, you end up
with a configuration with tons of packages that you won't
understand. When something is broken, it's very hard to understand
what's wrong. The only way to solve it is to ask for help, google
online, post question on stackoverflow, or raise issue in the package
repository. Most time, this approach works, but it also keeps you away
from truly understanding how emacs works.

So I decided to start using minimal third packages to build my own
configuration. I try to figure out how things work in original emacs,
then add the necessary third package to my config, and try hard to keep
everything under my understanding and control.

As a result, this configuration will updated along with I understand
emacs deeper.

## Choose on some packages

### iCompelete, vertico and ivy

Ivy is a monster. It's working well, but a little complex. I should
use iCompelete or Fido follow my principle, but I feel they are slight
slower than vertico, so vertico is my current choice.

### lsp-mode and eglot

Language server is an huge experience improvement for some languages,
so definitely should be included in my configuration. And eglot is
much simpler than lsp-mode. lsp-mode sometimes needs additional
package to work with some LSP.

### flymake and flycheck

I use flycheck for a while, because flymake report an error on
`use-package` in my `init-*.el`, but flycheck works fine. I thought it
was some bug in flymake. but finally I came up with the fixes, the
flymake was right, I made mistake in my config, so I switch back to
flymake now. And flycheck is not work well with eglot, there's a long
[discussion](https://github.com/joaotavora/eglot/issues/596) in
eglot's repo.

### paredit and smartparens

Paredit works fine in lisp family. and builtin electric-pair-mode is
sufficient for most languages.

## Well-known emacs configuration resourse

- [Purcell's emacs.d](https://github.com/purcell/emacs.d)
- [Doom Emacs](https://github.com/hlissner/doom-emacs)
- [Spacemacs](https://github.com/syl20bnr/spacemacs)
- [System Crafter Youtube](https://www.youtube.com/c/SystemCrafters)
- [Protesilao's Blog](https://protesilaos.com/)
