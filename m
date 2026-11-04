Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793792739;
	b=2FGRiOnd1L5xt2eGW5iDErd2W0EaLWWX18CkXhd+ZpU9XdaYubq8E5dPcPfgeOs4k3Xh
	 ebYdXKCfydtOaKzN+5DRv6rsczr5NrxCqJyS6+vXBOeMD2fC1fjBWfMWiRA/fS0haWi+y
	 7Bnqyl+aMMuh1pv6WIjn0mN6I2yKoFV30KDKsjVVcoxsCRhqhSR8H2ltPfu0G6BkeDxy0
	 dgNQySp4jGbhWILlVD90MMSMQ9f4vFArLbkPprm1ZBOFXyAPQ8XBaNoDOejCVDf1CwJGl
	 W43IPIpbxmJKmrnAOgh+PyQCb8Yr0KtK/W/xpFTuMjEt+2G7yAWTRp1MvyzH350wdMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793792739;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=bPn91g7pei2aAAO2tDwBLftNk+BZehXD08/7QsNP/xQ=;
	b=bT/0NtvQfHmZyO3MIrVRVluXtkbnSwUDvc2DWrzgR+Eb+PYFiANu6V1sW3s3tBntUMpl
	 UOm4r32LIvobbHM0HYjs76BierGZ17Fdw33THScZ9PJ0K7E6vfadgL0nZXBC9gDK4kKHM
	 xlbiOavOAktyQV+RZAb7Wgw5YEprkEdEsJakzH3w9Tkp+asaEk/yw/LyzYqBtw0LFcFdo
	 mdB6jDNkT4Fa78bD8IxnUWlcz4Iz6AukJQuNYEdeo28N1iVcYx4FYyCnavWD5EFOwm7oM
	 +bu9M7D3FH/PtxzEv8oCnKeT3D4aiQSsh4dhErU/3G5LzJshhvcOOy062gIUmFGzDGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SmsbqPjc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A00606A328
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 11:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SmsbqPjc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E079E1F000C1;
	Wed,  4 Nov 2026 11:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793792739;
	bh=bPn91g7pei2aAAO2tDwBLftNk+BZehXD08/7QsNP/xQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SmsbqPjcwbXPSR2xU+HxmRIQPbAvEXe6/OhmjjyGUGwhC5cs61KgCmfd4KXDHuB6h
	 BH+0sGz1ESJU5/pP2UcxMIOOguN7EssuXIYCQ917XcZIBMGTOpxWFguvXZyY8ekADk
	 PIv8tvbhj5OD5JYKtYkZue+YPLGqKgKffKFVHfzSmqUbJ9rxAqUlE1I1bYIWCf9Hna
	 JU+SUDd9G118j7vibGirgqcou22UUQRGxIb3O94NZ4bzfwdehIVJVIbQsacMLeDNaF
	 8EckZVs2EVcBbwXRi82bzdys1EFKmx1fJsOE/bQYQwYQgFAv4VTxaBTXlXdIsUdTZJ
	 Dhb2ehPntxsvg==
Message-ID: <sashiko-outbox-197209@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: mtu3: disable bottom halves in the threaded
 interrupt handler
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ryan Brue" <ryanbrue.dev@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261104-usb-mtu3-gadget-completion-callback-fix-v2-1-2769533a39cb@gmail.com>
References: <20261104-usb-mtu3-gadget-completion-callback-fix-v2-1-2769533a39cb@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 11:45:38 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> mtu3_irq() is a threaded handler, so it runs in process context, and it
> takes mtu->lock with spin_lock_irqsave(). mtu3_req_complete() drops the
> lock with a plain spin_unlock() around usb_gadget_giveback_request(), so
> the gadget function's completion callback runs with interrupts disabled,
> as the gadget API promises, but in neither hardirq nor softirq context.
>=20
> That breaks any callback that reaches netif_rx(). netif_rx() disables
> bottom halves itself when it is called outside hardirq and softirq
> context, and enabling them again with interrupts disabled is not
> allowed:
>=20
>   WARNING: kernel/softirq.c:453 at __local_bh_enable_ip+0x128/0x134
>     __local_bh_enable_ip
>     netif_rx
>     rx_complete [u_ether]
> [ ... ]
> names. The same copy is reliable with this change applied.
>=20
> Fixes: 13118959cb1a ("usb: mtu3: register mtu3_irq by threaded irq")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-usb-mtu3-g=
adget-completion-callback-fix-v2-1-2769533a39cb@gmail.com?part=3D1

