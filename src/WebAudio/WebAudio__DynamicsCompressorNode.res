type t = WebAudio__Types.dynamicsCompressorNode
type options = {
  attack?: float,
  knee?: float,
  ratio?: float,
  release?: float,
  threshold?: float,
}

include WebAudio__AudioNode.Impl({
  type t = t
})

@new
external make: (WebAudio__Types.audioContext, ~options: options=?) => t = "DynamicsCompressorNode"
@get external getAttack: t => WebAudio__Types.audioParam = "attack"
@get external getKnee: t => WebAudio__Types.audioParam = "knee"
@get external getRatio: t => WebAudio__Types.audioParam = "ratio"
@get external getRelease: t => WebAudio__Types.audioParam = "release"
@get external getThreshold: t => WebAudio__Types.audioParam = "threshold"
@get external getReduction: t => float = "reduction"
