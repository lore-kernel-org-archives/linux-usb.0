Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795127223;
	b=a1bRmmIwzHKqhhPR9tBhv4cHWcnVzgPCdIxxLbPbGfYH8R41DrYRV/gdrtHOq2dLdRae
	 GZQ3LTxfEKUv/LZPVRczvIinN17haIvn+Xd/VYlvqisftpFhOY7KUAvgljLvqgg65SFRZ
	 8Q5XST7QJhMoHqc96KEDW5FMXhoOxlxPT92qktV80caYx84FcQLOpdG9jebo/Vm+WRQmQ
	 sAdiBC2DMlCTStNe8ncb5YTV+rj4ggjaalBLWgufZDsLrVFCJzrtLkNihbhe6Iiqu5v5k
	 jfgaOh/4XWRqYdkQ/VvxZWRojzLf9XgxE+0ueWdOPcGJFyqbKM/X8VJtipwUXtf65Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795127223;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=pFUFMyKwMGS7MUvOE4kieqQLWOgpkjZGXFk5vzZwRKw=;
	b=aJsze4/xCPF2pXw4395gHp1A666Ds8vbuQG984tCVQa70Qa+VM64PYkCHPdoj1qFzr5T
	 pmyaEizStCG/Ph4dctJTVOoPu8YPv9Xiyu1Xv7uqjUKLJlq9CuEjuMJK1easf5ojixR4b
	 VoT2lpvWNYSpBFnty5nOLyuWvRhIhllhxNjP4z/fkAkhg1Ve3twuFjNi74bgOU9rqPVcN
	 TG9Y0gBPnDhrSlwy19X6FYECAlBlBvid4B/1e/2a9UuU26FpNaqWXLRdLCeGny1eWxV0Q
	 hLNfmwOIXCwiNGGZAihextkUC8G5FYNnw3iZhwDuit6WWTRcJ0WHUS2Ya/kqdAmwDbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=POBOi+t1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDEB606A33F
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 22:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=POBOi+t1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D79C1F000D2;
	Thu, 19 Nov 2026 22:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795127222;
	bh=pFUFMyKwMGS7MUvOE4kieqQLWOgpkjZGXFk5vzZwRKw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=POBOi+t1rFrN1/ZTOd7Kwu8tuTih5YsrPR0YyuxYcRfydCWl8r9S0jx9mTiDidpE+
	 QzKTaCg+2QAdPaGDQ7fYuUenOCbXieVQqXoVfvJa1gyAP1IVTlGK8HQOWVhmEmtfry
	 neLS4oTbrBBRrMYMXrojDIpEWr2sU4eYEjxic+XUzgi1CHmI7ronDsAXWCqkcnsMEu
	 9u1kIn/iFR1ckoMJ1YjDgLgz9VwiJOXSgFms3ksGy7wpuZw2mL2sIZPioT+GkCBJpp
	 uSf4qRBPxBf33zVkgu17j94PqmvxjS1hCUS5f6CEsuHDhOTzVsuRaWF7Bin5GTpv4Y
	 B77vI3Qjkc2Xw==
Message-ID: <sashiko-outbox-224130@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] USB: quirks: Add
 USB_QUIRK_DISCONNECT_PARENT_SUSPEND for HyperX QuadCast S
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oleh Kurudz" <admin@or1k.net>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261120-quadcast-s-suspend-v1-2-add8ccf12c8f@or1k.net>
References: <20261120-quadcast-s-suspend-v1-0-add8ccf12c8f@or1k.net>
 <20261120-quadcast-s-suspend-v1-2-add8ccf12c8f@or1k.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 22:27:02 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Oleh Kurudz <admin@or1k.net>
>=20
> The HyperX QuadCast S microphone has a built-in Huasheng 214b:7250 hub
> with two functions behind it: an audio device (0951:171d) and an HID
> device for the RGB lighting (0951:171f). During system suspend the HID
> function drops off the built-in hub, and the hub wakes the system even
> though remote wakeup is disabled. On an AMD laptop using s2idle the
> first suspend after boot comes back within about a second:
>=20
>   [   68.618009] PM: suspend entry (s2idle)
>   [   69.752213] usb 1-1.3.1: usb suspend, wakeup 0
>   [   69.753139] usb 1-1.3.4: usb suspend, wakeup 0
>   [   69.753876] hub 1-1.3:1.0: hub_suspend
>   [   69.754488] usb 1-1.3: usb suspend, wakeup 0
>   [   69.775275] PM: suspend-to-idle
> [ ... ]
> This patch and its changelog were written with the help of an AI
> coding assistant (Claude, claude-opus-5-5). I reviewed the result and
> ran the tests described above.
>=20
> Signed-off-by: Oleh Kurudz <admin@or1k.net>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-quadcast-s=
-suspend-v1-0-add8ccf12c8f@or1k.net?part=3D2

