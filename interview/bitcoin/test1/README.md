Have some code run before executing a devise function

Using devise for the authentication framework
(https://github.com/plataformatec/devise), how would you have another
controller execute before a specific devise controller method (in this case the
update password method)?

End goal: Before allowing a user to update their password, we would like them
to authenticate using a two-factor authentication controller, which if
successful would allow them to continue and change their password. The two
factor authentication function is not required to be implemented.
