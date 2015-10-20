class Task < ActiveRecord::Base
  belongs_to :user
  attr_reader :title,
              :description,
              :id,
              :status_id

  def initialize(data)
    @id          = data[:id]
    @title       = data[:title]
    @description = data[:description]
    @status_id   = data[:status_id]
  end
end
