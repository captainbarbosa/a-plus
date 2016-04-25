# Preview all emails at http://localhost:3000/rails/mailers/grade_mailer
class GradeMailerPreview < ActionMailer::Preview
  def send_report
    @student = Student.last
    GradeMailer.create_report(@student)
  end
end
