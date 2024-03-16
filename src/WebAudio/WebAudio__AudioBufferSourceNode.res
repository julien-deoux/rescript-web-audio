type t = WebAudio__Types.audioBufferSourceNode
type options = {
  buffer?: WebAudio__Types.audioBuffer,
  detune?: float,
  loop?: bool,
  loopEnd?: float,
  loopStart?: float,
  playbackRate?: float,
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

@new
external make: (WebAudio__Types.audioContext, ~options: options=?) => t = "AudioBufferSourceNode"
@get external getBuffer: t => option<WebAudio__Types.audioBuffer> = "buffer"
@set external setBuffer: (t, option<WebAudio__Types.audioBuffer>) => unit = "buffer"
@get external getDetune: t => WebAudio__Types.audioParam = "detune"
@get external getLoop: t => bool = "loop"
@set external setLoop: (t, bool) => unit = "loop"
@get external getLoopStart: t => float = "loopStart"
@set external setLoopStart: (t, float) => unit = "loopStart"
@get external getLoopEnd: t => float = "loopEnd"
@set external setLoopEnd: (t, float) => unit = "loopEnd"
@get external getPlaybackRate: t => WebAudio__Types.audioParam = "playbackRate"
@send external start: (t, ~when_: float=?, ~offset: float=?, ~duration: float=?) => unit = "start"
