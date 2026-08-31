Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9246839A075
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 16:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788195551; cv=pass; b=qvvgJIaYXQCyGjpY8v7bO9hMUMyH0xgVXvF95s3xjvQ45iIU2ADMUusGERCfbQv3MSdue3aZ+/RzzwGGY5WAWK/stJHn0zPQUa0XSIbkRTyiwE+ki/cwROgS6Wc7czcVzv0yiRCehwl9AvuwQ43tsNNron6q8HcZcKs5t4yUoXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788195551; c=relaxed/simple;
	bh=O8g1SAHmmnWE8/wxuaWY6UltB+D5JOukYmyaNXWpjfc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SAz+OtEKtv7uridwh6CSrduhXSVrKKmWkB1Snd2hfOmKWDab14F9dpul4zouu8mDOZCdZLTeKfSDh0YgS6zIXGo1eFH6Gl2aaNwKAj14R12rMLSICTmxjK7A7InNa7Tfou3KERDusv3YVw8neoz8VjAegnipL+AT8g5O8HsLiSs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=liRF/oKl; arc=pass smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="liRF/oKl"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc1bcdb3c4cso2802661a12.2
        for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 09:59:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788195549; cv=none;
        d=google.com; s=arc-20260327;
        b=pJIDcvh6ceBF7Sa7T3/9QpphXWzwB0Wolsa88gEYUpY7Xio4LkqgD+Zkw2sbAMzOJn
         0aqWZvPDD37lnlk9cKp6h5vxy262AD4PeT/KbgDNm7R5jXOtY00NR1MO1iVX4ZLEUpWX
         WR8wVfqlwjS13DC7Ns6njLiGWD2/76LOrm8om3AjBMHqkQlW5hT4TS58Q9nwjzIZ2XDX
         FVve7kD3vzbKcpW7b2OfvvFn6407bJSsPz01pKM/JHt0TPsGf/NVsYJwgJYMGSasTy5y
         7Bw052p5Ydzl1/QbfxC0ODrXMU4sVaVu0d4PvIk62GIQlP4mi5HOXFdMRiVYwiAtAy4R
         uxKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Lnj8rGRS4zyy3t2mjmHLPxQEcfwJOCyqagcfDb9wGJM=;
        fh=hwUjLdJwRC8/FZWtKQ+couppR3mbXpApM0ZWkqgpr0I=;
        b=kEOObyVgTodfwppc+11qFBlKrnSWU7gkmWNHtbgU2PsWhPuysB56pqiz99rAVAXmHZ
         XEBb8osZM3p521PNU8Mg0i4BqlPOQxoyPTIsD0dw3vfau+/rqK+GNvv5S+1E9n0oAds4
         LWODo2R2ieyuap+4AybwXk9cCeYbGPoMVzFAAbKng0A4xg8st0yq0d2GWpZlj5FB+jMG
         kMAohR8ltSJKwUtszsnhr/x6j5zO48b4wTDAj/GR1FYufitLHXQjfd1ARtOl+kzjCZsN
         IzF4ADaVy0f5Zn5b1FGeF5HK4Z7GteMzwvDOtZLyoqPOvT6rxGgQ3yQMYtG0cUFTdouW
         5kGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788195549; x=1788800349; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lnj8rGRS4zyy3t2mjmHLPxQEcfwJOCyqagcfDb9wGJM=;
        b=liRF/oKlMvagpo+7K6pHO70AELN95Rg64MHzaA1OJugxawTpOsZoARcXFQKFZCmpdW
         5sbFYnapn2MPnZU0cSNIkhe6BQzU9aIWFWh9yBpBVibrsBqYFO07KWhN/LuYxebYx4Uf
         SQJm+wVuBpE/2nhJt9obqTFVkDQ7o9rczHTHdOeVEgq6ssPyFoYwdQDz79FSUwmyD7kj
         V7A9j5BGNq1/n1u83af4FTRUye7exSdSdqREhk7YUnpCO4R29+5l85J1lPvKJvzf59fU
         1Rt3tQwfQSgsi3I9pi/cLs8oOUjyBjnJvLbjIj37SzYDiiUjUFN/AtTOB4Disou2uYZa
         vgbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788195549; x=1788800349;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lnj8rGRS4zyy3t2mjmHLPxQEcfwJOCyqagcfDb9wGJM=;
        b=HN+POaqZpwvRHxMIIsVoM+53LdMro515wrUoB6sWOp7Te+0jZXFJytIYtqyI/LPgCJ
         M6YuoKp7w55YxrpL/ihLoLXiIHNXLMNP8jcrK4xHXHV6qmvHQM4F4vqkGIGdjgCsOu3O
         bEzujD/oYmyeo/rZLu+i3ZmIuOd0g4mr3JRJQAh2ICsz4+OWFM671yrhs2ujitq3Hc5O
         n48hsoBziiVW50b37X+wj+ONX22b9zzkxs97d/j8qhAe7/HL2BWEjIdfq5mXbXeNJwDv
         cVd+IhWXHiCr5O+YSD7aBHbYxcMqb8totRem3Ad2KtGQR+XK72ooVF2hDy4k0SXT6Zav
         EWdQ==
X-Forwarded-Encrypted: i=1; AHgh+RpFJPUBDOkQnw9EqyfMi8BlEG7V6E+0pu03fMURwEMQLixLtSNOLi/t1RHz8EM8239NKv+ZuSsFKvU=@vger.kernel.org
X-Gm-Message-State: AFuF++m5z9FGvJ1WIyaAZQ8Gl/BAV4zYSHQxDwEpra1pHABaLtwKthC+
	lvf3LK9eiZK7BtBN5a/0f0M9OB7JqpC4hDlcEiWgaUf2ZpMgXRExUDihtEFOfK7ohwOLXuULHQj
	Vei9s7+1OThPHLb0iMhG+znvtrFu7d8PQ0oDR2Yw=
X-Gm-Gg: AR+sD102ZnCEToVL1+88X+qTRtDb4ePT4AJsbdd45KdxS0jSWEOqedbKlRTzmOx+7OR
	vGa0c8c1A0pIVUR5B3C4ep9hu4fsSBDBJu+uFV/s8D9ydpD1GC978MfrTMY+oJ+Ix69Ri2oH67/
	rcVsS7ggPK+fUNhqAFjzoxwp8olqLtKgmCKSE2IyeSpQP4ACwTekX8NPxuYdelFjeVU9LecG4PZ
	D1S/m3tCWjkehgHoro1xdSzw4KoBWUy6Uy1Or04+Qz6uEzjaT7qDTJxLR1KtBISloiN/R73Jgv+
	psCdKe2H2pRzgtrsRxhzZalHrBrF8Q15I5NwcqyOIg2yXUN8JxffK76YvivlYFBb5qaGYx5RN5c
	gATk=
X-Received: by 2002:a05:6a21:a34c:b0:3cd:2e96:5929 with SMTP id
 adf61e73a8af0-3d7af831e7fmr3734718637.14.1788195548626; Mon, 31 Aug 2026
 09:59:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260829011901.325379-1-rafad900@gmail.com> <991f3432-02af-47e7-b470-b21d36d09ac5@rowland.harvard.edu>
In-Reply-To: <991f3432-02af-47e7-b470-b21d36d09ac5@rowland.harvard.edu>
From: =?UTF-8?Q?Rafael_Alejandro_D=C3=ADaz_Cruz?= <rafad900@gmail.com>
Date: Mon, 31 Aug 2026 09:58:57 -0700
X-Gm-Features: AcwNN1XU52XwzNG3k-NXOURpKqLJZm2DZf5C7B0JVw987cwLk-O_rqZRoKbdZmE
Message-ID: <CALp66yH0C0WAgUDkXArbLHgwSdrJ0hfQP2id2xhztg-d=qK1Jw@mail.gmail.com>
Subject: Re: [PATCH usb-next v2] USB: gadgetfs: Fix use-after-free in gadgetfs_kill_sb
To: Alan Stern <stern@rowland.harvard.edu>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,
Sorry for the confusion. I assume I can just address the
concerns here and create another patch once the message
is clear.

I suppose there are actually two errors but because they
are triggered by the same syzkaller reproducer, I'm
treating them as one. The initial problem is the UAF on
the_device pointer when put_dev() is called both by the
error path of gadgetfs_fill_super() and gadgetfs_kill_sb().
This is triggered by the fault_injection in the reproducer.
I'll assume that one is clear.

The second underlying issue is still related to the_device
but not itself, rather the_device->count variable keeping
the references. The syzkaller reproducer still triggers the
same fault_injection in the reproducer but the
fault_injection might fail which leads to the success path
being taken. This means that the gadgetfs_fill_super()
will succeed and the the_device->count will be initialized
with 1 as you had mentioned. However, at the end of
the reproducer close() and umount() will each be called.
This leads to the following:

close() -> dev_releave() -> put_dev()
umount -> gadgetfs_kill_sb() -> put_dev()

the_device->count =3D=3D 1 at the start but is decremented
twice. refcount < 0 triggers second UAF.

This is fixed by incrementing the reference on the success
path of gadgetfs_fill_super(). That is what the get_dev(dev);
call is for.

As a side note, I'm part of the Linux Kernel Mentorship
and I appreciate your feedback! Please don't hold back on
the suggestions. Every bit helps me!

Thanks,
Rafael.

On Sat, Aug 29, 2026 at 8:05=E2=80=AFAM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> On Fri, Aug 28, 2026 at 06:19:01PM -0700, Rafael Alejandro Diaz Cruz wrot=
e:
> > When gadgetfs_fill_super() fails, it's error path calls
> > put_dev() which drops refcount inside the_device to 0
> > and frees the objet. But the_device pointer is not
> > cleared, leading to point at freed memory.
> >
> > VFS will then call gadgetfs_kill_sb() after mount
> > failure leading to put_dev() to be called on the
> > already freed pointer.
> >
> > Fix by setting the_device =3D NULL during error path
> > before calling put_dev() inside gadgetfs_fill_super()
> > so that gadgetfs_kill_sb() skips put_dev().
> >
> > However, if the fault injection from syzbot failed
> > and it began the open()/write()/close()/unmount()
> > sequence then close() and umount() will each trigger
> > the refcount to drop once via put_dev(). This will
> > still cause UAF since refcount is only incremented
> > once on creation but decremented twice.
>
> I don't understand this last paragraph at all.  What fault injection
> from syzbot are you talking about?  The earlier part of the description
> doesn't mention syzbot at all.
>
> Why do you spell "unmount" the first time with an 'n' but "umount" the
> second time without an 'n'?
>
> Is there any reason why close and unmount shouldn't both do a
> put_dev()?  Doesn't the open increment the refcount to 2, so close
> and unmount will set it to 0, causing a deallocation but not a UAF?
>
> Why is the refcount incremented upon creation?  Normally refcounts are
> created with an initial value of 1 so they don't need to be incremented.
>
> > Reported-by: syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com
> > Link: https://syzkaller.appspot.com/bug?extid=3D4a5c87a01894ca37f25c
> > Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> > Signed-off-by: Rafael Alejandro Diaz Cruz <rafad900@gmail.com>
> > ---
> >  drivers/usb/gadget/legacy/inode.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/leg=
acy/inode.c
> > index d87a8ab51510..77efa984ce84 100644
> > --- a/drivers/usb/gadget/legacy/inode.c
> > +++ b/drivers/usb/gadget/legacy/inode.c
> > @@ -2059,6 +2059,7 @@ gadgetfs_fill_super (struct super_block *sb, stru=
ct fs_context *fc)
> >       rc =3D gadgetfs_create_file(sb, CHIP, dev, &ep0_operations);
> >       if (rc) {
> >               put_dev(dev);
> > +             the_device =3D NULL;
> >               goto Enomem;
> >       }
> >
> > @@ -2066,6 +2067,7 @@ gadgetfs_fill_super (struct super_block *sb, stru=
ct fs_context *fc)
> >        * from binding to a controller.
> >        */
> >       the_device =3D dev;
> > +     get_dev(dev);
>
> Does this have something to do with that mysterious last paragraph in
> the description?  I can't see any relation between the two.  In
> particular, that paragraph doesn't say anything about adding a
> get_dev().
>
> Alan Stern
>
> >       rc =3D 0;
> >       goto Done;
> >
> > --
> > 2.43.0
