Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABDA380FCF
	for <linux-usb@vger.kernel.org>; Wed, 12 Aug 2026 03:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786505422; cv=pass; b=tc/66Z8Kp3+WBxJAzhDlylNCH2Khr7RxuL1RIYXZTyafo6/cDq99YkBhz5BvAnjNzxpSW9qyD3JSoPX0cASViHlsk16NvrwLcsuDab72tAmEqpG4aNJxuPvMwXliuaSpc8y6GeHh6syktTo9eDq0CMH41TemVE+AVwLuVTllnE0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786505422; c=relaxed/simple;
	bh=VHMPa1wT0GFriQ4MJC6w3IZRrh/sWmiZKFaqKeQcaaA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qOgWWuH6nGRYmSpN7u1C6nj3QQ0N/9wj8MD6+8mknut6eYRVhoLMwxE9ti///cCB6gtGvE2io3egrsDQPVHIJCKbRZAxkocjxa6Rt8i/ilt5iXhazz4vP8BJb7KMHSyXH66V8Og0VQ1F4S2A0ONZE2iDjsxmajXvf/Tap6jWRmQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ssm4e70K; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ssm4e70K"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-66b2179133dso467277d50.0
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 20:30:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786505419; cv=none;
        d=google.com; s=arc-20260327;
        b=EZqEMWqpWcGBy3V8qfKqPHcCrEQBxQS1sQywuG7nRxszaj3Uf+HbrW6P6M5Ybh/XCc
         C4b7uRgB+XXyojPuw3aIyfS1Q+5vt5B75ukR1HsDqTt8iwuD6b2aSGstgipV0NcPMlaG
         HvBgUZxcs5K62lRNbL1WMkwuoNqAmeSvciP28+bXTQnUj23Yn4qNtmadAGTQZRexDExP
         HGlDYLxu0ATzB5R+f7XVU0+xKEl4PwWhvdqSDq2L3h/02n1sFZIJ1v2BgT8JdN5nRuyg
         B3+KJCbz8ptNKRIjswzvG9Zbln3hdxfVqtgBOCH0EWxre68GP35Djuw4PM0ut6aYO5Jw
         qiIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4T+oO2E2HkJP7ru0wvu2yagPDSTYhm8rgd0jrMyifnQ=;
        fh=2qaZWGdGGY6AktI3auIzTvGdqcXwbKx8fFjGIHlaYL0=;
        b=fX0LIfs/aA4ewQsZw2Pp9Mj25uT7CjABkBnPo+gIpOFzfL9etRx6X/VPdAbAN0EPcX
         p9c8K2XPkdDCCFIHRb95bSmyzy8gI8aOXQVXTpw6NagGwrP2Kdm+lwSsGTgOVgh7avR8
         kQL6Mg3cFWMybvl4ACaNW16n4Ra3gJbhCSsooXWLNSo+7wEoZGR/Gphm4W95wBfqjrEX
         7AVe/EnfERAW0H1xpjkCNih59S4UuSOhG29w2RyraudvdUJu+4h+UpO5rlNfc/ThQvYs
         Auq9zxSlUeFhi74Z3FeZi1NJkAJZDkFNEk8nSPzzAfY4/NYr6pC4QAmrYUW6GHohpMSD
         RPVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786505419; x=1787110219; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4T+oO2E2HkJP7ru0wvu2yagPDSTYhm8rgd0jrMyifnQ=;
        b=Ssm4e70KSkDX3QjQgQ/dT+BxAbPjtiHdFGgVeO8xdYJfTFCvIApXEWQLcxZWUhtG7/
         axh8HbnLZhsXLOlqDjebtn0/1hX/zy6oC2++cAvpRiXNA5tyfjHnaK6hplGt+91R4QZ0
         Ct2jBuC4fz/BmsOpmTyq2B0w1MGV+0GW1HZUCG3bd7OMN6Rihc18/Z9EPP1Dw4JrnLuL
         9Uiqy6ilH8EcQQZ1C4oteFTs0fTC8R433rHBkwl0B6dqCePIZKCN71CIw6iVhp4W+apW
         4EmwHF1CWktI4HtkPP5fSxkykswoEaFSHq8Kiik/nNWXfbAU2ooBnxs0hOShQLmndi0K
         vFkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786505419; x=1787110219;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4T+oO2E2HkJP7ru0wvu2yagPDSTYhm8rgd0jrMyifnQ=;
        b=NP8zT+JZacCbB5IPEu7yY3FGzR4afe9tR7JRjYSkdTOLeDqLcl1xCC6FN3BflGjbDX
         VOz+BOVyysOumSeNWs63r/Xc0d/280tn6wtOl8lmj8S/oKbbTC49Ys5kG4iH8sE+ghH1
         hQ+hQYgORLxcn3+XK0gmuIbouWLxPj1sYrF69zjFeJUAsfnbx+8ESuplZDX30KE90Crj
         MdHWx1uSECan+F2oeoc+zvF3te3UYzi6kVwdUr4w5RcmHAs2OXECJw3OHIa91EfvtCV0
         6iEoFoELGwAk9ot3xoQI+cK1CqssZitPpuLNETjvC8/mLp6D8CpgaZIo8ggxtpblR4DC
         ehhw==
X-Forwarded-Encrypted: i=1; AHgh+RqQgbZ/Lb3ocm1VjAACNxJU/sHLSTZmEeUVUVEw41jXbiomxH+5Bt08Mia/B2lnryfG/vnzPd4PIpE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVhttjrq6XxQbz+UEeKPDVOuvNRHA4pa3PCQ5PuNwHyzVR4Ckk
	7uWobRBfHFBaYkYWqtp4czUje/XFdx7S2OtbamrlxVoGJdfLUVkl623zDnLsNukZkEBKWJug1eh
	z6I79AY3RcQpvvKyMXNmhd13GvTyTkRFgeByGpUE=
X-Gm-Gg: AR+sD10WTJB4Mm5l7q9l3LevtBAN3SfckWjY3akrElgwog7+UGDmiSbUsr06oLTkpC2
	+Ym/iFy2UG/hHwUv/TolKMXJjniJylnZsH+6SDGhtrAo5YYLaVNvDKs5KVrxctnLEAkcOuOnXqJ
	x6R0EY1EJTasowmrPr+Kvjcv8eb+D+CtRRkpeQTc1zdikeL9GXvBkrtclhBGvEbTLFqmT+LFS7p
	DoN11DvgOpRPYKUlMTcrFCrHs5IsSazpmjPfMYnqv07OYygBr2Hoar8z2aMmTsgD0vgNffH9jHu
	BflAlu7rTyMpgQJ1lrS164czSc7kK/mj1AQJhh1r2ojcvxJlG3IlxagYIa+SQLIy1y0ikAEDdWj
	9U4pOnQuu1IHk//oHRIIqIZfdSQeR+ckFxXDj2GLwvXxJYcRgsguEgplz7xL2E910DfI38se3Is
	Jfr5o+XgqpUFTo
X-Received: by 2002:a53:c048:0:20b0:667:911c:54ea with SMTP id
 956f58d0204a3-66b343a018fmr834165d50.46.1786505419260; Tue, 11 Aug 2026
 20:30:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+Z0x2KotE5hgrFn-vzR+XNF_H_vEbZcE_nXmpVz5F2q1vxE6w@mail.gmail.com>
 <2e6a5558-3bc1-4b5e-a9e1-cc03f0e5663e@linuxfoundation.org>
In-Reply-To: <2e6a5558-3bc1-4b5e-a9e1-cc03f0e5663e@linuxfoundation.org>
From: Jason Colapietro <jasoncola1@gmail.com>
Date: Tue, 11 Aug 2026 23:30:07 -0400
X-Gm-Features: AUfX_mxcx9SyGYQhVldnd0YRN7rD50rO5YCaAs1VL5vR5FiDLmM65OCoPgglpMM
Message-ID: <CA+Z0x2+YkSzREfUiU1b9fP_V-k4FK2nEa+-e0eUwRO_MrDLPZg@mail.gmail.com>
Subject: Re: [PATCH v2 RESEND] usbip: make remote list honor parsable output
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Hongren Zheng <i@zenithal.me>, Greg KH <greg@kroah.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jason Colapietro <jasoncola1@gmail.com>
11:26=E2=80=AFPM (1 minute ago)
to Shuah, Valentina, skhan, Hongren, Greg, linux-usb, linux-kernel, stable

The -p option only affects local devices and gadgets. Remote lists still
print their human-readable headings and details, so scripts cannot parse
them using the documented option.

Pass the parsable flag through the remote listing path. Emit the same busid
and usbid record used for local devices while continuing to consume every
interface record from the server.

Fixes: e9837bbb3e69 ("staging: usbip: userspace tools v1.0.0")
Closes: https://www.google.com/url?q=3Dhttps://bugzilla.kernel.org/show_bug=
.cgi?id%3D219502&source=3Dgmail&ust=3D1786591574713000&sa=3DE
Cc: stable@vger.kernel.org
Assisted-by: Codex:gpt-5
Signed-off-by: Jason Colapietro <jasoncola1@gmail.com>
---
Changes in v3:
- No functional change; resent as 1/2 of a series.
- 2/2 makes -p work regardless of where it appears on the command line.

tools/usb/usbip/src/usbip_list.c | 33 ++++++++++++++++++++------------
1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/tools/usb/usbip/src/usbip_list.c b/tools/usb/usbip/src/usbip_l=
ist.c
index 3d810bcca02..b9d60b87e47 100644
--- a/tools/usb/usbip/src/usbip_list.c
+++ b/tools/usb/usbip/src/usbip_list.c
@@ -41,7 +41,7 @@ void usbip_list_usage(void)
printf("usage: %s", usbip_list_usage_string);
}

-static int get_exported_devices(char *host, int sockfd)
+static int get_exported_devices(char *host, int sockfd, bool parsable)
{
char product_name[100];
char class_name[100];
@@ -80,9 +80,11 @@ static int get_exported_devices(char *host, int sockfd)
return 0;
}

- printf("Exportable USB devices\n");
- printf("=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D\n");
- printf(" - %s\n", host);
+ if (!parsable) {
+ printf("Exportable USB devices\n");
+ printf("=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D\n");
+ printf(" - %s\n", host);
+ }

for (i =3D 0; i < reply.ndev; i++) {
memset(&udev, 0, sizeof(udev));
@@ -98,9 +100,14 @@ static int get_exported_devices(char *host, int sockfd)
usbip_names_get_class(class_name, sizeof(class_name),
udev.bDeviceClass, udev.bDeviceSubClass,
udev.bDeviceProtocol);
- printf("%11s: %s\n", udev.busid, product_name);
- printf("%11s: %s\n", "", udev.path);
- printf("%11s: %s\n", "", class_name);
+ if (parsable) {
+ printf("busid=3D%s#usbid=3D%04x:%04x#\n", udev.busid,
+ udev.idVendor, udev.idProduct);
+ } else {
+ printf("%11s: %s\n", udev.busid, product_name);
+ printf("%11s: %s\n", "", udev.path);
+ printf("%11s: %s\n", "", class_name);
+ }

for (j =3D 0; j < udev.bNumInterfaces; j++) {
rc =3D usbip_net_recv(sockfd, &uintf, sizeof(uintf));
@@ -116,16 +123,18 @@ static int get_exported_devices(char *host, int sockf=
d)
uintf.bInterfaceClass,
uintf.bInterfaceSubClass,
uintf.bInterfaceProtocol);
- printf("%11s: %2d - %s\n", "", j, class_name);
+ if (!parsable)
+ printf("%11s: %2d - %s\n", "", j, class_name);
}

- printf("\n");
+ if (!parsable)
+ printf("\n");
}

return 0;
}

-static int list_exported_devices(char *host)
+static int list_exported_devices(char *host, bool parsable)
{
int rc;
int sockfd;
@@ -138,7 +147,7 @@ static int list_exported_devices(char *host)
}
dbg("connected to %s:%s", host, usbip_port_string);

- rc =3D get_exported_devices(host, sockfd);
+ rc =3D get_exported_devices(host, sockfd, parsable);
if (rc < 0) {
err("failed to get device list from %s", host);
return -1;
@@ -351,7 +360,7 @@ int usbip_list(int argc, char *argv[])
parsable =3D true;
break;
case 'r':
- ret =3D list_exported_devices(optarg);
+ ret =3D list_exported_devices(optarg, parsable);
goto out;
case 'l':
ret =3D list_devices(parsable);
--
2.50.1 (Apple Git-155)
-Jason

On Tue, Aug 11, 2026 at 6:48=E2=80=AFPM Shuah Khan <skhan@linuxfoundation.o=
rg> wrote:
>
> On 8/10/26 21:42, Jason Colapietro wrote:
> > The -p option only affects local devices and gadgets. Remote lists stil=
l
> > print their human-readable headings and details, so scripts cannot pars=
e
> > them using the documented option.
> >
> > Pass the parsable flag through the remote listing path. Emit the same b=
usid
> > and usbid record used for local devices while continuing to consume eve=
ry
> > interface record from the server.
>
> What happens without this patch? Can you elaborate with some examples?
>
> >
> > Fixes: e9837bbb3e69 ("staging: usbip: userspace tools v1.0.0")
> > Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D219502
> > Cc: stable@vger.kernel.org
> > Assisted-by: Codex:gpt-5
> > Signed-off-by: Jason Colapietro <jasoncola1@gmail.com>
> > ---
> > Changes in v2:
> > - Make the email From header match Signed-off-by.
> > - Add Cc: stable@vger.kernel.org.
> >
> >   tools/usb/usbip/src/usbip_list.c | 33 ++++++++++++++++++++-----------=
-
> >   1 file changed, 21 insertions(+), 12 deletions(-)
> >
> > diff --git a/tools/usb/usbip/src/usbip_list.c b/tools/usb/usbip/src/usb=
ip_list.c
> > index 3d810bcca02..b9d60b87e47 100644
> > --- a/tools/usb/usbip/src/usbip_list.c
> > +++ b/tools/usb/usbip/src/usbip_list.c
> > @@ -41,7 +41,7 @@ void usbip_list_usage(void)
> >       printf("usage: %s", usbip_list_usage_string);
> >   }
> >
> > -static int get_exported_devices(char *host, int sockfd)
> > +static int get_exported_devices(char *host, int sockfd, bool parsable)
> >   {
> >       char product_name[100];
> >       char class_name[100];
> > @@ -80,9 +80,11 @@ static int get_exported_devices(char *host, int sock=
fd)
> >               return 0;
> >       }
> >
> > -     printf("Exportable USB devices\n");
> > -     printf("=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D\n");
> > -     printf(" - %s\n", host);
> > +     if (!parsable) {
> > +             printf("Exportable USB devices\n");
> > +             printf("=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D\n");
> > +             printf(" - %s\n", host);
> > +     }
> >
> >       for (i =3D 0; i < reply.ndev; i++) {
> >               memset(&udev, 0, sizeof(udev));
> > @@ -98,9 +100,14 @@ static int get_exported_devices(char *host, int soc=
kfd)
> >               usbip_names_get_class(class_name, sizeof(class_name),
> >                                     udev.bDeviceClass, udev.bDeviceSubC=
lass,
> >                                     udev.bDeviceProtocol);
> > -             printf("%11s: %s\n", udev.busid, product_name);
> > -             printf("%11s: %s\n", "", udev.path);
> > -             printf("%11s: %s\n", "", class_name);
> > +             if (parsable) {
> > +                     printf("busid=3D%s#usbid=3D%04x:%04x#\n", udev.bu=
sid,
> > +                            udev.idVendor, udev.idProduct);
> > +             } else {
> > +                     printf("%11s: %s\n", udev.busid, product_name);
> > +                     printf("%11s: %s\n", "", udev.path);
> > +                     printf("%11s: %s\n", "", class_name);
> > +             }
> >
> >               for (j =3D 0; j < udev.bNumInterfaces; j++) {
> >                       rc =3D usbip_net_recv(sockfd, &uintf, sizeof(uint=
f));
> > @@ -116,16 +123,18 @@ static int get_exported_devices(char *host, int s=
ockfd)
> >                                       uintf.bInterfaceClass,
> >                                       uintf.bInterfaceSubClass,
> >                                       uintf.bInterfaceProtocol);
> > -                     printf("%11s: %2d - %s\n", "", j, class_name);
> > +                     if (!parsable)
> > +                             printf("%11s: %2d - %s\n", "", j, class_n=
ame);
> >               }
> >
> > -             printf("\n");
> > +             if (!parsable)
> > +                     printf("\n");
> >       }
> >
> >       return 0;
> >   }
> >
> > -static int list_exported_devices(char *host)
> > +static int list_exported_devices(char *host, bool parsable)
> >   {
> >       int rc;
> >       int sockfd;
> > @@ -138,7 +147,7 @@ static int list_exported_devices(char *host)
> >       }
> >       dbg("connected to %s:%s", host, usbip_port_string);
> >
> > -     rc =3D get_exported_devices(host, sockfd);
> > +     rc =3D get_exported_devices(host, sockfd, parsable);
> >       if (rc < 0) {
> >               err("failed to get device list from %s", host);
> >               return -1;
> > @@ -351,7 +360,7 @@ int usbip_list(int argc, char *argv[])
> >                       parsable =3D true;
> >                       break;
> >               case 'r':
> > -                     ret =3D list_exported_devices(optarg);
> > +                     ret =3D list_exported_devices(optarg, parsable);
> >                       goto out;
> >               case 'l':
> >                       ret =3D list_devices(parsable);
>
> thanks,
> -- Shuah
