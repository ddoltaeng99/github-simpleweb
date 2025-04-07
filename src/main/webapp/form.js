const formFields = document.querySelectorAll('.form__field');

formFields.forEach(field => {
    field.addEventListener('focus', () => {
        field.classList.add('is-active');
    });

    field.addEventListener('blur', () => {
        if (!field.value) {
            field.classList.remove('is-active');
        }
    });
});