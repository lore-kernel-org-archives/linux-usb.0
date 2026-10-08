Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6E31F8723
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 16:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791475402; cv=none; b=aU0PJF9JHc1Ye3tRfooSVsLEuX7V/BkQalWBA7GDkdE4w7Uv6HdFZT8tcpwbMECFZRjFhUXKnuSVdz2de5kxIn66JK/XOXAnW9WkXJ7Kqxak/r9HpPf4H2DdDfJnf7zx3Zhs0jYtdXv1OQHdJO9lD0EauMQERMJ+PJrbJ6p4ty0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791475402; c=relaxed/simple;
	bh=HZqlllqmk/Gkb+QT1fkQOzlrqQ/4ZycyfIXHmJcMMCQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=EgrlAY8S08/AGVZm3Tk/kicXaz+vyJPcMzSvK7KMnb4EQlrT8W01mIkNk3jTusghixXzCWGJLSqovvDO75Y54PjYsXhf7VGiG8/AeLuGC0BhEfqhwWLPSKCjkeXDOzfS76dWvRVauqQ+fQbqKk4ExEyWZmx3B4ZFnXwWnUUBhrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DZ6TdPbF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DZ6TdPbF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D9951F000FF;
	Thu,  8 Oct 2026 16:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791475401;
	bh=HZqlllqmk/Gkb+QT1fkQOzlrqQ/4ZycyfIXHmJcMMCQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DZ6TdPbFFM4NBxm2KUWTLlPIOMJuUaV3op1A+n8rez8fzBI1ZPxyv2omRolquGort
	 dWpQ41FcM+OjCkadwxmNFsiwiD8MZT30C5P9WsllCiXzyGPFEIXxN95LNSyS6C5HtI
	 vPjz+TqUvca32fPRxPJTl59BtrBc6Xq9pm4A8lEOnMOmlozTiAwakCzaia1ud22oAs
	 unnNAQMG277Gp9vmokSzlMMU0Xlmp4SCISmbRlmCI3gCWgcVsAHgt9yqcjng0w7Iz9
	 1dLI9EeGYxwK4giXBjTsisizTPIBEiQU00zs8ttXchUxQ7BROB5vM4kJySrCobIOgl
	 eaBAd1lWHrUXA==
Message-ID: <sashiko-outbox-164364@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: musb: Disable the D+ pullup during system
 suspend
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nguyen Minh Tien" <tien.nguyenminh@embeddedlinux.blog>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261008155402.66266-1-tien.nguyenminh@embeddedlinux.blog>
References: <20261008155402.66266-1-tien.nguyenminh@embeddedlinux.blog>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 16:03:21 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> When musb_suspend() clears DEVCTL, the host sees a disconnect. But VBUS
> is still there, so the controller can start a new session on its own
> and, with SOFTCONN still set, pull D+ up again while its interrupts are
> masked. The host then fails to enumerate the gadget ("unable to
> enumerate USB device") and gives up, and nothing at resume makes it try
> again. On a T113-S3 board the gadget link never survived an s2idle
> cycle.
>=20
> Clear SOFTCONN once the context is saved; musb_restore_context() puts
> it back on resume. This is what the FIXME asked for, as USB can't wake
> us in time with the interrupts masked. Platforms that power the PHY off
> during suspend, like the AM335x, never showed the problem: D+ drops
> with the PHY.
>=20
> Fixes: 6fc6f4b87cb3 ("usb: musb: Disable interrupts on suspend, enable th=
em on resume")
> Cc: stable@vger.kernel.org
> Signed-off-by: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008155402.6626=
6-1-tien.nguyenminh@embeddedlinux.blog?part=3D1

