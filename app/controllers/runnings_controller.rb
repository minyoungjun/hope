#coding: utf-8
require 'nokogiri'
require 'open-uri'
require 'json'
class RunningsController < ApplicationController
  def mypage
    @user = current_user

  end
  def index

    @users = JSON.parse(open("https://graph.facebook.com/v2.3/993180604026952/likes?limit=15&access_token=#{Grouptoken.last.token}").read)["data"]

    @comment_count = 0
    @like_count = 0
    @share_count = 0

    Post.all.each do |post|
      doc = JSON.parse(open("https://graph.facebook.com/v2.3/#{post.post_id}/insights/post_story_adds_by_action_type/lifetime?access_token=#{Grouptoken.last.token}").read)
      long = doc["data"][0]["values"][0]["value"]
      @comment_count += long["comment"].to_i
      @like_count += long["like"].to_i
      @share_count += long["share_count"].to_i
    end

    @all_count = @comment_count + @like_count + @share_count

  end
end
