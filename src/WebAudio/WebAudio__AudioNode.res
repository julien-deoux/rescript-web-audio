module Impl = (
  T: {
    type t
  },
) => {
  @get external getContext: T.t => WebAudio__Types.audioContext = "context"
  @get external getNumberOfInputs: T.t => int = "numberOfInputs"
  @get external getNumberOfOutputs: T.t => int = "numberOfOutputs"
  @get external getChannelCount: T.t => int = "channelCount"
  @set external setChannelCount: (T.t, int) => unit = "channelCount"
  @get external getChannelCountMode: T.t => WebAudio__Types.channelCountMode = "channelCountMode"
  @set
  external setChannelCountMode: (T.t, WebAudio__Types.channelCountMode) => unit = "channelCountMode"
  @get
  external getChannelInterpretation: T.t => WebAudio__Types.channelInterpretation =
    "channelInterpretation"
  @set
  external setChannelInterpretation: (T.t, WebAudio__Types.channelInterpretation) => unit =
    "channelInterpretation"
  @send
  external connectNode: (
    T.t,
    WebAudio__Types.audioNode_like<'b>,
    ~outputIndex: int=?,
    ~inputIndex: int=?,
  ) => option<WebAudio__Types.audioNode_like<'b>> = "connect"
  @send
  external connectParam: (T.t, WebAudio__Types.audioParam, ~outputIndex: int=?) => unit = "connect"
  @send
  external disconnectAll: T.t => unit = "disconnect"
  @send
  external disconnectNode: (
    T.t,
    WebAudio__Types.audioNode_like<'a>,
    ~outputIndex: int=?,
    ~inputIndex: int=?,
  ) => unit = "disconnect"
  @send
  external disconnectParam: (T.t, WebAudio__Types.audioParam, ~outputIndex: int=?) => unit =
    "disconnect"
}
