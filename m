Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792934732;
	b=jc2cpYVbLLstNWa+L7TMMhxBoQB/M5t6GVEN//SPLc+eNiljBg7gtVAqZzHC219R5wIl
	 1gREs/iQsJ9JXGBpkHCELXc6EdFR1wF/cigKskWhbwUpVuFOQD58o7EzQVoML2IHkxinb
	 rOFe+pCqd/yn5eeqN4iW5Z3caW/EkCRADvALkHKCMQm9eEt2YkWXGmY0yHUaZocvUps5W
	 KbByR8oOMDa6+5Ws5oE3w7ZCYu0Lu0EfZs2kRppuzdnkLO1SzGXKuppfw6vUkIxA9oD+Z
	 fXEBPHKED4DFSqub8mPIYZyiAUKow4Xpm/kUgUSEA3Djq23VuCVpKPDc1UoP5tg29qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792934732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=pyrDKClHBYpvA5FuT5xtznEc63sEHz+wvNi84lQ7igE=;
	b=s+CPh4moUeZXfyoXRLl+vYSRpF+eYBY4rOMDMtp5a7pmdqPrUEdIjW723UgulhwdhOp1
	 aj7fpmGHv++aHbOqtPnsm5JH8/MvSXy8/Dx0nbIo+D+3JJl7ZxFsnA0TukN1rW4S9+FYC
	 pkIVioJOdTS2ahuhrBgmG/NeI7YJ6zzpmWUJPeEQhptsvYD7gnJXj5EFbMzYuVwAoC/vs
	 mqlplHNAXFgAtxNMgdx95aqTtXzyo0bK+oEYyLqdgqEjRIXB9u/J2ovq2dQTub50meBQm
	 etw+k8w5XP7cG3vk0mp86EuXEBNWZmHp2THz4rM5MIUHt2NlvEOjWbmtBntrgd2DbHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=plo+Tlpk;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78072606A31A
	for <linux-usb@vger.kernel.org>; Sun, 25 Oct 2026 13:25:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78072606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=plo+Tlpk
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so15987475e9.3
        for <linux-usb@vger.kernel.org>; Sun, 25 Oct 2026 06:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792934731; x=1793539531; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pyrDKClHBYpvA5FuT5xtznEc63sEHz+wvNi84lQ7igE=;
        b=plo+TlpkaEiM3iZxa/MQhdUAPtoo1gWNUIXtnHGZOTcsi79EEPxVKuRfFTgdnf4tbi
         d4jQWY6tCRThlzFFw/iL7L8W5t8d4pY+w4tJhyywZYNrzLCJiLS8ucfz55fT5Pepoe4H
         TPup0/lu7jPA97q1h42yeJuljK4RYHUesHaoGF0BRfeAvVaBSFBuNPYHggqAp18XAW+b
         kjZbc4NVLpSfPWvvWE+a7WO7drpeX7cytUDpVoAt3sh6fHGEUoiA2uuV8IHqxxlFPkIm
         9g5Euh+btDggyTrvaSA6QFtSjrBQZxGp225uF1ONdJjUKAVZl9c5/l9XCmXS8LSd3gx2
         W9Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792934731; x=1793539531;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pyrDKClHBYpvA5FuT5xtznEc63sEHz+wvNi84lQ7igE=;
        b=euH7cDm0wrLKcK2f3dr5w/w0lJr4Tsgr0xtgo8DEseUd9XUUSOvBkr2xXCOW0iqb0z
         h5uSh31+1rP0gSeCnh0IZPcd3mGyjm2ZQ7eqQQyXERq7XqAVSF/+SrZXD0uVNftbEBie
         sxdy7gkbswP7PcRTPE8Fe8PaOnoakKvQ/o8JgwAjDbEGurOPKJTJSuOHMrJWgMFRqg2O
         ydnlUSzqxGLOlsOzTBYKlUEYjEl5PepOOFwSJq4IGkDHsfdDdstgPuEiNQ6a0T8cIgkI
         o848yrvesGm1w5IMDPCxxQQ9XI5ejWGckuGdGrV2O3djkMB95kn1wFvEOYsIE+Hba0E4
         OB9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxlh8wsNABT1fU6LBOnbfut37L7SuJNwV4UOYXmGEXZ79Ufqe33SCH2mTqAUtQsg2CymiNcU4w7CEY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0NB9AxvnGSZyeZol1CgHDYGALEKNq7TiUjJZZovyyriUE8y+t
	Ux1QvlOUAunDIu3XNDhi8n3avSQQ0Ygvi6XdV7PBFjYlNFLdL3a2wvgl
X-Gm-Gg: AYBFou2FsEfMoYqgA0ZRN2oCsxgGq8NjuqgNs7+FUYMaPKLd1Z7c7ayxocNhr1gmW9P
	MC3NF6l2ctbEcGM2Fdh/PhwfMKsRjl65K6lxKKMveA9KOVaxNuYBntq3gaSAG/9TOPQgdlwGnDN
	00+20rjse0jSBJBLH1hTR2RD86Ea6/j/e/giByCGhxt5wrxYbH/2SW460sqbqUxCwdsqvvTP4b0
	yPhLjT6umIdTyIkvxO1Nzx3gQr1PAFxSl/Y+tFVuqlDQCEP66Y3lyzqihx9oQra8BjmBdHRC4LK
	RXi7rkUe4wQRq3RCupjXUudG+nJyTnqk3dK6ywcV/4eEhh5xKVroIMckd63m+6o8O8jlEr/NmKk
	p4OE7LlRRAOg62WIr0QTnjfo+Psfla3BOtTHwx4UVsW1jzG2cqLQggltIvhuGT4CQEReFsoM4O0
	T8mOK6bb64DYpCehBNl+SUCufcPZHmCbKxLLAIEVrxUuo2ehUt8xGICBFTbWmI+EgGZDFiL0yZJ
	Fiu7N13PBGyV6ZBWP8/Mcvd8cDO+nJTRjT0D/N+rkr53MQaSAdq8eMruKbAOAKt
X-Received: by 2002:a05:600c:1987:b0:4a1:6992:f861 with SMTP id 5b1f17b1804b1-4a35ac3a825mr75967755e9.1.1792934730574;
        Sun, 25 Oct 2026 06:25:30 -0700 (PDT)
Received: from foxbook (bgu81.neoplus.adsl.tpnet.pl. [83.28.84.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0bb112sm135543355e9.8.2026.10.25.06.25.29
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 25 Oct 2026 06:25:30 -0700 (PDT)
Date: Sun, 25 Oct 2026 14:25:27 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: metaphaze <gmhomeier@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org
Subject: Re: [BUG] xhci: ASM2142 command-abort timeout (-110) kills the host
 instead of resetting it
Message-ID: <20261025142527.70b53e9c.michal.pecio@gmail.com>
In-Reply-To: <1792881094.236072.780250.nullmailer@maynard.pixelexstasy.com>
References: <1792881094.236072.780250.nullmailer@maynard.pixelexstasy.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 24 Oct 2026 17:31:34 -0500, metaphaze wrote:
> Hello,
> 
> xhci_abort_cmd_ring() treats a command-abort handshake timeout as a dead
> host. On an ASMedia ASM2142 that timeout happens while a USB 2.0 device
> is failing enumeration, and the whole controller is marked dead.

Yes, this happens sometimes, also on my ASM3142 (same PCI ID, not sure
what the differences are), but I have never had a reproducible case.

Could you record a trace of what happens there?

# disconnect other devices from this controller
cd /sys/kernel/tracing/
echo 1 >events/xhci-hcd/xhci_queue_trb/enable
echo 1 >events/xhci-hcd/xhci_handle_event/enable
echo 1 >events/xhci-hcd/xhci_get_port_status/enable
echo 1 >events/xhci-hcd/xhci_portsc_writel/enable
echo 1 >tracing_on
# connect the device, wait for failure
cp trace /tmp/xhci-trace
# send the trace and dmesg

> The comment above the handshake already says a timeout should be
> recovered with a host controller reset rather than treated as -ENODEV.

Theoretically possible, but resetting the HC would still be somewhat
disruptive and it may be better to just prevent triggering HW bugs.
Usually this happens and then there is little urgency to implement
automatic recovery by reset.

>   A PCI function reset brings the controller back until the next
>   high-speed attach:
> 
>     echo 0000:06:00.0 > /sys/bus/pci/drivers/xhci_hcd/unbind
>     echo 1 > /sys/bus/pci/devices/0000:06:00.0/reset
>     echo 0000:06:00.0 > /sys/bus/pci/drivers/xhci_hcd/bind

Is this PCI reset necessary?

An unbind/bind cycle issues xHCI reset which normally suffices.

Regards,
Michal
