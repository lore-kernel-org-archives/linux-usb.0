Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDC73CF1F0
	for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2026 09:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789120476; cv=pass; b=UQcU7gAOzAsygG8vxJUOtJaFgG/7CrbzpM3qqBqwOMVFxWoSTJCEXJ0Y5zCG/rZcwDfgjf+E6Dy2hCrFG4Jqg0acXIl7/6pcSdvMYbiQ+x3oHmjUHP04BT6p+wd6zkmqhzGe7aIHTFKvaTU1OV8o3wWT7fvqQp1kGs1kskYL0+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789120476; c=relaxed/simple;
	bh=sxPQd2WIotJ9767P38oBEjiKB0X2FvjDyh2e0Xku6Ag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SgpdVjO5rVFaWE11DVmkYUp9wSXN4SKd1dZyObeW03FP475YMkU9Q5M5j82lyTyIv8FDcuvN7N5UyQETLxbZt4pe5tGDD3Ab3V51SA76aPkZZ8rUR6nAraaGg3QVYkIkRSUmhGOlDoZfhIzKZ6YykZgnHdny0K4tL6c5Ko8HuCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RStG1qwx; arc=pass smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RStG1qwx"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7f4e596e393so824456a34.1
        for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2026 02:54:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789120474; cv=none;
        d=google.com; s=arc-20260327;
        b=QLYXw+2+vKipF4KVGBztItGQXMp4pSYSAGwEzexZporYoD042Iae9+xiVa/bKfVCcm
         9IGO0wxKqIU+tFV331n37QFmr//T4a7kPbvG5KjaudkdRlkiicaG6h8lxMUpMnywTpyV
         3myLS6IS9pPKDN4mOJj2tHp0+CiEsNw+Z38kMGsN6pXge7aKuX/25j99Uq+j9zQf+yym
         VTIuORHLxpkEHvZGfDLlPh5UJimrL/PVlPKiiCjXEdUBcsOB73gAsGikWYMYrDutFUfR
         ci9Z5BzhMdPofsi/ABwaN5dsBEXbAWTeyQNFb0ghHSYEmzPXUUOxi6xhK3qjDtXBJvEd
         KBAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sxPQd2WIotJ9767P38oBEjiKB0X2FvjDyh2e0Xku6Ag=;
        fh=oy/oifSBJ/hbXk/Eb57tw3Qx1IRc2xHyVow3JsPzQH0=;
        b=T5XKS7pAlvKVx17ABakKt3O5UiuPCkSCLzDqEH/OLCwFN3rYySnS+feEr+MdSmJAk5
         YhaPf5my9MQ1Ese3ChhJwAg9OyExJEgSbxKSkOuaYNN7Fs2sFRuojqja/XtvMDsC3S2F
         y/wdBf0+sm03yTPI/csSK9fGq3vmO4P79ZAy/LNFaC96Z8qJocxR65k21VVcKFtEe4tU
         TLtWze2usPp1TiXhK179OeyFVPoUDF6srbzUq3RlTf8UUa3zwG4DBBD5umyecKpKfJ2X
         o5b62iEolbJLcddA0padwz3QRPuxFTXr6Kuj7FdMDhsvP58fTwOvdSvLsFlqYQ5w9Mhd
         at6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789120474; x=1789725274; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sxPQd2WIotJ9767P38oBEjiKB0X2FvjDyh2e0Xku6Ag=;
        b=RStG1qwxGVgK/4N9ZBGWVzVbKICczvDyu85Ctz3aG8c+go527GpD/ZAaUOcJ4Ye9H4
         15XeChf2kr6dnPUJza7Svd5cV4f27OH+h/O0aDV3iF15s+kjSRM09wj4JANeHkbYx/lg
         31qrF1zinkFtqPhrEik7w0u4UuDEHTIcU4ERWpXAdiLDE2+XgSpC+pxPL5QAwcGwLE9+
         fnEd3yv66ZaqPj+NcfArCduHqrk5t7TGym7j5JVHNWJNvbVvZREJCbIPdD1UKxwm7sU+
         P/wyjLEA5Q/LfX4mzwWNbQaDxoo7NGqbQQMSKoWPda8cG9z5mWDYuztrQdnvl/7pbFgE
         2a8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789120474; x=1789725274;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sxPQd2WIotJ9767P38oBEjiKB0X2FvjDyh2e0Xku6Ag=;
        b=Rsjp8D+SiSsoWJwhNi0NwiW1XQdJxjk3TnDG3X2LzuB9gxjcv/Fudl7Y0xG/zJ0nTw
         DiCFB8wFa65dpAriuvki4KOEFWsRF6IBtU5fsWXsE6N+E8TIw1XzQWSmGW32aWEiGi7I
         UDs/HerAmu5NU2LF3yw0MAUZOOnaN8hVJgMjWsoYhVP2FegT7+bpV1ttG6jDQFJzRpvF
         3XouEoQV6d95bx5TkBJil1ZvkFxlMs4PGH3HSfkYzXZ1JKqd1LKJeJuvY9Bm0eL5aGur
         3GGgn6MiBxn0Z090rHbpM1+0t0iI5rY2WYQfnIWQkdItdK7wrLmdkyT5NmheH6S8Ai19
         Is0g==
X-Forwarded-Encrypted: i=1; AKwUvByUiBE4xCIQjBWMR7HQoSkimX1hqq/SY82jw2xCDjyzrb+x0xbm4UxCBP6bBJIBRgcMd3pt3TD/EAw=@vger.kernel.org
X-Gm-Message-State: AFuF++k3I9eETcQk0N4oWSeKbpAQR2TlQDn0Z2dW/ZW+CAt71HG0R2UH
	G9dlvLyrGTthmo5YpZCGW6eHubm47gWkGpI2aXa961v1fz6VZUSugKsG3VnZ2uSDx9wIUrnRPTj
	Eo2XVlIXspDtc6K9jb9iMQkgXNPzQfYQPRA1rS5W5
X-Gm-Gg: AYBFou27ZyYhN6KBJIuABw0jgx4b/8I69JAU6MJ6JQDm4+BsHaWx++rGjEdj/BNGozh
	scX/cVUWp1kDjUgHIQnK6UpgexDCrX62SiliiAng8bAEqpFyj/Q6lXA6QQPJsBrGQH6jdF+MYOt
	hJFzCfRNHmV4MyAEOOgx02wJ6wi+FR4P0WthdmEmqdeBz7q2BuwBIW2Nwsm1T8p6gE23B9FodHs
	61aXcnyhEvCtGglM3D5AT/Qrzyuas5ONy7pet3rD30cXaLQJiKMro2VrO0tBNgSxsW5uQnGxryj
	6+CMxGcO6rUA+2NfQjBPyb9qWW2kZxg2td2Ilur9bQ8g622JDVuM5AmHeTfBkz1VGlEjV/w2Qyc
	lbbALAGguGXyilC4aB6u3G8FBm8jyBbLJBIpaDxygXGF4vLnM/IeKjULjAPn3oZFHZJSZC2q7o4
	ZW9Er3sb65iXoxq/n9TrVaA0wK
X-Received: by 2002:a05:6830:f98:b0:800:d883:9988 with SMTP id
 46e09a7af769-803fb6cb448mr2828620a34.0.1789120473081; Fri, 11 Sep 2026
 02:54:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6a88066b.ae6ddae5.3da009.002d.GAE@google.com> <6a9bceeb.a5e650b3.26d8a.0008.GAE@google.com>
 <20260905104331.6d4288df.michal.pecio@gmail.com> <2026090536-numbness-enlisted-917e@gregkh>
 <20260906123835.56902ed7.michal.pecio@gmail.com> <CANp29Y4VaiT=oj5mkbf00hq6ogDs7zHZb1_9SC6qTQL7_UPfZw@mail.gmail.com>
 <20260907102252.6eff5c54.michal.pecio@gmail.com>
In-Reply-To: <20260907102252.6eff5c54.michal.pecio@gmail.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Fri, 11 Sep 2026 11:54:21 +0200
X-Gm-Features: AcwNN1U9QqScehaKOEShCisWyOXNyJs7MHAC8Id3_uKnwcGvz7UQHjUestEfjCk
Message-ID: <CANp29Y66ZREv=wr6PWBt-KORVJ+BdinM8J1B+RC_QoCzy1s1Ng@mail.gmail.com>
Subject: Re: [syzbot] [usb?] general protection fault in vhci_hcd_probe
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, 
	syzbot <syzbot+7300affe388249d66dfe@syzkaller.appspotmail.com>, i@zenithal.me, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, shuah@kernel.org, 
	syzkaller-bugs@googlegroups.com, valentina.manea.m@gmail.com, 
	syzkaller@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 10:22=E2=80=AFAM Michal Pecio <michal.pecio@gmail.co=
m> wrote:
>
> On Mon, 7 Sep 2026 09:59:36 +0200, Aleksandr Nogikh wrote:
> > On Sun, Sep 6, 2026 at 12:38=E2=80=AFPM Michal Pecio <michal.pecio@gmai=
l.com> wrote:
> > >
> > > On Sat, 5 Sep 2026 13:30:01 +0200, Greg KH wrote:
< .. >

> > > >
> > > > That will taint the kernel in newer releases, and syzbot has alread=
y
> > > > been told not to do this, it's not "valid" at all.
> > >
> > > What cought my attention is that Google apparently has some capabilit=
y
> > > (human, machine or otherwise) to understand how this repro works, and
> > > yet they keep reporting this broken pattern.
> >
> > As Greg pointed out, we've adjusted the fuzzer to stop using this
> > kernel interface, so there should be no new bugs of this type.
> > However, we haven't yet invalidated all such reported bugs, so some
> > notifications like this one may still leak. I'll look into
> > mass-invalidation of them all, but in the meanwhile let's close this
> > particular one:
> >
> > #syz invalid
>
> Thanks, that should do it.
>
> Nota bene, this can be triggered not only by the per-device
> 'driver_override' files, but also the per-driver 'new_id'. While
> I haven't yet seen your syzbot instance using the latter, I have
> seen others, so this needs to be filtered too.

Thanks for the suggestion!
I've looked through the open bugs, and none of them seems to be using
new_id indeed, but I've sent a fix to prohibit that just in case:
https://github.com/google/syzkaller/pull/7888.

Please feel free to ping us if you notice any similar false positives.

--=20
Aleksandr

>
> Regards,
> Michal
