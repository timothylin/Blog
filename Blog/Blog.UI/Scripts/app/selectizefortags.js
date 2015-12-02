$('#input-tags').selectize({
    delimiter: ',',
    persist: false,
    createOnBlur: true,
    create: function(input) {
        return {
            value: input,
            text: input
        }
    }
});