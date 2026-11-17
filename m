Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794884170;
	b=IYRfDi7CAPM6vhNOk7Vx3LrrrlKXmymMrm0g/L8cSGUZkoUwg14IFcD0TrGlddvD6BvV
	 Q9sfp5djVo/TIE77cRG8I6RAAE9JE1ZkeOsjFkEhUqV7GpEJu8rQqX18gG+c1jTD3SvMV
	 rMHO0w5NvxgbIbyxw523hz8i9svuCSZqE2slOp1QbDGHrziEqHBpdBasEftGZA5K1vuMl
	 C8pPFz3z2Z1t1amx20mdmY3C/jGrnWE2813JA2EeFl+JTSBGedo+wQNvHeW1bgRRpp5ic
	 VmrBuX1Z92mjD6wJIaXwQT0h7VgMZdMre5Cgv2QNUKmzzzdX8tP5218E59zJQFf9v8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794884170;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=18dvI2tBIkS/JHr3A2ANh5fTwaNORq1tIKQOfc8Jhfg=;
	b=vzlyLeHSoOOWh17UlYtvl6eudXOuzpd5BIXqxs3wJGIUmCohSldUC0uzbjgwyAxl0itT
	 I0n7Z/imNEzsDrgLwbNIDN1swcukNNjWX26QVGDkt54KQAJ6TsQYFyjiWLtkAXrYXLwto
	 khCh9iq+opKQdXJyTIlFJeTFI7l3T2MYnZDNZQq9cTMFR4dP4CMn0YWwGcYwfxC1i83tW
	 EvEQqtFJeCrUxwSGF4ZYwP5zTKN9HkFxVIinnTs7Ex46vv+Xsu+SvpIqkaJzFAzKLtcxr
	 VUyRyfFQSk0XNayO2mXvKmrJAu2BkIXBYkR7M5+Bz6qVLQIkI9Lk6VNJjvB4yfKed1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PMiUsBhS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B5A606A31C
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 02:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PMiUsBhS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C2111F000C4;
	Tue, 17 Nov 2026 02:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794884169;
	bh=18dvI2tBIkS/JHr3A2ANh5fTwaNORq1tIKQOfc8Jhfg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PMiUsBhSz264yW12YswZMHMU2ZvqsQa3K1hTn8rG8ZpTzqo9McX5ITcd4CtD6cTci
	 BluATvP434fhUtF8nYvbXj1CaRXDM2qlctm+x/t7pD4OAzueIg4Ee5+aae+lmyLEOG
	 b6XpDbua6Z4wzXUb3NY/NPNZ8uqAMagekcXJzBh97sRpPIfyQYajY+Eco2u4q4tO+2
	 SmGIz+i3NE4AjgX/H8l48BY7L9MuLC8tt8qnDLFYmCn2GXHMnka9rX0aRD9bV7tlOh
	 ArHnSY+dUBf+ABLpqf884IoqeIU4HgeKZn0deCXGNuU682vZunY4yGbFe6dJknuS1H
	 7kUSPpyxgQ57g==
Message-ID: <sashiko-outbox-218100@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: usbfs: reject SETINTERFACE while suspend is
 allowed
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cheng Yongkang" <teel4res@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261117023858.467683-1-teel4res@gmail.com>
References: <20261115163709.226641-1-teel4res@gmail.com>
 <36240a2c-0ecb-4b26-824d-84d782dc706e@rowland.harvard.edu>
 <20261116060549.370140-1-teel4res@gmail.com>
 <a7e6b6f9-9926-404a-b185-c9fcab5c9d10@rowland.harvard.edu>
 <20261117023858.467683-1-teel4res@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 02:56:09 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> After USBDEVFS_ALLOW_SUSPEND, a usbfs file no longer holds a runtime PM
> reference and the device can be runtime suspended. When it is resumed
> through reset-resume, finish_port_resume() sets USB_STATE_CONFIGURED
> before usb_reset_and_verify_device() restores the altsettings. The
> restore loop also runs when a driver bound to another interface calls
> usb_reset_device() from its resume handler. The resume path does not
> take the device lock, so a SETINTERFACE issued in that window passes
> checkintf() and its usb_set_interface() runs concurrently with the
> usb_set_interface() calls of the restore loop.
>=20
> Fail SETINTERFACE with -EHOSTUNREACH while suspend is allowed. A
> program has to call USBDEVFS_FORBID_SUSPEND or USBDEVFS_WAIT_FOR_RESUME
> first, which resumes the device and keeps it from suspending until the
> file allows suspend again.
>=20
> Fixes: 7794f486ed0b ("usbfs: Add ioctls for runtime power management")
> Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Cheng Yongkang <teel4res@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117023858.4676=
83-1-teel4res@gmail.com?part=3D1

