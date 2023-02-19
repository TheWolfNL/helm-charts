{{/*
Secondary entrypoint and primary loader for the common chart
*/}}
{{- define "thewolfnl.common.loader.generate" -}}
  {{- /* Enable code-server add-on if required */ -}}
  {{- if .Values.addons.codeserver.enabled -}}
    {{- include "thewolfnl.common.addon.codeserver" . | nindent 0 -}}
  {{- end -}}

  {{- /* Enable VPN add-on if required */ -}}
  {{- if .Values.addons.vpn.enabled -}}
    {{- include "thewolfnl.common.addon.vpn" . | nindent 0 -}}
  {{- end -}}

  {{- /* Enable netshoot add-on if required */ -}}
  {{- if .Values.addons.netshoot.enabled -}}
    {{- include "thewolfnl.common.addon.netshoot" . | nindent 0 -}}
  {{- end -}}

  {{- /* Build the templates */ -}}
  {{- include "thewolfnl.common.render.pvcs" . | nindent 0 -}}
  {{- include "thewolfnl.common.render.serviceAccount" . | nindent 0 -}}
  {{- include "thewolfnl.common.render.controller" . | nindent 0 -}}
  {{- include "thewolfnl.common.render.services" . | nindent 0 -}}
  {{- include "thewolfnl.common.render.ingresses" . | nindent 0 -}}
  {{- include "thewolfnl.common.render.serviceMonitors" . | nindent 0 -}}
  {{- include "thewolfnl.common.render.routes" . | nindent 0 -}}
  {{- include "thewolfnl.common.render.configmaps" . | nindent 0 -}}
  {{- include "thewolfnl.common.render.secrets" . | nindent 0 -}}
{{- end -}}
