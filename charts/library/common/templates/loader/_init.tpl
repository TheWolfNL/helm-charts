{{- define "thewolfnl.common.loader.init" -}}
  {{- /* Merge the local chart values and the common chart defaults */ -}}
  {{- include "thewolfnl.common.values.init" . }}
{{- end -}}
