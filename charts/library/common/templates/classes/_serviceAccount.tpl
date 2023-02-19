{{/*
This template serves as a blueprint for ServiceAccount objects that are created
using the common library.
*/}}
{{- define "thewolfnl.common.class.serviceAccount" -}}
---
apiVersion: v1
kind: ServiceAccount
metadata:
  name: {{ include "thewolfnl.common.lib.chart.names.serviceAccountName" . }}
  {{- with include "thewolfnl.common.lib.metadata.allLabels" $ | fromYaml }}
  labels: {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with (merge (.Values.serviceAccount.annotations | default dict) (include "thewolfnl.common.lib.metadata.globalAnnotations" $ | fromYaml)) }}
  annotations: {{- toYaml . | nindent 4 }}
  {{- end }}
secrets:
  - name: {{ include "thewolfnl.common.lib.chart.names.fullname" . }}-sa-token
{{- end -}}
