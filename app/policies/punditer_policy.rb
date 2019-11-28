class PunditerPolicy < ApplicationPolicy
  def index?
    true
  end

  class Scope < Scope
    def resolve
      if Time.zone.now < '2020-01-01'
        scope.all
      else
        scope.where(id: 2)
      end
    end
  end
end
