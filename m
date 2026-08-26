Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52908425898
	for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 13:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787751022; cv=pass; b=Igzaz3O2zNO+R04JuXtdm0gPPy8e5f48TZFdQhJCTuA3yDgSW0QdVtTjAJx1bxIyynIJj0u+iD5WS9bcKPOi2d0NE/Gybo7ez1f2xI4SYKHjmZjTLOCPN274FrVK2tNxpctfuzV5fu8V0iricQ2nK8sC7cpxqn/DfPCkneDVTRw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787751022; c=relaxed/simple;
	bh=4+QUItlyexEop5K9IQobQUIL/V1hyVSBQdXhjfeRaeM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RcYUW150vhgbWvXXMXy2TvUSi2Neinn1JjsOWuC65Ii9QC3v9Pf3ghTwnnL/P1SqRWY826DSoP8WMNS+LKFhZAB3f6F+6yfTnJ/T4LmS17ANrFTuDYYj03V7opTifvhzXI2Z6D7eRvqQoaaP2LH5Dxo/jSis6T6UvobeSak6RAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OmCWZKlY; arc=pass smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OmCWZKlY"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7e9fc3de7ceso722665a34.1
        for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 06:30:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787751019; cv=none;
        d=google.com; s=arc-20260327;
        b=kpinj1vms8Fpj+u7ouE06AlDBnmRUWBQS3a5AYUGrHKmq7zREAhOl2dBWbkGfxlE9Q
         QsHGb4ha8TQPfSLXZpVsXTBRtWAquVn/2j8lju5dt8XCGQ5o16lMc9gLpda252wfaJQu
         7RmTLUiClar6FkvRizT6xz4UrWTim0iAJj0SbEgcPtmkru1fEcyq4fj+EBA6uEc30xNC
         rQ4mNnDa368MLs7B2RXViVPmBBM9RAqLQFvJdAoAcx/6GWySBscxEeCwq2BoAfho9iDJ
         77sxtDsn5QoI0JpwHzlv6mSqr455PXOQglFyD/3UbUxEL4IMJY+WI3HCVpGxMW540tNF
         oKmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tGBMKdRDFuO6C8bnLpIsM/DfKNnhCL7OaTYDIwnax48=;
        fh=UwJhbn70GQ9qMw7F1KKwehe3Gm9CODgE73b58VqJENI=;
        b=CL3aSUKsr7EG0GjLYZ9UXfEBr1nFs7Vfjt8/Xf2v6PktTUVxKUrBHFa5J5FPUlypFM
         I0Mg7/acGOy+nhatA7r7rmYIBU6PkfE2OtCpRjQDpJamP7MTZnQ7ybzyf3dDXIw91trm
         mc4kzJZ1yG42dxH3BRCiHNyjbmjux1bK7KpYnw1a9NKwlbWOs4sVOvNHqAcbx+tQQu+H
         08+8izMbYSFygUCm0SeJ4YDrajx9qZdrBk6KI8lWhXN7ck1bAfzEHOCpU07XZ4q30DUs
         OUGph8ysgM1n8Q5UWMYxvDxQUxZxZ6ME2IkGcVHoLncWYSjf5V5UFprM0YTBtkPxSmDO
         9Q/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787751019; x=1788355819; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tGBMKdRDFuO6C8bnLpIsM/DfKNnhCL7OaTYDIwnax48=;
        b=OmCWZKlYw1c+XOFGoXmEYq9Na1AP7IYP+CmM5TrHwzPd7lLh3OCLBqnZRu2aXMillW
         jxnyVTcItuGF5OV8CHGffrhr44Mb3nt7rgkbXcXfI0hjGMjP1qHJReQD+S5gf2pjqiMG
         ykFb/jFDtpfSzyi39BnXYE/htM3FXPvsgPfKyZC0u0Sp2M6LtaUf99feZ1TQefAnTnqs
         6QiRLs39op0A1CuuDC+0TAnx1zmaCd2bkD1WSjH+Ja9bpWgwlw0EswQXU7/CvZsUdp6b
         l6rVR37V0+8tMke/7FI78BIJ1ytH1P8KrJxKMNkOs9mEeQQn5Ig44Zm2CZesQ8llJTAu
         iYyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787751019; x=1788355819;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tGBMKdRDFuO6C8bnLpIsM/DfKNnhCL7OaTYDIwnax48=;
        b=Ab56wKAWe9nnlejtiG5I7ZbnyY9AGz4ky93C6VvhoBh2beXtMQPaN69ko4gpfv3ApU
         d9Aajj1Jvb8KHMQv8kFt4rz7/lxui7GGCb+mUbxUCZ6Gf2FfzoCheM+ep5UhaItGHMio
         5jaf/Ps20tBYaS8UsWAhL1SjUqq1D52xmpx7cDYloMK85Ix3CdZc/MIZoKS0FoLFJ7rl
         oxPYOSVfKVhRdxAMRIXjOVJWOijnJ/zdCPC2A9cKrrvaDmtHrprz67BqyxHDDIvPAHTq
         nDt4LtSbliADsV1CDrBPZ5KQazlBzNnS3lpGp9uMbmb+GcUN08dguqK78DUXfSZhNc88
         i5FQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr4WqupbvgZBsO7Vy8i1jWAp3Vhe7igq0Ujoyb06+0XtA3tI8cME7H/S6dQE9KkFGrrEdIW2MI5qYI=@vger.kernel.org
X-Gm-Message-State: AFuF++kint8PRZYle3BllZ30+VCOWkEJmYBENjoVAVxPGpqgSD8R4J2U
	Y4EwOvHSE7KwLeBUfex0n/XNpSybmzSIZ+ih02wRBli4TdwglhQRnqULNvM0SbWBooypgF1S+nu
	YH69O6mGnvYKFPAMQoaYuOQK2Et6EOtIX9mec6x+V
X-Gm-Gg: AR+sD10mN7cdf72zhKIgWTw82fx+THnvrg6yaeK4iOJfbDgbdyZAzyVkMNFjSzDpF4t
	fW96q8SzaZgDvT7tAO3DNWDDfjfdaMK54TvGzF8rZUwrxf58moifucyLcP0qoQiTVYC8UlNgubX
	Npq6+IzTrvPRVD9sblzj7Mwk6V05NBvZNI97tzcd3ETHXHtR3zke+kFEYMTZ7Qzhgui1vMqk+jD
	3ivCgKm5tD0dVepO/XjpCgey2wyX3gnt95F7FPe3SaPlWRVYWqJiE9MYA6d2LrTsUTp94RE0oe+
	nt0lT1ZKAGUqyjHdapLbO4LqEyULLtpTqwjxq2f629VkimKWERu1QpSNmJQZe0Y++t6EUdmaIRp
	8AzyYSrHHtyt8j5RKczspC6YoOQcrjgQmRKzqsTqIHQ9TC11hTQb6LnJb+gIrKiATFlzVU78o56
	cSjEDzbqt3FKau
X-Received: by 2002:a05:6830:6690:b0:7e9:df1f:6a19 with SMTP id
 46e09a7af769-7f4c4bf0713mr7367085a34.7.1787751018570; Wed, 26 Aug 2026
 06:30:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6a6a966c.86abc875.e5c3d.0053.GAE@google.com> <6a86a5b9.4d75e56a.c9a88.0036.GAE@google.com>
 <2026082038-providing-huntress-55e6@gregkh>
In-Reply-To: <2026082038-providing-huntress-55e6@gregkh>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Wed, 26 Aug 2026 15:30:07 +0200
X-Gm-Features: AcwNN1VEiQcaoAs5WNLCReb8twNJ9S1NHvJs824bh052v3ANnZqGaZ2BMBC8xIA
Message-ID: <CANp29Y4L4-W9nx1DHrkEmn=9oDr=k_A5FLHcKLo6a74DL-X9fg@mail.gmail.com>
Subject: Re: [syzbot] [usb?] kernel BUG in register_netdevice
To: Greg KH <gregkh@linuxfoundation.org>
Cc: syzbot <syzbot+85ede281798faf736677@syzkaller.appspotmail.com>, balbi@kernel.org, 
	kuba@kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	mcgrof@kernel.org, syzkaller-bugs@googlegroups.com, vvs@openvz.org, 
	Chuyang Wang <wangchuyang2003@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 20, 2026 at 9:08=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Wed, Aug 19, 2026 at 11:59:05PM -0700, syzbot wrote:
> > syzbot has bisected this issue to:
> >
> > commit 425b9c7f51c98443db71ad679893725483b21196
> > Author: Vasily Averin <vvs@openvz.org>
> > Date:   Mon May 2 12:15:51 2022 +0000
> >
> >     memcg: accounting for objects allocated for new netdevice
> >
> > bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=3D1212ba25=
580000
> > start commit:   e8bf40d15402 Merge tag 'chrome-platform-firmware-v7.3' =
of ..
> > git tree:       upstream
> > final oops:     https://syzkaller.appspot.com/x/report.txt?x=3D1112ba25=
580000
> > console output: https://syzkaller.appspot.com/x/log.txt?x=3D1612ba25580=
000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=3D46f568dd8d7=
95f6
> > dashboard link: https://syzkaller.appspot.com/bug?extid=3D85ede281798fa=
f736677
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D156b25495=
80000
> >
> > Reported-by: syzbot+85ede281798faf736677@syzkaller.appspotmail.com
> > Fixes: 425b9c7f51c9 ("memcg: accounting for objects allocated for new n=
etdevice")
> >
> > For information about bisection process see: https://goo.gl/tpsmEJ#bise=
ction
> >
>
> I strongly doubt this bisection.
>
> Note, syzbot has gone on a tear lately with USB "issues", what happened
> to suddenly cause this?  Did some new functionality get added to it such
> that it is wanting to stress-test the bind/unbind racing with gadget
> device setup suddenly?  What changed to start all of these reports?

It's a consequence of using LLMs to generate seed programs:
https://lpc.events/event/20/contributions/2619/

We did not specifically aim at gadget drivers, etc.; they just
happened to be one of the areas where injecting extra seed programs
into syzbot led to a lot of new code coverage and thus many newly
observed kernel crashes.

--=20
Aleksandr


>
> thanks,
>
> greg k-h
>
> --
> You received this message because you are subscribed to the Google Groups=
 "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion visit https://groups.google.com/d/msgid/syzkaller=
-bugs/2026082038-providing-huntress-55e6%40gregkh.
