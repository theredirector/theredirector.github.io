# Redirect!
What is this, you might ask. It's a simple redirector.

You use it by specifying something such as `http://theredirector.github.io/?http://example.com` and you are redirected to `http://example.com` with a 302 redirect.

`theredirector.github.io` is a CNAME for `r.zgrep.org`.

## Uses?

Anything you can think of!

We, for example, have used it to cheat through `git.io`'s GitHub-only policy.

[`https://git.io/example`](https://git.io/example) &#8594; `https://theredirector.github.io/?https://example.com` &#8594; `http://r.zgrep.org/?https://example.com` &#8594; [`https://example.com`](https://example.com).
