type t = WebAudio__Types.audioContext
@unboxed
type latencyHint =
  | @as("balanced") Balanced
  | @as("interactive") Interactive
  | @as("playback") Playback
  | Preferred(float)
type audioSinkInfo = {@as("type") type_: [#none]}
@unboxed type sinkId = Id(string) | Options(audioSinkInfo)
type audioTimestamp = {
  contextTime: float,
  performanceTime: float,
}
type options = {
  latencyHint?: latencyHint,
  sampleRate?: float,
  sinkId?: sinkId,
}

include WebAudio__BaseAudioContext.Impl({
  type t = t
})

@new external make: (~options: options=?) => t = "AudioContext"
@get external getBaseLatency: t => float = "baseLatency"
@get external getOutputLatency: t => float = "outputLatency"
@get external getSinkId: t => sinkId = "sinkId"
@send external setSinkId: (t, sinkId) => promise<unit> = "setSinkId"
@send external getOutputTimestamp: t => audioTimestamp = "getOutputTimestamp"
@send external close: t => promise<unit> = "close"
@send external resume: t => promise<unit> = "resume"
@send external suspend: t => promise<unit> = "suspend"
@send
external addSinkchangeEventListener: (t, @as("sinkchange") _, Dom.event => unit) => unit =
  "addEventListener"
@send
external removeSinkchangeEventListener: (t, @as("sinkchange") _, Dom.event => unit) => unit =
  "removeEventListener"
