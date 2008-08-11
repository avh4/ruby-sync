= Ruby Sync

== Intro

A full file synchronisation library for ruby, supports syncing/mirroring with local and FTP/SSH directories.

== Usage

Ruby Sync is a file syncronisation tool written in Ruby. You can use it in your Rakefiles or anywhere else you feel like.

Example sync:

  s1 = Net::FTP.new()
  s2 = Net::SSH.new()
  s3 = Dir['.']
  
  files_affected = RubySync.new(s1, s2).sync_up
  files_affected = RubySync.new(s2, s3).sync_down