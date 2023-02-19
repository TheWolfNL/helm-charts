{{/* Common labels shared across objects */}}
{{- define "thewolfnl.common.lib.metadata.allLabels" -}}
helm.sh/chart: {{ include "thewolfnl.common.lib.chart.names.chart" . }}
{{ include "thewolfnl.common.lib.metadata.selectorLabels" . }}
  {{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
  {{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{ include "thewolfnl.common.lib.metadata.globalLabels" . }}
{{- end -}}
