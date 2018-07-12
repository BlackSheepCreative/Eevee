<?php

use SilverStripe\Control\Email\Email;
use SilverStripe\Forms\EmailField;
use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\Form;
use SilverStripe\Forms\FormAction;
use SilverStripe\Forms\RequiredFields;
use SilverStripe\Forms\TextareaField;
use SilverStripe\Forms\TextField;

class ContactPageController extends PageController
{
    private static $allowed_actions = [
        'ContactForm'
    ];

    public function ContactForm()
    {
        $form = Form::create(
            $this,
            __FUNCTION__,
            FieldList::create(
                TextField::create('Name', 'Name')
                    ->setAttribute('placeholder', 'First and last'),
                EmailField::create('Email', 'Email')
                    ->setAttribute('placeholder', 'example@example.com'),
                PhoneNumberField::create('Phone', 'Phone')
                    ->setAttribute('placeholder', 'Phone number (mobile or home)'),
                TextareaField::create('Message', 'Message')
                    ->setAttribute('placeholder', 'How can we help?')
                    ->setAttribute('rows', '5')
            ),
            FieldList::create(
                FormAction::create('sendContactForm', 'Send message')
                    ->setUseButtonTag(true)
            ),
            RequiredFields::create([
                'Name', 'Email', 'Message'
            ])
        );

        $form->addExtraClass('contact-form');

        return $form;
    }

    public function sendContactForm($data, Form $form)
    {
        $contactSubmission = ContactSubmission::create();
        $form->saveInto($contactSubmission);
        $contactSubmission->write();

        $to = $this->SiteConfig()->ContactEmail;
        $email = new Email();
        $email->setTo($to)
            ->setSubject('New contact message')
            ->setBcc('logs@baa.co.nz')
            ->setHTMLTemplate('EmailTemplate')
            ->addData([
                'Title' => 'New contact message',
                'Preheader' => 'You have received a new contact message',
                'SiteName' => $this->SiteConfig()->Title,
                'Name' => $contactSubmission->Name,
                'Email' => $contactSubmission->Email,
                'Phone' => $contactSubmission->Phone,
                'Message' => $contactSubmission->Message,
            ]);
        $email->send();

        $this->getRequest()->getSession()->set('FormSuccess', true);

        $this->redirect($this->Link());
        return;
    }
}
