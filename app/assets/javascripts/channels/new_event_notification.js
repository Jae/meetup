App.cable.subscriptions.create(
  "NewEventNotificationChannel", {
    received: function(data) {
      console.log(data);
    }
  });
