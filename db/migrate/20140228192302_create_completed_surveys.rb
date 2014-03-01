class CreateCompletedSurveys < ActiveRecord::Migration
  def change
    create_table :completed_surveys do |t|
      t.belongs_to :survey
      t.belongs_to :user
    end
  end
end
