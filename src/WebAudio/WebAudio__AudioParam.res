type t = WebAudio__Types.audioParam

@get external getDefaultValue: t => float = "defaultValue"
@get external getMaxValue: t => float = "maxValue"
@get external getMinValue: t => float = "minValue"
@get external getValue: t => float = "value"
@set external setValue: (t, float) => unit = "value"
@send external setValueAtTime: (t, float, float) => t = "setValueAtTime"
@send external linearRampToValueAtTime: (t, float, float) => t = "linearRampToValueAtTime"
@send external exponentialRampToValueAtTime: (t, float, float) => t = "exponentialRampToValueAtTime"
@send external setTargetAtTime: (t, float, float, float) => t = "setTargetAtTime"
@send external setValueCurveAtTime: (t, array<float>, float, float) => t = "setValueCurveAtTime"
@send external cancelScheduledValues: (t, float) => t = "cancelScheduledValues"
@send external cancelAndHoldAtTime: (t, float) => t = "cancelAndHoldAtTime"
