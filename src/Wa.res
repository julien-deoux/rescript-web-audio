open RescriptCore

type audioBuffer
type audioParam
type audioNode<'a>
type analyser
type analyserNode = audioNode<analyser>
type scheduledSource<'a>
type audioScheduledSourceNode<'a> = audioNode<scheduledSource<'a>>
type bufferSource
type audioBufferSourceNode = audioScheduledSourceNode<bufferSource>
type destination
type audioDestinationNode = audioNode<destination>
type biquadFilter
type biquadFilterNode = audioNode<biquadFilter>
type channelMerger
type channelMergerNode = audioNode<channelMerger>
type channelSplitter
type channelSplitterNode = audioNode<channelSplitter>
type constantSource
type constantSourceNode = audioScheduledSourceNode<constantSource>
type convolver
type convolverNode = audioNode<convolver>
type delay
type delayNode = audioNode<delay>
type dynamicsCompressor
type dynamicsCompressorNode = audioNode<dynamicsCompressor>
type gain
type gainNode = audioNode<gain>
type iirFilter
type iirFilterNode = audioNode<iirFilter>
type mediaElementAudioSource
type mediaElementAudioSourceNode = audioNode<mediaElementAudioSource>
type mediaStreamAudioDestination
type mediaStreamAudioDestinationNode = audioNode<mediaStreamAudioDestination>
type mediaStreamAudioSource
type mediaStreamAudioSourceNode = audioNode<mediaStreamAudioSource>
type oscillator
type oscillatorNode = audioScheduledSourceNode<oscillator>
type panner
type pannerNode = audioNode<panner>
type stereoPanner
type stereoPannerNode = audioNode<stereoPanner>
type waveShaper
type waveShaperNode = audioNode<waveShaper>
type baseAudioContext<'a>
type online
type audioContext = baseAudioContext<online>
type offline
type offlineAudioContext = baseAudioContext<offline>
type channelCountMode = [#max | #"clamped-max" | #explicit]
type channelInterpretation = [#speakers | #discrete]
type periodicWave

module AnalyserNode = {
  type fftSize = [#32 | #64 | #128 | #256 | #512 | #1024 | #2048 | #4096 | #8192 | #16384 | #32768]
  type options = {
    fftSize?: fftSize,
    maxDecibels?: float,
    minDecibels?: float,
    smoothingTimeConstant?: float,
    channelCount?: int,
    channelCountMode?: channelCountMode,
    channelInterpretation?: channelInterpretation,
  }
  @new external make: (audioContext, ~options: options=?) => analyserNode = "AnalyserNode"
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
  external getFloatFrequencyData: (analyserNode, Float32Array.t) => unit = "getFloatFrequencyData"
  @send
  external getByteFrequencyData: (analyserNode, Uint8Array.t) => unit = "getByteFrequencyData"
  @send
  external getFloatTimeDomainData: (analyserNode, Float32Array.t) => unit = "getFloatTimeDomainData"
  @send
  external getByteTimeDomainData: (analyserNode, Uint8Array.t) => unit = "getByteTimeDomainData"
}

module AudioBuffer = {
  type options = {
    length: int,
    sampleRate: float,
    numberOfChannels?: int,
    channelCount?: int,
    channelCountMode?: channelCountMode,
    channelInterpretation?: channelInterpretation,
  }

  /**
  Could throw `NotSupportedError` or `RangeError`
  (see [https://developer.mozilla.org/en-US/docs/Web/API/AudioBuffer/AudioBuffer])
  */
  @new
  external make: options => audioBuffer = "AudioBuffer"

  @get external getSampleRate: audioBuffer => float = "sampleRate"
  @get external getLength: audioBuffer => int = "length"
  @get external getDuration: audioBuffer => float = "duration"
  @get external getNumberOfChannels: audioBuffer => int = "numberOfChannels"
  @send external getChannelData: (audioBuffer, int) => Float32Array.t = "getChannelData"

  /**
  Could throw `IndexSizeError`
  (see [https://developer.mozilla.org/en-US/docs/Web/API/AudioBuffer/copyFromChannel])
  */
  @send
  external copyFromChannel: (audioBuffer, Float32Array.t, int, ~startInChannel: int=?) => unit =
    "copyFromChannel"

  @send
  external copyToChannel: (audioBuffer, Float32Array.t, int, ~startInChannel: int=?) => unit =
    "copyToChannel"
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
  @set external setBuffer: (audioBufferSourceNode, option<audioBuffer>) => unit = "buffer"
  @get external getDetune: audioBufferSourceNode => audioParam = "detune"
  @get external getLoop: audioBufferSourceNode => bool = "loop"
  @set external setLoop: (audioBufferSourceNode, bool) => unit = "loop"
  @get external getLoopStart: audioBufferSourceNode => float = "loopStart"
  @set external setLoopStart: (audioBufferSourceNode, float) => unit = "loopStart"
  @get external getLoopEnd: audioBufferSourceNode => float = "loopEnd"
  @set external setLoopEnd: (audioBufferSourceNode, float) => unit = "loopEnd"
  @get external getPlaybackRate: audioBufferSourceNode => audioParam = "playbackRate"

  /**
  Could throw `TypeError` or `InvalidStateError`
  (see [https://developer.mozilla.org/en-US/docs/Web/API/AudioBufferSourceNode/start])
  */
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
  external onSinkchange: (audioContext, @as("sinkchange") _, Dom.event => unit) => unit =
    "addEventListener"
}

module AudioDestinationNode = {
  @get external getMaxChannelCount: audioDestinationNode => float = "maxChannelCount"
  @set external setMaxChannelCount: (audioDestinationNode, float) => unit = "maxChannelCount"
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
  external onEnded: (audioScheduledSourceNode<'a>, @as("ended") _, Dom.event => unit) => unit =
    "addEventListener"
}

module BaseAudioContext = {
  @get external getCurrentTime: baseAudioContext<'a> => float = "currentTime"
  @get external getDestination: baseAudioContext<'a> => audioDestinationNode = "destination"
  @get external getSampleRate: baseAudioContext<'a> => float = "sampleRate"
  @get external getState: baseAudioContext<'a> => [#suspended | #running | #closed] = "state"
  @send external createOscillator: baseAudioContext<'a> => oscillatorNode = "createOscillator"
  @send external createGain: baseAudioContext<'a> => gainNode = "createGain"
  @send
  external decodeAudioData: (baseAudioContext<'a>, ArrayBuffer.t) => promise<audioBuffer> =
    "decodeAudioData"
  @send
  external onStateChange: (baseAudioContext<'a>, @as("statechange") _, Dom.event => unit) => unit =
    "addEventListener"
}

module BiquadFilterNode = {
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
    q?: float,
    detune?: float,
    frequency?: float,
    gain?: float,
    channelCount?: int,
    channelCountMode?: channelCountMode,
    channelInterpretation?: channelInterpretation,
  }
  @new external make: (audioContext, ~options: options=?) => biquadFilterNode = "BiquadFilterNode"
  @get
  external getFrequency: biquadFilterNode => audioParam = "frequency"
  @get external getDetune: biquadFilterNode => audioParam = "detune"
  @get external getQ: biquadFilterNode => audioParam = "Q"
  @get external getType: biquadFilterNode => type_ = "type"
  @set external setType: (biquadFilterNode, type_) => unit = "type"
  @get external getGain: biquadFilterNode => audioParam = "gain"
  @send
  external getFrequencyResponse: (
    biquadFilterNode,
    Float32Array.t,
    Float32Array.t,
    Float32Array.t,
  ) => unit = "getFrequencyResponse"
}

module ChannelMergerNode = {
  type options = {
    numberOfInputs?: int,
    channelCount?: int,
    channelCountMode?: channelCountMode,
    channelInterpretation?: channelInterpretation,
  }
  @new external make: (audioContext, ~options: options=?) => channelMergerNode = "ChannelMergerNode"
}

module ChannelSplitterNode = {
  type options = {
    numberOfOutputs?: int,
    channelCount?: int,
    channelCountMode?: channelCountMode,
    channelInterpretation?: channelInterpretation,
  }
  @new
  external make: (audioContext, ~options: options=?) => channelSplitterNode = "ChannelSplitterNode"
}

module ConstantSourceNode = {
  type options = {offset?: float}
  @new
  external make: (audioContext, ~options: options=?) => constantSourceNode = "ConstantSourceNode"
  @get external getOffset: constantSourceNode => audioParam = "offset"
}

module ConvolverNode = {
  type options = {
    buffer?: audioBuffer,
    disableNormalization?: bool,
    channelCount?: int,
    channelCountMode?: channelCountMode,
    channelInterpretation?: channelInterpretation,
  }
  @new
  external make: (audioContext, ~options: options=?) => convolverNode = "ConvolverNode"
  @get external getBuffer: convolverNode => audioBuffer = "buffer"
  @set external setBuffer: (convolverNode, audioBuffer) => unit = "buffer"
  @get external getNormalize: convolverNode => bool = "normalize"
  @set external setNormalize: (convolverNode, bool) => unit = "normalize"
}

module DelayNode = {
  type options = {
    delayTime?: float,
    maxDelayTime?: float,
    channelCount?: int,
    channelCountMode?: channelCountMode,
    channelInterpretation?: channelInterpretation,
  }
  @new external make: (audioContext, ~options: options=?) => delayNode = "DelayNode"
  @get external getDelayTime: delayNode => audioParam = "delayTime"
}

module DynamicsCompressorNode = {
  type options = {
    attack?: float,
    knee?: float,
    ratio?: float,
    release?: float,
    threshold?: float,
  }
  @new
  external make: (audioContext, ~options: options=?) => dynamicsCompressorNode =
    "DynamicsCompressorNode"
  @get external getAttack: dynamicsCompressorNode => audioParam = "attack"
  @get external getKnee: dynamicsCompressorNode => audioParam = "knee"
  @get external getRatio: dynamicsCompressorNode => audioParam = "ratio"
  @get external getRelease: dynamicsCompressorNode => audioParam = "release"
  @get external getThreshold: dynamicsCompressorNode => audioParam = "threshold"
  @get external getReduction: dynamicsCompressorNode => float = "reduction"
}

module GainNode = {
  type options = {
    gain?: float,
    channelCount?: int,
    channelCountMode?: channelCountMode,
    channelInterpretation?: channelInterpretation,
  }
  @new external make: (audioContext, ~options: options=?) => gainNode = "GainNode"
  @get external getGain: gainNode => audioParam = "gain"
}

module IIRFilterNode = {
  type options = {
    feedForward: array<float>,
    feedBack: array<float>,
    channelCount?: int,
    channelCountMode?: channelCountMode,
    channelInterpretation?: channelInterpretation,
  }
  @new external make: (audioContext, ~options: options) => iirFilterNode = "IIRFilterNode"
  @send
  external getFrequencyResponse: (
    iirFilterNode,
    Float32Array.t,
    Float32Array.t,
    Float32Array.t,
  ) => unit = "getFrequencyResponse"
}

module MediaElementAudioSourceNode = {
  type options = {
    mediaElement: Dom.htmlMediaElement,
    channelCount?: int,
    channelCountMode?: channelCountMode,
    channelInterpretation?: channelInterpretation,
  }
  @new
  external make: (audioContext, ~options: options) => mediaElementAudioSourceNode =
    "MediaElementAudioSourceNode"
  @get
  external getMediaElement: mediaElementAudioSourceNode => Dom.htmlMediaElement = "mediaElement"
}

module MediaStreamAudioDestinationNode = {
  type options = {
    channelCount?: int,
    channelCountMode?: channelCountMode,
    channelInterpretation?: channelInterpretation,
  }
  @new
  external make: (audioContext, ~options: options=?) => mediaStreamAudioDestinationNode =
    "MediaStreamAudioDestinationNode"
  @get external getStream: mediaStreamAudioDestinationNode => Ms.mediaStream = "stream"
  @set external setStream: (mediaStreamAudioDestinationNode, Ms.mediaStream) => unit = "stream"
}

module MediaStreamAudioSourceNode = {
  type options = {
    channelCount?: int,
    channelCountMode?: channelCountMode,
    channelInterpretation?: channelInterpretation,
  }
  @new
  external make: (audioContext, ~options: options=?) => mediaStreamAudioSourceNode =
    "MediaStreamAudioSourceNode"
  @get external getStream: mediaStreamAudioSourceNode => Ms.mediaStream = "stream"
  @set external setStream: (mediaStreamAudioSourceNode, Ms.mediaStream) => unit = "stream"
}

module OfflineAudioContext = {
  type options = {
    numberOfChannels: int,
    length: float,
    sampleRate: float,
  }
  @new
  external make: options => offlineAudioContext = "OfflineAudioContext"
  @get external getLength: offlineAudioContext => float = "length"
  @send external suspend: (offlineAudioContext, float) => promise<unit> = "suspend"
  @send external startRendering: offlineAudioContext => promise<audioBuffer> = "startRendering"
}

module OscillatorNode = {
  type type_ = [#sine | #square | #sawtooth | #triangle | #custom]
  type options = {
    type_?: type_,
    detune?: float,
    frequency?: float,
    periodicWave?: periodicWave,
    channelCount?: int,
    channelCountMode?: channelCountMode,
    channelInterpretation?: channelInterpretation,
  }
  @new
  external make: (audioContext, ~options: options=?) => oscillatorNode = "OscillatorNode"
  @get
  external getFrequency: oscillatorNode => audioParam = "frequency"
  @get external getDetune: oscillatorNode => audioParam = "detune"
  @get external getType: oscillatorNode => type_ = "type"
  @set external setType: (oscillatorNode, type_) => unit = "type"
  @send external setPeriodicWave: (oscillatorNode, periodicWave) => unit = "setPeriodicWave"
}

module PannerNode = {
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
    channelCountMode?: channelCountMode,
    channelInterpretation?: channelInterpretation,
  }
  @make external make: (audioContext, ~options: options=?) => pannerNode = "PannerNode"
  @get external getConeInnerAngle: pannerNode => float = "coneInnerAngle"
  @set external setConeInnerAngle: (pannerNode, float) => unit = "coneInnerAngle"
  @get external getConeOuterAngle: pannerNode => float = "coneOuterAngle"
  @set external setConeOuterAngle: (pannerNode, float) => unit = "coneOuterAngle"
  @get external getConeOuterGain: pannerNode => float = "coneOuterGain"
  @set external setConeOuterGain: (pannerNode, float) => unit = "coneOuterGain"
  @get external getDistanceModel: pannerNode => distanceModel = "distanceModel"
  @set external setDistanceModel: (pannerNode, distanceModel) => unit = "distanceModel"
  @get external getMaxDistance: pannerNode => float = "maxDistance"
  @set external setMaxDistance: (pannerNode, float) => unit = "maxDistance"
  @get external getOrientationX: pannerNode => audioParam = "orientationX"
  @get external getOrientationY: pannerNode => audioParam = "orientationY"
  @get external getOrientationZ: pannerNode => audioParam = "orientationZ"
  @get external getPanningModel: pannerNode => panningModel = "panningModel"
  @set external setPanningModel: (pannerNode, panningModel) => unit = "panningModel"
  @get external getPositionX: pannerNode => audioParam = "positionX"
  @get external getPositionY: pannerNode => audioParam = "positionY"
  @get external getPositionZ: pannerNode => audioParam = "positionZ"
  @get external getRefDistance: pannerNode => float = "refDistance"
  @set external setRefDistance: (pannerNode, float) => unit = "refDistance"
  @get external getRolloffFactor: pannerNode => float = "rolloffFactor"
  @set external setRolloffFactor: (pannerNode, float) => unit = "rolloffFactor"
}

module StereoPannerNode = {
  type options = {
    pan?: float,
    channelCount?: int,
    channelCountMode?: channelCountMode,
    channelInterpretation?: channelInterpretation,
  }
  @new external make: (audioContext, ~options: options=?) => stereoPannerNode = "StereoPannerNode"
  @get external getPan: stereoPannerNode => audioParam = "pan"
}

module WaveShaperNode = {
  type oversample = [#none | #"2x" | #"4x"]
  type options = {
    curve?: Float32Array.t,
    oversample?: oversample,
    channelCount?: int,
    channelCountMode?: channelCountMode,
    channelInterpretation?: channelInterpretation,
  }
  @new external make: (audioContext, ~options: options=?) => waveShaperNode = "WaveShaperNode"
  @get external getCurve: waveShaperNode => option<Float32Array.t> = "curve"
  @set external setCurve: (waveShaperNode, option<Float32Array.t>) => unit = "curve"
  @get external getOversample: waveShaperNode => oversample = "oversample"
  @set external setOversample: (waveShaperNode, oversample) => unit = "oversample"
}
