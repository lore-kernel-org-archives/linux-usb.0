Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794376603;
	b=SeTJI5sszxkffzcraqUOO+upZL4S5gTCBpgUN8k+f6JkhzSmiIFUpmotKUhWFZ8o392O
	 KJ/rbrSIDLIUOcNQ3MODFqH43LtrOZz5qheR/d++Px/8D9RJRbLTAePrGd/nih0YTnKTn
	 TN/TaIj5NEejEsIBCou07oaxoWOX38bHXuC62kijnDeYsBlCC2ePC+VxfFyiJUyvHyYuh
	 //PrepZFHoT6t3ydAZ7dbIJHVp3qXuJ7V4T2hZJzKe+/002mxgZpk+rIfAN/TiDJ3UQu/
	 2X82VRWZMnJEzfC5+rKwT8Y/AVVufVRiu7EChtH9dgPfXiHq9nPXBq/s7M7BXpQqswA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794376603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=SVdC4NoqsEAb0xjeu4zg9bcnEb0TfO6Tqq8G+6Aa5+w=;
	b=z3BRbWOUGvj1Kq+cv9+3jZbgNh0GQjBr/UALuz8fs7ZhPj0RKnjokYHAieJO9q5rrIxC
	 dk+hu6ZoVf6O9bOVnsSuMJYlt4DTmRo8fnd9X3rXudQwBAAeByMlVV2ado7CNZpNKi9iE
	 Mjur78PAQ4SgZFItqKTrwCY5rMFeJ4FYXMy3dGEFsH8u4OpgTXK0OuW5Lkz2PnG2Gbr1z
	 tVdFBcOAPUIE5asUZ4gcvA5KL05BJSl5J+qCWMGVEaabQNZqHxp69zWXgw4gnS7/0UVBZ
	 /HPBieJo9qroixd0edQR8L+EoFK1ETtgMlewlCpknmwllcOhnbZ1z8CKsNTn237X60Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j8DnNixo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.175
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFDF606A321
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 05:56:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FFDF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j8DnNixo
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-53ec92375d2so1098536b6e.1
        for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 21:56:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794376601; cv=none;
        d=google.com; s=arc-20260327;
        b=cWgTBm55kz7LnvvQnD0Xhyrqm5m+BEaIZOvdahHq4L0isgaVoK8WK3KG39dP3f01bh
         fNwSf5qqTiT7Y3JXynUQFKs66yWZh9MHczZOWuk/TIpQQMo3IyDf64tg6wSPVR9FQllT
         1VU6ZT+DfRzOUjoWvqcGJ90EcCwu3VIJUdq9AG824kU3LHfP6fHzCw6UKCHQuLf3X4y7
         xVULjmuyAU67Bup2homE6gadYSI4qU6XsburHct2Ny//vbXNm0hOz4Z3oRzgwfS6EzID
         Cpu+OZUcFcyEOoJ4v8ehDzmuZRj82MSRNyjlLBjN1VI8mtvauszwjJeA9zY544oyfmAw
         d8/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SVdC4NoqsEAb0xjeu4zg9bcnEb0TfO6Tqq8G+6Aa5+w=;
        fh=E1b1Wrz0giXQ1BhfhOLfO0Faro5kmqLeWSGuolMv33g=;
        b=B5a2403fF+z+kioQSuZatJpfJU0HwGh3urff3TaPsu5aCiYV8WF7JwLcbXO6TVsb4Q
         XLF9lUF69PX9wLBFRDfBNZxFMTiny+YAKJ3PT9BNdGNZK4PmIcctk6Ja9Qz+ChrDzeYE
         W3IYvAmYtSaQHgKIhn0eJcwuQJN7eYcGz684Z8hU/VcDZYUydW95HRz4SsLrp329ipSD
         QjB5dzKj8JK2S+z2Yg6Kky25PAMLXoOfFbkvyU0279CfyTWrDy80mWpfyywQgrEjPtJ7
         8ddyFraeFRbww8HzudkvwYp+RZho9hrn7izk3IXxtVkTShfcRsD14RxNBaLDUdt15iHd
         G4+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794376601; x=1794981401; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SVdC4NoqsEAb0xjeu4zg9bcnEb0TfO6Tqq8G+6Aa5+w=;
        b=j8DnNixo91ABh6Ud1k1J3g8aT3pLJT9qPII6YHh2PMwH0GPT0uCz17ceNKSWkB4kSo
         zNlqE6pisPqCcWJ0rHOnmVMs0oCFgNLWxkXLb9XHr1uelXj91icqJRc1JoDF3Uir7d0y
         yq12Y/L5wojdgHri6yXzY9qQI0EiKOx1GoVa9QHA3NobFrl/0nYgHysu1rp2yqjLQd72
         KUVmDsMyQ0hEVI2V9+KVllo1Pob7VGPMUxJ/aoyOOT4k4/f6jDvOXvzEgeecLyH5ydTq
         cORxLEcFj1HltGhuJswiKqhQ//CWBKlYTTSVjhNP4fuu7iClRZCv8tAMyZPZWUN8leqc
         YsxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794376601; x=1794981401;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SVdC4NoqsEAb0xjeu4zg9bcnEb0TfO6Tqq8G+6Aa5+w=;
        b=XiNgL2AfNmxbyR6mWbhxrHBySuBuCpgjIf5nu/l3rCRbgXkqxeies8JrCV6kRzDkGd
         oNvJRj5fieXJq8gILj+2irr/whkDPPc/7YRAKJr457e+douy98bNTnqt5pyoge3cxjlH
         ZfOf6/HcNhyjcUyLdey94SdurM9yOUHvRdM1A+QX1/wYbXfeYEGlj5WUSsCV9OZHaDC/
         s9nubAkSXXeW7Dxf0BBZWsq27myAGDOuogQUkwvum/MO03zyOitsqYCLQM+ATq+LjxJ5
         xKyITBo4AtfgDf/tNPguXEBa5lkRCPJ3zKJSeDj8nxUBvQkDjoVRAtHxttxLPnC/nBKg
         cnbA==
X-Forwarded-Encrypted: i=1; AL+hErF4OLGUB4dE4pzVFg7sEnomrYAixpOA3CIQTi9J2AiWYxnhx1Cy8H7xMqi10TrpMDRlMACdmRF2LNc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+F6H6NAnosHRMdG0XpXmOVoTti3XsnL9+6fjLSyhFKSfEp4TZb
	A8pf16BeufZbgUidTCBzyCrEG/XEVFb61zzDs/0Pv5pDEw0E2VEFCDse7lGANAtdMLFb79Vjbab
	XxnyJlin1PSjRai0POW7eoi5Bd9FVt/o=
X-Gm-Gg: AYBFou3Tp5AX0ZdScZMXTCzJxdhwbrXKTo4U0w7dtQoH0tqTanrMHzpPX4Dn+XtCJfQ
	WmyG2Q4KKJa3kWtMcMYSbv4Dnaqk2ZV9UTFbc+QSrU5MbxOSgg31Cjw9oBDvXs8MWLU2OZVld1F
	S2XdbZA0g0ke32RDXKE0rUSG88s593r+IWnj+txF0pM8/e+2e6rDArlPt4s9LfMm6KccaDwp8Jt
	7M8GI8dmbCf60Q9odv5Ab0b3nmfpttLjcScpycdrcD3VLMGBH8a9mWkDu9YQiskvKYu9yOVpdfv
	g/L+KVPaHQk6ouYeOW2rZJUuNhZMfYtGh2Qt8biveelrCodbDJeKdQ0HpSwCWd5F1uzhHmC1JTb
	d1Z63AVwavB8Qi76cTuv/phR/Hq1JitPO22s+XMhQ9slkDFO+rQGUQ2q+Pkx7O/qesPesF6lYVF
	vg9fu0D5vzdGIEVeBhys0AaEWo5tF2B/taZVZzsqEZiE5UjlztT2c=
X-Received: by 2002:a05:6808:4f23:b0:53a:e153:e901 with SMTP id
 5614622812f47-56b932504ffmr1277212b6e.2.1794376601509; Tue, 10 Nov 2026
 21:56:41 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <6ae09458.f0fe5aea.79aa1.008e.GAE@google.com> <20261027101009.18e9136537144533915008e4@linux-foundation.org>
In-Reply-To: <20261027101009.18e9136537144533915008e4@linux-foundation.org>
From: Rohith Matam <rohithmatham@gmail.com>
Date: Tue, 10 Nov 2026 21:56:30 -0800
X-Gm-Features: AclHuK-vbFkZZTGrimsL-YTV39zkF7VzvFxaCKkhVtRTZJlOUBJ0WGB_WgVtgM8
Message-ID: <CA+FtcErvvvg8EQUpgravNPTib4_CnFb3W20PY-xMYSTdDH4=4A@mail.gmail.com>
Subject: Re: [syzbot] [mm?] [usb?] WARNING in corrupted (4)
To: Andrew Morton <akpm@linux-foundation.org>
Cc: syzbot <syzbot+9fe09db3795456e0b442@syzkaller.appspotmail.com>, cl@gentwo.org, 
	hao.li@linux.dev, harry@kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-usb@vger.kernel.org, rientjes@google.com, 
	roman.gushchin@linux.dev, syzkaller-bugs@googlegroups.com, vbabka@kernel.org, 
	mchehab@kernel.org, hverkuil@kernel.org, duoming@zju.edu.cn, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andrew,

I retested my v6 patch against the October reproducer, and syzbot
reported the patch test as OK.

The patch removes URB_FREE_BUFFER from the Siano-owned buffer and also
fixes the related work initialization and teardown ordering.

Patch:
https://lore.kernel.org/r/20260601201639.63171-1-rohithmatham@gmail.com

Mauro, Hans, could you please take another look at v6 for inclusion?

Thanks,
Rohith


On Tue, 27 Oct 2026 at 10:10, Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Tue, 27 Oct 2026 05:08:56 -0700 syzbot <syzbot+9fe09db3795456e0b442@syzkaller.appspotmail.com> wrote:
>
> > Hello,
> >
> > syzbot found the following issue on:
> >
> > HEAD commit:    5b0764a53235 Merge tag 'drm-next-2026-10-21' of https://gi..
> > git tree:       upstream
> > console output: https://syzkaller.appspot.com/x/log.txt?x=13739fc9580000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=fd1433abd362f255
> > dashboard link: https://syzkaller.appspot.com/bug?extid=9fe09db3795456e0b442
> > compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
> > userspace arch: i386
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11cb9b0d580000
> >
> > Downloadable assets:
> > disk image: https://storage.googleapis.com/syzbot-assets/05ac8658d211/disk-5b0764a5.raw.xz
> > vmlinux: https://storage.googleapis.com/syzbot-assets/9cfb73243216/vmlinux-5b0764a5.xz
> > kernel image: https://storage.googleapis.com/syzbot-assets/fc45c7faf785/bzImage-5b0764a5.xz
> >
> > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > Reported-by: syzbot+9fe09db3795456e0b442@syzkaller.appspotmail.com
> >
> > ------------[ cut here ]------------
> > !PageLargeKmalloc(page)
> > WARNING: mm/slub.c:6855 at free_large_kmalloc+0x97/0x110 mm/slub.c:6855, CPU#0: kworker/0:1/10
> >
>
> Thanks.
>
> > This report is generated by a bot.
>
> So is this report ;)
>
> This looks like a double free in the Siano USB media driver, rather
> than an MM bug.
>
> The failure occurs during USB probe error recovery. The allocation
> comes from smscore_register_device(), and the page-owner records show
> that smscore_unregister_device() has already freed it. The USB core
> can then attempt to free the same memory because smsusb_submit_urb()
> sets URB_FREE_BUFFER on a buffer owned by the Siano core.
>
> Rohith Matam posted a patch in June which removes URB_FREE_BUFFER
> and fixes several related URB teardown races:
>
> https://lore.kernel.org/r/20260601201639.63171-1-rohithmatham@gmail.com
>
> I don't know why that patch hasn't resolved this problem, but it
> would be worth revisiting before developing another fix.
>
> This doesn't appear to need any MM changes.
