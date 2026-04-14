namespace btp.demo;

using { cuid, managed } from '@sap/cds/common';

entity employeeRegistry : cuid, managed {
  name        : String(50);
  email_id   : String(255);
  department : String(255);
}

entity city_name : cuid, managed {
  city : String(255);
}