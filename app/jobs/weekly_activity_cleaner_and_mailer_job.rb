class WeeklyActivityCleanerAndMailerJob < ApplicationJob
  def perform
    Survey::Attempt.delete_all
    Survey::Participant.delete_all
    Survey::Answer.delete_all

    connection = ActiveRecord::Base.connection
    %w[survey_attempts survey_participant survey_answers].each do |table_name|
      connection.reset_pk_sequence!(table_name) if connection.respond_to?(:reset_pk_sequence!)
    end
  end
end
