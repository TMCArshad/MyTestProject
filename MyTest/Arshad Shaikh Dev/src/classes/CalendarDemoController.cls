public with sharing class CalendarDemoController {
    public String events {
        get {
            JSONGenerator g = JSON.createGenerator(true);
            g.writeStartArray();
            for (Integer i = -2; i <= 2; i++) {
                g.writeStartObject();
                g.writeStringField('title', 'Event ' + i);
                g.writeDateTimeField('start', DateTime.now().addDays(i).addHours(i));
                g.writeDateTimeField('end', DateTime.now().addDays(i).addHours(i + 1));
                g.writeEndObject();
            }
            g.writeEndArray();
            return g.getAsString();
        }
    }
}