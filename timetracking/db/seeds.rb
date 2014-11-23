# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Project.create name: 'Iron Man', description: 'one'
Project.create name: 'war', description: 'awful'
Project.create name: 'peace', description: 'great'
Project.create name: 'ferrari', description: 'red'


p = Project.find_by(name: "Iron Man")
p.entries.create hours: 0, minutes: 15, comment: "nah", date: Date.parse("2014-11-12")
p.entries.create hours: 0, minutes: 30, comment: "full", date: Date.parse("2014-11-13")
p.entries.create hours: 2, minutes: 25,                   date: Date.parse("2014-11-14")

q = Project.find_by(name: "war")
q.entries.create hours: 1, minutes: 15, comment: "more", date: Date.parse("2013-11-12")
q.entries.create hours: 3, minutes: 25,                   date: Date.parse("2013-11-14")

t = Project.find_by(name: "peace")
t.entries.create hours: 6, minutes: 15, comment: "alone", date: Date.parse("2012-06-28")