User.create email: "hellovietnam93@gmail.com", username: "Panda", password: "12345678",
  password_confirmation: "12345678", role: :admin

5.times do |n|
  user = User.create email: "email_#{n}@gmail.com", username: "User_#{n}", password: "12345678",
    password_confirmation: "12345678"

  # 5.times do |m|
  #   post = user.posts.create title: "Post_#{m}", content: "Post content_#{m}"

  #   5.times do |p|
  #     comment = post.comments.create content: "Comment_#{p}", user: user

  #     5.times do |x|
  #       Comment.create user: user, content: "child_#{x}", parent_id: comment.id
  #     end
  #   end
  # end
end


# Post.all.each do |post|
#   User.trainee.each do |user|
#     post.like_posts.create user: user
#   end
# end

# Comment.all.each do |comment|
#   User.trainee.each do |user|
#     comment.like_comments.create user: user
#   end
# end
