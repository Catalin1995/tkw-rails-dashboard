class TecknoworkersController < ApplicationController
  def index
    tecknoworkers = Tecknoworker.all
    keys = tecknoworkers.inject([]) { |keys, tecknoworker| keys.push(tecknoworker.locality) }.uniq
    @tecknoworkers = []
    keys.each do |key|
      users = get_users_from tecknoworkers, key
      @tecknoworkers.push(key: key,
                          count: users.size,
                          users: users)
    end
  end

  def graph
    tecknoworkers = Tecknoworker.all
    keys = tecknoworkers.inject([]) { |keys, tecknoworker| keys.push(tecknoworker.locality) }.uniq
    @graph = []
    keys.each do |key|
      @graph.push(key: key,
                  y: get_users_from(tecknoworkers, key).size)
    end
  end

  private

  def get_users_from(users, key)
    users.select { |user| user.locality == key }
  end
end
