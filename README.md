# rescript-web-audio
Rescript bindings for the Web Audio API

## Design goals

The goal is to provide as much of the functionality of the JS API with _some_
degree of extra-safety afforded by Rescript (for instance, using variants when
the number of options for a specific value is finite).

I haven't settled yet on my list of priorities but right now it is as follows:
- Zero-cost bindings
- 100% coverage of the API (https://developer.mozilla.org/en-US/docs/Web/API/Web_Audio_API)
- Type safety
- Error safety

Meaning that some exceptions will be avoided thanks to the type system, but
some might still be thrown and won't be replaced by option types for now (as it
would violate priority #1). I hope to be able to document those cases at some
point but right now this is just a pet project.
