Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794750429;
	b=odfUx7LGyKCxt80chC3hDSiiH4U9Tsih0f4BYmdhnUPbGA92o92awe2NbJRMt2rRtDUY
	 rH+7FA4UUiK+8fBrKL0otivH/ENJhvbmLz4XRHyIuxFj1Fmy56Y7VanD5k6wfEo9zvP5y
	 fkvQ/PpoY2QoJhjCrzvoIyXvRMaPTRW/vrPpVyAQsJ1q88ofiufXrin83F9mnqtj3EbqI
	 0ZqGmoGnJD6Byd65IyQVmzKadC/VY0b8cXbOrmAdx/hLKvlRliz9BRMPtv6e8/Xftgk5p
	 I4rmMClndK39pLb0jjErcVR8BlkSbeFV8+RvfdPNHe/QGdS/LZ0wWTfOmMuhCmxvGGQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794750429;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FpOG0cpnBOHBYv9UoV4Ob8nspS31qekk4WrWeis1Ouw=;
	b=lTTAFyY8I7zmsZWwYawblcc95SSAlfJ1nSfCi8S3zKRlYsKPWOmw4Ww+ZP6aqWigDSAx
	 Yp6Xz4gjU6lHu2jLNBlfvEW5zwe5ICz8uHsypDXi3WsK+/Fib3mCH8lPkQA1lX+KzauJw
	 d8Mx9TyuxIpHw/rjz5j9FTMkAJI5Bnxe3BgZwGNf4PHFUHmg5oXCHbAmDyDCnN287BBQj
	 GHh8BsIt2J0t1vXsFXbiNC21GiAKHLn3ROqtXWTj4Ux0+7gRzj87ffFNEQwTNqosTlrbB
	 XOkn2zAW0Azajsla6huhvbGGR10MupY7CQXoPQU91f2PtmRSje5LhmoNxgLvaZojYkg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aWMyaooB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271E2606A31D
	for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 13:47:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 271E2606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aWMyaooB
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-67db89857abso21257d50.0
        for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 05:47:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794750428; cv=none;
        d=google.com; s=arc-20260327;
        b=OquEU7D7EPOTdB3iJdPnUE4Sq7xUcP5Ar0ISAFwngw25gI5D8g5Rp998lO17d4C0JT
         /BM7TBBGRux5sd48TOet51kRpzd4udZObOnxpqUhb+Jt/ByLFSF1yp8myvaavcCa9XKp
         yxkrYU1EfzfzJPrNptaWKw1V+RqDL93w5EMqW3xsonQIqv58H8dJYYOJ7m0sCeWWksUe
         pBVuLkuD8PpUU2rxW/RjW2KpKNvI2cEUclNZY2Y4kqqMF2q7VIUVOkkXMCRNnE3NgML5
         AOsTg2pJuiXvg9IBJPDvFoB97ou6b/bvAW6/jUjMKvQpFHs8+JVUHd9A7XdNeXEjjMgm
         G2Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FpOG0cpnBOHBYv9UoV4Ob8nspS31qekk4WrWeis1Ouw=;
        fh=3oglMdhrU9oE1XylA3JnxvnVjilSuLr6o4YCh5iiTeU=;
        b=oNnlEWP+2y7lWfw1KQNGDIurMxoUrUhm4FBETdvaQCN+oyz9T7ZYIq7dsDGes9aHjn
         U2jzmsyN0AUIoaJwHIFYExI5sUTUmPjaLPis8BwOjA4GLAsF2oKgzyxMq00rUo2Evs4X
         yWA6KPsZmZVEPPzynmzZ3QUzO08jrCgQ7Eq1oXErXaDp4KXqINftvBLeQEMIO1z6oZ39
         e7YAi3yi+SFbIJH3i+qEBaSoPaBkNb3ngzalsHdlpXavlm0WB1PkRZzmNWcL8LvuwLsz
         XRhX73rMx1u2xA1cWesjkcFecva002FrT/7rVggN51Gv0rUfgCz7rLvdK2spTTOezUR+
         osuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794750428; x=1795355228; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FpOG0cpnBOHBYv9UoV4Ob8nspS31qekk4WrWeis1Ouw=;
        b=aWMyaooBHymqlhmmh9HmpWGiHQxNTYahKaz7UxgEAvmKiMGJJF9eMOC1+vOaHhX3/f
         kGPN0lbRMDckE8xmhyrAbQC5mPmMhSfjI70YIo+2LqeEmi+ixQFROlfbw46G/Un8ohjS
         vc8zcBbl3TAmuFVwAQz1YLvI7OX3tYO8IPJzVoGM9IhcGepL/55jwuvzwEjK57QHjZKD
         TiRFSUQOxIfEB21wY9/ZSIE7KAsBOBZ5wNsbifuhRwfml7/abdCw4/ag0PjK7oDwKKB5
         QwrrM2QLjWyKcZyW+8T+9zvDr7OKoZLJ6luVw9/868DD43vXKJt7ArOwpEFxhi2RpFNM
         keTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794750428; x=1795355228;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FpOG0cpnBOHBYv9UoV4Ob8nspS31qekk4WrWeis1Ouw=;
        b=WB6CcUAC/i6dpzCquw8bJiruVDFuDvxI2dIzLCjjPdDi5FEowSgeUGflKRVo7Ns8RA
         XpNstGznAi3OgVWKpY+RZv+v0cWJYLHF2zXqIcupDJjZE44SJ5nj6WNVduqdXvEINJTp
         DVbAivEJlxydmx76uHE7Ig2krHABmkvbsiWb7GKEzowtk4pMwj0HHosflOzH9jbYJOif
         fQZQzQu8UCTDYQ0TLmZ7Z15q6NYMD6T9MCZPjoDq3loORUBxtrsgerDRYKoMBtiZSm+Z
         bwxlTX1tQaCCS8ewKgJcIvO/ek7E8KdC5yigFxF/irpyAIOzC3Bo9GD4uoQgRL/y1qRE
         F79Q==
X-Forwarded-Encrypted: i=1; AL+hErGQ5I/WNXy+33IyHw5PzVT8dxrgdMc0RtXLu3EFcTIqTCuF1XNfR7OjCY6qdov4uyMimY1tEhAzECs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9USPSU+9pm3HatUH494/2hw8f/++Qpqj72/sYF9LvHADufa+vo
	xGaRnIRMs3N7vP3TH7zoXOp5V+O3/nz8ZYVNyFcFvHAGg6jvhKA+H+fOcJ7QFVOw3RoUxoBEYc/
	FB/ukOYByQGwY2yHmPp+Lop8sh4idPvQ=
X-Gm-Gg: AYBFou3KXjZWlpNZASFE+p1BMVDii7eaB1iP6U2kIvoEz84UPC90qoY2Kv8vAsQUeCA
	HFNmOHugc+tqJW3tgUeJBs22M3+SxEPL8XS6kXQINjeIx0bt/UuHoktgq5rJhKsXMLoxUU96igL
	QEQl57huiF6USPBJ4eQHJkF3hUYziuTMLpfWlzHfEAb4t621jOHw7GrEtWzIvvhXMRXnd/PDIDv
	BuANPycksDO1S5ggn9VSfGXZAdRawhsBMmUvGa3o4MsopvuwymAG/UXEubw4rWCN4T9Blsy/j0e
	2HLctr3+2OaIdo6ld8pV2vJgIfsVtO946jtOGh3mRq/k6x/vdTURz1Ea7YhuafFs9nRgkZ3Gi4S
	DG4PBMXyCf26kB5GC/FgAipRhOQJ36EpNA54NROX1DUOMDFysEAaHvm6j9fD6ClsAoYH4ObLOYD
	zMZSfADuoLwcF1RAl+2PrfN3UFid0UQkuqtvolG28H8OPzWReB4G0KNVlLpdEclE/z7JLN3Tk/h
	wKVuJgiQ0lWwcWV6eoY9n1xCU0280Xz
X-Received: by 2002:a05:690e:bc2:b0:67d:b309:a23d with SMTP id
 956f58d0204a3-67db309a28emr432606d50.113.1794750428013; Sun, 15 Nov 2026
 05:47:08 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260821114854.12218-1-kartikey406@gmail.com> <2026092925-licorice-strode-7905@gregkh>
 <CADhLXY6t7UL9Ys65qDSBBAUzj+sQkS26xFZX3YjkFZ8ufS16wQ@mail.gmail.com>
 <CADhLXY55XwzujRCg+xgm4v4UJmfdgUQ0oihS39f3iMwFDzXTRw@mail.gmail.com> <2026101828-oxidation-squishy-51e3@gregkh>
In-Reply-To: <2026101828-oxidation-squishy-51e3@gregkh>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Sun, 15 Nov 2026 19:16:56 +0530
X-Gm-Features: AclHuK9Otwj5KZQGTuXt58Ob917qEckKqwNSKFzQk-AX8IyL3DHhyoRMo2Da_E8
Message-ID: <CADhLXY4N5ia9-J7ahmnOE2i6r5w-SMZC0KiezFu0P1n7=O_xrQ@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: u_audio: reject srate request for
 unconfigured direction
To: Greg KH <gregkh@linuxfoundation.org>
Cc: kees@kernel.org, pavel.hofman@ivitera.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+e1d0e66badecc32d45eb@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 5:24=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Sun, Oct 18, 2026 at 04:28:49PM +0530, Deepanshu Kartikey wrote:
> > On Wed, Sep 30, 2026 at 1:48=E2=80=AFPM Deepanshu Kartikey
> > <kartikey406@gmail.com> wrote:
> > >
> > > On Tue, Sep 29, 2026 at 6:53=E2=80=AFPM Greg KH <gregkh@linuxfoundati=
on.org> wrote:
> > > >
> > > > On Fri, Aug 21, 2026 at 05:18:54PM +0530, Deepanshu Kartikey wrote:
> > > > > u_audio_get_playback_srate() unconditionally locks and reads
> > > > > uac->p_prm.lock/srate, but g_audio_setup() only initializes
> > > > > p_prm.lock when p_chmask is set. On a UAC2 instance configured
> > > > > without a playback direction, this results in acquiring a
> > > > > never spin_lock_init()'d lock when a GET_CUR sample rate
> > > > > request targets playback, triggering a lockdep "trying to
> > > > > register non-static key" warning.
> > > > >
> > > > > Reject the request with -EOPNOTSUPP when p_chmask is not set,
> > > > > before touching prm->lock.
> > > > >
> > > > > Fixes: eb3a1ce6f5ed ("usb: gadget: u_audio: Add capture/playback =
srate getter")
> > > > > Reported-by: syzbot+e1d0e66badecc32d45eb@syzkaller.appspotmail.co=
m
> > > > > Closes: http://syzkaller.appspot.com/bug?extid=3De1d0e66badecc32d=
45eb
> > > > > Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> > > > > ---
> > > >
> > > > How was this tested?
> > >
> > > I have not been able to test this since there is no
> > > repro present in syzbot.
> > >
> > > I verified the fix by static analysis of the call path in the report
> > > (afunc_setup -> in_rq_cur -> u_audio_get_playback_srate) and confirme=
d
> > > in g_audio_setup() that uac->p_prm.lock is only passed through
> > > spin_lock_init() inside the "if (p_chmask)" block, so it is left
> > > uninitialized whenever p_chmask is 0. Leading to lock splat issue.
> > >
> > > This patch is compile test only
> > >
> > > > Did you forget a Assisted-by: tag?
> > >
> > > Sure I will add assisted by tag
> > >
> > > thanks
> > >
> > > Deepanshu
> >
> > Hi Greg,
> >
> > Please let me know the status of this patch.
>
> Burried with 2000+ other pending USB patches, please be patient, there
> is no rush here as this is not affecting any real device you have,
> right?
>
> thanks,
>
> greg k-h

Gentle Reminder. Please let me know the status of this patch.

Thanks

Deepanshu
