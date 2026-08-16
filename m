Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E083B19B7
	for <linux-usb@vger.kernel.org>; Sun, 16 Aug 2026 15:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786895989; cv=none; b=GEr0C2i4RuCdcCFeQ0I3rkkyE+QaVkJQA6fSufZIgoaUE3t43VLRXVZNEUk77jBSsDp7Gv59CoWiDBxr4px23YzjW5L4innn9janIAqJuIg5oEKztLSUs6462foMa6xt3omngkhiU8f+YR1x1QmlYDKuYS0P4IRVQ+0Oj3u2db8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786895989; c=relaxed/simple;
	bh=Sw9+05Kn6CPhAWUYNlQRpu8a6dAywA6+bHc0oOe2MKA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QJ1n/TWyFQ6EWjtoSQmqSINBcMQ4ZRBV7F/A/zLtqscRM9vQs1qRDzBOkjg5k8Lw8tF0Ig+2Q0FGv2m33ZMNTHmDjS4tjSWvOQDjMKASY5cxkzMM3OcEXevQKyn3/wRwJuCzanUQboL9RJ8hlV10Jw3TvVX8G4O4OXDLMrC/3pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jxZbBjoJ; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jxZbBjoJ"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a0de062db5so3983604a12.1
        for <linux-usb@vger.kernel.org>; Sun, 16 Aug 2026 08:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786895986; x=1787500786; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pAKKTUYGlatu3QmFxdyAgsxejHtc5j1LfICMpNa6Qh0=;
        b=jxZbBjoJx8e2svs3p+xBTkv8elDP32vcn9Y32L6wHbJLY+X/JmVja2U7yQ8xypSdZO
         YK5Wg+Sg8jC4U9dbZnZC+uv1C2jsRvXmEZfWKd/NtjOLHtf/aKl7cbfg8olFJRzwusAf
         1dhnSTjexszCkPgx29x1Tg9kMelgk+fYgeuCHMnZyC1mQazhm2uGy5M3DnSlRwXY1LqR
         s5c/yHpa6ADC9mFv5g3JPOnQB0vy/ARE9NiSNdjSqpAhiLxA3S8hYi7eDe6OANOc6oRq
         aVD4d/Z/zSTT1MY8LgTg8uF93Myiv/twrM10RVqWrju+LLymniaNo1+O6aJlZjYPX2Rc
         4mjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786895986; x=1787500786;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pAKKTUYGlatu3QmFxdyAgsxejHtc5j1LfICMpNa6Qh0=;
        b=e+BXcL3rv/C0v77MJccys2m8elVgn/EI1IAa0lnBburSEUYPjQ8bMIOgrXoSvjT66R
         Lc+iTcwK+jJE55/pkGV+mIZ0J/LXN6gJSXvcYsqphZDc4fJD6NVMNDaexJcZr4Y9Vhtx
         SNfeG1/XYggET2jwbR+SyU5idZY1TALZqaFgPinC9lornDFs83VV7S3jc10XcyqaqXeJ
         WGARRIwIMNc5NFJe00GvRPHqXOQmGnljBh3Whdn1UbFgkPBu4K0JMoSEGDa/iSI7g5x6
         qchlzZAyjQIKNJk4FkAyahaHdYeX0mepHehW0fO9UBNY8EJpPcBu+Mld2ME1/V5Nv5tV
         hEcQ==
X-Forwarded-Encrypted: i=1; AHgh+RqFJtZE3+RSz7ciCnqV8Nx5fjwAKPeF5hWY2UpkRq4cZmvqQlbnZ8tKpEhxzO68t+J4EQZaomet4dY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGO7elucNdLEXzyS+igvBvx8F7hxbTk9AWqEdWJP86VcdpDPK1
	s4yXTkLTs9BT/05L9HGFJeVNNUE6oVLnv7jvz5KHa5vst4BUOaDYS1rZ
X-Gm-Gg: AR+sD11FwVSRMK2xSUIdbxuag2KUkvjaEglHUSWCbK7JJfYZJlMEw6Eqh6Pw4N1r0EH
	iQxGT6Z7Mud42RBKiJL4knAWQ5fRhz7ImDYbuzo83SpGPghD0qVhuse5vufRTscW3cPAbHUeFtn
	IomRIvum0nbamgTBEf2UHj/6PapvSRd/I42WgkqooQPWjUDirF88VrFh1MtpmyVKE486Qo8Zs+n
	MzL+99Vax35sbleThtZpaYSEjfY1Dcha1enuw/dQjMamBZeah427bynNAitaRqXJfRxLiYY+RfD
	4BeXF/WjQrtV6D5g6/4lMeWtxibznqNnZ9TkBbMaZBujGYdw5dEU94PvIF9DSUs5oj/VMwP11oG
	FBxu6Je4epsTx1evAFg4PYL1wsgsIElXvS/xiQmcup3So+j3xOzbSleI4o0jkON+vrYKPyrNgqE
	+hTwyX/N7OTsnasIAMLisLGyogattk9WqLfWHZGqUSGyTLZnP/scGaMa8MzZpCx9/iHrQ=
X-Received: by 2002:a05:6402:1ccf:b0:698:9e5e:5df8 with SMTP id 4fb4d7f45d1cf-6a38a903b19mr9091471a12.7.1786895985687;
        Sun, 16 Aug 2026 08:59:45 -0700 (PDT)
Received: from foxbook (bfg7.neoplus.adsl.tpnet.pl. [83.28.44.7])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a38d767e3csm2931148a12.17.2026.08.16.08.59.42
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 16 Aug 2026 08:59:44 -0700 (PDT)
Date: Sun, 16 Aug 2026 18:01:47 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: perex@perex.cz, tiwai@suse.com, kees@kernel.org,
 chengordon326@gmail.com, jussi@sonarnerd.net, hulianqin@vivo.com,
 i@rong.moe, g@b4.vu, cryolitia@uniontech.com, pav@iki.fi,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
Subject: Re: [PATCH v3] ALSA: usb-audio: Fix boot-time audio stuttering for
 USB Audio device
Message-ID: <20260816180147.2e5f01d1.michal.pecio@gmail.com>
In-Reply-To: <20260728111309.1271834-1-zhangheng@kylinos.cn>
References: <20260728111309.1271834-1-zhangheng@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

Adding linux-usb.

On Tue, 28 Jul 2026 19:13:09 +0800, Zhang Heng wrote:
> This USB Audio device (0x1e0b:0xd01e) exhibits audio stuttering
> during boot when playing audio. Once the system is fully booted,
> playback is normal.

Weird, your thread runs horribly slowly (preempted by something despite
spin_lock_irqsave held by xhci-hcd?) during those URB submissions. It's
first time I actually see this warning:

[    9.654586] xhci_hcd 0000:03:00.3: Frame ID 644 (reg 5154, index 13) beyond range (645, 1539)
[    9.654589] xhci_hcd 0000:03:00.3: Ignore frame ID field, use SIA bit instead
[    9.655053] xhci_hcd 0000:03:00.3: Frame ID 644 (reg 5158, index 14) beyond range (645, 1539)
[    9.655055] xhci_hcd 0000:03:00.3: Ignore frame ID field, use SIA bit instead

If packet 14 was scheduled for frame 644, packet 0 must have been
frame 643 i.e. uframe 5144 (should be frame aligned). So packet 14 was
uframe 5158 - it was only being written to HW while it was already
due for execution, some 2ms after usb_submit_urb() began. ???

URB execution won't even start until all packets are written - we do
take care to queue URBs atomically. Initial part of this URB (before
the warnings) will complete with -EXDEV status due to blatant isoc
scheduling threshold violation, but the rest (with SIA bits) will be
delayed by HW and completed normally after submission finishes.

The same may happen to the next URB if the condition which caused this
persists, and moreover, the next URB may be scheduled with a gap after
the previous one.

IDK how snd-usb-audio would react to such a mess. It is believed, at
least by the USB subsystem, that drivers expect contiguously submitted
URBs to execute in contiguous service intervals, without gaps.

FYI, a lot of this xhci-hcd logic is considered broken and goes out
the window in v7.3. I'm curious if you could test how things work on
usb-next without (and maybe also with) your workaround code.

https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/log/?h=usb-next

This removes the automatic conversion to SIA/ASAP and insertion of gaps
between URBs, so that the initial URB will likely wholly complete with
-EXDEV and the next one will be scheduled immediately after it.

Again, what snd-usb-audio will think about it IDK, but usb-next mostly
works for me in my test (one remaining exception I'm trying to fix).

> The device reports its isochronous endpoints with the Asynchronous
> sync type (bmAttributes = 0x03), which causes the driver to
> calculate nurbs = min(max_urbs, ...) = 3, providing only ~16ms
> of buffering. During boot, the higher system scheduling jitter
> (e.g., from init scripts, device enumeration, and driver probing)
> can exceed this buffer depth, causing audible stuttering.

Not sure what causes it, xhci-hcd holds a spin_lock_irqsave() during
the whole submission, so I think it shouldn't get preempted.

> This patch adds a device-specific quirk (QUIRK_FLAG_PLAYBACK_URB_FIXUP)
> that applies two changes for this device:
> 1. Forces nurbs to MAX_URBS (12), providing sufficient buffering

I actually wonder why snd-usb-audio seems to allocate only one URB per
period and then submit URBs shorter than a period. Doesn't this mean
that all URBs may be busy without covering the whole playback buffer,
and then newly written samples have nowhere to go until one completes?

This seems to increase risk of URB queue underrun, though TBH I tried
increasing 'nurbs' and I haven't seen much practical difference running
with very low latency like 2x250us or 2x500us.

Note: on USB 3.1 and newer such settings may only work on usb-next.

> 2. Sets URB_ISO_ASAP flag for more consistent xHCI scheduling

URB_ISO_ASAP or xHCI SIA do the opposite of consistency - they cause
execution to be delayed until the URB is written to the HW and the HW
reaches it.

Non-ASAP submissions are scheduled contiguously and possibly complete
with -EXDEV if submitted too late. Only after the last completion of
the last remaining URB returns, will the next URB be scheduled
separately and discontiguously, to execute in some (near) future.
Again, this is documented usb_submit_urb() rule and it's believed that
drivers expect it. It's how OHCI/UHCI/EHCI drivers work.

Using ASAP is a known workaround for the old xhci-hcd bugs, similar
patches have been sent to linux-usb, that's why it's being fixed. But
IDK if usb-next will solve your bizarre edge case out of the box.

Regards,
Michal
