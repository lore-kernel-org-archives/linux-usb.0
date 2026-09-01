Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1EF37A841
	for <linux-usb@vger.kernel.org>; Tue,  1 Sep 2026 05:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788239199; cv=pass; b=ZqvenbXfvC+EqaPGXzthXThqZibIxeWQ9vu7Xp6ayOCHcgiIOx5NfrA9EZLRyEH2pZjc6tqGlFoL5zce0lKqK73yZK5Lwjm5NImQ45f9ccG/XotPUFLuHw5HFZnmD8QxtNsUjCK0/KbZhvqsZZa97ySMb5W7o8TrS3y5NQTPKNU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788239199; c=relaxed/simple;
	bh=DXUR1kngFuqFotBIycz37T0OKEb5ANnR0IeCXoPbnio=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H+tMjZgIrQuhaNO6+0ydchSC6BpUgdn8pBi3hUWOtu9qCvcaUK6WnPP49spOUa7juQHkPcLTHUWnAENmfVkNlnpSQWid5sBdODRtb6UjN7jf34QYGez7l5OOdQzLMJ2gK18SSMrUK6BDa3qFIwqjyfn1W9EDH54IE21mOwDe1xs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ondOQLCn; arc=pass smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ondOQLCn"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84f38f3b36eso440889b3a.1
        for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 22:06:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788239197; cv=none;
        d=google.com; s=arc-20260327;
        b=d/0EZtcC7Y2+1gQaH7Du+8e03PJ4a2PpPo7lCV54xnFoOuHAEj4Q5Rwuo2B8XncEeW
         0ymtLh+Q4GI+0Plw7+xmbIGB99tcvA3ecEQQsHl6Mr7lnRFOtYTfp2JFmuYsXvB9LtxB
         /1cQ2Wk8js4XWwsFWJuBGPwW11D3SR874nVzmpje5OZnQHie0yyL1R7RyM0CWyIKZKGy
         DsD2COzKai++nPvAVolSZ5SR0w+AXB7C8K6DgB6s6GEL9HbNVhwApqEMBonRsU5RAnaX
         SAgKzBQLe2yYzpanXdVfEqiGEkrXbdY42wE2p1eO5zNNRCGwtgNzTF8yFMXli8AVAPZ4
         ccCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Uxm6VQ8DSjAEX2q/IFs3sWCsxk2wubK/8uzkDDttSgE=;
        fh=/0+sCzNbv3Y8qLTlc0ASCIPCL8ZrD38tHzuQXTpWT4k=;
        b=qWNwZtUkJH6euTcBlXVsNvjUzUbWjnQXwXWQmOQ0BCbqsKaJfvU80h2bPp7UNVzBz3
         9Me1arE3GbgcrIYUQ9q0HRDDspgjvTwo9jDTlLuqODSZ59WkcLVbKZgAJP2+zWLGUJTZ
         U/BNWQbGA7OzX86hFGLznpoL/6OD0V054neRfxgDrPovxT+2/x2ktKEmUnwTp0rlokEC
         KW4a8At8k07tupYIZYl/Teke8Xsa8VZ/pTmG2JCFGFqhtpowofyRLOmsp4Lr7L+c1tWw
         v9KV6yEpbjCIVZgOc4vNqO9NRS4qGpPdnvUX9YVLs5fl1DRh4RCY2rQZ6OJx++J644tu
         HUIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788239197; x=1788843997; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Uxm6VQ8DSjAEX2q/IFs3sWCsxk2wubK/8uzkDDttSgE=;
        b=ondOQLCn/ewyMt3fbRxkwuB8Ud110wuELZe+EsK6mjjaJ3ktDppcKssqRj7BXqxxjr
         Nu8MjDivdIj75OjT98BIEqnJ4CAJXk4OEyQg3UQu7tdLe309Sruy3J1ZrB+8O0GgM5id
         BAeXfADa9n5+Bdi3NlcQNG4Ggw0ACHFLZ8pmrw4NK+zzgh9I6VrXYHgmkyvW0iYfDBxq
         OODNmt70o1/18GTF2kO6ry/Iu84jtguWsgaWsz2a/2jJVHIKNqb5auZTthjlkITTKnxk
         3MSPZab0+jtzUZM8vTc3f+faN49n1PRfVatauKpsPAlz2PZAJr5D8X5xeO3G7wuV8xIY
         0LbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788239197; x=1788843997;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uxm6VQ8DSjAEX2q/IFs3sWCsxk2wubK/8uzkDDttSgE=;
        b=MwiTg5Q20tWdp9AFQbEAoi1reVmpTW5EqQep0N33g239FecCvRk/+8C8UAxogAqQZH
         8YYDaS934VsHTbsFKUclGfmjNNqy3jHuanFKSYhVeS3iLZ/eFl9N0/ibvo4o5nA6D6lh
         4kDLm0jrrD+/AEIYdsYjEvVnIJRaSvvFMRZa6boVVntAcda2lM7wY92aSj0iIUjJPHTx
         6MR6/uU7cFjxbhh/j4sEfaJ3dePHoaOqCsovPnchUPYtui6yZ5pr+5sQIvllEUNe2FSj
         DKg6UFVr30nh1dZyJUlxbb46RdPR1sHTUKzYkBloUgOFaN+xIJZGOpOBv6n/cbk0t5pJ
         5icQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp3/lx4u1VW1NPQJFJGzrIWJkFxLSqXzGIURM5MmgeZsncSk4nsq7YbhsLdZhiVjsJWONFu/I1pB8w=@vger.kernel.org
X-Gm-Message-State: AFuF++kGtiXaitnUKsrxqNB7fdLVtWR2wl3ckbhpcMFU7kGKASJV8ytE
	XEhYCE/2JBhu21Ks3QSCnp4vTo8f9JItUU+Lxd3WD8FYP5mpwOssgEEIYv5JkzLD8DE/8uswZ42
	93fm4ToQd5di+9gCIr5nc1zXHmIz5EEPwMaSsrC1d3A==
X-Gm-Gg: AR+sD10aurqEyhlJA6xkwpMQmFWRg4Gm58cYwVsdZHpDoTG1YBarKPhulll18Pz2gZQ
	/6Fj+PpDgNuqFGGziilkWoY355HJMo3MuCcAlSUVsgq4TsFkRaNtWDiStR5hO8ONhuOq0A0ZNFl
	uJGAHit5M8OdOI1+ZPkOvERWITR2QogytQLPFo2rjTyMM6UCl0C9l62n8NQIchdt+1QTSV+6uXr
	S2Qz+FOuY9D/INxHjYUOYO4apabnCTW4INaso48O/ye59syQ6+nWDunpvcsm3FiWit2ECWgd6/H
	OoghJZzYUtGzpSPoec810PupLl31UkaISU8dQJC2N60wsPio6rNxoDCL1/an56oDVOg9UtghQKN
	sViEwmQOxpeU=
X-Received: by 2002:a05:6a20:918f:b0:3d3:ae1f:d7f7 with SMTP id
 adf61e73a8af0-3d3ae201380mr27905058637.23.1788239196713; Mon, 31 Aug 2026
 22:06:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260829011901.325379-1-rafad900@gmail.com> <991f3432-02af-47e7-b470-b21d36d09ac5@rowland.harvard.edu>
 <CALp66yH0C0WAgUDkXArbLHgwSdrJ0hfQP2id2xhztg-d=qK1Jw@mail.gmail.com> <23099c10-19ea-4626-b1a0-74a64fcb0dda@rowland.harvard.edu>
In-Reply-To: <23099c10-19ea-4626-b1a0-74a64fcb0dda@rowland.harvard.edu>
From: =?UTF-8?Q?Rafael_Alejandro_D=C3=ADaz_Cruz?= <rafad900@gmail.com>
Date: Mon, 31 Aug 2026 22:06:23 -0700
X-Gm-Features: AcwNN1U928dfwm_0v6JwN_YiF55eOuPpUsmYXGUQrlqDWPQMJQaLQMXRP8viM84
Message-ID: <CALp66yGtNY1e3DFdRxMjf1YDnCLrsH_bg4gpyu-A1K0mRgOt2Q@mail.gmail.com>
Subject: Re: [PATCH usb-next v2] USB: gadgetfs: Fix use-after-free in gadgetfs_kill_sb
To: Alan Stern <stern@rowland.harvard.edu>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

After spending a couple hours staring at the code and
asking claude for things I might have missed, I did come
up with a better explanation of how the error happens,
but not why it happens.

I began by removing the get_dev(dev) line I previously
added and keeping a mental score of all the times
that refcount is incremented and decremented and found
that in most cases, they are even. Except in one case
inside gadgetfs_bind():

static int gadgetfs_bind(struct usb_gadget *gadget, struct
usb_gadget_driver *driver) {
     struct dev_data *dev =3D the_device;
// ........
     + get_dev(dev)  // HERE
     if (!dev->req);
         goto enomem;

     if (activate_ep_files (dev) < 0)
        goto enomem;
// ......
     - get_dev (dev);  // Move this up
     return 0;

enomem:
     gadgetfs_unbind (gadget);
     return -ENOMEM;
}
Somehow the reproducer is triggering one of those two
if conditions and sending the execution down the error
path directly to the gadgetfs_unbind(gadget) and skipping
the get_dev(dev) right before it.

Inside gadgetfs_unbind() we call put_dev(dev) which
would be an uneven decrement. I can confirm this was
the problem by first making the change above and
then triggering the reproducer on my local QEMU which
does not trigger the UAF.

Yet, I don't understand why this is being triggered since
from what I can see, none of the syscalls coming from
the reproducer are directly related to this. And these
.._bind(), ..._unbind() functions are not part of the UAF
stack trace but rather, something that happens in between
the reproducer triggered by the usb protocol.

Not sure if this is good enough. I don't know what else to
look into.

On Mon, Aug 31, 2026 at 7:10=E2=80=AFPM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> On Mon, Aug 31, 2026 at 09:58:57AM -0700, Rafael Alejandro D=C3=ADaz Cruz=
 wrote:
> > Hello,
> > Sorry for the confusion. I assume I can just address the
> > concerns here and create another patch once the message
> > is clear.
> >
> > I suppose there are actually two errors but because they
> > are triggered by the same syzkaller reproducer, I'm
> > treating them as one. The initial problem is the UAF on
> > the_device pointer when put_dev() is called both by the
> > error path of gadgetfs_fill_super() and gadgetfs_kill_sb().
> > This is triggered by the fault_injection in the reproducer.
> > I'll assume that one is clear.
>
> Yes, that's okay.
>
> > The second underlying issue is still related to the_device
> > but not itself, rather the_device->count variable keeping
> > the references. The syzkaller reproducer still triggers the
> > same fault_injection in the reproducer but the
> > fault_injection might fail which leads to the success path
> > being taken. This means that the gadgetfs_fill_super()
> > will succeed and the the_device->count will be initialized
> > with 1 as you had mentioned. However, at the end of
> > the reproducer close() and umount() will each be called.
> > This leads to the following:
> >
> > close() -> dev_releave() -> put_dev()
> > umount -> gadgetfs_kill_sb() -> put_dev()
> >
> > the_device->count =3D=3D 1 at the start but is decremented
> > twice. refcount < 0 triggers second UAF.
>
> But gadget_dev_open() increments the refcount (it calls get_dev()).  The
> increment caused by opening the device cancels out the decrement caused
> by closing it.  And the initial assignment to 1 caused by creating it
> cancels out the final decrement caused by gadgetfs_kill_sb().  So there
> shouldn't be any erroneous accesses.
>
> > This is fixed by incrementing the reference on the success
> > path of gadgetfs_fill_super(). That is what the get_dev(dev);
> > call is for.
>
> If you do that, what will cancel out the increment caused by
> gadget_dev_open()?
>
> > As a side note, I'm part of the Linux Kernel Mentorship
> > and I appreciate your feedback! Please don't hold back on
> > the suggestions. Every bit helps me!
>
> Don't mention it; we all have to start somewhere!
>
> Alan Stern
