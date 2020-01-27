{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "cron-job.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "cron-job.fullname" -}}
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
{{- define "cron-job.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "cron-job.labels" -}}
helm.sh/chart: {{ include "cron-job.chart" . }}
{{ include "cron-job.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "cron-job.selectorLabels" -}}
app.kubernetes.io/name: {{ include "cron-job.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "cron-job.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "cron-job.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Generate the secret name for SA
*/}}
{{- define "cron-job.secretName" -}}
{{ default (include "cron-job.fullname" .) .Values.existingSecret }}
{{- end -}}

{{/*
Check if any type of credentials are defined
*/}}
{{- define "cron-job.hasCredentials" -}}
{{ or .Values.secretsgeneric.newSecret ( or .Values.existingSecret .Values.existingSecretKey ) -}}
{{- end -}}

{{/*
Generate existingSecretKey key name in the secret
*/}}
{{- define "cron-job.secretKey" -}}
{{ default "credential-file-json" .Values.existingSecretKey }}
{{- end -}}
