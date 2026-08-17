Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83DE3EA959
	for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 22:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787004503; cv=none; b=Gz3rHA9K4aMsULLkJBJltk8x58jxdrLGNb/lb0lwt9YTUm1xrpk3eipIRJGdc/L+nDtuUgcO8j02p0EKZc946X89EHzCW19U8mdjRH1Qshrh8q/pYvHSGfZRHKdYOnOd57Mr04SVhHs6QlXPQbAxQVs2X6XLXPLG7yF9FZhD9bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787004503; c=relaxed/simple;
	bh=9s2JbNAJS1415QlTUE7wC0TeZFV0uxN63GBbcoNquUE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IYmvSIw3f2Rwu0cBv6EIx+UaDmOtfJYLSkIKAFYvRHIVl3vuj9f6rBwz8DARN7qnxqw5668X8DoGpMwhc6LZj2F1PbgjhA75TlR86PuwaIWknHGuzSvUndC92S9HgroPiXEOs0g94KxeC6q13nOLkfVWZlo19Q27+nq7Q4TS/sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mCk0zCIy; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mCk0zCIy"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4954df200ddso27700845e9.0
        for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 15:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787004499; x=1787609299; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WKO/SacqqVi0QkNOU9cB+vvwLf+/XmkCwjc4OaRBIa4=;
        b=mCk0zCIyAOBZ2ymNwjJVuOiAZggZwmvLQao0i6AJ38n65A3P3nfJumbb88jNkggKFT
         LC2koPSd30uzxLv8FK6gIh8ke1A8CSmT2m7eDp69R2fBfIpfVOlK6rW0m4b+XbH10doj
         uJR/nebhvMWM1SMcD1tzTksRPgx84yhqFHpuj1AmHEvTjVwMTYcNBGjgBkFGIwQKE0hW
         ePeE0d9iGxp0p/0RPwhZ8xYGyAh5BIN8cdXSC1t4AQhqL2m3DLDVD8CtZyzbDAUlvQN8
         qt+k4wxEcnHV1xdBK22toyo9rMXwt38vFMtmvg70//UEtztO20lWt9wo00PTP3VmEuYZ
         npTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787004499; x=1787609299;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WKO/SacqqVi0QkNOU9cB+vvwLf+/XmkCwjc4OaRBIa4=;
        b=JThoSivSaQDpBYbAUGEEF9Uyk/LsIJvRyf165M217qizNnBU6LIzjDt862kVNvsJFh
         oXuz+HxxpB6foE39spZikyQnG5LVnkF/2/g6QtxpuFqmX9Uq+hjTrgBouZYB1GKuTysg
         utwFrMf2HdEQ6320vL2kqGCuNQyiXvzgfvPuEjpN4vcBcILxNJl9wRnFe9XHX1eH+5zY
         2PcvoB7gS2V8IPZObP62RNv/bRlTbE0pT9CVWV/EV6bnNgoEUdZDPFK6AQ7vU0oT44BN
         TCJnG3AZSvKiGDVGRRXMLh+jFMEdspCV2wX0OOQPOvRNicK8osLAsQnzRuhgM02LiYT6
         6XQQ==
X-Gm-Message-State: AOJu0YyXEr+qkL0qtmC/ynbcY/WlxNFP+a7MbZcV/ltM2pLFUfAJbSTv
	OuaIrCtSG1N7SyWN5nj+QeLZA7IYnonh22WIlamUVWNxq7fDkmUGnW1r
X-Gm-Gg: AR+sD11GdtS7uLavxhRQigdDFP1FgAQFhEjD86FJmpqYjNBDDN0FF/n4erCK/2hyY14
	LAud4o/akffZ3qW3aPtYq0an36iiVWELc6iflGPs64llNefo1Dz5FS4p6rjl35n5jKh21qiV17M
	gnT65vkBQZ0xEYJZ64hpailX5NEBh0V1sCzFhpo4UNtfMD6lD0VazppElm+iHthCjdAJE8PtuTs
	dwx0aaEZQC/sPeUv0IBr6wWU1BMKUYxtUos+CCuYzQkgLOE9tEaWH3v1xAlkuBKo+yT0khUbpm1
	hePVE5zbp7JdEjLHO34HoJhOJYFTEk0lpaNfqHyXxNQhMbBfpXA3MSkaOnHqx3xP3yPyE7eHYir
	O0ua+5ELbKkQ2yaQXzk9l/3gXW1FnV3s1kIzMO3z7tqShsqj4wosruj6JWcwbeuhxg9XGDIm9ro
	SVEifI5OvT4t8RtULI1M+OhRTSUhGr7tNIZKR3c0UcfObPpF22iahE8gcEIw7rIY+Jr0o=
X-Received: by 2002:a05:600c:1395:b0:499:872b:abd4 with SMTP id 5b1f17b1804b1-4998797684cmr392019155e9.6.1787004498797;
        Mon, 17 Aug 2026 15:08:18 -0700 (PDT)
Received: from foxbook (bfg7.neoplus.adsl.tpnet.pl. [83.28.44.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4999610966dsm236039625e9.5.2026.08.17.15.08.18
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 17 Aug 2026 15:08:18 -0700 (PDT)
Date: Tue, 18 Aug 2026 00:09:09 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: =?UTF-8?B?0JTQvNC40YLRgNC40Lk=?= <senior.joker2009@yandex.ru>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [BUG] xhci: repeated URB cancel on UVC status interrupt EP
 (0x83) loops for ~15s, stalls camera - Intel Cannon Point-LP [8086:9ded]
Message-ID: <20260818000909.31af0ae3.michal.pecio@gmail.com>
In-Reply-To: <fa17985f-fe64-4f23-9b71-9a244db2f64c@yandex.ru>
References: <1551785954451@mail.yandex.ru>
	<20260815215259.014cc324.michal.pecio@gmail.com>
	<fa17985f-fe64-4f23-9b71-9a244db2f64c@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 18 Aug 2026 00:05:45 +0300, =D0=94=D0=BC=D0=B8=D1=82=D1=80=D0=B8=D0=
=B9 wrote:
> |DMAR: IOMMU enabled iommu: Default domain type: Translated iommu:
> DMA domain TLB invalidation policy: strict mode pci 0000:00:14.0:
> Adding to iommu group 5 |
>=20
> There were no DMAR or IOMMU fault reports. The camera problem still
> reproduces.

OK, that's good. Probably nothing bad happened to you before.

But it's generally safer to have IOMMU enabled when dealing with
questionable hardware like that.

> I also built Fedora kernel 7.1.8 with commit
> 7c0c31c66a7f9daace156bac427aafb2f4bbb5fc applied:
>=20
> |xhci: move dequeue to next valid td instead of past cancelled one |
>=20
> The resulting kernel is:
>=20
> |7.1.8-200.xhci7c0c31c.fc44.x86_64 |
>=20
> The COPR build is available here:
>=20
> |https://copr.fedorainfracloud.org/coprs/vertigo-red/kernel-xhci-deq/buil=
d/10873745/=20
> |
>=20
> The patch does not fix the problem on this machine.

So let's try this one.
https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=3D=
usb-next&id=3D3d9eeb336131bc5a174367c384fa00c15c8744fd

The log below looks like it's another broken Intel chipset and "All TDs
skipped" is never good news, it probably should have been xhci_err()
rather than xhci_dbg()...

But anyway, commit above tries to work around this class of HW bugs.
Let's see if it's good enough for your chip.

[  137.538119] xhci_hcd 0000:00:14.0: Miss service interval error for slot =
4 ep 2, set skip flag, skip now
[  137.538122] xhci_hcd 0000:00:14.0: Found td. Clear skip flag for slot 4 =
ep 2.
[  137.538124] xhci_hcd 0000:00:14.0: Miss service interval error for slot =
4 ep 2, set skip flag
[  137.538125] xhci_hcd 0000:00:14.0: Miss service interval error for slot =
4 ep 2, set skip flag
[  137.538127] xhci_hcd 0000:00:14.0: Found td. Clear skip flag for slot 4 =
ep 2.
[  137.538755] xhci_hcd 0000:00:14.0: Miss service interval error for slot =
4 ep 2, set skip flag, skip now
[  137.538764] xhci_hcd 0000:00:14.0: All TDs skipped for slot 4 ep 2. Clea=
r skip flag.
[  137.538766] xhci_hcd 0000:00:14.0: Miss service interval error for slot =
4 ep 2, set skip flag
[  137.538768] xhci_hcd 0000:00:14.0: Miss service interval error for slot =
4 ep 2, set skip flag
[  137.539589] xhci_hcd 0000:00:14.0: Spurious event dma 0x00000000ffc75230=
, comp_code 13 after 13
[  137.539595] xhci_hcd 0000:00:14.0: Event dma 0x00000000ffc75240 for ep 2=
 status 13 not part of TD at 00000000ffc75ae0 - 00000000ffc75ae0
[  137.539600] xhci_hcd 0000:00:14.0: Event dma 0x00000000ffc75250 for ep 2=
 status 13 not part of TD at 00000000ffc75ae0 - 00000000ffc75ae0

> I do not know whether the repeated status-URB cancellation is causal.
> It may be related to UVC status endpoint stop/resume behavior.

It might simply be that uvcvideo submits some interrupt URB when
starting recording and then unlinks it when stopping, so nothing wrong
with that, and actual problem is the isochronous stream getting stuck.

> I also tested a Logitech Webcam C170 (046d:082b) connected to external
> USB port 1-6 on the same USB 2.0 bus. It appeared as /dev/video2 and was
> tested at its default 640x480 YUYV, 30 fps setting.
>=20
> All 16 completed restart attempts timed out after 45 seconds. The
> external camera used slot 6 / xHCI ep 4, and its log contains:
>=20
> |9336 Event dma ... not part of TD 9176 with status 13 160 with status 1=
=20
> 64 Event TRB ... with no TDs queued |
>=20
> Thus a different USB 2.0 webcam can trigger the same class of ring
> corruption on a separate slot and endpoint.

Yep, looking like a host controller bug.

Regards,
Michal
