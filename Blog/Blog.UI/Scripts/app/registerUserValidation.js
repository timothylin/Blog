$(document).ready(function () {
    $('#registerUserForm').validate({
        rules: {
            Email: {
                required: true,
                email: true
            },
            FirstName: {
                required: true
            },
            LastName: {
                required: true
            },
            Password: {
                required: true,
                minlength: 6,
                maxlength: 100
            },
            ConfirmPassword: {
                required: true,
                equalTo: "#Password"
            }

        },
        messages: {
            Email: "Please enter a valid email format.",
            FirstName: "Please enter a first name.",
            LastName: "Please enter a last name.",
            Password: {
                required: "Please enter a password.",
                minlength: $.validator.format("The password must be at least 6 characters long."),
                maxlength: $.validator.format("The password is too long!!")
            },
            ConfirmPassword: "The password and confirmation password does not match."
        }
    });
});