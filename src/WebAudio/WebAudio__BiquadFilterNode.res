type t = WebAudio__Types.biquadFilterNode
type type_ = [
  | #lowpass
  | #highpass
  | #bandpass
  | #lowshelf
  | #highshelf
  | #peaking
  | #notch
  | #allpass
]
type options = {
  @as("type") type_?: type_,
  q?: float,
  detune?: float,
  frequency?: float,
  gain?: float,
  channelCount?: int,
  channelCountMode?: WebAudio__Types.channelCountMode,
  channelInterpretation?: WebAudio__Types.channelInterpretation,
}

include WebAudio__AudioNode.Impl({
  type t = t
})

@new external make: (WebAudio__Types.audioContext, ~options: options=?) => t = "BiquadFilterNode"
@get external getFrequency: t => WebAudio__Types.audioParam = "frequency"
@get external getDetune: t => WebAudio__Types.audioParam = "detune"
@get external getQ: t => WebAudio__Types.audioParam = "Q"
@get external getType: t => type_ = "type"
@set external setType: (t, type_) => unit = "type"
@get external getGain: t => WebAudio__Types.audioParam = "gain"
@send
external getFrequencyResponse: (
  t,
  RescriptCore.Float32Array.t,
  RescriptCore.Float32Array.t,
  RescriptCore.Float32Array.t,
) => unit = "getFrequencyResponse"
