Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A648230BE9
	for <linux-usb@vger.kernel.org>; Sat, 15 Aug 2026 19:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786823423; cv=none; b=OfpIyeog9AH9MpIvVlhYEMpDxoWB/InbRq8vdTTweR/AXlK5rOGsP+q9kqwk9oE4W1cXCJa2Fb7RbuBYczfGr2QShJCSKtKAqRd9TV39PJMFcAp8PP+vbF+HF+vCqA5RTmEhPZQpq0j/5X0os30QO2nZCNUwijmgMbE9+InSs28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786823423; c=relaxed/simple;
	bh=x71yvax3R4p2yC40Geruf5omb8u8kPIRl7GLW7cGRLI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=by0DCB8M7lAdCeSgLOOXZSyaXZWlnn3m2GbSiPdYYWCMT8Pn5wWYOXiUKko8P49AxRTDhdgOw1uRrlMJ6kshRHk1v5Ae1B/jOR9q+4b9r2q3ISFDLe+9H6Uo9NcLS9PgTEnUPLdTcBlZyuQ0wlOiCj2eDSPNknpoUB7P70U8cLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MIdGYNWW; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MIdGYNWW"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a20319d030so2887826a12.2
        for <linux-usb@vger.kernel.org>; Sat, 15 Aug 2026 12:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786823420; x=1787428220; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x71yvax3R4p2yC40Geruf5omb8u8kPIRl7GLW7cGRLI=;
        b=MIdGYNWWHYmzPCos5NQO1iief7aM6zVKt6K2AK/c249FXSBrkD1TI8BvuKMNStwt3U
         SYkHCYMppxSfZ6nlrfZWMLN7lPXaUsz15E9b9EUyHDf8QLOVVpdbo3w4z5yGl11NfXYU
         atxzdomcc5l00hr3W3DX2KR/BeWJhh4ubVgRoC8TVMgY7MCn8+Q8PfaDEwL/xT7f2syg
         Jfq1PIgU1XzNnr5EkqINgVwRunQbdFTnLZAsXiiF2iZgONLbuF6ubBIpQ0AC1OTwmBK4
         iObRyNS7CwTopftJfL20YJkUQnFcnD9SApuF7ez3+sYQbAhxNpwfymIEE6rXDOv8lPSu
         9Zcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786823420; x=1787428220;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x71yvax3R4p2yC40Geruf5omb8u8kPIRl7GLW7cGRLI=;
        b=f5+fZ3OfJbmcSCX/9ODK0S85/bRr92eEp5msJVqcf0bGsvSA5NmzdMMpnEEd9kyqNl
         BMPvIkO4q9fJdTpt0l7DKP/vI8dHA73+X3Jx0XFOoQWWZrPkdr6aY9Ovswc3ypzBaHZF
         hFxp/swVaeY+oNEy6DEXfJPNlpgChtkgId/PFduuqFrilvTSlVXgTSX1OgTAvM+EjewU
         8+jHvE5D/mZgw6e9QXufyBg8++47mRgPHiK/7O0FZAgSTjxPSCh4CVjJYp3buNFArJzC
         47Pd6xHJW4x/LSTQBcKgnMEMYFAtz7KMPgtqo9EkvPm3jLHgxbCfgn5u6vAglP7WtFG7
         yD8A==
X-Gm-Message-State: AOJu0YynnbpdwB7rB0eixu8cNosSBOj9/3s5KhjpIoDl0a+VtF2CIWpg
	FO7RSegHfj82XiuMUWM0nLBZxcwbp6w6TVDDsrBm3lmivE0WfGM5QG4QIq3fYw==
X-Gm-Gg: AR+sD13twwUl6QlJiFGFmIAdt1HiEri05jJyYUSN2PvZIHMS5KsZaCXd3zuOlMP8PQB
	K7BwGMxdwW4WdhnZBB+FcTYJUg48PznJ5ne1cROjRUXpiqwlWlfnf2RdhZvHK4mKoGdLHmzgMH3
	W7q6P3TWjpVMAhAReQmKv3BqyZFk1ZmXmcW8qzH71Z/8wcZT9MPIc0lhqB4iIPJ5ixejYC+7u4O
	KUjU/PPap0d09tcG9XJ8NnLVMWygMtSqXVOodOA8+27aLNjIi6H6exSGXRDe9LATU4OivYpEe1p
	d8OE7/WdbFxX0ndZYQz77y7rrL8eIQ1Gc0aDIUAtSYCWlcF8YnDjPm9nFC2CsCQGKvBqsk9RnQL
	UPgJsnz+5j+IL9gUpanQNiC4itx/IMtvVNa9T1bd2CpOIrHMbz45wUTwDSrKD74eTc80/bTmSDz
	7rEL9pwB0lOpktBrO97GVjYdzk1sgIWuMmyM38qCBv3zvN8u8KzMECoyyNbDgzFZOBMLU=
X-Received: by 2002:a05:6402:2546:b0:6a3:87b7:b5a9 with SMTP id 4fb4d7f45d1cf-6a38a96aa3cmr6173602a12.12.1786823420160;
        Sat, 15 Aug 2026 12:50:20 -0700 (PDT)
Received: from foxbook (bfg7.neoplus.adsl.tpnet.pl. [83.28.44.7])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a38d768978sm2072453a12.16.2026.08.15.12.50.17
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 15 Aug 2026 12:50:19 -0700 (PDT)
Date: Sat, 15 Aug 2026 21:52:59 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: =?UTF-8?B?0JTQvNC40YLRgNC40Lk=?= <senior.joker2009@yandex.ru>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [BUG] xhci: repeated URB cancel on UVC status interrupt EP
 (0x83) loops for ~15s, stalls camera - Intel Cannon Point-LP [8086:9ded]
Message-ID: <20260815215259.014cc324.michal.pecio@gmail.com>
In-Reply-To: <1551785954451@mail.yandex.ru>
References: <1551785954451@mail.yandex.ru>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

Please post in plain text (not HTML) to kernel mailing lists. Not all
mail clients render HTML, not all that do make it easy to quote HTML.

There is something odd about your trace, not sure why the entries
aren't decoded.

The dmesg fragment shows some serious breakage on the isochronous
endpoint, it seems to jump to random places on the ring and execute
completely wrong TDs, like failed or missing Set TR Dequeue?

Considering the above, I would suggest *enabling* IOMMU, because this
chip is completely out of control and it may be DMA-ing to buffers
that have been freed (uvcvideo doesn't generally free isoc buffers
during streaming, but hell knowns if other endpoints aren't affected).

3990.653716 xhci_hcd 0000:00:14.0: Event dma 0x00000001323c0af0 for ep 2 status 1 not part of TD at 00000001323c0b10 - 00000001323c0b10
3990.653718 xhci_hcd 0000:00:14.0: Event dma 0x00000001323c0b00 for ep 2 status 1 not part of TD at 00000001323c0b10 - 00000001323c0b10
3991.385996 xhci_hcd 0000:00:14.0: Event dma 0x00000001323c05a0 for ep 2 status 13 not part of TD at 00000001323c0e40 - 00000001323c0e40
3991.386003 xhci_hcd 0000:00:14.0: Event dma 0x00000001323c05b0 for ep 2 status 13 not part of TD at 00000001323c0e40 - 00000001323c0e40
3991.386005 xhci_hcd 0000:00:14.0: Event dma 0x00000001323c05c0 for ep 2 status 13 not part of TD at 00000001323c0e40 - 00000001323c0e40
3991.386007 xhci_hcd 0000:00:14.0: Event dma 0x00000001323c05d0 for ep 2 status 13 not part of TD at 00000001323c0e40 - 00000001323c0e40
3991.386009 xhci_hcd 0000:00:14.0: Event dma 0x00000001323c05e0 for ep 2 status 13 not part of TD at 00000001323c0e40 - 00000001323c0e40
3991.386018 xhci_hcd 0000:00:14.0: Event TRB for slot 4 ep 2 with no TDs queued
3991.386645 xhci_hcd 0000:00:14.0: Event dma 0x00000001323c0630 for ep 2 status 13 not part of TD at 0000000119d858a0 - 0000000119d858a0
3991.386649 xhci_hcd 0000:00:14.0: Event dma 0x00000001323c0640 for ep 2 status 13 not part of TD at 0000000119d858a0 - 0000000119d858a0

Not sure what's the problem, if any, with the interrupt endpoint.
Nothing about it shows up in the log snippet provided.

Maybe try to collect dmesg with xhci dynamic debug enabled:

echo 'module xhci_hcd +p' >/proc/dynamic_debug/control
dmesg -W |tee log.txt
# connect the camera and reproduce the bug
# send log.txt

If you are feeling lucky, try if this patch from usb-next happens to
fix it. It was seen to reduce occurrences of other bizarre problems.

https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-next&id=7c0c31c66a7f9daace156bac427aafb2f4bbb5fc

Either add usb.git to your remotes and checkout this commit, or
cherry-pick it on some recent kernel, or apply the diff manually,
or wait for v7.3-rc1 which is expected to include this patch.

Does anything similar happen to other USB 2.0 webcams connected to
external USB ports on the same USB bus number 1? I would say that a
15 second freeze may simply be a webcam issue, but those "Event dma"
messages shouldn't be there.

Regards,
Michal
