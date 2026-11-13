Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794553151;
	b=sh4YUyOgrnggMmZtjp8PoQX7J26knPJQqZUN1NmHc6PrkRkMXIKynBT0v6ibYsUTs6Ze
	 Z5DnFD89B6UtVgqPYCkbY0f73KAzZWngpchtNBGe0OhM7qj874s3yNCyAK4u/CqMmT9Ay
	 /NMD9Na2yYrrU9vOVmQpneGJzR0LUGWtUxqfTqMQq1n/ct6PXTMPOrFiH6H+sLuAyMd7y
	 +T2PMV4qgVG8yPNo2q1mB1L0kyPuh+zO6bx5A0u2x73R1ByqddPtzI6Ztjd8B9tQd8yRM
	 EpzBfZl7Ah6VN/UqDqH17r3469rZImB0Zvpb23oDpCOLSsNUkgdMKr44jNOal/NnjKA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794553151;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qeIzGejgUnOZAJR+NUnKQWT+JLX+S3iStcqz+L1EeNc=;
	b=wToi3x8YphmhGX0SpUoHYTdogVhUSKNF6LBWPj4ay5ifSAhFrAPPvbhxqj+9K1ZY6jyV
	 hkoOZ5Newid83P1N8UPFuMNtQCRR6eUwuFczoPpZTkxXnbkzPeuuTnk1QoTY9d8sS3snO
	 0ceDWNbVq2Y1eTc1+5kqIPTFDO0anTgDA7oPtsSpBUR0GgNdU0oiNK3YstK3mAqsmqzVU
	 Bc0Dkicr9NixEHeZ9qyyO9lL8ketpSgq35/6U9RZkz10Y05h1E6Y5GcGEU28BDE033WOI
	 y01n5boZT+DyBjikQoXXHRHZoEDMqMERySwMQvQ7faYbFm2B0p7BRKAar3+UGcD3Kgw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=yv8UBWw8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EDA606A33B
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 06:59:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34EDA606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=yv8UBWw8
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4d581da0aaso88627066b.2
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 22:59:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794553149; cv=none;
        d=google.com; s=arc-20260327;
        b=FOF1nIeVbhZqJRJmDwWpaGbkG+Ad+1hSOS+81uLwE8nf7h8SO2Q6UyservJy8HMWxX
         PeKKPL78F9xEAU8bbQQGP1TbgrB9bQEq6K90n0LdVf9SFbr3xX0mEiGLB/R6dLdxWKNL
         dzfFNQM/Rtk7fZ8UGzQM30PwGRIO/D6tLVr6zhxOursd7OZDMdvFppjqjO//WWl30EVT
         T7d5gZ7oOoxIZ2kFFwxBE96QUjC/aovvnqXcVS7Uy1d5e8KXtzMn+YK0CRbPJ3nBOAx/
         4mapbu4AuVBturBWqMKuLu2ZHHA4zVUSnx3PISJ09wkpVhId/NQf0GzrKGpEb0IAUOrj
         A1Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qeIzGejgUnOZAJR+NUnKQWT+JLX+S3iStcqz+L1EeNc=;
        fh=9Utgtcp3xmg0hBAJ6dc6FsxPgXuVTbArhOzGwZhII70=;
        b=pBJxNpUTPzylDa2cjolM2pnjERaHToyO/cWB6elLTtQ/7Y7QlSpffhE4BH1k7ATdwP
         bG8E/GeKRQzVijOimFlqeO9Wy5ZYBl0f6LBLpiEvpD90LIFTTyCMcuLgqnN1MyLEfG1H
         pS+iBbKX8E22fsWOBJld0m+dyuNp2cCKD69YULn4m3vBRvIZQ63xXHtYCPAzgzop28w/
         2w20RXgHjWE7CGUzOyd/z+Q2a3OzA8yV+t2LJObSEFruiOlBbfKtBvVw6n/yfsDx49LA
         kcQVRQHCwJrSVggEhaBONgM8z9jZDjJucQhARcP8HRYYVLtAGWt7ewy4uactmKcZDhhS
         oqBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794553149; x=1795157949; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qeIzGejgUnOZAJR+NUnKQWT+JLX+S3iStcqz+L1EeNc=;
        b=yv8UBWw8+3wCTR92+nxE0nmLMArTGzE6Ezdymo6t2L6PVidgmuf99L/gf9wApGZVLF
         MujXKE7gtXTDvh/VTttvmrTZVmwUkWND5tw0R+mmAaHlSi6KAQNCjzEoE8a98Adih5zg
         OR25M5gaZD3H6FazwL5UKFl/Krjsm2NlIkoP9B5noXVIdYZ4n154vlYzpYg23HvcakLH
         jisUu+HO8fIGQi3l2MNGLeEjhz74mAZbrMh3TwYvP4ji8KAQUZMsWof7/1w9QRXt6fdi
         s103+8hy9Ke58DLD8w2P+diercjuAwQqHcvCZdZCvfz2uOq1RgnghI0ljrEgpUbJ/K+w
         gBsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794553149; x=1795157949;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qeIzGejgUnOZAJR+NUnKQWT+JLX+S3iStcqz+L1EeNc=;
        b=JfKf9uARrV7EdsO7udBmA/BgqVsaQ2Mfpm607FRq177PUItOj8PI+7YxoiG2RzRja1
         3+oYQhs7aahh5fIk1Dc3dr4tlTEE1ZPHUR1uQ1NgAoVz5+tkhGJXyOEEBqjQwdzaoKg5
         MJ+cSEGvHs/I+9QBLxEb1v0xWavsDTeQIliUJNX6WY5UyqL+bZaxqX020sxGcZj+ZVHp
         Zb4rvpaoDHuv3hJQ9leveXcoTFzNo3yzUFUtZ/NdukJ3sekGaJtueLfkzVSpGhmvpxI2
         IpZx98j94XijFc7jDFiSkBr4zAq+No8D5PfyYCHzhtHMM34Qs0FtkBe+p917RmkzDm1u
         Uifw==
X-Forwarded-Encrypted: i=1; AL+hErEVot0UJg2OZOW6neHdQ51xoHUGiuvOnK1rWAaXUFrUVXKH8Iw7Bprd+JBxd0o/Zktkdmd08pGywd4=@vger.kernel.org
X-Gm-Message-State: APuU4Z92dYu+IL4KXIa0Fel+VcjiPPpADOKsyoOWCeK5IgWlTS+9T0vX
	qVFKGFvGri0z4w19CofSjoeLd53uLj3gyYx7GLF6QTlpktvxhw+XgvjVWSLSlStq8LOh1slbjgZ
	+iLN9NnD4WblDaYfnwxfyptADvUOd/8JFWE5mbSafbqJx8rO9JOIlaNIoIw==
X-Gm-Gg: AYBFou1ow0jNMwBr9EptbYcmlHpqbItJUcmenXGaofzd8SeaIy+kT95hk1o9cQnOCKE
	DDu4l+jlw6C0xgDxM5CqpDkVSnzDWUQCz70z2xnUCN1dU+BTPeU8ELPsubUBN8WVSWmbZzcqCRl
	HxwYSQPaErAoj7x0CmV3QiizLiSsVN14XddcCtuG2jCNiw8EcdjKVIUTTUnXPU0NKh6FMUrKNaW
	sh+mtSray//Ym9Iv1E+GA2rJ2rdBG68CmSqhQTW4S88GZ0dDJdQ1HeOsHmbmznLmaTL+RmUtPn4
	8mOtXugWhr4V1vw6zL6QiHPag1yHTlybkkDDlbxm2nwDTKj4jlOWUJvZBRTUavfesjx7/HI9ODw
	pmcHw2Qn28jPjAheQgVY6K6ev9AugHSsbKRIEvRwcei0anEu/7gWdB5AOGUDKj07bcpNt
X-Received: by 2002:a17:907:96ac:b0:c29:3c97:c994 with SMTP id
 a640c23a62f3a-c50963bd677mr113775466b.35.1794553149505; Thu, 12 Nov 2026
 22:59:09 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-udc-connect-v1-1-03c73259642b@flipper.net> <57e83596-03c7-4406-b01c-db2ad2298413@rowland.harvard.edu>
In-Reply-To: <57e83596-03c7-4406-b01c-db2ad2298413@rowland.harvard.edu>
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 13 Nov 2026 10:58:58 +0400
X-Gm-Features: AclHuK9vJOW-Z7MYq2yRXHeCiiCDHnszsRMvz5_5l2FLX1hDAYnqlpu_XsOjoZY
Message-ID: <CAKTNdwHb4ahziiFLDCCWsi9_65toGx=HTkvaB7bv3vhqzuCc6w@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: udc: Clear a pending connection when
 starting the UDC
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Neill Kapron <nkapron@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Xu Yang <xu.yang_2@nxp.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alan,

On Fri, Nov 13, 2026 at 7:36=E2=80=AFAM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> On Thu, Nov 12, 2026 at 06:31:35PM +0400, Alexey Charkov wrote:
> > Since commit 62911bc82b03 ("usb: gadget: udc: skip pullup() if already
> > connected"), usb_gadget_connect_locked() returns early when
> > gadget->connected is set. A connection requested while the UDC is
> > stopped sets that flag too, without enabling the pullup. A later
> > gadget_bind_driver() or soft_connect "connect" then finds it set and
> > never enables the pullup, so the host doesn't see the gadget until it i=
s
> > unbound and bound again.
> >
> > This happens whenever a UDC driver reports VBUS through
> > usb_udc_vbus_handler() while no gadget driver is bound, e.g. when a
> > Type-C port controller switches the controller to the device role at
> > boot, seconds before userspace binds a configfs gadget.
> >
> > The pullup is never enabled while the UDC is stopped, so clear
> > gadget->connected once it starts. The bind connects according to the
> > VBUS state that the core tracks anyway, and a function that deactivates
> > the gadget during bind still has the connection recorded for
> > usb_gadget_activate().
>
> This is good but it doesn't go far enough.
>
> The UDC core has gone a little overboard in the ways it allows gadgets
> to connect to or disconnect from the host.  Along with the automatic
> actions associated with bind and unbind, there's vbus_event_work(),
> usb_gadget_{de}activate(), and soft_connect_store().  In some respects
> these interfaces act at cross purposes.
>
> (There's also usb_gadget_{dis}connect().  Those two routines seem to be
> EXPORTed solely for the benefit of
> drivers/power/supply/isp1704_charger.c -- is this really a good idea?)
>
> In addition, there's a good case to be made that soft_connect_store()
> should rely entirely on udc->connect_lock, not on
> device_lock(&udc->gadget->dev), and it should check
> udc->allow_connect instead of udc->driver, and it should not
> call usb_gadget_udc_start_locked() or usb_gadget_udc_stop_locked().
>
> And of course, as you implied but didn't state explicitly,
> gadget->connected is being used for two different purposes: to indicate
> the current connection state, and to indicate whether a connection
> should be started when it becomes possible to do so.  There should be a
> separate variable -- or none at all -- to handle this secondary purpose.

Thanks a lot for looking into this. I'm happy to look into a broader
refactor and submit it separately; however, I believe this immediate
targeted fix for a recent regression would be good to merge
regardless. Without this patch, the gadget doesn't come up at boot for
me at all, and a larger refactor would require multiple review rounds.

> The whole situation needs to be straightened out.  I think the following
> approach makes sense:
>
>     1.  Connecting is never allowed if no driver is bound, because
>         in that condition the gadget can't do anything.
>
>     2.  Connecting is not allowed if Vbus power isn't present, because
>         it would violate the USB spec.
>
>     3.  Connecting is not allowed if the gadget driver has
>         deactivated the gadget.  Note that the activation setting has
>         to be forgotten when the gadget driver unbinds, since it is
>         driver-specific.
>
>     4.  soft_connect_store() should be able to force a disconnect,
>         but it shouldn't be able to override 1 - 3 by forcing a
>         connect.
>
>     5.  Whenever the state changes, the gadget should try to connect
>         if not prevented from doing so by 1 - 4.
>
> In addition, the gadget should be started when it binds to a driver and
> stopped when it unbinds, with no changes at any other times.  (Read the
> kerneldoc for usb_gadget_udc_stop_locked() to see why.)
>
> And the proper way to test whether none of conditions 1 - 3 apply should
> be to check udc->allow_connect while holding udc->connect_lock.  All the
> relevant routines should maintain this invariant, perhaps by calling a
> subroutine to set udc->allow_connect whenever the state changes.
>
> Have I left anything out?
>
> We do a lot of this already, but not all of it.  How would you like to
> implement this scheme fully?

Let me give it a try and send an RFC series.

Best regards,
Alexey
