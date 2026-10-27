Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100429;
	b=nMihk0/8bdT8w0CZsu1BlUFQEfSyDQdS+0PldP3gdHWLYC/fZe1aUTdtqHa/Uf1TacJd
	 brzx+R1VROoodcwkhz+01DaWUmRzBPl6Yv1SSASc4v2ORPwptDJ7lHLiFgmpeSaF/+Yii
	 dsM6OF8s+q7fm+ENL2mKzNJbciX1uXKt+y9UOW76JYYwsOApFj8cQ82Tc7jtI82mBRmOq
	 lPv+8BQ7+pGIqrSVgCyha0+ktGOTMYzw931IHW6ExO9vCUQ4j/fto5ou/EA+tat85y3WV
	 +QOmtrUdCxNTELXz3QBtD9tOy/fAxphVAt0vCO1/E+bM100fyzwhQ0A/CxgAlflrg/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100429;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=h9bNGVeG0k5RZYVkn4G41NoOWYbyxLp1DbxTQ4HVoyk=;
	b=iK+eWvs89Dmhs1TNjS9hkeo0sPH3+o0iPm2Z68aQYoRaaZ85mIJsQKHw0pt24PPoE2TQ
	 ywg3PNB2orneyzhmIBUno++nZg2Yw8m9w6VeVnM0f4cnZHY8LgSRpM/HitVsIWUL+CdGQ
	 GBXSZ6YDFwobLnCNEbGADvbHTz45JWLul05TRWHdYga0FHIot3h2dEimkJl42pVlnT0Ax
	 fwcgjLrHu8PDnF1YI2t6xxOfAacG1FQyi+5jobdLmGWAVIl0mXDr6NxvEFleR30rn+bNe
	 nIhXi5NWhtflE+/cTcgujGZizJnt+Ss+mrXZBw7njq5Ry9ck0MKC/jhJvcAyeB+WTDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DmZLhUb2;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE09C606A31E
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 11:27:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE09C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DmZLhUb2
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so27146755e9.3
        for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 04:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793100427; x=1793705227; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h9bNGVeG0k5RZYVkn4G41NoOWYbyxLp1DbxTQ4HVoyk=;
        b=DmZLhUb2kDU2Mk020s03gbi6UajB9n56O6qLXGia6Fd5V3NwcyZNyvddEqhKK4L363
         Kvy6KD1yagn5Ukdwdkx45/yJmH8Ley+9PVOMMfIycCFj917R/MKg5BuiTrKG/PvbIPhK
         B8wxtigfc7+HnacLZjTlwpiCS0GXi+Ehb8fV7uJCENXFTHvs748L5bmU8+4vYKFRaRqW
         surlEFPFsn4GKB4JHWaCB1P/03E0ug6sKTT3xW0RzEfWuM+hVZ5cgsj+63xvKNMR8a4u
         xVFpTTN2etJL4nTW6XAOJKRxSWkrsamMxTdcFxfrispbGjp+vzef0e45guDc4ZusvZ/I
         puSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100427; x=1793705227;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h9bNGVeG0k5RZYVkn4G41NoOWYbyxLp1DbxTQ4HVoyk=;
        b=rciwnUNBD1XKve1F3//ZC5xEmiZ8Oi2mGWdadoQvqmDcf+4ROtLdyqoc9PVdSuId94
         saGbF45jL7VlT4Q27f4ebnr0JgCK4twGugTj4kRWxEtPW4SIwEEJ4e0TKI+jsLo1BcYJ
         2ZcM493nSXT+6nrdfKoxbKf9EjbG7Dgzzuvt+txDdbUTcb0Qhqs2Y06qBmtYTIBdf4AT
         8lcsZXmtxGncdeQREYNYb5fjq5FTuc1oUS7NEWu3l8OY5zc9Y0LhHrkRRLmHouTkdY9X
         QJioF1g7wAGmpdI7d1xthm7xdWeTEiuv44kaT6NPbokuNHRwN9X2WJQnBztnMe+RvjGo
         RH2w==
X-Forwarded-Encrypted: i=1; AKwUvBxayc3sDCaDxD9jRuNZkftj58thjdrQgMa/vjMooOdwijf61zawkPAYq93+uBR3gRLUS0jHWbiN8IQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJO80aXcFJyvGR0+hZFgoDXRCSFuL0HvkMMHQy0jgq13iYCkBUh
	o/sWp0eYQfRl+vxtoKDjBAljSwxxFarKSTFBxcwQhpWgDmiTg9v0ZIXv
X-Gm-Gg: AYBFou0JDC3UR3NJmjnkKs9WDfcZ7WyieZp273KK1BDEscc87K7akiMxdz/jplX+WER
	E5axetH1CzZQpA6uf/7mUCvWlx2ZGu4kkpOrnpV7khG3iJ0WeqsTEILeZ0P8hh0gapup+7dD8YO
	ihmzRw81k0y9XkS1ob2JY1wXD+WOoMyPzHBbDdQCafRBAZGn0Ki8i5rswfu6B2KtE29k3CivvJi
	eETdnR/tpKe2XK+V/iCrc3FA5Gambn85vPjxKix7G+zEXFtHCegahThxDPGtTVyTML5zJ7n4IZR
	dHZanetkYIe8b0TlEAFJYVp1gy1chYEFV+Gx3R8e4YDf1qC8qBsnYq55pG7eblFCNO+BFTKPKtc
	sdTpwtCuw9DE01kZj0W26du/s88vsPWvTRyxIhslL7UYyCrc8+GzDfXmBYjKXc8K6ZRX/+woRXH
	/BdWGblj9odAZX2jZPN3XWQyqsGePjmyIKLuo7X3WeSdrwz613++1M8kIzyiDNHg0WZkk8wnBWq
	h5g3s2XOUrN5zCKqlykGumPkz49uKa2q46dhvavizO41cySxb4AwmNAWNILy6J/+aglHK7wodtW
	x5UMNK5M+w==
X-Received: by 2002:a05:600c:530e:b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4a35acbee85mr182266245e9.26.1793100426728;
        Tue, 27 Oct 2026 04:27:06 -0700 (PDT)
Received: from foxbook (bgu81.neoplus.adsl.tpnet.pl. [83.28.84.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359f3e00asm449397205e9.0.2026.10.27.04.27.05
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 27 Oct 2026 04:27:06 -0700 (PDT)
Date: Tue, 27 Oct 2026 12:27:02 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Yiyu Zhou <yiyu@yiyuzhou.io>, mathias.nyman@intel.com,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev, Dennis Wissel
 <dennis@dsine.de>
Subject: Re: [PATCH] xhci: keep ep0 blocked after disconnect until Address
 Device reloads it
Message-ID: <20261027122702.77f01cb0.michal.pecio@gmail.com>
In-Reply-To: <842f8c77-ad37-4eea-9983-61a4086eaf5e@linux.intel.com>
References: <qLQr_bD2TzCrwVMFdRe7Wg@dsine.de>
	<20261027084845.1588204-1-yiyu@yiyuzhou.io>
	<842f8c77-ad37-4eea-9983-61a4086eaf5e@linux.intel.com>
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

On Tue, 27 Oct 2026 12:36:26 +0200, Mathias Nyman wrote:
> Thanks for the detailed description, this looks like a very targeted fix
> for this specific hid case.
> 
> It still leaves the stale TRBs on ep0 ring, and relies on a successful
> address device command to clear the EP_DROP_PENDING flag, blocking ep0
> in all other scenarios. It also leaves xHC internal ep0 in the
> 'halted' state. Not sure if xHC internal halted ep0 state is cleared during
> 'reset device' or 'address device' command.

Addres Device is not suitable, unless preceded by Drop/Enable slot.

Reset Device:

  For the Default Control Endpoint the xHC shall terminate any USB
  activity, abort any pending events not already posted to an Event
  Ring, and transition the endpoint to the Running state.

I see no mention of "halted" in all of 4.6.11. Logically, the spec
seems to assume that SW can use this command when EP0 is running and
busy, so it can transition to halted while the command is pending,
so the xHC "should" be able to deal with that.

We know how dependable xHCI hardware is in practice, but actually this
might work because IIRC Windows also doesn't bother resetting endpoints
of disconnected devices. I haven't studied this very thoroughly, but
I recall noticing that it queries PORTSC before resetting endpoints
and it violates the spec by dropping halted endpoints, just like we do.

> I'm thinking we should take a step backwards first when fixing this
> regression, and then look if we can tune fine tune ep0 after that.
> 
> 1. Make sure All TDs are turned to no-op before returning the URBs in
>    the disconnect case.
> 
>     Add all TDs in ring to cancelled list, turn them no-op, and then
>     give them back.

Seems helpful and harmless, doesn't account for potential TRB caching.

> 2. Treat ep0 differently, cancel all TDs on ring as above, but still
>    reset it when halted. Allow a Set TR deq pointer command as well,
>    and only give back ep0 URBs after this. This partially reverts the
>    two patches that caused this issue, and clears the ep0 halted state

Sensible, if Reset EP/Set TR Deq on EP0 of a disconnected USB3 device
don't trigger HW bugs. These commands only change some EP Ctx fields
and don't submit or abort USB transfers, so they may be safe. It's even
possible that they are safe on all endpoints, but who knows.

I don't think this will cause any issuess on Renesas, even generalized
to all endpoints, and I still have the HW and ability to test.

We could use some input from the author of b8c3b718087b ("usb: xhci:
Don't try to recover an endpoint if port is in error state.") about
those issues, whether they affected EP0 or not :)

> 3. Possibly keep EP_DROP_PENDING flag for ep0 until
>    xhci_setup_device() as this patch does, but always clear it in
>    xhci_setup_device() before it returns

Does this result in URBs failing to submit before the device is
addressed, causing USB core to drop and enumerate again? That part
does seem a little dodgy. We may agree or disagree with core's
policies, but they are what they are, and not an accidental bug.
Doesn't seem suitable for 7.3.

Regards,
Michal
