<?php

use SilverStripe\CMS\Model\SiteTree;

class Page extends SiteTree
{
    private static $icon = 'mysite/images/icons/page.svg';

    private static $db = [];

    private static $has_one = [];

    public function getCMSFields() 
    {
        $fields = parent::getCMSFields();

        return $fields;
    }
}