<?php

use SilverStripe\ORM\DataObject;

class ContactSubmission extends DataObject
{
    private static $db = [
        'Name' => 'Text',
        'Email' => 'Text',
        'Phone' => 'Text',
        'Message' => 'Text'
    ];
}
