# coding: utf-8

DATABASE = {
        name: {
            name1: 'Luke',
            name2: 'Luciano',
            name3: 'Alberto',
            name4: 'Vanda',
            name5: Faker::Name.name
        },

        age: {
            age1: 30,
            age2: 28,
            age3: 23,
            age4: 25,
            age5: Faker::Number.number(digits: 2)
        },

        salary: {
            salary1: 42000,
            salary2: 5800,
            salary3: 3400,
            salary4: 95000,
            salary5: Faker::Number.number
        }
}