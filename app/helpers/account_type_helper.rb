module AccountTypeHelper
  def account_type
    if current_user
      if current_user.teacher_id != nil
        "Teacher"
      elsif current_user.student_id != nil
        "Student"
      elsif current_user.parent_id != nil
        "Parent"
      end
    end
  end
end
