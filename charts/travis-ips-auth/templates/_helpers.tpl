{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "travis-ips-auth.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "travis-ips-auth.fullname" -}}
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
{{- define "travis-ips-auth.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "travis-ips-auth.labels" -}}
helm.sh/chart: {{ include "travis-ips-auth.chart" . }}
{{ include "travis-ips-auth.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "travis-ips-auth.selectorLabels" -}}
app.kubernetes.io/name: {{ include "travis-ips-auth.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "travis-ips-auth.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "travis-ips-auth.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Generate the secret name for SA
*/}}
{{- define "travis-ips-auth.secretNameSA" -}}
{{ default (include "travis-ips-auth.fullname" .) .Values.existingSecretSA }}
{{- end -}}

{{/*
Check if any type of credentials are defined
*/}}
{{- define "travis-ips-auth.hasCredentials" -}}
{{ or .Values.secretsgeneric.serivceAccountCredentialFileJson ( or .Values.existingSecretSA .Values.existingServiceAccountSecretKey ) -}}
{{- end -}}

{{/*
Generate existingServiceAccountSecretKey key name in the secret
*/}}
{{- define "travis-ips-auth.secretKeyServiceAccount" -}}
{{ default "credential-file-json" .Values.existingServiceAccountSecretKey }}
{{- end -}}
