App.cable.subscriptions.create(
  "NewEventNotificationChannel", {
    received: function(event) {
      $(".events").prepend($("<p>").append(
        event.title
      ).append(
        " at somewhere in " + event.city
      ).append(
        " from " + event.start_time
      ).append(
        " to " + event.end_time
      ).append(
        " about " + event.topics));
    }
  });
