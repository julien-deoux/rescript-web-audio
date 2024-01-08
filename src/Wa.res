type event<'target>
type audioBuffer
type audioParam
type audioNode<'a>
type analyser
type analyserNode = audioNode<analyser>
type bufferSource
type audioBufferSourceNode = audioScheduledSourceNode<bufferSource>
type destination
type audioDestinationNode = audioNode<destination>
type scheduledSource<'a>
type audioScheduledSourceNode<'a> = audioNode<scheduledSource<'a>>
type oscillator
type oscillatorNode = audioScheduledSourceNode<oscillator>
type gain
type gainNode = audioNode<gain>
type baseAudioContext<'a>
type online
type audioContext = baseAudioContext<online>
type offline
type offlineAudioContext = baseAudioContext<offline>
type channelCountMode = [#max | #"clamped-max" | #explicit]
type channelInterpretation = [#speakers | #discrete]

module AnalyserNode = {
  type fftSize = [#32 | #64 | #128 | #256 | #512 | #1024 | #2048 | #4096 | #8192 | #16384 | #32768]
  type options = {
    fftSize?: fftSize,
    minDecibels?: float,
    maxDecibels?: float,
    smoothingTimeConstant?: float,
    channelCount?: int,
    channelCountMode?: channelCountMode,
    channelInterpretation?: channelInterpretation,
  }
  @new
  external make: (audioContext, ~options: options=?) => analyserNode = "AnalyserNode"
  @get external getFftSize: analyserNode => fftSize = "fftSize"
  @set external setFftSize: (analyserNode, fftSize) => unit = "fftSize"
  @get external getFrequencyBinCount: analyserNode => int = "frequencyBinCount"
  @get external getMinDecibels: analyserNode => float = "minDecibels"
  @set external setMinDecibels: (analyserNode, float) => unit = "minDecibels"
  @get external getMaxDecibels: analyserNode => float = "maxDecibels"
  @set external setMaxDecibels: (analyserNode, float) => unit = "maxDecibels"
  @get external getSmoothingTimeConstant: analyserNode => float = "smoothingTimeConstant"
  @set external setSmoothingTimeConstant: (analyserNode, float) => unit = "smoothingTimeConstant"
  @send
  external getFloatFrequencyData: (analyserNode, Js.TypedArray2.Float32Array.t) => unit =
    "getFloatFrequencyData"
  @send
  external getByteFrequencyData: (analyserNode, Js.TypedArray2.Uint8Array.t) => unit =
    "getByteFrequencyData"
  @send
  external getFloatTimeDomainData: (analyserNode, Js.TypedArray2.Float32Array.t) => unit =
    "getFloatTimeDomainData"
  @send
  external getByteTimeDomainData: (analyserNode, Js.TypedArray2.Uint8Array.t) => unit =
    "getByteTimeDomainData"
}

module AudioBuffer = {
  type options = {
    length?: int,
    numberOfChannels?: int,
    sampleRate?: float,
    channelCount?: int,
    channelCountMode?: channelCountMode,
    channelInterpretation?: channelInterpretation,
  }
  @new external make: options => audioBuffer = "AudioBuffer"
  @get external getSampleRate: audioBuffer => float = "sampleRate"
  @get external getLength: audioBuffer => int = "length"
  @get external getDuration: audioBuffer => float = "duration"
  @get external getNumberOfChannels: audioBuffer => int = "numberOfChannels"
  @send
  external getChannelData: (analyserNode, int) => Js.TypedArray2.Float32Array.t = "getChannelData"
  @send
  external copyFromChannel: (
    analyserNode,
    Js.TypedArray2.Float32Array.t,
    int,
    ~startInChannel: int=?,
  ) => unit = "copyFromChannel"
  @send
  external copyToChannel: (
    analyserNode,
    Js.TypedArray2.Float32Array.t,
    int,
    ~startInChannel: int=?,
  ) => unit = "copyToChannel"
}

module AudioBufferSourceNode = {
  type options = {
    buffer?: audioBuffer,
    detune?: float,
    loop?: bool,
    loopEnd?: float,
    loopStart?: float,
    playbackRate?: float,
    channelCount?: int,
    channelCountMode?: channelCountMode,
    channelInterpretation?: channelInterpretation,
  }
  @new
  external make: (audioContext, ~options: options=?) => audioBufferSourceNode =
    "AudioBufferSourceNode"
  @get external getBuffer: audioBufferSourceNode => option<audioBuffer> = "buffer"
  @set
  external setBuffer: (audioBufferSourceNode, option<audioBuffer>) => unit = "buffer"
  @get external getDetune: audioBufferSourceNode => audioParam = "detune"
  @set
  external setDetune: (audioBufferSourceNode, audioParam) => unit = "detune"
  @get external getLoop: audioBufferSourceNode => bool = "loop"
  @set
  external setLoop: (audioBufferSourceNode, bool) => unit = "loop"
  @get external getLoopStart: audioBufferSourceNode => option<float> = "loopStart"
  @set
  external setLoopStart: (audioBufferSourceNode, option<float>) => unit = "loopStart"
  @get external getLoopEnd: audioBufferSourceNode => option<float> = "loopEnd"
  @set
  external setLoopEnd: (audioBufferSourceNode, option<float>) => unit = "loopEnd"
  @get external getPlaybackRate: audioBufferSourceNode => audioParam = "playbackRate"
  @set
  external setPlaybackRate: (audioBufferSourceNode, audioParam) => unit = "playbackRate"
  @send
  external start: (
    audioBufferSourceNode,
    ~when_: float=?,
    ~offset: float=?,
    ~duration: float=?,
  ) => unit = "start"
}

module AudioContext = {
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
  @new external make: options => audioContext = "AudioContext"
  @get external getBaseLatency: audioContext => float = "baseLatency"
  @get external getOutputLatency: audioContext => float = "outputLatency"
  @get external getSinkId: audioContext => sinkId = "sinkId"
  @send external setSinkId: (audioContext, sinkId) => unit = "setSinkId"
  @send external getOutputTimestamp: audioContext => audioTimestamp = "getOutputTimestamp"
  @send external close: audioContext => unit = "close"
  @send external resume: audioContext => unit = "resume"
  @send external suspend: audioContext => unit = "suspend"
  @send
  external onSinkchange: (audioContext, @as("sinkchange") _, event<audioContext> => unit) => unit =
    "addEventListener"
}

module AudioDestinationNode = {
  @get external getMaxChannelCount: audioDestinationNode => float = "maxChannelCount"
  @get external getMaxChannelCount: (audioDestinationNode, float) => unit = "maxChannelCount"
}

module AudioNode = {
  @get external getContext: audioNode<'a> => audioContext = "context"
  @get external getNumberOfInputs: audioNode<'a> => int = "numberOfInputs"
  @get external getNumberOfOutputs: audioNode<'a> => int = "numberOfOutputs"
  @get external getChannelCount: audioNode<'a> => int = "channelCount"
  @set external setChannelCount: (audioNode<'a>, int) => unit = "channelCount"
  @get external getChannelCountMode: audioNode<'a> => channelCountMode = "channelCountMode"
  @set external setChannelCountMode: (audioNode<'a>, channelCountMode) => unit = "channelCountMode"
  @get
  external getChannelInterpretation: audioNode<'a> => channelInterpretation =
    "channelInterpretation"
  @set
  external setChannelInterpretation: (audioNode<'a>, channelInterpretation) => unit =
    "channelInterpretation"
  @send
  external connectNode: (
    audioNode<'a>,
    audioNode<'b>,
    ~outputIndex: int=?,
    ~inputIndex: int=?,
  ) => option<audioNode<'b>> = "connect"
  @send
  external connectParam: (audioNode<'a>, audioParam, ~outputIndex: int=?) => unit = "connect"
  @send
  external disconnectAll: audioNode<'a> => unit = "disconnect"
  @send
  external disconnectNode: (
    audioNode<'a>,
    audioNode<'b>,
    ~outputIndex: int=?,
    ~inputIndex: int=?,
  ) => unit = "disconnect"
  @send
  external disconnectParam: (audioNode<'a>, audioParam, ~outputIndex: int=?) => unit = "disconnect"
}

module AudioParam = {
  @get external getDefaultValue: audioParam => float = "defaultValue"
  @get external getMaxValue: audioParam => float = "maxValue"
  @get external getMinValue: audioParam => float = "minValue"
  @get external getValue: audioParam => float = "value"
  @set external setValue: (audioParam, float) => unit = "value"
  @send external setValueAtTime: (audioParam, float, float) => audioParam = "setValueAtTime"
  @send
  external linearRampToValueAtTime: (audioParam, float, float) => audioParam =
    "linearRampToValueAtTime"
  @send
  external exponentialRampToValueAtTime: (audioParam, float, float) => audioParam =
    "exponentialRampToValueAtTime"
  @send
  external setTargetAtTime: (audioParam, float, float, float) => audioParam = "setTargetAtTime"
  @send
  external setValueCurveAtTime: (audioParam, array<float>, float, float) => audioParam =
    "setValueCurveAtTime"
  @send external cancelScheduledValues: (audioParam, float) => audioParam = "cancelScheduledValues"
  @send external cancelAndHoldAtTime: (audioParam, float) => audioParam = "cancelAndHoldAtTime"
}

module AudioScheduledSourceNode = {
  @send external start: (audioScheduledSourceNode<'a>, ~when_: float=?) => unit = "start"
  @send external stop: (audioScheduledSourceNode<'a>, ~when_: float=?) => unit = "stop"
  @send
  external onEnded: (
    audioScheduledSourceNode<'a>,
    @as("ended") _,
    event<audioScheduledSourceNode<'a>> => unit,
  ) => unit = "addEventListener"
}

module BaseAudioContext = {
  @get external getCurrentTime: baseAudioContext<'a> => float = "currentTime"
  @get external getDestination: baseAudioContext<'a> => audioDestinationNode = "destination"
  @get external getSampleRate: baseAudioContext<'a> => float = "sampleRate"
  @get external getState: baseAudioContext<'a> => [#suspended | #running | #closed] = "state"
  @send external createOscillator: baseAudioContext<'a> => oscillatorNode = "createOscillator"
  @send external createGain: baseAudioContext<'a> => gainNode = "createGain"
  @send
  external decodeAudioData: (
    baseAudioContext<'a>,
    Js.TypedArray2.ArrayBuffer.t,
  ) => promise<audioBuffer> = "decodeAudioData"
  @send
  external onStateChange: (
    baseAudioContext<'a>,
    @as("statechange") _,
    event<baseAudioContext<'a>> => unit,
  ) => unit = "addEventListener"
}

module OscillatorNode = {
  type type_ = [#sine | #square | #sawtooth | #triangle | #custom]
  type options = {
    type_?: type_,
    detune?: float,
    frequency?: float,
  }
  @new
  external make: (audioContext, ~options: options=?) => oscillatorNode = "OscillatorNode"
  @get external getType: oscillatorNode => type_ = "type"
  @set external setType: (oscillatorNode, type_) => unit = "type"
  @get external getDetune: oscillatorNode => audioParam = "detune"
  @set
  external setDetune: (oscillatorNode, audioParam) => unit = "detune"
  @get
  external getFrequency: oscillatorNode => audioParam = "frequency"
  @set
  external setFrequency: (oscillatorNode, audioParam) => unit = "frequency"
}

module GainNode = {
  type options = {gain?: float}
  @new external make: (audioContext, ~options: options=?) => gainNode = "GainNode"
  @get external getGain: gainNode => audioParam = "gain"
  @set external setGain: (gainNode, audioParam) => unit = "gain"
}
