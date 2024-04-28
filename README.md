# rescript-web-audio

[![npm](https://img.shields.io/npm/v/rescript-web-audio.svg)](https://npmjs.org/rescript-web-audio)

Zero-cost ReScript bindings for the
[Web Audio API](https://developer.mozilla.org/en-US/docs/Web/API/Web_Audio_API)

## Installation

```sh
pnpm install rescript-web-audio
```
Then add `rescript-web-audio` to `bs-dependencies` in `rescript.json`.
```json
{
    "name": "my-project",
    "bs-dependencies": ["@rescript/core", "rescript-web-audio"]
}
```

## Usage

This library is heavily inspired by the design of
[rescript-webapi](https://github.com/TheSpyder/rescript-webapi) and
[ocaml-ffmpeg](https://github.com/savonet/ocaml-ffmpeg), which both use
**phantom types** and **implementation inheritance** to translate an Object
Oriented API into the functional paradigm of OCaml. Here is an example of what
it looks like in the wild:

```rescript
open WebAudio

// Constructors become ModuleName.make().
let ctx = AudioContext.make()

let osc = OscillatorNode.make(
  ctx,
  ~options={
    // Strings with a finite number of possible values become polymorphic variants.
    type_: #sine, 
    frequency: 440.0,
  },
)

let gain = GainNode.make(
  ctx,
  ~options={
    gain: 0.3,
  },
)

// Methods become functions.
let _ = OscillatorNode.connectNode(osc, gain)

// Fields become getters (and setters when appropriate).
let _ = GainNode.connectNode(gain, AudioContext.getDestination(ctx))

OscillatorNode.start(osc)
```
