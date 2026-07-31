Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB50E3F39FB
	for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 11:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785496392; cv=pass; b=HO79wFVvUvMSZFKaE/TnWFiG40KZzQhVJCHwOZYFsuUZLyDcZ1+sfKoVUY+gjjy1D04HYIaq2lIYIMQrRIL7vjgsUuulI6cIBrFbwJZbXfhbXpcPWdNfWEqBoosDUNKBqo57bLaUcLna/HUYCrE5ATrCMdfkvWNCJ9S4rey7dAQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785496392; c=relaxed/simple;
	bh=U6FWqmAjMXu81c1lJrojTAumO8gtbpTP4J5Oe2U4Ces=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hcfNLW36DSFvmyXGTdjsWQVd2C/W+DHqkpTcao3WPVXyApMAnpTKiKUg0LSAfcjfdGnSt4ApukYjvKVajd/P2Ys2OM/AxqMM+H5huyQsPPPhrQzGFACnRF9BPKsq6WpteTW0zU+trg+23hOzLX+JNdpQXAW7rY2bKCVm8B5CAoY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UUYkKrs4; arc=pass smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UUYkKrs4"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8143daf89c7so8230117b3.1
        for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 04:13:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785496389; cv=none;
        d=google.com; s=arc-20260327;
        b=qE0BfDRyfVaWxAVMGdSK5e6cLjfVOq+xp8UHcB1+sjkD5pZIwumyfsDvhVsYNQCUT8
         XThk081kTqcx1OzwIi3DU/2TUyUCfJ/VKUnK/r1ZjXBksRFSIKWvvjb/gM2DKowxrc+w
         SH67SudONYngzl/nyLNxloMV5i6DSFzbxOdDOsph+pWOiAb5jpdRp62EL0t8+Ws1U/Wd
         bPjI+pqtG0h4qF4WqwmYjtmsVe60nj0qf9S281BaJ8K9RLwm+UI//qljjv/V9Sll3UCQ
         8sPKj34/YkEd72N2LuvVsl2WacQGCBODjZO/0pD8fFrm4PQZvhG0Ks5fBuyrKf0lqGQ9
         VSeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2p0EeN6dXhl+wQoCj1GbVY2xW8MN67WT2/eOXo99EpY=;
        fh=//NJbMrWCFXFC/qQdlyb/6rS8VgiEuWzyODeZiaQ0K8=;
        b=DzJB59wZAsOD8wz+jJhQ/jisfQZ2ACoYptVmT5XfljfBkUkqOP6vDrnLnv+xsxyAm3
         WcRcirBsZtjjcM7batGejkX4YbRgJOKgLG/4wFIVaganFOk2CSFfIQi0Hsq/0RewCIiF
         0TZvAofbNbqyUBEHTt/HgAdpsqcGkAbEJhuooELVbfaRcMPB32tnomM9GCVdNmBOoD22
         Kfn9d26NSRe8MhGPnVrO1IX0pyKJP7k/FfYtic3/s6i2MtrDrrElT2C3qTIvOVmuj126
         2nIOOES3gyY4avlWyKmeyCYlgiXj8I4pfvYk1FK46wfNPlNw1e8GpFbamRnhHyvC5vbI
         3asg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785496389; x=1786101189; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2p0EeN6dXhl+wQoCj1GbVY2xW8MN67WT2/eOXo99EpY=;
        b=UUYkKrs47BeqOXMyqzl+H5Vi0+MeTucSagDbV5kafpRMs4g4yM9T4PQskECcN3qMOS
         IGuoxEh9lPhUzkDruKaBBjwVA7BlgjoWpfQOUNdcMbr5zKDt48lSdeyMRwF9QzK77EVr
         EgyoPhLGWBeqJpHb5kdTWKCzxURks55czTIQ5w+NRk9OLjQcwTESNIS3Cya4efDvje7h
         eNfRHYb6fFoH+dF0r7v958Bed6/e+SBQ4BJBDh0rMGQ38EcpcrDNLoBeu7+znU0ny+Jo
         JMxQFeIhtuNvwbSo8X53Q0pMagQQ0/bOsELKeaeOaepMpsUo5QekILzHteaxHmwuIe6Y
         /Yfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785496389; x=1786101189;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2p0EeN6dXhl+wQoCj1GbVY2xW8MN67WT2/eOXo99EpY=;
        b=h0kjq1eBLQ9q82Z9ny+hmwpledMDFJ+L/fKjElQI86PrYKj51u7fIMQMC81aIyMG2h
         BAuKGNOhydLZzdvj6P8hqyU23nueaVOh7TFtj4j5zg7KjkkZ8YMhv0VafCeiq5hooJbn
         wuEYBhId4VcMkbsP1AUlYMhB1BzbUjFAQui42bctUZw3y5DxyZcLjLEVE9RCVgAtnv/C
         J1YMwQtWTt8sI2T60LMI1v12wcUHrOIbe7rc6KCsyodpUuiB8EzEzxfppsSbue8bmROn
         u+edzPjqUfJZTKD0ELFrOmpkg3spioGklp44Zf8r62e0kcZxcPMFjszYXYwb16bq0puE
         D0UA==
X-Forwarded-Encrypted: i=1; AHgh+RoBSiDJUhKeB+9069khJXrHMGdFzhxrHmOP2yJiK+gu76o5qA7+Bg+KtfBLPeNS5cysjOS3rk1cmZE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIOAPx3VcZA8EwZ1QYEamruKBlSr8iukxcdU2JA/cc4MQ5mRk4
	t/xDMxdOnHD1ABgdpfOPIMJNDhTX8Fkq13JNtnAhkXekAH+ZNVlRZ5zyRkCU+OCqMpAYT4FLs+Z
	J0v5yxeDWY/n4bVkOYigFGgEi0iTCtos=
X-Gm-Gg: AR+sD11bu1RKgju0A29LE+8hJPwKauJ7nFUmYqihfAQHxOnuGlsBYfLUfSEPoJLPJDy
	1xk3Rj5To9CebmfsMTOGmuD5nhEFIGRNjAQodAF0ErNLr4DHK5z4GqZV+ogDtLZxKGZyi2frxb6
	zOHWXT2BmgoOCcrwMKZ64uzUaRF2zcipqjFB0pWPBa2vg9bZTJU4BwmcubbumBj4hkgnU3oZSLS
	5q+yG5kaiWRYFlxxf3wqizOXYcIC2dOeYwWDG/VhbzhqI63eJdf9X1xeS4aX6bTQAzmTYyAoTWz
	jFKP8i2BCTM4v6WTBYpUW22yuR7RfHH3EjnZ8u1w7hiwtDi2wxUqbNg8+1xs/tr5n0ZzpnUG2uA
	ecxGstQyBtwMAN5oQf5Ll+/Q79ok3Y1+3
X-Received: by 2002:a05:690c:6982:b0:81e:a471:e893 with SMTP id
 00721157ae682-81fcbad5eb5mr12438657b3.24.1785496389404; Fri, 31 Jul 2026
 04:13:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731091316.14145-1-kartikey406@gmail.com> <2026073135-tiny-frightful-ea54@gregkh>
In-Reply-To: <2026073135-tiny-frightful-ea54@gregkh>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Fri, 31 Jul 2026 16:42:57 +0530
X-Gm-Features: AUfX_mzISKbKNo_YRWuuke0qJIGSVjf5fP_mpuR2ADukmbY4KR5yebLAjY0vk2Q
Message-ID: <CADhLXY5J1qGJM5FszxHJ_VXoVRBx1zOUnTESZmG9hjOO9EaSkQ@mail.gmail.com>
Subject: Re: [PATCH] usb: gadgetfs: fix use-after-free in ep_open()
To: Greg KH <gregkh@linuxfoundation.org>
Cc: viro@zeniv.linux.org.uk, jack@suse.cz, brauner@kernel.org, 
	mjguzik@gmail.com, kees@kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+df9e891bf8ea586f846b@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2026 at 4:08=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>

> > Reported-by: syzbot+df9e891bf8ea586f846b@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=3Ddf9e891bf8ea586f846b
> > Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
>
> What commit id does this fix?
>

Fixes commit: I'll track down the exact SHA via git blame
on ep_open()'s lock ordering and resend with a proper Fixes: tag.


> And how did you find this?  Test it?
>

Found via syzbot fuzzing (KASAN slab-use-after-free),
not a manual audit reproduced locally under KASAN in a loop,
and confirmed via syzbot's #syz test against this patch.

> >
> >  static const char *CHIP;
> >  static DEFINE_MUTEX(sb_mutex);               /* Serialize superblock o=
perations */
> > +static struct dev_data *the_device;
>
> Do we really want a single "device"?  Ah, it comes from elsewhere in
> thsi file, that's really not good...
>

I don't personally use gadgetfs found this purely from the syzbot report.
Happy to help check whether it's still in active use anywhere if that's use=
ful,
or if you'd rather this go toward removing the legacy driver
 instead of patching it, that's fine by me too; your call.



> >  ep_open (struct inode *inode, struct file *fd)
> >  {
> > -     struct ep_data          *data =3D inode->i_private;
> > -     int                     value =3D -EBUSY;
> > +     struct dev_data *dev =3D the_device;
>
> Why isn't this coming from the inode or file?
>
>

Fair point; it doesn't need the_device at all.
I'll derive dev frominstead (setting sb->s_fs_info =3D dev in
gadgetfs_fill_super()),
which is properly scoped to this inode's mount rather than relying on
the global singleton.


> > -     rc =3D gadgetfs_create_file(sb, CHIP, dev, &ep0_operations);
> > +     rc =3D gadgetfs_create_file(sb, CHIP, dev, &ep0_operations, NULL)=
;
>
> When we have to look up what a random parameter is, when you set it to
> NULL, that's usually not a good way to write a function.
>

Correct, I will remove this no longer needed once I pick dev from
inode->i_sb->s_fs_info

I will send the patch v2 shortly

Thanks

Deepanshu
