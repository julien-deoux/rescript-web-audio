type t = WebAudio__Types.convolverNode
type options = {
  buffer?: WebAudio__Types.audioBuffer,
  disableNormalization?: bool,
  channelCount?: int,
  channelCountMode?: WebAudio__Types.channelCountMode,
  channelInterpretation?: WebAudio__Types.channelInterpretation,
}

include WebAudio__AudioNode.Impl({
  type t = t
})

@new external make: (WebAudio__Types.audioContext, ~options: options=?) => t = "ConvolverNode"
@get external getBuffer: t => WebAudio__Types.audioBuffer = "buffer"
@set external setBuffer: (t, WebAudio__Types.audioBuffer) => unit = "buffer"
@get external getNormalize: t => bool = "normalize"
@set external setNormalize: (t, bool) => unit = "normalize"
