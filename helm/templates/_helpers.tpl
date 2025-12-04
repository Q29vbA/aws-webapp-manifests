{{- define "aws-webapp-manifests.name" -}}
{{- $name := .Chart.Name }}
{{- printf "%s" $name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "aws-webapp-manifests.selectorLabels" -}}
app.kubernetes.io/name: {{ include "aws-webapp-manifests.name" . }}
{{- end }}

{{- define "ns" -}}
{{ .Values.global.namespace | default .Release.Namespace }}
{{- end -}}
