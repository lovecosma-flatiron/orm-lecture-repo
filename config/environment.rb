require 'sqlite3'
require 'pry'
require_relative  '../lib/song.rb'
# require_relative '../bin/run.rb'


DB = {:conn => SQLite3::Database.new('db/songs.db')}

DB[:conn].results_as_hash = true;

