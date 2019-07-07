using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin;
using Microsoft.Owin.Security;
using SmartPhoneShop.Common;
using SmartPhoneShop.Data;
using SmartPhoneShop.Model.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web;
using Twilio;
using Twilio.Clients;
using Twilio.Rest.Api.V2010.Account;

namespace SmartPhoneShop.Web.App_Start
{
    public class EmailService : IIdentityMessageService
    {
        public Task SendAsync(IdentityMessage message)
        {
            return configSendGridasync(message);
        }
        public static class Keys
        {
            public static string SMSAccountIdentification = "AC2a8b77ff2bdd96c5a05a2947940c287f";
            public static string SMSAccountPassword = "fcee0f65e9c6aa1e9efbc3828b9b09c0";
            public static string SMSAccountFrom = "+12024107196";
        }
        private Task configSendGridasync(IdentityMessage message)
        {
            var fromEmail = ConfigHelper.GetByKey("FromEmailAddress");
            var password = ConfigHelper.GetByKey("FromEmailPassword");
            var client = new SmtpClient
            {
                Host = "smtp.gmail.com",
                Port = 587,
                UseDefaultCredentials = false,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                Credentials = new NetworkCredential(fromEmail, password),
                EnableSsl = true,
            };
            var from = new MailAddress("info@hoanghuy97cntt.somee.com", "Hoang Huy");
            var to = new MailAddress(message.Destination);
            var mail = new MailMessage(from, to)
            {
                Subject = message.Subject,
                Body = message.Body,
                IsBodyHtml = true,
            };
            client.Send(mail);
            return Task.FromResult(0);
        }
    }
    public static class Keys
    {
        public static string SMSAccountIdentification = "AC2a8b77ff2bdd96c5a05a2947940c287f";
        public static string SMSAccountPassword = "fcee0f65e9c6aa1e9efbc3828b9b09c0";
        public static string SMSAccountFrom = "+12024107196";
    }
    public class ApplicationUserStore : UserStore<ApplicationUser>
    {
        public ApplicationUserStore(SmartPhoneDbContext context)
            : base(context)
        {
        }
    }
    public class SmsService : IIdentityMessageService
    {
        public Task SendAsync(IdentityMessage message)
        {
            // Twilio Begin
            var account = Keys.SMSAccountIdentification;
            var password = Keys.SMSAccountPassword;
            var _client = new TwilioRestClient(
               account,
               password
           );
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls
                                                | SecurityProtocolType.Tls11
                                                | SecurityProtocolType.Tls12
                                                | SecurityProtocolType.Ssl3;

            TwilioClient.Init(account, password);
            MessageResource resource = null;
            try
            {
                resource = MessageResource.Create(
               body: message.Body,
               from: new Twilio.Types.PhoneNumber("+12024107196"),
               to: message.Destination
            );
            }
            catch (Exception e)
            {

                return Task.FromResult(0);
            }
            // Twilio doesn't currently have an async API, so return success.
            return Task.FromResult(0);
            // Twilio End
        }
    }
    // Configure the application user manager used in this application. UserManager is defined in ASP.NET Identity and is used by the application.
    public class ApplicationUserManager : UserManager<ApplicationUser>
    {
        public ApplicationUserManager(IUserStore<ApplicationUser> store)
            : base(store)
        {
        }
        public static ApplicationUserManager AppDomainManager;
        public static ApplicationUserManager Create(IdentityFactoryOptions<ApplicationUserManager> options, IOwinContext context)
        {
            var manager = new ApplicationUserManager(new UserStore<ApplicationUser>(context.Get<SmartPhoneDbContext>()));
            // Configure validation logic for usernames
            manager.UserValidator = new UserValidator<ApplicationUser>(manager)
            {
                AllowOnlyAlphanumericUserNames = false,
                RequireUniqueEmail = true,
                
            };

            // Configure validation logic for passwords
            manager.PasswordValidator = new PasswordValidator
            {
                RequiredLength = 6,
                RequireNonLetterOrDigit = false,
                RequireDigit = true,
                RequireLowercase = true,
                RequireUppercase = true,
            };

            // Configure user lockout defaults
            manager.UserLockoutEnabledByDefault = true;
            manager.DefaultAccountLockoutTimeSpan = TimeSpan.FromMinutes(5);

            manager.MaxFailedAccessAttemptsBeforeLockout = 5;
            manager.RegisterTwoFactorProvider("Phone Code", new PhoneNumberTokenProvider<ApplicationUser>
            {
                MessageFormat = "Your security code is {0}"
            });
            manager.RegisterTwoFactorProvider("Email Code", new EmailTokenProvider<ApplicationUser>
            {
                Subject = "Security Code",
                BodyFormat = "Your security code is {0}"
            });
            manager.EmailService = new EmailService();
            manager.SmsService = new SmsService();
            var dataProtectionProvider = options.DataProtectionProvider;
            if (dataProtectionProvider != null)
            {
                manager.UserTokenProvider =
                    new DataProtectorTokenProvider<ApplicationUser>(dataProtectionProvider.Create("ASP.NET Identity"));
            }
            AppDomainManager = manager;
            return manager;
        }
    }

    // Configure the application sign-in manager which is used in this application.
    public class ApplicationSignInManager : SignInManager<ApplicationUser, string>
    {
        public ApplicationSignInManager(ApplicationUserManager userManager, IAuthenticationManager authenticationManager)
            : base(userManager, authenticationManager)
        {
        }

        public override Task<ClaimsIdentity> CreateUserIdentityAsync(ApplicationUser user)
        {
            return user.GenerateUserIdentityAsync((ApplicationUserManager)UserManager, DefaultAuthenticationTypes.ApplicationCookie);
        }

        public static ApplicationSignInManager Create(IdentityFactoryOptions<ApplicationSignInManager> options, IOwinContext context)
        {
            return new ApplicationSignInManager(context.GetUserManager<ApplicationUserManager>(), context.Authentication);
        }
    }
}