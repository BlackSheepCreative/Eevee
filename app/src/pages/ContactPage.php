<?php

use SilverStripe\Forms\TextField;

class ContactPage extends Page
{
    private static $description = 'A page with a contact form on it';

    private static $db = [
        'ContactTitle' => 'Text',
        'ContactAddress' => 'Text',
    ];

    function getCMSFields()
    {
        $fields = parent::getCMSFields();
        
        $fields->addFieldsToTab('Root.Main', [
            TextField::create('ContactTitle'),
            TextField::create('ContactAddress')
        ], 'Content');
        
        return $fields;
    }
}