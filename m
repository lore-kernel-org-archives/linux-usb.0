Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7235536BCCC
	for <linux-usb@vger.kernel.org>; Sat, 20 Jun 2026 07:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781939296; cv=pass; b=R2qr5lFK6M5t9uFyDOMfiWJeMF7FPsc8LVn4kDxkDAs8rky9Lic2U0T+qs8uKMXo5B2G6aFPY1uq47KS5DefclN/QZKR9iinp9LVJlGHR5vWaEtkK5E7tWwQXHdKmh7SD1Ey7JfFPh657emCd27pCuYjirjB88sCTQLjL1kX5Pg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781939296; c=relaxed/simple;
	bh=XCyMl4IDuXCyjqYPYR2YxAkyWZJWWJ09lyGz+6TSh4Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oTIWWrftbU8w8GnE35v/ZpnpWOAsDhfD7OI3CHPDQ7tA46DMO0fIHlbuu04FoszXAqqJE0Q48cbV9e1zt6pj9K3Ye4cOSO1wlrNPExktLLxWmv9MlqrfhwTAaoccVV5CLfa0hljxDyVeAXpYuuR6ER+A0OznbjsUfBtMAt8zFPA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qMQQGHuf; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qMQQGHuf"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c07ea058c1aso424568666b.2
        for <linux-usb@vger.kernel.org>; Sat, 20 Jun 2026 00:08:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781939293; cv=none;
        d=google.com; s=arc-20240605;
        b=HesgJ7DM9oobTNiRgErW2E1D4RThSKNhyRzMZLLblBYC93GWi8Lootiaexi+JhTKdY
         WjPp4VUy8hpwX73h32Rs9LRiTjOGEavK+GOAB4wRbzVzXbCergI31Topd6kHywbl3Swe
         luz3IPgfhSViQguForGU5XnQ4Uxl06baUd9r1WQEj7S8RLahcv2LgPE0IOLchvpfeoGH
         74qw6J5K6yf2r+3ncp23yxM9LGoy79ix3UAVWnRX1aGioCvOU+toQ2iFvO6oDo7vUUxH
         NZbbBiFoOywKYxJtU2FFWpD8hHyA4PhwiVMBlqjaSfcY8mOcykbahD5bPTjUWjydYoi+
         FuGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mcZwV7WSG1IhueP/EjyjB8c7E4lA+ynuPgyNNSZ/zK8=;
        fh=07g4tpHnOgrhzKKNSUpFc7vl2Zhl3DRLp5LdrzBRDIo=;
        b=aORumtiGlaBujy/lo8OIafAKHpAUw2FV/ys0G5xGvat7AvQZW8DZBpOivzbzF1F85n
         KCGxxwKAkghTfHMhGLWn73YqF8VJ1LEbwAUVCFlnXFEmNW1JvcLmE4d/RZRaZJ3tQCKa
         x5k+ICXgJ1JEr/3fISngzkuRbGz3miAhpo5VZhV9tnzFzf+ahZWNh2WZuEx7tKg/L3iL
         SjZWiLZckjYOM3CSz/00LemYmjAJKGa5rAvJx8EwWW0yPPZpFoh6a90s5se3C+32arox
         fzH91txCw8tRDnIdHCZoO/dVs4dJzubQbsuY6uQS32Hajd3StNkH4PaxFvidLq1KXe2a
         iTEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781939293; x=1782544093; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mcZwV7WSG1IhueP/EjyjB8c7E4lA+ynuPgyNNSZ/zK8=;
        b=qMQQGHufDHKGZtHzHq5WaGR8JEPeKMmTezladggnpN7KAVEjZwVlZt2EugYuc9/V4R
         PQCZ4FN17FHciNoFwVpA7Z+/aV3vOVfG2Lm0pPcKQeaYhiCIW6CFg6i0llYQFr1ecj0E
         zqKfvX+wqD2epCllhiKBt66sEqYFQAZv7UfUPI1FLlln3zyXQpvEts6bC7GqRowPQi2T
         ySphv5bx9W8zMcOqdGNKNWs3Nc/jJpAK61otj/oaNEgn3sAnM82rqsTcfgp2/H/kl3xC
         Cq3IcUBzDZ1ZMQ1Iad7O4E6giYo87txvzqaXpn1TdpoJNED3wE2BwWy7msWy+zdYhDoG
         DLRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781939293; x=1782544093;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mcZwV7WSG1IhueP/EjyjB8c7E4lA+ynuPgyNNSZ/zK8=;
        b=ERxKH1j3tQT41Oau/5Nba6H6QpwKhmL7KogxlQrSNdlS9npgMoLFJ53VbRdNEVkf7R
         nyXSR03csIBisGqJabd2+1P5uGXWFspspP3n4y0fb9blSrlNb+DykhPt3RNILm3FWp5H
         gDSwGX3IVRvJgH4OehZX0Dyk8zpPFCm24M7n7b98GZubxjBw2vl5tu9Yqu2FJjurCiaY
         YHmy06RqUD1wfKlCk7biLYSU+vOfRvrHHDmYYQDIId0o+TPZJTki0jd20Io3yvXCfZOr
         8bGzvd/2YYh93xBks8N5opwJ4acRjmvK8ZZ7kfP5bQX0YpO+2rU36fBgcB/RkfS5cxsr
         z7gQ==
X-Gm-Message-State: AOJu0YzzcKjxdfuVJutbYVmjLRneZBcnKbJk9OTVcomVEzWMqaTfrW+D
	mkDoUJqWIzdZPWtkobjiTyjTbZU5mMhJpR8fqrnhVZ6Y4T0txjeQ4oL1aRR1dcH+GVLPqmLJo48
	jX3Jjq+gZq/AnzZYOYWbznm9VbHcByVgzaWz6rgs=
X-Gm-Gg: AfdE7cmJKYBRChftYT5Bh4n38gejCVmhRRgFXRgL4fAFEzhDoi+1PfbJxOCGweueZBT
	9dXs2rArk7kDsZrOtx7dBi76evQYVLkN9aoXdbDGcx405bK1EXdBqPLUKYGflItgdFVoOsmRgml
	0TsbLhRb0ukHHoc55McWoosrG1hu/K4xZHccQ3WOp08V1D1JCl/YQB1uAvRuR9r79lfhibEtIuP
	sAmCoqJxSOlUlIzmg5wctSnR2x4R+XQCgTtCBwfSGbqoyMiXr/DWXR2K4QJ4TWv6Aj580CnyTgd
	y0HRjlJB
X-Received: by 2002:a17:906:6a2a:b0:be9:54dc:af58 with SMTP id
 a640c23a62f3a-c097d0b248bmr311133466b.49.1781939292478; Sat, 20 Jun 2026
 00:08:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260619095936.24080-1-nikhilsolanke5@gmail.com> <8175e40d-357a-4513-b827-752f679e9904@rowland.harvard.edu>
In-Reply-To: <8175e40d-357a-4513-b827-752f679e9904@rowland.harvard.edu>
From: Nikhil Solanke <nikhilsolanke5@gmail.com>
Date: Sat, 20 Jun 2026 12:38:00 +0530
X-Gm-Features: AVVi8CfxzcZmGS7iAGbjP8NrznqkOopqPiRigCQbnY003mQlSIrSxE4W3W2WC10
Message-ID: <CAFgddhKKuGQgu0Ahu_WRyZocQGwPZkUejjoaJQ+P8--+k=Lwkg@mail.gmail.com>
Subject: Re: [PATCH] usbcore: Add quirk for 255-bytes initial config read
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, michal.pecio@gmail.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> You don't need Suggested-by here.  It's redundant; we always assume that
> people are responsible for authorship of the patches they write and
> submit, unless they say otherwise.
>
> > Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> > Suggested-by: Michal Pecio <michal.pecio@gmail.com>
> > Closes: https://lore.kernel.org/linux-usb/CAFgddh+JWdT4LLwMc5qjM8q_pBu-fRo2qADR5ovAKoGHWMQrRw@mail.gmail.com/
> > Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> > Cc: <stable@vger.kernel.org>
> >
> > Signed-off-by: Nikhil Solanke <nikhilsolanke5@gmail.com>
> > ---
> >  drivers/usb/core/config.c  | 56 +++++++++++++++++++++++++++-----------
> >  drivers/usb/core/quirks.c  |  3 ++
> >  include/linux/usb/quirks.h |  4 +++
> >  3 files changed, 47 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
> > index 45e20c6d76c0..623425cef085 100644
> > --- a/drivers/usb/core/config.c
> > +++ b/drivers/usb/core/config.c
> > @@ -912,6 +912,8 @@ int usb_get_configuration(struct usb_device *dev)
> >       unsigned char *bigbuffer;
> >       struct usb_config_descriptor *desc;
> >       int result;
> > +     size_t usb_dt_config_size = (dev->quirks & USB_QUIRK_CONFIG_SIZE)
> > +             ? USB_DT_CONFIG_SIZE_QUIRK : USB_DT_CONFIG_SIZE;
>
> I wouldn't call the variable usb_dt_config_size.  It isn't always the
> size of a USB configuration descriptor; it isn't even always the size
> you expect for the response.  Rather, it is the size you intend to ask
> for.
>
> >
> >       if (ncfg > USB_MAXCONFIG) {
> >               dev_notice(ddev, "too many configurations: %d, "
> > @@ -938,7 +940,8 @@ int usb_get_configuration(struct usb_device *dev)
> >       if (!dev->rawdescriptors)
> >               return -ENOMEM;
> >
> > -     desc = kmalloc(USB_DT_CONFIG_SIZE, GFP_KERNEL);
> > +     desc = kmalloc(usb_dt_config_size, GFP_KERNEL);
> > +
> >       if (!desc)
> >               return -ENOMEM;
> >
> > @@ -946,7 +949,7 @@ int usb_get_configuration(struct usb_device *dev)
> >               /* We grab just the first descriptor so we know how long
> >                * the whole configuration is */
>
> This comment is now out of date.  It should be rewritten to explain why
> the quirk does and why.

I will explain the quirk above where the variable is defined and reference
it here. A reader would probably question about the quirk there.

>
> >               result = usb_get_descriptor(dev, USB_DT_CONFIG, cfgno,
> > -                 desc, USB_DT_CONFIG_SIZE);
> > +                 desc, usb_dt_config_size);
> >               if (result < 0) {
> >                       dev_err(ddev, "unable to read config index %d "
> >                           "descriptor/%s: %d\n", cfgno, "start", result);
> > @@ -957,26 +960,39 @@ int usb_get_configuration(struct usb_device *dev)
> >                       break;
> >               } else if (result < 4) {
> >                       dev_err(ddev, "config index %d descriptor too short "
> > -                         "(expected %i, got %i)\n", cfgno,
> > -                         USB_DT_CONFIG_SIZE, result);
> > +                         "(expected %zu, got %i)\n", cfgno,
>
> Likewise, "expected" here is wrong.  It should be "asked for" or
> something like that.

For this branch tho, we are expecting atleast 9 bytes. if we don't get
those we simply bail out. expected is the right word here. But this was the
originial implementation. With the introduction of the quirk, the wording
of it does fall apart. Instead of adding more branches just to rename a log
message, let's just keep it as "expected"? In a similar branch later on,
when we ask for the bigbuffer, it does make sense to use "asked for" like
you suggested. I will make the change there.

>
> > +                         usb_dt_config_size, result);
> >                       result = -EINVAL;
> >                       goto err;
> >               }
> > -             length = max_t(int, le16_to_cpu(desc->wTotalLength),
> > -                 USB_DT_CONFIG_SIZE);
> > +             /* If the device does returns the full length configuration
> > +              * descriptor, skip the second read. Fallback to default
> > +              * behavior otherwise.
> > +              */
>
> New multiline comments (or ones that are rewritten) should use the same
> format as the rest of the USB stack:
>
>         /*
>          * Blah, blah, blah
>          * Blah, blah, blah
>          */
>

Alright. About the comments formatting, all other comments were not
following a consistent format in the same file. so I didn't bother to fix
such small style changes. But I will still fix them in the way you (and
kernel code style guidelines) say.

> Whether the quirk flag is set doesn't matter.  All you care about is
> whether the information received earlier contains the entire descriptor
> set.  The first and third tests here should be removed.
>
> There is some question about what to do if wTotalLength < result.  My
> advice is to use the smaller value in this case, but not smaller than
> USB_DT_CONFIG_SIZE.

In the case where wTotalLength < result, wouldn't it be better to consider
the result value as the truth? Or are there scenarios where the device or
the buffer will contain gibberish just to fill it, which is why you
suggested a smaller value. I did understand the part that it should be
atleast USB_DT_CONFIG_SIZE because its the header, but isn't that part
already handled above with result < 4? It does ensure all the critical
fields are actually present. And with just the second test, the code will
naturally jump to the else branch for any cases like you mentioned. I will
change the max_t back to use USB_DT_CONFIG_SIZE and everything seems to be
covered now? Also looking at the 3rd test now, it is actually redundant.
Thanks for pointing that out.


> >
> > -             /* Now that we know the length, get the whole thing */
> > -             bigbuffer = kmalloc(length, GFP_KERNEL);
> > -             if (!bigbuffer) {
> > -                     result = -ENOMEM;
> > -                     goto err;
> > -             }
> > +                     bigbuffer = (unsigned char *) desc;
> > +                     desc = NULL;
> > +                     length = result;
>
> Don't keep the entire 255-byte buffer.  Use krealloc() to shrink the
> buffer down to the right size.

I did intially though of using krealloc(), but when looked at existing
implementation, bigbuffer is alloced with wTotalLength while ensuring its
atleast USB_DT_CONFIG_SIZE (9) bytes. Then when we receive the result, the
bigbuffer isn't realloced as per the size we received. So I tried to mirror
this exising behavior in fear that I might mess up something else while
trying to be smart. (Although yea, it is waste of memory).

> The "due to above errors" part isn't needed, since the errors will be
> obvious in the kernel log.  In fact, it probably would be better not to
> put this information here at all but instead modify the error message in
> usb_enumerate_device() (the caller).

Alright

> > diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
> > index 87810eff974e..92219684a604 100644
> > --- a/drivers/usb/core/quirks.c
> > +++ b/drivers/usb/core/quirks.c
> > @@ -142,6 +142,9 @@ static int quirks_param_set(const char *value, const struct kernel_param *kp)
> >                               break;
> >                       case 'q':
> >                               flags |= USB_QUIRK_FORCE_ONE_CONFIG;
> > +                             break;
> > +                     case 'r':
> > +                             flags |= USB_QUIRK_CONFIG_SIZE;
>
> For good style, there should be a "break" statement here.

Yea I do agree. Then again I tried to keep my changes in respect to what
was like originally. I will add the missing break then.

> Also, you need to document the new flag under the usbcore.quirks entry
> in Documentation/admin-guide/kernel-parameters.txt.

Oh sorry, totally missed it. Working on it.

> Again, I don't like this name.  It's not a quirk in the size of the
> configuration descriptor type, which is what "USB_DT_CONFIG_SIZE" stands
> for; it's a quirk in the way the kernel asks for config descriptors.
> (Or in what size request the device will accept, if you prefer.)
>
> And the 255 value doesn't belong in this header file anyway.  It should
> be defined in config.c since that's the only place it gets used.

So what about USB_CONFIG_REQ_SIZE? it's what you had suggested before in
earlier conversations (without the QUIRK word in between naming our magic
number 255).

Nikhil Solanke
