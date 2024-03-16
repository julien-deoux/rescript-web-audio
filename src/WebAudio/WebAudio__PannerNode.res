type t = WebAudio__Types.pannerNode
type panningModel = [#equalpower | #HRTF]
type distanceModel = [#linear | #inverse | #exponential]
type options = {
  panningModel?: panningModel,
  distanceModel?: distanceModel,
  positionX?: float,
  positionY?: float,
  positionZ?: float,
  orientationX?: float,
  orientationY?: float,
  orientationZ?: float,
  refDistance?: float,
  maxDistance?: float,
  rolloffFactor?: float,
  coneInnerAngle?: float,
  coneOuterAngle?: float,
  coneOuterGain?: float,
  channelCount?: int,
  channelCountMode?: WebAudio__Types.channelCountMode,
  channelInterpretation?: WebAudio__Types.channelInterpretation,
}

include WebAudio__AudioNode.Impl({
  type t = t
})

@new external make: (WebAudio__Types.audioContext, ~options: options=?) => t = "PannerNode"
@get external getConeInnerAngle: t => float = "coneInnerAngle"
@set external setConeInnerAngle: (t, float) => unit = "coneInnerAngle"
@get external getConeOuterAngle: t => float = "coneOuterAngle"
@set external setConeOuterAngle: (t, float) => unit = "coneOuterAngle"
@get external getConeOuterGain: t => float = "coneOuterGain"
@set external setConeOuterGain: (t, float) => unit = "coneOuterGain"
@get external getDistanceModel: t => distanceModel = "distanceModel"
@set external setDistanceModel: (t, distanceModel) => unit = "distanceModel"
@get external getMaxDistance: t => float = "maxDistance"
@set external setMaxDistance: (t, float) => unit = "maxDistance"
@get external getOrientationX: t => WebAudio__Types.audioParam = "orientationX"
@get external getOrientationY: t => WebAudio__Types.audioParam = "orientationY"
@get external getOrientationZ: t => WebAudio__Types.audioParam = "orientationZ"
@get external getPanningModel: t => panningModel = "panningModel"
@set external setPanningModel: (t, panningModel) => unit = "panningModel"
@get external getPositionX: t => WebAudio__Types.audioParam = "positionX"
@get external getPositionY: t => WebAudio__Types.audioParam = "positionY"
@get external getPositionZ: t => WebAudio__Types.audioParam = "positionZ"
@get external getRefDistance: t => float = "refDistance"
@set external setRefDistance: (t, float) => unit = "refDistance"
@get external getRolloffFactor: t => float = "rolloffFactor"
@set external setRolloffFactor: (t, float) => unit = "rolloffFactor"
