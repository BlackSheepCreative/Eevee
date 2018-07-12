<?php

use SilverStripe\Admin\ModelAdmin;

class ContactSubmissionAdmin extends ModelAdmin
{
    private static $managed_models = [
        'ContactSubmission'
    ];

    private static $url_segment = 'contacts';

    private static $menu_title = 'Contact submissions';
}
