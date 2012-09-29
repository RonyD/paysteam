Paisly
======

Models
------

* Company
* Users
* Departments / Groups
* Employee
* Salaries
* Reports
* Tax Tables
* Social Security Fund
* Accounting
* Notifications


Company
-------

### Sign up

Information needed from the customer for sign up.

* Company Name
* Company Code - this is generated automatically by Paisly
* Customer's first at last name
* Customer's email
* Customer's password

rails g scaffold employee company:references first_name:string last_name:string gender:string date_of_dirth:date address_1:string address_2:string city:string country:string postal_code:string telephone:string email:string social_security:string ird_number:string insurance_number:string employment_date:date termination_date:date nationality:string country_of_birth:string