class CreateInitialDbTemplate < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.timestamps
    end

    create_table :workout_programmes do |t|
      t.integer :user_id
      t.string :name
      t.timestamps
    end

    #create_table :weigh_ins do |t|
    #  t.string :weight, null: false
    #  t.integer :user_id, null: false
    #  t.timestamps
    #end

    #create_table :workout_groups do
    #  t.integer :workout_plan_id
    #  t.string :name
    #  t.timestamps
    #end

    #create_table :workout_exercises do
    #  t.integer :workout_group_id
    #  t.integer :configuration
    #  t.string :name
    #  t.timestamps
    #end

    #create_table :workout_session do
    #  t.integer :workout_plan_id
    #  t.integer :workout_group_id
    #  t.timestamps
    #end

    #create_table :session_exercise do
    #  t.integer :workout_session_id
    #  t.integer :workout_exercise_id
    #  t.timestamps
    #end

    #create_table :sets do
    #  t.integer :workout_exercise_id
    #  t.string :reps_goal
    #  t.sttring :reps_achieved
    #  t.string :priority
    #  t.timestamps
    #end

  end

  def self.down
    drop_table :users
  end
end
