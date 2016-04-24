class GradeMailer < ApplicationMailer
  default from: ENV["GMAIL_USER"]
  layout 'mailer'

  def create_report(student)
    @student = student
    @user = User.find_by(student_id: @student.id)
    @grades = Grade.where(student_id: @student.id)
    mail(to: @user.email, subject: 'Your Grade Report')
  end
end
