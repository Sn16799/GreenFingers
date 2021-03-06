require 'rails_helper'

RSpec.describe 'BlogCommentのテスト', type: :model do

  describe 'バリデーションのテスト' do

    context 'commentカラム' do
      let!(:user) { create(:user) }
      let!(:plant) { create(:plant, user_id: user.id) }
      let!(:blog) { create(:blog, user_id: user.id, plant_id: plant.id) }
      let!(:blog_comment) { create(:blog_comment, user_id: user.id, blog_id: blog.id) }

      it '500字以下であること' do
        blog_comment.comment = Faker::Lorem.characters(number: 501)
        expect(blog_comment.valid?).to eq false;
      end
    end

  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(BlogComment.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context 'Blogモデルとの関係' do
      it 'N:1となっている' do
        expect(BlogComment.reflect_on_association(:blog).macro).to eq :belongs_to
      end
    end
  end


end
