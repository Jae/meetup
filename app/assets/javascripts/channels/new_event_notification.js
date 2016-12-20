App.cable.subscriptions.create(
  "NewEventNotificationChannel", {
    received: function(event) {
      $(".events").prepend(
        $("<div class='panel panel-default'>").append(
          $("<div class='panel-body'>").append(
            $("<p>").append(
              event.title
            ).append(
              " at " + event.address
            ).append(
              " in " + event.city
            ).append(
              " from " + event.start_time
            ).append(
              event.end_time && (" to " + event.end_time) || ""
            ).append(
              " about " + event.topics)
          )
        )
      );
    }
  });
