
#---------------------------
# Project structure (paths)
#---------------------------
lib_dir            := lib

sources_dir        := src
sql_dir            := $(sources_dir)/sql
ddl_dir            := $(sql_dir)/ddl
sqlt_dir           := $(sql_dir)/sqlt

resources_dir      := res
gis_dir            := $(resources_dir)/gis

outputs_dir        := dist
data_dir           := data


# Folders created by this makefile
dirs := $(outputs_dir)


# Helper files
contrib_dir        := contrib
git_dir            := $(contrib_dir)/git

