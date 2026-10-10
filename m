Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45B5335064
	for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 23:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791674589; cv=none; b=U67VBf74WbWwiN3nMfDnBVSfDQO+bZs3n2JoFloUMTvsOjFjFuK7v5V4gPpnP5BNNQIJ7q2wgbVa7t21N66Jcxr6QwdSVhCJU3e5bou8JG3Ar/59rPjHaCS4PuOg4hP4Xz+P3nEkgyhJvceZichAJLOGyWC+/DBnTqiqrPQalOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791674589; c=relaxed/simple;
	bh=6xfomBzFTe5bJov0pa8TAJC/4sOn4aontPuKq8h2N34=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=jraiVs8y5CTjNFdDuCljnvR/IVPYv9/E5IPJcsTzBGkWZvsyZdqiRCF1So9W4Wm09KEibVrYFjwWgOL/6l+xNOPArpRqliS0BCRYpC/MQY9LVyoapZvEQRAEp1dB0ZS7bFEjWG1bARWUFqBz1r/fy1ZZ24vX05CEeE0LhSouGKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NiKs6MEF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NiKs6MEF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2379E1F000FF;
	Sat, 10 Oct 2026 23:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791674588;
	bh=Gi3aJALKa5qyjild2qSjCrjfCxkTS040dWcYFg9gb9E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NiKs6MEFOit+FhYfojwaQdpq7UTtPVG3zqF5PnZjL2wZTh3SDHkgma3xqQWWw5QSy
	 Opv34B4HZZoooeCFwrdB+aG4R8di389O6k1nWgXAsa7CX9F+Q6CDttBidZEmnVUBKm
	 LlkwbqaWvktELlElGMdHttDdAuU1w45zqJa8Bfdk3SrL1MKyKWhyygObAMqB0OoY8l
	 oxfwJD8fov1VgWq8JPEb5xlk5iysvqduEBCTCBS3HpgfHEdTRmtH9IceXsYXORRgug
	 z4L/KJ9s2mUTBujIPb5tjWrxbB5d1mZ2xbNh6/CCWoQhojFJzqLwLxw8x0pYTA7PIZ
	 IeYj1TNv+PcJg==
Message-ID: <sashiko-outbox-166930@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: core: sysfs: show product, manufacturer and serial
 without the device lock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joe Finzel" <joe@sudmix.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261011-usb-string-attrs-v1-1-81c01b035237@sudmix.de>
References: <20261011-usb-string-attrs-v1-1-81c01b035237@sudmix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 23:23:07 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> From: Joe Finzel <joe@sudmix.de>
>=20
> Reading the product, manufacturer or serial attribute of a USB device
> takes the device lock. A hub holds its lock in hub_event() while it
> enumerates all of its ports, including the debounce and reset delays of
> every child, so a reader of the hub's strings waits until the last port
> is done -- seconds on a hub with several devices.
>=20
> udev reads these strings for every USB device (the usb_id builtin, run
> from 50-udev-default.rules). Its worker blocks SIGTERM, so when systemd
> stops udevd in the initrd before switching root, it waits for that
> worker. On a desktop with a few hubs this delays every boot:
>=20
>   i7-13700K, ASUS ROG STRIX Z790-F, four hubs with HID devices behind
>   them: udevd took 1.7 s to stop, while the hubs were still enumerating.
> [ ... ]
> Andy Whitcroft reported the same boot stall in 2010 ("khubd -- switch
> USB product/manufacturer/serial handling to RCU"); back then the strings
> could still change under Wireless USB.
>=20
> Signed-off-by: Joe Finzel <joe@sudmix.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261011-usb-string=
-attrs-v1-1-81c01b035237@sudmix.de?part=3D1

