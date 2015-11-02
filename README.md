# Redirect!
What is this, you might ask. It's a simple redirector.

You use it by specifying something such as `http://theredirector.github.io/redirect-to?url=http://example.com` and you are redirected to `http://example.com` with a 302 redirect.

`theredirector.github.io` is a CNAME for `httpbin.org`.

## Uses?

Anything you can think of!

We, for example, have used it to cheat through `git.io`'s GitHub-only policy.

[`http://git.io/vl0a6`](http://git.io/vl0a6) &#8594; `https://theredirector.github.io/redirect-to?url=https://example.com` &#8594; `http://httpbin.org/redirect-to?url=https://example.com` &#8594; [`https://example.com`](https://example.com).
