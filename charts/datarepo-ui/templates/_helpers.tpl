{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "datarepo-ui.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "datarepo-ui.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "datarepo-ui.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "datarepo-ui.labels" -}}
helm.sh/chart: {{ include "datarepo-ui.chart" . }}
{{ include "datarepo-ui.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "datarepo-ui.selectorLabels" -}}
app.kubernetes.io/name: {{ include "datarepo-ui.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: ui
app.kubernetes.io/part-of: terra
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "datarepo-ui.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "datarepo-ui.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Create repository image and imagetag with Terra Values.global.applicationVersion Overrride
*/}}
{{- define "datarepo-ui.image" -}}
{{- if .Values.imageName -}}
    {{ .Values.imageName }}
{{- else -}}
    {{ .Values.image.repository }}:{{ .Values.image.tag }}
{{- end -}}
{{- end -}}
