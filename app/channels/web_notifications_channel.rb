class WebNotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "web_notifications_#{current_user.id}"
  end
end
# Client-side, which assumes you've already requested the right to send web notifications
App.cable.subscriptions.create "WebNotificationsChannel",
  received: (data) ->
    new Notification data["title"], body: data["body"]
# Somewhere in your app this is called, perhaps from a NewCommentJob
ActionCable.server.broadcast \
  "web_notifications_#{current_user.id}", { title: 'New things!', body: 'All the news that is fit to print' }