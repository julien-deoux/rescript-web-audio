type state = [#suspended | #running | #closed]

module Impl = (
  T: {
    type t
  },
) => {
  @get external getAudioWorklet: T.t => WebAudio__Types.audioWorklet = "audioWorklet"
  @get external getCurrentTime: T.t => float = "currentTime"
  @get external getDestination: T.t => WebAudio__Types.audioDestinationNode = "destination"
  @get external getSampleRate: T.t => float = "sampleRate"
  @get external getState: T.t => state = "state"
  @send
  external decodeAudioData: (
    T.t,
    RescriptCore.ArrayBuffer.t,
  ) => promise<WebAudio__Types.audioBuffer> = "decodeAudioData"
  @send
  external addStateChangeEventListener: (T.t, @as("statechange") _, Dom.event => unit) => unit =
    "addEventListener"
  @send
  external removeStateChangeEventListener: (T.t, @as("statechange") _, Dom.event => unit) => unit =
    "removeEventListener"
}
