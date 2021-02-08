class Post < ActiveRecord::Base

  belongs_to :author
  validate :is_title_case 

  # before_validation will run before the 'validate' macro? runs. Also keep in mind that before_validation should be used when you are making changes to the model
  before_validation :make_title_case

  # Any other action besides modifying a model object, use before_save
  before_save :email_author_about_post

  # before create should be called only when a new object is being created. This action will occur first
  before_create :some_action_before_new_object_is_saved  

  private

  def some_action_before_new_object_is_saved
    # Some other code
  end

  def email_author_about_post
    # Some code
  end

  def is_title_case
    if title.split.any?{|w|w[0].upcase != w[0]}
      errors.add(:title, "Title must be in title case")
    end
  end

  def make_title_case
    self.title = self.title.titlecase
  end
end
