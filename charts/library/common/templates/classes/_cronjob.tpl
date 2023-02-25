{{/*
This template serves as a blueprint for Cronjob objects that are created
using the common library.
*/}}
{{- define "thewolfnl.common.class.cronjob" -}}
  {{- $restartPolicy := default "Never" .Values.controller.restartPolicy -}}
  {{- if and (ne $restartPolicy "Never") (ne $restartPolicy "OnFailure") -}}
    {{- fail (printf "Not a valid restartPolicy for CronJob (%s)" $restartPolicy) -}}
  {{- end -}}
  {{- $_ := set .Values.controller "restartPolicy" $restartPolicy -}}
---
apiVersion: batch/v1
kind: CronJob
metadata:
  name: {{ include "thewolfnl.common.lib.chart.names.fullname" . }}
  {{- with include "thewolfnl.common.lib.controller.metadata.labels" . }}
  labels: {{- . | nindent 4 }}
  {{- end }}
  {{- with include "thewolfnl.common.lib.controller.metadata.annotations" . }}
  annotations: {{- . | nindent 4 }}
  {{- end }}
spec:
  concurrencyPolicy: "{{ .Values.controller.cronjob.concurrencyPolicy }}"
  startingDeadlineSeconds: {{ .Values.controller.cronjob.startingDeadlineSeconds }}
  schedule: "{{ .Values.controller.cronjob.schedule }}"
  successfulJobsHistoryLimit: {{ .Values.controller.cronjob.successfulJobsHistory }}
  failedJobsHistoryLimit: {{ .Values.controller.cronjob.failedJobsHistory }}
  jobTemplate:
    spec:
      {{- with .Values.controller.cronjob.ttlSecondsAfterFinished }}
      ttlSecondsAfterFinished: {{ . }}
      {{- end }}
      template:
        metadata:
          {{- with include ("thewolfnl.common.lib.metadata.podAnnotations") . }}
          annotations:
            {{- . | nindent 12 }}
          {{- end }}
          labels:
            {{- include "thewolfnl.common.lib.metadata.selectorLabels" . | nindent 12 }}
            {{- with .Values.podLabels }}
            {{- toYaml . | nindent 12 }}
            {{- end }}
        spec:
          {{- include "thewolfnl.common.lib.controller.pod" . | nindent 10 }}
{{- end -}}
