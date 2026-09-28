Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A5536EA98
	for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2026 10:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790589837; cv=none; b=i9KhK0DtJdmX2M2DH2Pn/9vAwWNr4l0bf2LTO0ER42FDTEWalO/zDeMcQWV5HMRTitaKybeAQQZ737+vgQKLgXk7DneThuZNn1tuckhF3Nqlor4D1fTvIjTcgZdl/66qPfPodUbH7pNvXtpGqgx4+5T4XhTw2AvMhk+/PklYcgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790589837; c=relaxed/simple;
	bh=t2intcSOZ6w3/5sj5AzOnym+zZbGravTu/rzgCH7FWI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=chNGs7RrCSGQnqWd4jyLSoI+iluCz6qz55BusHerX4iLiVPGrV+uDNEfJ4j+jyRBqNEQhcYzaEaqKU2t8h59r/dFWBwqOIBiwMPF0+S1QLi6+3Ab7k5sJfaU6auCl5GxHrRQII2rRSJ08zSdMf3Jbu5buU6jkVu4MMLT+w1aG2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A7iALOsH; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A7iALOsH"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so17205605e9.0
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2026 03:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790589834; x=1791194634; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v4nfpC6mEwRFb6BbldYO+nHUNeTY4zzd/RfKUSQ2BiM=;
        b=A7iALOsHaekAKr9v5Xt7922OyY+gcpM/ejK1oKN8YWjcTF1Y6Co3mk8tpR/Yk6M61/
         PLm6XTpOz1fOWlnuJLtrKTdNQV3qW617jkZhQ9YzryVOuBneshCzPQ0iJ0mAJi0Bo6wT
         Pw1r3vgcrWqvPex8eXrYV71CmGOzXZy0FT8dm3ehF2sINCMksZ4ri/MXqvO0FzkdZ2mI
         93X/ZiqgGxg0qNFrHHyMIh9mxoyuKn2VgeZ6ebSxlaxoBogTUqcL6BRZybKg75ZqLPbB
         4RfB7hBpQn/lNu/6IsCDk1zxmiEymYpfMo0EdiYFNX8H6V4JlMczhknTqMbTc0ccL9ev
         FTIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790589834; x=1791194634;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v4nfpC6mEwRFb6BbldYO+nHUNeTY4zzd/RfKUSQ2BiM=;
        b=Pc2GXYfvC/AEJ+z1lu/y0XvRvAd4JtSGJvJoDyW1eX780FYzO/fy9O84PesMW8ayyi
         Tn1/Etp/AAfPAg/SWX7nz+QZZGn1mWtvy9UI/2HGGJZ/yj2Sv26BR25Flm8mHy5x/Rw8
         k+7V4AZsR+K5cfdkuLAShHlBmW2QoczbstYtWb03W7d8b0Gr+Uy8um4oO3XpJNmTbHUJ
         SgCsigsCWtpA9rH15QaFYTY5eQevYC8LPsynF7VP/uOdHvsbtGRJrBITxh4FZpJQbggR
         KCYz2l96HVFL7YXkIGQUnuNkwhQFutIMOnDlfKvxbb2r7ExDo+g44/cnzc4hgsktB9aF
         1rUg==
X-Gm-Message-State: AFuF++mPcWLr19QbH74gYHqln8LJhsnskjI0LxHia7P9AUJXzrt9raCA
	eKcO9opB2uOrt3lPPPtw2DZZlnSsvT/WEXS+2O8bjJ5jA9C8zAS1ACnv
X-Gm-Gg: AYBFou3yQSEZ08xsAz+syLjejGyhPPkHrU/W5lRY4wycanXC0xbvkouc4Unaf2EiBps
	vKuIyZhF0Y8j65z3IZbXhvdNV3heOGA84z80ciGIkw8MsEHaHF2GYJ53IA3gcvieb1iUYfylqnv
	jomer41aZI/1YOd0gkNz8cpChxXmceXQt5QhcL/BPPVAwX83xjfC3SED6L5nIGHQVM88azRxAeE
	eSp4Ml5dNhB+F14j6uJXtkngVxDvRyeGCnC3pSukD27fv6MhOf6GSewrG26+tsVWfbWvqkpTRB7
	4Kfh+IaVDmMxaoDf5+nWwPtzvrirrV+BFKkCY6TzYvVBFER50602B2RGX4LIpWucjbGeVnd5qZO
	x8TzMT1f/hVNlcGhyTzivZJBC4KMOpyvQJTfFHW/a6HMsFZBUQ6e9+tt6zX1XgnUP7abeZXLzbG
	vg1lfanI4UaaKd2A/uqv+jQWvcUZRapGWt8gjl13tIKbz0uG9xm860cOnuywhCi6jV6CuP/G0e+
	t8BpHDHWA==
X-Received: by 2002:a05:600c:8b6e:b0:499:8aff:59b6 with SMTP id 5b1f17b1804b1-49fe66cccf5mr208804175e9.14.1790589833445;
        Mon, 28 Sep 2026 03:03:53 -0700 (PDT)
Received: from foxbook (bez152.neoplus.adsl.tpnet.pl. [83.28.37.152])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0018f1375sm118055625e9.8.2026.09.28.03.03.50
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 28 Sep 2026 03:03:51 -0700 (PDT)
Date: Mon, 28 Sep 2026 12:03:43 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Dane Linssen <linssendane@gmail.com>
Cc: linux-usb@vger.kernel.org, netdev@vger.kernel.org, Mathias Nyman
 <mathias.nyman@intel.com>, Alan Stern <stern@rowland.harvard.edu>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: r8152: RX stops until rebind after -EPROTO on the bulk-in
 endpoint
Message-ID: <20260928120343.49e02c07.michal.pecio@gmail.com>
In-Reply-To: <CAM6_QD_xAyTFVvYKvCrrZmS+fV5DBBje9V=VdkDMMSpt2ussRg@mail.gmail.com>
References: <CAM6_QD_PoTdwdM7DvzzgHRs-G5EvQu-c5oNGve=GuKV4wFYAvQ@mail.gmail.com>
	<CAM6_QD_xAyTFVvYKvCrrZmS+fV5DBBje9V=VdkDMMSpt2ussRg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 28 Sep 2026 00:01:31 +0200, Dane Linssen wrote:
>   xhci debugfs devices/02/ep-context, bulk-in endpoint:
>     State running mult 1 max P. Streams 0 interval 125 us
>     max ESIT payload 0 CErr 3 Type Bulk IN burst 3 maxp 1024
>     deq 000000010bd3f960 avg trb len 0, virt_state:0x40
> 
> virt_state reads 0x0 when healthy, both here and on a second host
> with the same adapter. The stall at 18:59 looked the same.
> 
> 0x40 is EP_HARD_CLEAR_TOGGLE. xhci sets it when it hard-resets a
> halted endpoint, which includes a bulk transaction error that
> outlasted MAX_SOFT_RETRY, and clears it in xhci_endpoint_reset()
> once the class driver calls usb_clear_halt(). r8152 never calls
> usb_clear_halt(). On -EPROTO, read_bulk_callback() re-queues the
> buffer without logging, so as far as I can tell the endpoint stays
> out of sync until a rebind resets it. No "Rx status" warning was
> ever logged, so it wasn't a stall (-EPIPE).

Oh great, this stuff again. Yes, it seems you are getting xHCI
"USB Transaction Error" aka -EPROTO and then xhci-hcd resets the
host endpoint and clears it sequence state, but device endpoint
remains in the former state. In USB 3.x, sequence number mismatch
causes all future URBs to complete with -EPROTO again. (USB 2.0
could lose one USB packet but then it "recovers").

This should be visible with usbmon.

Alternatively, on ASMedia controllers, future URBs never complete;
AFAIU it's a HW bug. Out of curiosity, what's your xHCI chip?

As a bandaid, you could try increasing MAX_SOFT_RETRY or this:
https://lore.kernel.org/linux-usb/20260905101837.4b7849c5.michal.pecio@gmail.com/

You mentioned using dynamic debug. Do you see "Transfer error"
messages randomly during operation, or is it only one burst right
before the failure? Is your controller ASM4242 by any chance?

> usbnet doesn't clear the halt on -EPROTO either, so I'm not sure
> whether the fix belongs in r8152 or on the xhci side. It looks close
> to what Mathias's RFC "fix xhci endpoint restart at EPROTO" (March
> 2026) discusses [1].

This xHCI patch only tried to prevent URB execution before the driver
calls usb_clear_halt(). This seems a good policy for -EPIPE and maybe
also for -EPROTO on USB 3.x devices, since sequence mismatch renders
them unusable anyway. We've been reluctant to touch USB 2.0.

But somebody still needs to call usb_clear_halt(). Alan Stern thought
it could be USB core, but these patches haven't materialized and TBH
there is nothing wrong with drivers like r8152 calling it. In fact,
some class specs (like mass storage) seem to imply this, by wanting
other class-specific operations to happen before clear halt.

Is it doable for r8152 to call this before continuing operation?
xHCI side can be fixed and things might work, at least for r8152.

Regards,
Michal
