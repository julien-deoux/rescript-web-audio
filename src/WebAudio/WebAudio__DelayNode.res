type t = WebAudio__Types.delayNode
type options = {
  delayTime?: float,
  maxDelayTime?: float,
  channelCount?: int,
  channelCountMode?: WebAudio__Types.channelCountMode,
  channelInterpretation?: WebAudio__Types.channelInterpretation,
}

include WebAudio__AudioNode.Impl({
  type t = t
})

@new external make: (WebAudio__Types.audioContext, ~options: options=?) => t = "DelayNode"
@get external getDelayTime: t => WebAudio__Types.audioParam = "delayTime"
