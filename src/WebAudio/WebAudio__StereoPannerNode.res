type t = WebAudio__Types.stereoPannerNode
type options = {
  pan?: float,
  channelCount?: int,
  channelCountMode?: WebAudio__Types.channelCountMode,
  channelInterpretation?: WebAudio__Types.channelInterpretation,
}

include WebAudio__AudioNode.Impl({
  type t = t
})

@new external make: (WebAudio__Types.audioContext, ~options: options=?) => t = "StereoPannerNode"
@get external getPan: t => WebAudio__Types.audioParam = "pan"
