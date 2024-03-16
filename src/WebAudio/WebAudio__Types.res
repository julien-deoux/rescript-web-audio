type audioBuffer
type audioParam
type audioWorklet
type audioNode_like<'a>
type _analyserNode
type analyserNode = audioNode_like<_analyserNode>
type scheduledSource_like<'a>
type audioScheduledSourceNode_like<'a> = audioNode_like<scheduledSource_like<'a>>
type _audioBufferSourceNode
type audioBufferSourceNode = audioScheduledSourceNode_like<_audioBufferSourceNode>
type _audioDestinationNode
type audioDestinationNode = audioNode_like<_audioDestinationNode>
type _biquadFilterNode
type biquadFilterNode = audioNode_like<_biquadFilterNode>
type _channelMergerNode
type channelMergerNode = audioNode_like<_channelMergerNode>
type _channelSplitterNode
type channelSplitterNode = audioNode_like<_channelSplitterNode>
type _constantSourceNode
type constantSourceNode = audioScheduledSourceNode_like<_constantSourceNode>
type _convolverNode
type convolverNode = audioNode_like<_convolverNode>
type _delayNode
type delayNode = audioNode_like<_delayNode>
type _dynamicsCompressorNode
type dynamicsCompressorNode = audioNode_like<_dynamicsCompressorNode>
type _gainNode
type gainNode = audioNode_like<_gainNode>
type _iirFilterNode
type iirFilterNode = audioNode_like<_iirFilterNode>
type _mediaElementAudioSourceNode
type mediaElementAudioSourceNode = audioNode_like<_mediaElementAudioSourceNode>
type _mediaStreamAudioDestinationNode
type mediaStreamAudioDestinationNode = audioNode_like<_mediaStreamAudioDestinationNode>
type _mediaStreamAudioSourceNode
type mediaStreamAudioSourceNode = audioNode_like<_mediaStreamAudioSourceNode>
type _oscillatorNode
type oscillatorNode = audioScheduledSourceNode_like<_oscillatorNode>
type _pannerNode
type pannerNode = audioNode_like<_pannerNode>
type _stereoPannerNode
type stereoPannerNode = audioNode_like<_stereoPannerNode>
type _waveShaperNode
type waveShaperNode = audioNode_like<_waveShaperNode>
type baseAudioContext_like<'a>
type _audioContext
type audioContext = baseAudioContext_like<_audioContext>
type _offlineAudioContext
type offlineAudioContext = baseAudioContext_like<_offlineAudioContext>
type _offlineAudioCompletionEvent
type offlineAudioCompletionEvent = Dom.event_like<_offlineAudioCompletionEvent>
type channelCountMode = [#max | #"clamped-max" | #explicit]
type channelInterpretation = [#speakers | #discrete]
type periodicWave
