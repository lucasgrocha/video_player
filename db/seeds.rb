user_1 = FactoryBot.create(:user)
user_2 = FactoryBot.create(:user)
user_3 = FactoryBot.create(:user)

9.times do
  FactoryBot.create(:video, user: user_1)
end

5.times do
  FactoryBot.create(:video, user: user_2)
end

12.times do
  FactoryBot.create(:video, user: user_3)
end
