Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07703368BD
	for <linux-usb@vger.kernel.org>; Tue, 21 Jul 2026 00:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784595051; cv=pass; b=DH46awxubiHQ3FMOAXT8s8vWUv33swIICOos59o9XtytFcWw8OElGLgJDXyl403P3eevW2dlxOJudzcyzVoL32qADCkYxiQFp0MBQol6cHtF9vNQHagDjdrJuStW5VvR1Okd5veYtEGIhv5L0qweaxdfoiuKVvRT2lDK7iAMqqg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784595051; c=relaxed/simple;
	bh=Ijrl8AOK4suXz+UBtKa0/wn8BspCDqyzYDuJPUy8ekA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SINXfrGc75EzKZBbs6VW5SnTej3R3MmdPsEncb61OeWTTVlj++y3ZwEDcowqxBAHmHxISnm/ltCqUG1bdwfTG5gvRHYV41Tr+c0PLwgfOIFtuTMoTdkL+dZaSk88Rewwk2i00lqrQ4KTFZNk7b3FuXI9o+qf7q/7DQ5mX/iJvoE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IJRVC2Ms; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IJRVC2Ms"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ceb096e675so106623245ad.0
        for <linux-usb@vger.kernel.org>; Mon, 20 Jul 2026 17:50:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784595049; cv=none;
        d=google.com; s=arc-20260327;
        b=Am0MPO9vxMDrLavPgrPUE6T/2wtZoVveE3z9HiSH77NGSNndm+QF6jGgy054RrUDZp
         Jyk6bSjmDElMFNlBTWoiwgP0n99nJXw+1BEWtSW3e/B/dYSykCvDOH5qDvT8ROOJH44M
         OMmOW9uoo8JCJBsy1aZ78JdYAmN8br+A5I0ruVHj0WAUIn6+/Fm7UUcpNKLpVAUcgJ+O
         lCiMl0iVUuiTc+e5iJ1SNgoh7DuBZvYkYQIQzaoR95mBuoHuGFn/0OKVdFNPhZOZg+B5
         6SPh5qSs3eY/YCPkGsNwjPUM8StAJmIpaH+7z86sXqVlLTYiYWCZ7TOGCY5CGVvott/+
         3Ybg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eT35gyvZmMmvMyNqXFKHJFkmLqPivc/FT4p5X4DNc9g=;
        fh=WIPVVV04You4BmRcpklsLxQMbomsR+/AxaMxxz9spYw=;
        b=baqJ9q+LjdPSqQzWSN9mAAlvnkSo5rJMrLVd96Ap4VvW/U9756WXRcr/jqe9vycCAR
         m55sCEA+CFJzIPFx6WVuXyvPdXgtFS/FXL4GZZdduTOSkCNOFZ5/X4RZ+swAVWazlx7Y
         hzFclF9IZAhoRCsxxuF65crNqCbuEIDhmFO/MVRQbtOqOi+WdASwZi5FO6s0HpxV9+uH
         JeI5B+9u+rs/C/vROo14Wmpor6Y7xqrWfhYTWIv4LBgNLb3yr2/KeOlNiMXzKtWqjiAE
         XfHFTvOqB4IoBnLcdFhjCMVlvO9KxwKjjq4lC4WfeenRIicsJ3Gki9eBJD6g2aFeKTT/
         734w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784595049; x=1785199849; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eT35gyvZmMmvMyNqXFKHJFkmLqPivc/FT4p5X4DNc9g=;
        b=IJRVC2MsxC0d9L9dl0fvlAWP39DOMD6C2Ftfa9sDPGQbkAprS3gdDxI1Jmmr0xSuVz
         fGlhLMgyP3sybHMAXxnnQ1FED8Xh1O/DVdEOmxzbgpUgEwwJL1lhswDd1hOj7ET3XtPx
         acJaUPKqC1ocDQyXITUyJIgv52F2SxH2cB1ItCFzGf3S2SlTkHavnckzxNZiGv643Wgo
         pLswBnCdYimKEYJPKyK4WZnIqOFZEGHj3fckRZeybwSy3ypmkeBf2IeclNX+CfdwH8IG
         A8bEPUK+3u8fMDwCPFfU5kMUCotkREzgeqtVr0Fmek1i5SY3ZiqHBk47F047S53vS/KM
         eEnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784595049; x=1785199849;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eT35gyvZmMmvMyNqXFKHJFkmLqPivc/FT4p5X4DNc9g=;
        b=Oi4mPQ4wjyAL1RprTYFFODkUX+dD9Ri5h+plPHxehDtLqJDIMdYg4F/dU4AzwQnZDo
         4Fwt1FZYAxu2mUcfVq7GVuzYtCvAn/zec+ySLoDhxZ8yBNqy9upq1xd+q97SgBndQinL
         RwvSBTuDPiqm9RtjwIgE+G4LSE4EmIUBfgdtCEL1qUqeQtVplcXUtyQXU/a9XmZ2A6Bb
         7TiiURZQwMkMlp2zzOKeGxxgp8atXjGrn3vppkrAR+fkYeC4sfBOjVameQqkyPNmq98f
         M/rbiDW0AcZRP35n/GYo5Z+TmcwX4l4c2QTqj8jGOfivYhCW2s4SARJJBHU5tpLjx6X7
         PZqg==
X-Gm-Message-State: AOJu0YygaH+fgSL3ziM1JGXcEkTPBjPp7mRPtUJ6xWh0K/3Tmwkl1Eai
	bDsNtU7cG15e/zUrEXoDt3JL01DkV35/XI1YaKqUHqEE68o+sX31EmvDgt2OvOJzYc2ebYaL6MG
	vdY9EtqSHbxh7p2oLJr2J8f8YU8aaCko=
X-Gm-Gg: AR+sD12Epyx9OP6HpjKGfF1h/p6hZhXdCSm/7CXDp7sPOfVa8qb4lidNab0JR51Dp6d
	dmxHOvukTrxeMUKBUoKb71IxmFHQiGhAbhNQPQ5omV18p+3ulLeMprKyICRFTzHlze+i02ZAKop
	f2hqDKjq70B4LWHuN95Qqiq2PER8lJpvChFxbwtMe8FBneCCJ0k0Hr7ETv3UANlj4uHEsML2QXj
	WsyxrkoudUD+nAj1HW7SlG/5ZcJPgsywU1Dv9b347MSPDcDjfzP4p47jbuw
X-Received: by 2002:a17:903:1aa7:b0:2ca:20b1:3e0a with SMTP id
 d9443c01a7336-2cf34832655mr173102495ad.3.1784595049084; Mon, 20 Jul 2026
 17:50:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJ5U=Uw2R7xVEY3ugZ_gRsi+yC9WviMbFEO9RbR6A3ue-G=adg@mail.gmail.com>
 <34fd1f17-6e84-4d5c-bbc0-e1cb990d2017@rowland.harvard.edu>
In-Reply-To: <34fd1f17-6e84-4d5c-bbc0-e1cb990d2017@rowland.harvard.edu>
From: Anon <myaltforstuff1234@gmail.com>
Date: Tue, 21 Jul 2026 03:50:37 +0300
X-Gm-Features: AUfX_mwK3z4hZ14NysVi3dE9OGG135tBhWkqg1I9yl5rTIl9FZPA5X4POtVUg7A
Message-ID: <CAJ5U=Uwnt0kSJ+rFiA0tDg0=VZo3sVjfs49nHoFKXp28JTNoxg@mail.gmail.com>
Subject: Re: [BUG] usbcore: EPROTO on first-stage Config Descriptor read
 (ShanWan clone, 2563:028e)
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Wow what are the odds a patch this recent landed for this exact
problem. Thank you! Realistically when will this patch land in
mainline?

On Mon, Jul 20, 2026 at 4:47=E2=80=AFPM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> On Mon, Jul 20, 2026 at 08:50:49AM +0300, Anon wrote:
> > Rapoo V600SE / ShanWan-family chipset -- X-input persona (2563:028E)
> > fails USB enumeration one stage earlier than the known Switch Pro
> > fallback bug
> >
> > Hardware
> > --------
> > Product: Rapoo V600SE Dual-Mode Vibration Gamepad (marketed with
> > Hall-effect sticks/triggers, X/D/A mode switching)
> > Underlying chipset family: ShenZhen ShanWan Technology Co., Ltd.
> > (confirmed via multiple vendor IDs observed from the same physical
> > unit: 0x2563, 0x20BC)
> > System: CachyOS (Arch-based), systemd-boot bootloader, kernel 7.1.3-2-c=
achyos
> > USB controller: xHCI (xhci_hcd)
> >
> > Summary
> > -------
> > This controller presents at least four distinct USB identities from
> > the same physical hardware, depending on mode-button state and
> > connection type. Three of these are already individually documented in
> > various places (ArchWiki, xpad issue tracker, hid-shanwan project) as
> > instances of a known ShanWan firmware bug: a malformed response to the
> > two-stage USB Configuration Descriptor read causing -71 EPROTO
> > (sometimes -32 EPIPE), leading to enumeration failure and a silent
> > firmware-side fallback to a lower-capability "Android" persona.
>
> > Root cause (confirmed at byte level via raw usbmon)
> > -----------------------------------------------------
> > This matches the general failure mode already described on the
> > ArchWiki Gamepad page (https://wiki.archlinux.org/title/Gamepad) for
> > ShanWan-family devices: during enumeration, the host requests the
> > Configuration Descriptor in two stages -- a 9-byte header first (to
> > learn wTotalLength), then the full descriptor. Some ShanWan firmware
> > responds to the first request by sending the full descriptor anyway,
> > which is a USB spec violation, and strict host controllers reject it
> > with EPROTO/EPIPE. Windows tolerates this; Linux (by default) does
> > not, and the device firmware silently re-enumerates into a
> > lower-capability fallback persona after the failure.
>
> > What I'm hoping for
> > --------------------
> > - Has anyone seen this specific earlier-stage (first 9-byte header)
> > EPROTO failure on a ShanWan-family device, as opposed to the more
> > commonly documented second-stage failure? Is there a known fix?
> > - Would a patch that increases retry attempts specifically around
> > EPROTO on the Configuration Descriptor's first stage (perhaps gated to
> > known-bad VID:PID ranges, similar to how hid-shanwan and hid-sony's
> > existing ShanWan quirks are scoped) be a reasonable ask, or is this
> > considered out of scope for mainline given it's cloned/unofficial
> > hardware?
> > - I'm not a kernel developer, but I'm willing to test patches, provide
> > more capture data, or run a device on a spare machine if that's useful
> > to anyone actively working on hid-shanwan or xpad.
>
> This message might be relevant:
>
> https://lore.kernel.org/linux-usb/20260717195336.98500-2-nikhilsolanke5@g=
mail.com/
>
> You would have to add a quirk entry for your particular device, for
> example (added to the boot command line):
>
>         usbcore.quirks=3D2563:028e:r
>
> Alan Stern
