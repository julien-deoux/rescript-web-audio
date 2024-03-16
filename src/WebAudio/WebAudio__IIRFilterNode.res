type t = WebAudio__Types.iirFilterNode
type options = {
  feedForward: array<float>,
  feedBack: array<float>,
  channelCount?: int,
  channelCountMode?: WebAudio__Types.channelCountMode,
  channelInterpretation?: WebAudio__Types.channelInterpretation,
}

include WebAudio__AudioNode.Impl({
  type t = t
})

@new external make: (WebAudio__Types.audioContext, ~options: options) => t = "IIRFilterNode"
@send
external getFrequencyResponse: (
  t,
  RescriptCore.Float32Array.t,
  RescriptCore.Float32Array.t,
  RescriptCore.Float32Array.t,
) => unit = "getFrequencyResponse"
