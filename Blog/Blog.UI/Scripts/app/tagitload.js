$(document).ready(function() {
    $("#myTags").tagit({
        // Options
        fieldName: "hashtags",
        availableTags: ["date", "love", "Tim", "Dean", "Patrick", "sweet", "boys"],
        autocomplete: { delay: 0, minLength: 2 },
        showAutocompleteOnFocus: false,
        removeConfirmation: false,
        caseSensitive: false,
        allowDuplicates: false,
        allowSpaces: false,
        readOnly: false,
        tagLimit: 10,
        singleField: false,
        placeholderText: "Enter hashtags...",

        // Events
        beforeTagAdded: function(event, ui) {
            if (ui.tagLabel.indexOf("#") !== -1) {
                return false;
            }
            if (ui.tagLabel.indexOf(" ") !== -1) {
                return false;
            }
            return true;
        }

    });
    
});