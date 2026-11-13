Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794552032;
	b=RYAgOOCjIXTAm9hl3KJSlnh5of7esgjy6OD5EJski9JJklfI+Krtjy4BSOrB5vowUsJM
	 8+VI4kQX8EQa9E8Wy0iHmPnXLSWmhmi+iE/s2DPKxXM//LA4qtuTM5sAScs+FMGab82el
	 Q9EcaJfsBh0wLk2qMZWd1osDt1uYNfWPl+vkdvF7DSVC+tK+DzFjUfU36i9pWfLlRF7BS
	 YZdjUAIG+OWPNgAzyt5YUVwKrlvp+ITEdM7A5sdk91xFuu0hgA03Imtsk9FppMgx7QXCx
	 TzULCOzt3xecrAEbnwsKM96ULbJbw3hIhdDiGkS0z9h0heo4rGGyKqFxE5cCgWPGL9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794552032;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=WDeN/0qM2qOpnmQ+VMcPHkNxGND/KncdLig3CNX0M24=;
	b=DM7WijGI/hVtB5tBVQDNBXfTCtI/Il9LdQIe2HBkzX9mY5n14lrMiskkei5hYjmI0DX4
	 93oqxeGSEBSTcRHkY5acc+O5Wfzo7Fql55zCguyBJe/hSIGz0pABC34onXmD0LSHOUZLE
	 eCvLLaJIp+q9OwQ+RmsjlcAXyVYHostYP3TW3BVMm2T9LhZ62gm5yfBP1QLb8V5K+1nww
	 ebPHKNA3uXh5CtCr6sMoMqaloBKrG2e5eRjSC1e6If3IWePp7y9mxvwH943Ru3XqRMX6G
	 KpcmTFg4hbNgobnZ2ipAwnseT81nNCnxt9UkKg9z0mNDE5YOAtNsbq6AqYl159L3UxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DZd23E7v;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10693606A330
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 06:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DZd23E7v
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE3151F000C6;
	Fri, 13 Nov 2026 06:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794552031;
	bh=WDeN/0qM2qOpnmQ+VMcPHkNxGND/KncdLig3CNX0M24=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=DZd23E7vU4+9UzDB5ewRIFjA4YtmRkma3/kdBDiHry92a0snz4AUvF6Y9RQCxtPfP
	 dpnveoSJBSOn3bG0AP8fAOamrs7P2y0GWKWkidPYSU30X2S3D+Y0ezi84rw0qpzItO
	 +UjtgArJt6VLraztXfVGc3Ddi4fg5eK3l5v6L0YZN6ZMb3y0tZm35GhjgBepP8WdWH
	 b3q2iDgvQYEr8VylTUiguFTmvJPblZ3IjMUJrx7gZUzWdXdffjNReA0S8IU6GPsBAw
	 ajRbzw9BXaH44mDSHS/qWIWWTtyB9ghxhwqYJFp3ovEknBIxmSEck8hvGGTxtanBAB
	 MKAiwdlN7Jqgg==
Message-ID: <sashiko-outbox-212277@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] usb: phy: gpio-vbus: free the interrupt before
 cancelling the work
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chengyu Liu" <lui2012qwq@gmail.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261113063409.47485-5-lui2012qwq@gmail.com>
References: <20261113063409.47485-1-lui2012qwq@gmail.com>
 <20261113063409.47485-5-lui2012qwq@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 06:40:31 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> gpio_vbus_remove() cancels gpio_vbus->work while the VBUS sensing GPIO
> interrupt is still live: it is devm-managed and freed only at detach,
> and gpio_vbus_irq() schedules the work with a 100 ms debounce delay.
> A plug event landing after the cancel re-arms the work, and its timer
> then fires on the freed gpio_vbus_data.
>=20
> Free the interrupt first, which also waits for any running handler,
> so nothing can re-arm the work past the cancel.
>=20
> Found by static analysis and confirmed with a KASAN reproducer:
> slab-use-after-free write in __run_timer_base() within one debounce
> interval of unregistering the device while its VBUS GPIO is toggled
> (object allocated by gpio_vbus_probe() via devm_kmalloc(), freed by
> devres_release_all() at unbind).
>=20
> Fixes: c2344f13b59e ("USB: gpio_vbus: add delayed vbus_session calls")
> Cc: stable@vger.kernel.org
> Reviewed-by: Neill Kapron <nkapron@google.com>
> Signed-off-by: Chengyu Liu <lui2012qwq@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113063409.4748=
5-1-lui2012qwq@gmail.com?part=3D4

