{{/*
Main entrypoint for the common library chart. It will render all underlying templates based on the provided values.
*/}}
{{- define "thewolfnl.common.loader.all" -}}
  {{- /* Generate chart and dependency values */ -}}
  {{- include "thewolfnl.common.loader.init" . -}}

  {{- /* Generate remaining objects */ -}}
  {{- include "thewolfnl.common.loader.generate" . -}}
{{- end -}}
