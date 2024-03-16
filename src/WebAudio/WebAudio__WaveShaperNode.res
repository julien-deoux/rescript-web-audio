type t = WebAudio__Types.waveShaperNode
type oversample = [#none | #"2x" | #"4x"]
type options = {
  curve?: RescriptCore.Float32Array.t,
  oversample?: oversample,
  channelCount?: int,
  channelCountMode?: WebAudio__Types.channelCountMode,
  channelInterpretation?: WebAudio__Types.channelInterpretation,
}

include WebAudio__AudioNode.Impl({
  type t = t
})

@new external make: (WebAudio__Types.audioContext, ~options: options=?) => t = "WaveShaperNode"
@get external getCurve: t => option<RescriptCore.Float32Array.t> = "curve"
@set external setCurve: (t, option<RescriptCore.Float32Array.t>) => unit = "curve"
@get external getOversample: t => oversample = "oversample"
@set external setOversample: (t, oversample) => unit = "oversample"
