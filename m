Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A998E47D451
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 15:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786030272; cv=pass; b=qAyqIlVDa39jJlqFHCpP1ENsun4Vce3NPYeiaEBKI9rZB6dpiDgxmQXsXAkLSsDYx382oQ/WKCgdR9Cndj7ln5zY6ZjJLRUBA5NECG1hlvK+5cdncTLIX0/+i5fwkx569rFcKTV9krEueLuBt5ocU4C+xzKNXnzDuv3v3k1L8BY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786030272; c=relaxed/simple;
	bh=fLiER/vmdWlHF+9sZpvO+y7EIGs75XRtDb4SFTSZC4Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T4abig8e8fLg2Sx88GXNRP3o3yIEGISCKkZMppoRg6ap9O1kfg5NadHkjQar1Yc+zch19yC9bKUr1oLnM+FY4liWG+Z5XWSnJCQIWUwLQdq9TMcRkNSsjsXWF2WpjWPGVy5fdDhIC8zDfGwe1vpOi/vwd61QIbK0OAm6u3ZznTU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CNN2H7uM; arc=pass smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CNN2H7uM"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7ec3b429a3aso1730530a34.1
        for <linux-usb@vger.kernel.org>; Thu, 06 Aug 2026 08:31:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786030269; cv=none;
        d=google.com; s=arc-20260327;
        b=Mm9wxtbK1lkZuILsVTdGvWgUXOg3xdzcNHsnnR6VRwUudI8Dv9puSW/ep561X9/9rI
         cLHmrerXR8XUk0/fnlgzd9uxut0O8NGjbHX9E5fFbZzIgj4FvnKBkVQ3dk16d/q/YEyh
         kzJNukMWpggljujO++nNdzaK4yNzjYPzGMeM94rzmQ/zMOA+gUEw/n3pde39ycmYIEub
         lrcHeCSVW/DTu6BmqguvDQOp7oj/l9n/vdrpNS8FkK1Joz3e09GsXTs7eOR/QR/V6z4H
         7/AYaOg67MwrqlguCk7T0Jvze0BK9LZWxAW40LBtgHo7vYwOGsc2HmGxnjpUySp/aiFv
         k7FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OeqDu1CsfKPxF1E2KpHBYLzflhrd36yx3OXDIydobwM=;
        fh=DjnoDMKMHIriSJAEsNnQGrdoGprl0pHW7UGucztMXMo=;
        b=qjjQCshPHfEGJwJWzzUfo5ai+dkkh4rffH2pCi9l1eV8PUO2oJDFpLxiBjjBlsKhhq
         D7i72lVKkBTqb0kYT+kCmXZO1VOGnpUB3ZtJe2q6ta+fk1xhfjM7NxQcI0WEpji8dTH1
         ACXofwlluZRAVNRA+8HrWoOy+Um1BD9LgURowCLA8uFUbgUwvphxDdng6dH1nn5NQQHv
         FBvHIma/OETYCybdcTPF40zstt0ceCbDRmuVE3h7C8HEwtJI+0quTToH3hVdyvPnjaXy
         CBKDGhD8gaTH4pkBQeg0CuuZuTipkEyKUza3YxNfZJSfnx1CVEoLLN8nbOmJ2WHJnl7k
         42Xw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786030269; x=1786635069; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OeqDu1CsfKPxF1E2KpHBYLzflhrd36yx3OXDIydobwM=;
        b=CNN2H7uMbVOCqjUle3FZD+rHqQ3hRA2b4hnVSYUs+/zbJxdWDce2/1SNMRYjcnESTu
         NDjAVGxEaSsYYVDEJ+342rH3mvj8ZrAQGpRAm1mM+Wau+ys0fZ8MRK6ycEmJGRbaRvv3
         dgntvXRnhEq30qiEFngPey2v5+WcWVfBxaZ86rkYwqsXzaCwQw9REQgo5DXSvf2ad+qN
         YhL3hkAUmnALqD8GC8UU76KV/HwmfiGQvutUSPNbEF05NAaQFh1KeuX1uJ3vXHNRWbRN
         TG3jEI1vpt499ZVU7FxWdjX3Xe+l1noVL3tWgqOSnBH5F2LvI7I6TOIzNsiM6N6hElX5
         iICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786030269; x=1786635069;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OeqDu1CsfKPxF1E2KpHBYLzflhrd36yx3OXDIydobwM=;
        b=oy8ytJEQ9lpOCdSN9e6n0zd1RkQLGGO57KTxgFeFV7X2lKXCztwpVW1LgzS1I725WQ
         bLkTO2l/rLe8EFMvTzKL9gfSlGLl7xAncKZd5IQKaq+m0hLLfGmNdFKx5lcG9A30MtXb
         /EFagMoXHlyj/pAhQgfHht55ymiLCVlYpQgVILI/JlhT5tBTibJVdJjcQwssXl8RiTCT
         AzvuDeMIXEHKtCmQDhGWeYnkPDSq30JEPr/SK/zT3hAHHshW2vNZYZEW2nSeZ7p7u4eT
         zFaMsmDf9NR+1L7qnTCVciAp9kVCaLEW0XEyLKLV9c6b7jJ2FqQuSHFenXL8Vnr15Tb1
         E54Q==
X-Gm-Message-State: AOJu0YydO0Qms6psDEKYUHKzzx5d1we9uOw9aXjKwhW+IcCJXGY6aj+8
	G9IAWdgFDUGrFgVyShaG/a+kQ885kC3DiTJRw7YDcXZ/nYcl7fKRcJgKjlJYoKRXJkdQvLArylE
	7JOycnusN9VTc4K7P5kqNMLuX8bScFWP1Gd12DXps+EErtlIn5GYEygI4
X-Gm-Gg: AR+sD12C99XGeInkzY6d5DzRBKAv21raAQNoJuVChPM7VIxWwbOtvRL7t8HOAkQIwuO
	KbDV+1FJLS+IDXIum63TvKd3qDKpQ/3RPFj9ycCJRHm+3ivP7g6ZmUOwMaanye5ypfHW9NL5KyP
	YgCC6g967nPeDf6UICHTn/Pol1B7mRXtep+HPbxO0Rt2W5AvXX1b/qkPVouVsLB39IX/XrpC0sn
	8+I7mvXEZCWaGoiCJ99HVeulLxAwKcOlQN6GyKF5kvI2gR1o2krxVdMNZmJDUyjK6eBVGaIYe6a
	2C6E9QUdGRVjwQe/eSf9np6KjY4s5ABAalDwaJTnhFXR+Me8TWIYkL56H2jHfR+xCFxknQsWWKm
	UuJgUOB2KUp6wfEoKjjUWZCvpvMvlr6Wwz0VUq/toRZJVtCum+u+0qD47ezUYsqZNJ9BFMXzRoJ
	mTckgtYq9rV6GH
X-Received: by 2002:a05:6830:6685:b0:7ec:2fe:1ec0 with SMTP id
 46e09a7af769-7f1e5ce9482mr10656413a34.4.1786030267858; Thu, 06 Aug 2026
 08:31:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2026080322-obsessed-daringly-e6df@gregkh> <20260806142511.2337081-1-nogikh@google.com>
 <2026080617-gave-widely-c5dc@gregkh> <CANp29Y7R1OzK3mo_i6uBxLV6zCgFUVxMgrfozAT-QNivp+gHMg@mail.gmail.com>
 <2026080612-whomever-abide-ff93@gregkh>
In-Reply-To: <2026080612-whomever-abide-ff93@gregkh>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Thu, 6 Aug 2026 17:30:56 +0200
X-Gm-Features: AUfX_mwrhX5F-gcC8SmlgH523aI5MC4Rm26FumdWLixY8oAPIrxsHN1tYB6voys
Message-ID: <CANp29Y4rWajhxvjR5Pag27m1+UiQAJ4LN+o2n86+=2vquaCpBQ@mail.gmail.com>
Subject: Re: [PATCH v2] usb: usbtest: disable dynamic ID support
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kees Cook <kees@kernel.org>, syzbot@lists.linux.dev, 
	syzbot+7e1e5911f9eac50bedc7@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 6, 2026 at 4:43=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Aug 06, 2026 at 04:35:12PM +0200, Aleksandr Nogikh wrote:
> > On Thu, Aug 6, 2026 at 4:32=E2=80=AFPM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Thu, Aug 06, 2026 at 02:25:11PM +0000, Aleksandr Nogikh wrote:
> > > > The usbtest driver relies on the driver_info field of struct usb_de=
vice_id
> > > > to point to a valid struct usbtest_info descriptor. This structure =
contains
> > > > essential test configurations, such as endpoint addresses and test =
modes,
> > > > which are required during probe.
> > > >
> > > > When a user dynamically adds a new device ID via the sysfs new_id
> > > > interface without specifying a reference device, the USB core initi=
alizes
> > > > driver_info to 0 (NULL). When a matching device is subsequently pro=
bed,
> > > > usbtest_probe() unconditionally casts driver_info to a struct usbte=
st_info
> > > > pointer and dereferences it, leading to a NULL pointer dereference =
crash:
> > > >
> > > >   Oops: general protection fault, probably for non-canonical addres=
s
> > > >   0xdffffc0000000001: 0000 [#1] SMP KASAN NOPTI
> > > >   KASAN: null-ptr-deref in range [0x0000000000000008-0x000000000000=
000f]
> > > >   RIP: 0010:usbtest_probe+0x3b9/0x1280 drivers/usb/misc/usbtest.c:2=
822
> > > >
> > > > Because usbtest strictly requires pre-defined usbtest_info descript=
ors
> > > > to function, dynamic ID binding via sysfs is fundamentally unsuppor=
ted
> > > > for this driver.
> > > >
> > > > Fix this by setting .no_dynamic_id =3D 1 on usbtest_driver. This in=
structs
> > > > the USB core to skip creating the new_id and remove_id sysfs interf=
aces
> > > > for usbtest, preventing invalid dynamic ID entries from being creat=
ed.
> > > >
> > > > Reported-by: syzbot+7e1e5911f9eac50bedc7@syzkaller.appspotmail.com
> > > > Closes: https://syzkaller.appspot.com/bug?extid=3D7e1e5911f9eac50be=
dc7
> > > > Signed-off-by: Aleksandr Nogikh <nogikh@google.com>
> > >
> > > Shouldn't this also get a cc: stable?
> >
> > Is there (in general) value in cc: stable without a Fixes: tag?
>
> Very much so.  Don't you want this in stable trees so that your syzbot
> runs on the older kernels don't fail horribly?  If not, then hey,
> waiting for newer releases is fine with me, but I got the impression
> this was a good thing to fix :)

I see, thanks for the clarification!
I've sent a v3 that Cc's stable.

>
> thanks,
>
> greg k-h
