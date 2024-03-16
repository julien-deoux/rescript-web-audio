type t = WebAudio__Types.gainNode
type options = {
  gain?: float,
  channelCount?: int,
  channelCountMode?: WebAudio__Types.channelCountMode,
  channelInterpretation?: WebAudio__Types.channelInterpretation,
}

include WebAudio__AudioNode.Impl({
  type t = t
})

@new external make: (WebAudio__Types.audioContext, ~options: options=?) => t = "GainNode"
@get external getGain: t => WebAudio__Types.audioParam = "gain"
