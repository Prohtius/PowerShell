```powershell
connect-exchangeonline -identity <username>@<domain_name>

Set-MailboxCalendarFolder -Identity conference.room@company.com:\Calendar -PublishEnabled $true

Set-MailboxCalendarFolder -Identity conference.room@company.com:\Calendar -DetailLevel LimitedDetails
 
Set-MailboxCalendarFolder -Identity conference.room@company.com:\Calendar -PublishDateRangeFrom OneYear
 
Set-MailboxCalendarFolder -Identity conference.room@company.com:\Calendar -PublishDateRangeTo OneYear

Get-MailboxCalendarFolder -Identity conference.room@company.com:\Calendar | FL
```
```html
<a href="https://outlook.office365.com/dar/....
View Resource Calendar
</a>
```
```html
<iframe src="https://outlook.office365.com/owa/calendar/...."
width="100%"
height="800"
frameborder="0">
</iframe>
Show more lines
```
