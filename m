Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCBA519E00
	for <linux-usb@vger.kernel.org>; Wed, 14 Oct 2026 13:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791985425; cv=none; b=OAIlVuiSAo1grQlhfkr4Xploonq6YPoZvtFYcVL3nrIosFosJxcfIPk6bTQeJ/Yj9wB8PFGrY7Nk8OiXAMjCsvBEZrTLxPwqGPWakIVrDTcqIce1mv/awLUDuhxTyoCGU7gTCHe2rEdRojaWuEhAAs2g927mFKFNwjm1g3/qewo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791985425; c=relaxed/simple;
	bh=AFlR+Ehct18tn+MkFdwheAw5REx13nP8AwnmdnPvZFo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=CpfpT0cUVaLs1RxcqzAuS+zvc4mNGM1WBHujK28nR71qvGuhCmTW3WYwobIO95IFZeE71lXC96Ck7EsF++AhtZvjAU0zcLjFr9Pa5pnvHRm0zG2/RYyAr/dagpR2FCjn4se7XCmzfImij0NAB8184Q/lw57KuMIOyn9AIB0aLlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mnPhK5SZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mnPhK5SZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7B8B1F000FF;
	Wed, 14 Oct 2026 13:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791985423;
	bh=B/OwcU29TJXMs/GUix41exDw4ssWhPSD7IVhRNNMcq0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mnPhK5SZ0dHI2ka8ghoYk658fBJKRdih7lhuXGgztqETwDK6UI5Rj1Fhy1bO5kGdX
	 8ukyA6iKmPZwvFo3BRNTFeieW2pDzw1ziMykLDD4H9hPFuI4OLp0oOauDcx4pl8Pg2
	 bJ9Jk0KsQ1TXSSjmPozrgKIcwCaIOkQs4oTJqjWNIFEHTmUyVtOrrl8nBCxNjKPTBI
	 fkRwXVM0PM1w4p85dFc6G1xH4tlOq2SyIBGrmnhePLR/d1rsIJ/tzK//K7w/c8ZDJb
	 3Gk34X1uuofSEOtcjK120zVdLKVpVOw5h7/QiWfMP0JIX7o1ZPbzpjyPjWViFD663H
	 COECyVtBxmlzw==
Message-ID: <sashiko-outbox-171376@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] driver core: fix parent lock use-after-free on
 USB disconnect
Reply-To: sashiko-reviews@lists.linux.dev
To: "Johan Hovold" <johan@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261014133109.1392265-2-johan@kernel.org>
References: <20261014133109.1392265-1-johan@kernel.org>
 <20261014133109.1392265-2-johan@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 13:43:43 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> USB interfaces should be probed with their parent USB device lock held
> and the USB bus therefore sets the need_parent_lock bus flag so that
> driver core takes the parent lock when needed.
>=20
> Driver core is only guaranteed to hold a reference to the parent device
> during initial probe however and nothing prevents the device and its
> parent from being deregistered and the parent potentially freed, for
> example, while iterating over devices in driver_attach() or
> bus_rescan_devices_helper().
>=20
> Since commit 524134d42231 ("USB: don't cancel queued resets when
> unbinding drivers") USB interfaces hold a reference to their parent USB
> device, but a parent hub may still go away while probing a USB device
> (e.g. via the drivers_probe sysfs interface). This can lead to a
> use-after-free when taking the parent device lock before checking the
> [ ... ]
> Fixes: bf74ad5bc417 ("[PATCH] Hold the device's parent's lock during prob=
e and remove")
> Cc: stable@vger.kernel.org	# 2.6.16: 524134d42231: USB: don't cancel queu=
ed resets when unbinding drivers
> Cc: stable@vger.kernel.org	# 2.6.16
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014133109.1392=
265-1-johan@kernel.org?part=3D1

