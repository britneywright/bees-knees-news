require 'rails_helper'

describe PostsController do
 
  describe 'GET #index' do
    it "populates an array of all posts" do
        post = Post.create(title: "something", link: "http://example.com", user_id: 1) 
      get :index
      expect(assigns(:posts)).to match_array([post])
    end
  end

  describe 'GET #show' do
    it "assigns the requested post to @post" do
      post = Post.create(title: "something", link: "http://example.com", user_id: 1) 
      get :show, id: post
      expect(assigns(:post)).to eq post
    end
  end

  describe 'GET #new' do
    it "assigns a new Post to @post" do
      get :new
      expect(assigns(:post)).to be_a_new(Post)
    end
  end

  describe 'GET #edit' do
    it "assigns the requested post to @post" do
      post = Post.create(title: "something", link: "http://example.com", user_id: 1)
      get :edit, id: post
      expect(assigns(:post)).to eq post
    end
  end

  describe "POST #create" do

    it "saves the new post in the database" do
      expect{Post.create(title: "something", link: "http://example.com", user_id: 1)}.to change(Post, :count).by(1)
    end

    it "redirects to posts#show" do
      user = User.create!(username: "britney", password: "britney")
      post :create, :post => {title: "something", link: "http://example.com", user_id: user.id}
      expect(response).to redirect_to new_post_path
    end
  end
end
