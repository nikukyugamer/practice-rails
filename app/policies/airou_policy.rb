class AirouPolicy < Struct.new(:user, :hogebar)
  def index?
    # ポリシーの適用元のコントローラから渡ってきた引数は、hogebar で使うことができる
    # foobar としたかったら、Struct のコンストラクタに :foobar を渡せばいい
    true
  end

  # AirouPolicy は class Scope を持つクラスを継承していないので、 class Scope < Scope みたいにはできない
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      if Time.zone.now < '2020-01-01'
        scope.all
      else
        scope.where(id: 2)
      end
    end
  end
end
