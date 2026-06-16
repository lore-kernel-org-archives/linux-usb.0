Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7255B3CE48E
	for <linux-usb@vger.kernel.org>; Tue, 16 Jun 2026 05:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781586857; cv=pass; b=cRGjxHQX8nHmqKovd5MP27GTY6GEv+uzPoySy8v0fzrQ3xQuKMBO/MVCGadsPLVnbmHC3UZhkl0eVnLg39JNbHi3FS6lpX+dz1R8Gh36lGNKheNodUClC2mZOq1MoouMtpvgjjPKTflSg/0r40uXczYtXqoWEk9cEHBEvhyF6eM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781586857; c=relaxed/simple;
	bh=cdgthtRN3TaZug5RXpYRGPPhsYE+QJ6XysT3Mm820xc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UbbO908LEDNV3DzkKL4R7BEowoldLFG7wssux0Wa4h+2kZAieJg4iery3hRTo3mGelv45FuxYMTgehKP6ty2zBsQD/D5q7C6Epd5GyP6zrZfM8L+JgWtnId5wlA3HFXQSg/S5ng8O2N6STv7NN8V5mv0qj894uhfmb/ImuTiOsc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xwf.google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wEhFJAs0; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xwf.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wEhFJAs0"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-51765531803so186201cf.0
        for <linux-usb@vger.kernel.org>; Mon, 15 Jun 2026 22:14:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781586855; cv=none;
        d=google.com; s=arc-20240605;
        b=ZUB2hizKgS+xxqFfXmkRjc0usZa8rx0MhhXAEFOhufPNRnAAs0bppNFMHDbVUFNOTe
         n8l+WQra5rH7uWwjxvoKBLwDqHzXG13uwP/QJRtz6N+lVXgv1ECGg/X9MF9DqMORU+p2
         3H1vSKHh7/gCMPi7BQ5unIGlm5hWeKcfkdfTyyTax24tHVrcSEZ9AHHDm1TEHNxWC0Tc
         uj/wlfvTcDYnQuoDzhA2QI5mG1l54ruOw/I5WL+kV9UsKqFWP7j7Exv9Diklev7RPni1
         9b6XEjcMfIF2+IewD/XI1ZOKnF2vJjnqymj0WU7lbVAkmbABWibivDZYQ78dXwhIGcy0
         04UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=oZf9AADMW1nQW+AfyrB/2b+6l5AZvBA4C3NEgxXJMD8=;
        fh=haX/BIPEK2AmGx6eJFKwrJctEeZ71vZez314o+abq4Q=;
        b=Wny37YNnbP/K5CNylpbCvwNTbVqF0iJExLekqqbTmOj+x0gMs+alN4SKc/VwvzgUmL
         dWUOksZM89vXiR5nbL3eOx3MVBnJkb1VZRKAFM6m0pkBV4HoXG+RXLN9yo4FpLWPXpPD
         6kXpzJUbdClhwYMFM1X5c+Jk5PUH3Rhzd/jYO3IpkeaXt3Vxg65gzst+OAAMAC1RpnB4
         mHaRZz+w2cC8astifmKECfdahbtkn2YxVRqamdM5f7AGr6ve2Xw4erXbLq+v+O77heER
         4GfB8YkSC6QWJQRn/yD8O34cxrr77Lu1q3OWaT70YtehiRrFOUglOEu/uEaORkarKQZi
         TDRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781586855; x=1782191655; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oZf9AADMW1nQW+AfyrB/2b+6l5AZvBA4C3NEgxXJMD8=;
        b=wEhFJAs0av8w0frst2D7qsBUT8oBcLWm8aYlIkItG1hd8gwjWVkBVSgFXm8eEBSn3s
         YV45x1yVr1I5PTc3+Ianyb4QthYhFnI/YBFvU99FWYhwx/6HseDx+C8LuSGtV8/RfQPN
         y47w44+eYAXnA7HZn4H9M+yrgkK3HxqpQyqdlQoGcyihqe69nYJmy8a8gc+Q9pa5tdi6
         Y8U0i83xsIgj7MkIlOnNQI6eRcoJ5X5JgaPQvM+R0UJvl9YSPkpQO6ysA9ZrVyf8wYvu
         WZC2RB27l19oh+0P80NXnnZLONclItXLSrVd32a6XjmhzIdlQtE6jdJ7xn20pnKeynkF
         kFeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781586855; x=1782191655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oZf9AADMW1nQW+AfyrB/2b+6l5AZvBA4C3NEgxXJMD8=;
        b=Ol9lpNW5sc9qkHgt0eecrFyHQxwUv9VtCXE4R1MazxPDAeTyIKeeXozTj1LU6alETE
         MfCp8gSwbedFVm9IJF5YBbTnvF42NLqoi8ggIlkskfYRNIMZAxF9V8DHStCkzu3U56ng
         agvXbniqWgokdKjDcAgTtL8hiN83iBbwhwHPYEMcVAMTleHazozPMdPSiSelnvMyhVNR
         fFvgjbmlyH3TA4SL5xuFk/sFBqGvfB0MBQTEeygcAedwxg23orX8PI5VThKFoxtB/nUZ
         3EP31gxay0dPd14FwnK1bpHerERcHwA51KCFiybUlwfiIb6BsPbVKJftkH65ePG55Ok+
         pEuA==
X-Forwarded-Encrypted: i=1; AFNElJ8Sie6teNG3TljGkwhYb+Ls+mNpiV5GBg6MuRsg4GNzclRtacLkacc+lAdibjKw51eNcax4oViUuho=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWwIGxBlqqkQFCQTScLVZXZzDsMsa68qGdal1rrPnfipBT0h5w
	1Z1s/oUDQY/nCnay7Nu4UUpkg5tEaMC/pJVrNKAV3Nf8pfJw7tLPk1YSn5/kxWt/McCC+g7unuE
	Fh04rMq5FPhFQAxk89fEmCIUJKax96cibPHXPOEZF
X-Gm-Gg: Acq92OGoOlXoD8Qs8NQGgypo6rQ/JryoU+G5muobzPgh+bpZUNycD8CLhQ9Ae0ROd66
	rsR7i4zEj3HV3anlg45b8MjjMKoNf5TQVJTgnroFuYVwAJSCL9Ofpqd9wdejxzJ5yvfayGcUlsO
	CuUykCXVJvTW4H/F3PHzW2HbpRtHZ92RRP6+1VbJfm+OJbI3oR6Q9ecNn+sAMQaJsUGPt8qOyFf
	qLAqLTssPECG0zqaLVn5mYtlB5EbRAL2rXkJDnRXazyLwiYfUIwbc2Hopw3wO9dL0DE9FQ1YaQz
	+mtXlFyKsA==
X-Received: by 2002:a05:622a:1811:b0:50f:be7b:923a with SMTP id
 d75a77b69052e-51993b50849mr4108131cf.9.1781586854474; Mon, 15 Jun 2026
 22:14:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526070635.839701-1-hhhuuu@google.com> <1f7a7bf2-4d21-4944-9da0-36082d052b25@rowland.harvard.edu>
 <CAJh=zjLLrY-NpV-ZcmH0V6q8CjNuKt7CmW-GEFQ8_y3zm9v1yw@mail.gmail.com> <d0042def-a513-479f-9742-12942346cd5a@rowland.harvard.edu>
In-Reply-To: <d0042def-a513-479f-9742-12942346cd5a@rowland.harvard.edu>
Reply-To: hhhuuu@xwf.google.com
From: "Jimmy Hu (xWF)" <hhhuuu@xwf.google.com>
Date: Tue, 16 Jun 2026 13:14:03 +0800
X-Gm-Features: AVVi8CdpgkJIscAxcD7JJW8uf9rRWz1lpVf-Jfo1TjIojlCbI_U2UHaPHFSuQOY
Message-ID: <CAJh=zjJqarEkrzajpdcUAZwOxisbdrwTPwX_jHWzuWZFSQ16SA@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: udc: Fix NULL pointer dereference in gadget_match_driver
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 2, 2026 at 10:30=E2=80=AFPM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> On Tue, Jun 02, 2026 at 01:34:07PM +0800, Jimmy Hu (xWF) wrote:
> > On Wed, May 27, 2026 at 2:00=E2=80=AFAM Alan Stern <stern@rowland.harva=
rd.edu> wrote:
> > >
> > > On Tue, May 26, 2026 at 03:06:35PM +0800, Jimmy Hu wrote:
> > > > A NULL pointer dereference occurs in gadget_match_driver() because =
a
> > > > race condition exists between the DRD mode-switch work and the
> > > > configfs UDC write path:
> > > >
> > > > 1. The DRD mode-switch work invokes __dwc3_set_mode(), which calls
> > > >    dwc3_gadget_exit() and subsequently frees the UDC device name vi=
a
> > > >    device_unregister(&udc->dev).
> > > > 2. The configfs UDC write path invokes gadget_dev_desc_UDC_store(),
> > > >    which calls usb_gadget_register_driver() and subsequently
> > > >    compares the UDC device name via gadget_match_driver().
> > > >
> > > > If gadget_match_driver() runs concurrently during UDC unregistratio=
n, it
> > > > may access the freed UDC device name. Once the freed memory is zero=
ed,
> > > > dev_name(&udc->dev) returns NULL, causing a panic in strcmp().
> > >
> > > I don't see how this can happen.  gadget_match_driver() runs during
> > > probing of a gadget, which takes place only while the gadget is
> > > registered in the device core.  But usb_del_gadget() calls
> > > device_del(&gadget->dev) before it calls device_unregister(&udc->dev)=
.
> > > This means that at any time when gadget_match_driver() can run, the U=
DC
> > > device name must still be allocated.
> > >
> > > You should run more tests.  Add debugging printk() calls just before =
and
> > > just after the device_del(&gadget->dev) and device_unregister(&udc->d=
ev)
> > > lines, and inside gadget_match_driver(), so the tests will show
> > > unambiguously when these things happen with respect to each other.
> > >
> > > > Fix this by checking dev_name(&udc->dev) before calling strcmp().
> > >
> > > Adding a check like this will not fix a race; it will only make the r=
ace
> > > less likely to occur.  It won't prevent the name from being deallocat=
ed
> > > between the check and the strcmp() call.
> > >
> > > Alan Stern
> >
> > Hi Alan,
> >
> > Thank you for the review. You are absolutely right about the TOCTOU ris=
k;
> > the simple NULL check does not prevent the name from being deallocated
> > after the check but before the strcmp() call.
> >
> > I will submit a v2 patch that uses get_device(&udc->dev) and put_device=
()
> > to increment the UDC reference count during the matching phase. This wi=
ll
> > guarantee that the UDC device name remains allocated and valid througho=
ut
> > the entire duration of strcmp(), eliminating the race condition structu=
rally.
> >
> > Does this approach sound reasonable to you?
>
> No, because you haven't addressed the issue I raised at the start of my
> email, namely, how can this problem actually occur?  And you didn't run
> additional tests with the extra debugging information that I asked for.
>
> Alan Stern

Hi Alan,

I have captured the KASAN log with the extra debugging information
you requested, which shows how this race condition occurs.

The log shows that after gadget_match_driver() enters execution on
one core, a parallel core can invoke usb_del_gadget() and complete
both device_del(&gadget->dev) and device_unregister(&udc->dev)
before strcmp() executes.

Here is the exact timeline from the dmesg output:

1. At 268.595241, task 1374 (configfs path) enters
gadget_match_driver() (on CPU6):
[  268.595241][ T1374] [CPU6
android.hardwar]:[JJ][core.c/gadget_match_driver/1568] Enter

2. At 268.595250 (only 9 us later), DRD work invokes usb_del_gadget() (on C=
PU3):
[  268.595250][  T102] [CPU3
kworker/3:1]:[JJ][core.c/usb_del_gadget/1529] Before
device_del(&gadget->dev);
[  268.598129][  T102] [CPU3
kworker/3:1]:[JJ][core.c/usb_del_gadget/1531] After
device_del(&gadget->dev);
[  268.598159][  T102] [CPU3
kworker/3:1]:[JJ][core.c/usb_del_gadget/1534] Before
device_unregister(&udc->dev);
[  268.599405][  T102] [CPU3
kworker/3:1]:[JJ][core.c/usb_del_gadget/1536] After
device_unregister(&udc->dev);

3. At 268.599427, task 1374 starts comparison, where it triggers a
KASAN invalid-access. (Due to kernel preemption, the task was migrated
to CPU7):
[  268.599434][ T1374] BUG: KASAN: invalid-access in
gadget_match_driver+0x150/0x1cc
[  268.599448][ T1374] Read of size 8 at addr 66ffff801a49b880 by task
android.hardwar/1374
[  268.599454][ T1374] Pointer tag: [66], memory tag: [fe]
[  268.599456][ T1374]
[  268.599460][ T1374] CPU: 7 PID: 1374 Comm: android.hardwar Tainted:
G S      W  O       6.1.124-android14-11-ga633402dff84-dirty #1

To resolve this object lifetime issue, I see two potential approaches:

1. Protect the UDC device lifecycle during the comparison phase using
   get_device(&udc->dev) and put_device() (as a lightweight fix).
2. Serialize the configfs match path and the unregister path using
   a subsystem mutex.

I would highly appreciate your thoughts on which direction you prefer.
Does this data address the scenario you raised?

Thanks,
Jimmy
