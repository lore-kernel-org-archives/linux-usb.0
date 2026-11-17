Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794944154;
	b=M4pF5BIVhr8eWaLJIMsYYYS9/RmUnZKCXXdlmtmNVyqmptFmulJLdGs9d4KZBkBDUURh
	 cboSpaVxpYNqTNpfh7UPlbKR/cY+zfHsHXLoFWuCeDA6eYe5N1lw1Ex8fbBFtdiKAMKOr
	 /RBpXOJqbmXyyX+noYKRCTqUrpZ6V+ecaN3MnffIWJbLM3J7r+MSQ8fTBQRDY7S/gfxHF
	 KP5rxeA/e1smqHJYcqmumT9JcLpvQ5h1L8OcRTchPQPkggIS/L0+6tYTY27LmP/SdgNkT
	 KqR/u/DfwbXDFL7xfH/aixE8y1M5qNKORnGLt/VVAS81aspmS2lY1X4OcgYdZXz1OBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794944154;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=gDJ6dpxOIUR9brvMd6lTGXfjgJfZybZT29DID1cSiqY=;
	b=PQzSOtCm8NzRdRULZCajY2FMleenJ9XKDLMN3uZYr7aaYXtFNzk+AJ977sIVETMMY3mj
	 fwqMYsdml9aC4etPzmYBWGqxNWW1nCZHxUIeFGO3EAwyN+xpOlDELvWDhN2JuGnvCKA3y
	 VG3kS2ze0VU0Is38sbOeUHktt/ovhyd7LSWjKDRAvJRoTsuT3iECNDgBwe9B1NJ7IlKlN
	 WJhuo8jJi1KoyAKbS74Ks/vOUhXQv9CUKdDIwTdterS19k6IpMHVafp+o4V5wh6VvvjHp
	 KETcQr0mgTzkk/Qfd6hnwwSOBErgAXIXO0u9G3w+xLEpOyIuOXU+7GtoweERyk1h0LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i+ohFJqJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018E2606A32A
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 19:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i+ohFJqJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4DEA1F000C5;
	Tue, 17 Nov 2026 19:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794944153;
	bh=gDJ6dpxOIUR9brvMd6lTGXfjgJfZybZT29DID1cSiqY=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=i+ohFJqJhUvbPDUrX8S/tdtugDBJMTqZoxPBIoAatChS1qhsfVqMVGQbvWXav2ggo
	 TmyyPA++CO69kYtdTYK+7fgCkrbag/HDgn8WxjcFo7FqUr/5aXIZ3cvIkSPtO2dC4S
	 WarZjKLys6Zn7EfXyXNd3HiqhsoCwqCQ/osjIxj8FZbkvAsQ+PaDFe/ihnKC/tBJob
	 bHd11klWYb6D8SxYw7CHKE/a2uVYR1K4WPWhZDlD8bKEqt0CFTol8QEI6EY9AnQfT0
	 kjMAZk9estRi6kPs4FLqguLX8r1V2SVeui0d0tKUzoCYEz115f3bMjdicSnbiydyEM
	 5ouYESRc2KmWw==
Message-ID: <sashiko-outbox-219494@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: xhci: pci: do not perform Soft Retry on AMD 500
 series chipset host
Reply-To: sashiko-reviews@lists.linux.dev
To: "Riley Wagner" <riwiwa00@gmail.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261117193300.25897-1-riwiwa00@gmail.com>
References: <20261117193300.25897-1-riwiwa00@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 19:35:53 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Full-speed HID devices hot-plugged into a root port of the AMD 500
> series chipset xHCI host (1022:43ee) enumerate and bind, but never
> deliver any input. The device then resets itself after ~10 seconds,
> re-enumerates, and the cycle repeats. Devices present at boot are not
> affected.
>=20
> With xhci_hcd dynamic debug enabled, the first poll of the interrupt IN
> endpoint fails with a transaction error, the driver performs a Soft
> Retry, and the endpoint never completes another transfer:
>=20
>   [ 6658.313453] xhci_hcd 0000:02:00.0: Successful Endpoint Configure com=
mand
>   [ 6658.352348] input: ELECOM TrackBall Mouse HUGE TrackBall as ...
>   [ 6659.424165] xhci_hcd 0000:02:00.0: Transfer error for slot 29 ep 2 o=
n endpoint
>   [ 6659.424170] xhci_hcd 0000:02:00.0: Soft-reset ep 2, slot 29
>   [ 6659.424290] xhci_hcd 0000:02:00.0: Ignoring reset ep completion code=
 of 1
> [ ... ]
>=20
> Fixes: f8f80be501aa ("xhci: Use soft retry to recover faster from transac=
tion errors")
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D202541
> Cc: stable@vger.kernel.org
> Signed-off-by: Riley Wagner <riwiwa00@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117193300.2589=
7-1-riwiwa00@gmail.com?part=3D1

