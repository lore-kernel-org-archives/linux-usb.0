Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13EA41A909
	for <linux-usb@vger.kernel.org>; Mon,  7 Sep 2026 08:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788769381; cv=none; b=HnaJo+3Spwg61/4c9o9+jW5dKTEJqyRwf9rA/05L5iCYSnndLmwti4bMed2uqZOC4SfeWjp+D5ybREMzjlBOsNkVmLKdvXOjbGTMmJ+fOTohcAL0W0p3rckHASEMKzP4KNvQJmNItFkzKJR6h79Rn0vcYgxuG/SQbAf8WnhPtpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788769381; c=relaxed/simple;
	bh=Yh01Mk0ZxpNxRDgGkFuFdNhDsxsvzBT4L8+anRObBgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ibNwVYZxOUn8kN7Tgi9gKUNuJNg3QvXYg/+hPd7/r8KumsULdGQYWy14JZS/ogXDALUbl+DjUp1vyiryCXMWtkN6Sv6kPiXGkRXvy/jPbOAOLc3/G4Ghdnha+Cp7KtjME4qWqkenVEie0+DWDneVEChN2Ufq0l7S4lPNY5neiBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AZoe8Iez; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AZoe8Iez"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso27387265e9.1
        for <linux-usb@vger.kernel.org>; Mon, 07 Sep 2026 01:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788769378; x=1789374178; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VCqJaTcs5m3D0UG8DDlgKpZ5cHbVAKWTm8C1454BXRU=;
        b=AZoe8Iezw4OiUD/t0K9hGF34moGiGzej7iIL9f1ZkBrohBRj5mETTQKw2f9w1LqNy2
         V6vGoSe1DcaBCi2N06FZYfYOrUxn4U6MpuZD4cFPQgLNnqQNKhD4KlJO8ykzovx9cOTw
         If1nvKTQ1vKu1rYiqLEFH+RFVcMLdTCFuShZMAyKYRcB4BuB/rbMH9uYLAO+45f5ro0u
         XLUU8srqyj2BCDiw7N44fahDdJCamw9jV3hleRRDEc9uy6bByJEpIMa5tcLv7y5CUxkr
         C24mfU/fy39+NO2urREx8JZc7drGoNEO3i0zGOr0Hk6rQ/dMtKylFEH/qs66l2vrO25f
         Ugtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788769378; x=1789374178;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VCqJaTcs5m3D0UG8DDlgKpZ5cHbVAKWTm8C1454BXRU=;
        b=apy5ZUQyjlUIbl54SuI/NOnADrcC+bHgocWSQ0iMQlx9aPxihGUVoQB9dJ7HiorFXd
         BnB/xbWfzm0W5j9Lj2+4ckdUc20tc6iMqgcJoZjRPpveayazX1g8yuTTWhqmtQAkFaB+
         xe0WwE5DuCTcZ4BTtuCeGRVAJ/m52g2vT9Dz7hHMULLpS02EXsRD7Sz07dp0IjDELBPr
         ZuAshJ3s2UW4/HJXNKSgwYIjRGYQqgDKhyx3jS22hM0QDMq2NOTxHLyBhS98lPf0zA6s
         Wef82ri/kuY/PPhlXCUD0omfWuJYqzwSefNeXUfucb0dwnjpXaz8wAhW0frYRmxCd5kT
         iGgQ==
X-Forwarded-Encrypted: i=1; AKwUvByom/2NvLQQQobV57jizlyC0b26zsxL94fxGIOkhap1Kq0F/OjTin/WwKBzm/pbw1tbm8qr22HzU88=@vger.kernel.org
X-Gm-Message-State: AFuF++n/HQ7GmIpVw/rWu9HGYvzaarNaXcAOr4QMg43cZCDQsXNEk8oW
	zclEosdM3CgM08mTPHHioeWR222+59fXCwqDf71//CQrOj1fSnHuHgSQX/hEvw==
X-Gm-Gg: AYBFou3YHwvR00ks/bZG9QDRkfaAcn4vOCTuWCIeCqx63Bi1Ml8/rb0VwfCXDYlzh+V
	QRp6wduom36WoZ3y9b5lnCrSclCx8Gkih3e27ua+kIG+uWkPPGfmxgPmKcEhNR4aEOhLjA78zOt
	O1Epq/br6+ICKZyty8Sd4UiJ51qAaKRANNFYNVDn2b5Oh/PpZNN0DC7/tYpOAaVndRbX955XU+q
	aGWPq7iobqTAN+tLqwCr4McLc59FL3kDQeZ4Ux+aM4W+BvAOqGRsXQOF6tytFvJvbuoLoHZWe6e
	speDqeq1XQ45T/EGR+VXa/Ab/SOLhydTuY944cWdn4XVPvAmvO9CxIpDUxQXTKf/TBv5cK8zA33
	MtXSoMzxIQ+jp1T19/Y9CATZ5TvamQcxF5OYEJNyQhZ5J9Ewt0ZalkGW+7hW5xcmCe+zFohsYqF
	N3P/HaidUppGqEaznJITor6qMo3OaHyLlXe9Fn8bqgogz+gVqt3W2Le5uoi85K3dY/wjGIMw==
X-Received: by 2002:a05:600c:1986:b0:49c:fa21:e744 with SMTP id 5b1f17b1804b1-49cfa21e906mr173256045e9.26.1788769377804;
        Mon, 07 Sep 2026 01:22:57 -0700 (PDT)
Received: from foxbook (bfg95.neoplus.adsl.tpnet.pl. [83.28.44.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7740d44sm651558805e9.15.2026.09.07.01.22.56
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 07 Sep 2026 01:22:57 -0700 (PDT)
Date: Mon, 7 Sep 2026 10:22:52 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Aleksandr Nogikh <nogikh@google.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, syzbot
 <syzbot+7300affe388249d66dfe@syzkaller.appspotmail.com>, i@zenithal.me,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, shuah@kernel.org,
 syzkaller-bugs@googlegroups.com, valentina.manea.m@gmail.com,
 syzkaller@googlegroups.com
Subject: Re: [syzbot] [usb?] general protection fault in vhci_hcd_probe
Message-ID: <20260907102252.6eff5c54.michal.pecio@gmail.com>
In-Reply-To: <CANp29Y4VaiT=oj5mkbf00hq6ogDs7zHZb1_9SC6qTQL7_UPfZw@mail.gmail.com>
References: <6a88066b.ae6ddae5.3da009.002d.GAE@google.com>
	<6a9bceeb.a5e650b3.26d8a.0008.GAE@google.com>
	<20260905104331.6d4288df.michal.pecio@gmail.com>
	<2026090536-numbness-enlisted-917e@gregkh>
	<20260906123835.56902ed7.michal.pecio@gmail.com>
	<CANp29Y4VaiT=oj5mkbf00hq6ogDs7zHZb1_9SC6qTQL7_UPfZw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 7 Sep 2026 09:59:36 +0200, Aleksandr Nogikh wrote:
> On Sun, Sep 6, 2026 at 12:38=E2=80=AFPM Michal Pecio <michal.pecio@gmail.=
com> wrote:
> >
> > On Sat, 5 Sep 2026 13:30:01 +0200, Greg KH wrote: =20
> > > On Sat, Sep 05, 2026 at 10:43:31AM +0200, Michal Pecio wrote: =20
> > > > On Sat, 05 Sep 2026 01:12:27 -0700, syzbot wrote: =20
> > > > > syzbot has found a reproducer for the following issue on:
> > > > >
> > > > > HEAD commit:    9d80aa4617b3 Add linux-next specific files for 20=
260903
> > > > > git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/nex=
t/linux-next.git
> > > > > console output: https://syzkaller.appspot.com/x/log.txt?x=3D10adf=
4f9580000
> > > > > kernel config:  https://syzkaller.appspot.com/x/.config?x=3Dbb4a3=
2c282cc2ec7
> > > > > dashboard link: https://syzkaller.appspot.com/bug?extid=3D7300aff=
e388249d66dfe
> > > > > compiler:       Debian clang version 22.1.8 (++20260613092233+e80=
beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
> > > > > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D121c7=
215580000 =20
> > > >
> > > > Who or what is coming up with these ideas and even commenting it?
> > > >
> > > >     // Iterate platform devices
> > > >     dir =3D opendir("/sys/bus/platform/devices/");
> > > >
> > > >     while ((ent =3D readdir(dir)) !=3D NULL) {
> > > >
> > > >         // Set driver override
> > > >         snprintf(path, sizeof(path), "/sys/bus/platform/devices/%s/=
driver_override", ent->d_name);
> > > >         fd =3D open(path, O_WRONLY);
> > > >
> > > >         // Bind to vhci_hcd
> > > >         fd =3D open("/sys/bus/platform/drivers/vhci_hcd/bind", O_WR=
ONLY); =20
> > >
> > > That will taint the kernel in newer releases, and syzbot has already
> > > been told not to do this, it's not "valid" at all. =20
> >
> > What cought my attention is that Google apparently has some capability
> > (human, machine or otherwise) to understand how this repro works, and
> > yet they keep reporting this broken pattern. =20
>=20
> As Greg pointed out, we've adjusted the fuzzer to stop using this
> kernel interface, so there should be no new bugs of this type.
> However, we haven't yet invalidated all such reported bugs, so some
> notifications like this one may still leak. I'll look into
> mass-invalidation of them all, but in the meanwhile let's close this
> particular one:
>=20
> #syz invalid

Thanks, that should do it.

Nota bene, this can be triggered not only by the per-device
'driver_override' files, but also the per-driver 'new_id'. While
I haven't yet seen your syzbot instance using the latter, I have
seen others, so this needs to be filtered too.

Regards,
Michal
