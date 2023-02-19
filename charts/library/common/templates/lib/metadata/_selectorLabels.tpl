{{/* Selector labels shared across objects */}}
{{- define "thewolfnl.common.lib.metadata.selectorLabels" -}}
app.kubernetes.io/name: {{ include "thewolfnl.common.lib.chart.names.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
