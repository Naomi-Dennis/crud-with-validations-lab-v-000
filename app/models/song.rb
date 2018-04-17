require_relative "../helpers/song_helper.rb"
class Song < ActiveRecord::Base
  include SongHelper
  validates :title, presence: true, uniqueness: true
  validates :artist_name, presence: true
  validates :genre, presence: true
  validates :released, inclusion: {in: [true, false] }
  validates_presence_of :release_year, if: Proc.new{|obj| obj[:released] == true}
  validates :release_year, inclusion: {in: [0..99]}
end
