# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Company.delete_all
Company.reset_pk_sequence
Company.create!(
    [
        {name: 'Company_0', location: 'Location_0'},
        {name: 'Company_1', location: 'Location_1'},
        {name: 'Company_2', location: 'Location_2'},
        {name: 'Company_3', location: 'Location_3'}
    ]
)
Job.delete_all
Job.reset_pk_sequence
Job.create!(
    [
        {name: 'Job_0', place: 'Place_0', company_id: 1},
        {name: 'Job_1', place: 'Place_1', company_id: 1},
        {name: 'Job_2', place: 'Place_2', company_id: 2},
        {name: 'Job_3', place: 'Place_3', company_id: 3}
    ]
)