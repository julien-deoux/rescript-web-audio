type t = WebAudio__Types.analyserNode
type fftSize = [#32 | #64 | #128 | #256 | #512 | #1024 | #2048 | #4096 | #8192 | #16384 | #32768]
type options = {
  fftSize?: fftSize,
  maxDecibels?: float,
  minDecibels?: float,
  smoothingTimeConstant?: float,
  channelCount?: int,
  channelCountMode?: WebAudio__Types.channelCountMode,
  channelInterpretation?: WebAudio__Types.channelInterpretation,
}

include WebAudio__AudioNode.Impl({
  type t = t
})

@new external make: (WebAudio__Types.audioContext, ~options: options=?) => t = "AnalyserNode"
@get external getFftSize: t => fftSize = "fftSize"
@set external setFftSize: (t, fftSize) => unit = "fftSize"
@get external getFrequencyBinCount: t => int = "frequencyBinCount"
@get external getMinDecibels: t => float = "minDecibels"
@set external setMinDecibels: (t, float) => unit = "minDecibels"
@get external getMaxDecibels: t => float = "maxDecibels"
@set external setMaxDecibels: (t, float) => unit = "maxDecibels"
@get external getSmoothingTimeConstant: t => float = "smoothingTimeConstant"
@set external setSmoothingTimeConstant: (t, float) => unit = "smoothingTimeConstant"
@send
external getFloatFrequencyData: (t, RescriptCore.Float32Array.t) => unit = "getFloatFrequencyData"
@send external getByteFrequencyData: (t, RescriptCore.Uint8Array.t) => unit = "getByteFrequencyData"
@send
external getFloatTimeDomainData: (t, RescriptCore.Float32Array.t) => unit = "getFloatTimeDomainData"
@send
external getByteTimeDomainData: (t, RescriptCore.Uint8Array.t) => unit = "getByteTimeDomainData"
