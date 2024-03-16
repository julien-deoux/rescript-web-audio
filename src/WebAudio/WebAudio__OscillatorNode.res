type t = WebAudio__Types.oscillatorNode
type type_ = [#sine | #square | #sawtooth | #triangle | #custom]
type options = {
  @as("type") type_?: type_,
  detune?: float,
  frequency?: float,
  periodicWave?: WebAudio__Types.periodicWave,
  channelCount?: int,
  channelCountMode?: WebAudio__Types.channelCountMode,
  channelInterpretation?: WebAudio__Types.channelInterpretation,
}

include WebAudio__AudioNode.Impl({
  type t = t
})
include WebAudio__AudioScheduledSourceNode.Impl({
  type t = t
})

@new external make: (WebAudio__Types.audioContext, ~options: options=?) => t = "OscillatorNode"
@get external getFrequency: t => WebAudio__Types.audioParam = "frequency"
@get external getDetune: t => WebAudio__Types.audioParam = "detune"
@get external getType: t => type_ = "type"
@set external setType: (t, type_) => unit = "type"
@send external setPeriodicWave: (t, WebAudio__Types.periodicWave) => unit = "setPeriodicWave"
