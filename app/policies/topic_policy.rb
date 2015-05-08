class TopicPolicy < ApplicationPolicy
  
  def new?
    create?
  end

  def create?
    user.present?
  end

  def update?
    user.present? && (record.user == user)
  end

  def destroy?
    user.present? && (record.user == user)
  end
  
end