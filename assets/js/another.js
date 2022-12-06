document.addEventListener('DOMContentLoaded', function(){
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl,{
        googleCalendarApiKey: 'AIzaSyBeSslG2Oc5r0aiX9n6w0ek_wmr_13a-SU',
        events: {
            googleCalendarId: 'fgtsbht4nljd23rlmv4p95al3o@group.calendar.google.com'
        }
    });
    calendar.render();

});

