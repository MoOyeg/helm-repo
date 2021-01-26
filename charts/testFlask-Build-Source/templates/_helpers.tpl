{{/*
Expand the name of the chart.
*/}}
{{- define "testFlask-Build-Source.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "testFlask-Build-Source.imagestream" -}}
{{- $tempname := default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- $tempimgurl := default (printf "image-registry.openshift-image-registry.svc") .Values.imagestream.tag | trunc 63 | trimSuffix "-" }}
{{- $tempimgurl1 := printf "%s/%s" $tempimgurl .Release.Namespace }}
{{- printf "%s/%s" $tempimgurl1 $tempname }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "testFlask-Build-Source.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "testFlask-Build-Source.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "testFlask-Build-Source.labels" -}}
helm.sh/chart: {{ include "testFlask-Build-Source.chart" . }}
{{ include "testFlask-Build-Source.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "testFlask-Build-Source.selectorLabels" -}}
app.kubernetes.io/name: {{ include "testFlask-Build-Source.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "testFlask-Build-Source.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
