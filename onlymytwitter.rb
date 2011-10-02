#-*- codings:utf-8 -*-
# only my twitter

require 'sqlite3'

class TweetDB
	def initialize
		@author = 'haroperi'
		@db = SQLite3::Database.new('twitter.db')
	end

	def update str
		@db.execute("insert into tweet values(\"%s\", \"%s\", \"%s\");" % [@author, `date +%s`, str])
	end
end

db = TweetDB.new
while l = gets
	db.update l.chomp
end

