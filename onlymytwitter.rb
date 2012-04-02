#-*- codings:utf-8 -*-
# only my twitter

require 'sqlite3'

class TweetDB
	def initialize
		@author = 'haroperi'
		@db = SQLite3::Database.new('twitter.db')
	end

	def update str
		date = `date +%s`.chomp
		@db.execute("insert into tweet values(\"%s\", \"%s\", '%s');" % [@author, date, str])
	end

	def timeline count = 10
		recent_tweets = []
		@db.execute("select * from tweet") do |row|
			recent_tweets.push row.join("\t")
			if recent_tweets.size > count
				recent_tweets.shift
			end
		end
		return recent_tweets
	end
end

db = TweetDB.new

db.timeline.each { |row| puts row }

while l = gets
	l.chomp!
	db.update l.chomp if l != ''
end

