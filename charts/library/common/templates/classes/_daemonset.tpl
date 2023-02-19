{{/*
This template serves as the blueprint for the DaemonSet objects that are created
within the common library.
*/}}
{{- define "thewolfnl.common.class.daemonset" -}}
---
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: {{ include "thewolfnl.common.lib.chart.names.fullname" . }}
  {{- with include "thewolfnl.common.lib.controller.metadata.labels" . }}
  labels: {{- . | nindent 4 }}
  {{- end }}
  {{- with include "thewolfnl.common.lib.controller.metadata.annotations" . }}
  annotations: {{- . | nindent 4 }}
  {{- end }}
spec:
  revisionHistoryLimit: {{ .Values.controller.revisionHistoryLimit }}
  selector:
    matchLabels:
      {{- include "thewolfnl.common.lib.metadata.selectorLabels" . | nindent 6 }}
  template:
    metadata:
      {{- with include ("thewolfnl.common.lib.metadata.podAnnotations") . }}
      annotations:
        {{- . | nindent 8 }}
      {{- end }}
      labels:
        {{- include "thewolfnl.common.lib.metadata.selectorLabels" . | nindent 8 }}
        {{- with .Values.podLabels }}
        {{- toYaml . | nindent 8 }}
        {{- end }}
    spec:
      {{- include "thewolfnl.common.lib.controller.pod" . | nindent 6 }}
{{- end }}
