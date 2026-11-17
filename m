Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920985;
	b=YtHh6IN+CBm/9YBYaIkMrk8uhAfBfRc22BKwDXCepMV+wWmMBcxDzJU26hgQfaXwYn1e
	 9A09aERRdE5yVzYTo9aFnd1IbLNSV07Jh31h01c5q7kEsq3wh3u/y0SvUlKaWI4K25wQu
	 ynzq58gT/XXT/Bw7J88sm/RwLeVjRJt9WqW2YNZmM8Quqk2Dq0tLirHa6U5KWaK/l6slC
	 dDM+uBZyfHnRkisLAKwPeT8a+X5J8Wkh7UFNr7fmo6Kz8D/OTD+lnaORqWX9tj9g8wdLq
	 Uk2WRjAgLFj6lEizj/gMSDV4xZM/fTV9fpZaEmc/KHsOnpnr9d2pRGQE8hYpKi0U7Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920985;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+P7BtybgaP2uFpzEDh8TlIgAeOtbgC+qrTCCl87i9eI=;
	b=r1DRENveu6Zjfp7Cz/XxUWKfH9NxqMcqfyhvOFYCmIHL1XxcTOCUkjz8avPuXIiv8P/c
	 eEnm8d+XAIv0wPC4M0mIw4hk3fZ2tXkhN9ietEXUPYWwKJKX/MWE7JoeHXOE17m+53Qm8
	 e+BSSV/FAsUdhYuJZIzhjmoe28R96ILd1iGqrVk1kzlRD+0gwp3WkOWp21ZO4R690nB+y
	 b53q1daWhQo2PWBaAVgtRqtRzlfPatYYdi0yeYyGbIf88S/BwlkIdlnjZ2NZjqSJzwRWZ
	 xI73XH8Tp6s1Gs0tSGurTJedzSnDwcqEmhn1O2kxpyO4s4+Dgq39xGmWsktTTlxTvJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aw7uewVS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B841C606A337;
	Tue, 17 Nov 2026 13:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aw7uewVS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 458001F000C4;
	Tue, 17 Nov 2026 13:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794920985;
	bh=+P7BtybgaP2uFpzEDh8TlIgAeOtbgC+qrTCCl87i9eI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aw7uewVSDK+Pe2Qhl/OwwdL4nnc92goZgCJr1TkZXbWbL8AE8vbAeV9/yHzST7Gxz
	 PXajcAqv6KWCYpz8QzMg9NkWQNRgOIn+ldDFZF0ApiEyibPM2uWRrJefrMvaMpa/sg
	 zL149KxPLO+rl0THNOArftr3+fHyPZQeCTqG29NIYFPjzXKUEza/Mc7ue1RYggsO81
	 EUPhjuL8VfRfbhbFizAiHYaCRRoMIraW2SNhaGfPrS8HpcJv+MNEcwBridaouwZJYl
	 G4YIJULqqkdcdYYAQVWZS6hE0T14Jw2k9p1cQf84QraQBf7EniC5idd2XzmoyRt1zq
	 2OP+coi9mb1ow==
Message-ID: <sashiko-outbox-218841@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] usb: musb: sunxi: Assert reset before deasserting
 on init
Reply-To: sashiko-reviews@lists.linux.dev
To: Roadbobek <admin@roadbobek.com>
Cc: linux-usb@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-phy@lists.infradead.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261117-usb-sunxi-reset-fix-v1-1-c2b76e0e84e1@roadbobek.com>
References: <20261117-usb-sunxi-reset-fix-v1-0-c2b76e0e84e1@roadbobek.com>
 <20261117-usb-sunxi-reset-fix-v1-1-c2b76e0e84e1@roadbobek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 13:09:44 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] usb: musb: sunxi: Signed-off-by trailer uses single-word handle
  Roadbobek
- [Low] usb: musb: sunxi: missing Fixes trailer for sunxi_musb_init()
  reset fix
--

commit 6fb0d83bc22980ce7dcaa8d7c886a7bcf57b0905
Author: Roadbobek <admin@roadbobek.com>

> usb: musb: sunxi: Assert reset before deasserting on init
>
> When a bootloader such as U-Boot (for example with
> CONFIG_USB_MUSB_HOST=3Dy) initializes MUSB and boots Linux
> without stopping USB first, the controller reset line is
> already deasserted at probe time.
>
> In that case reset_control_deassert() in sunxi_musb_init()
> is a no-op and stale MUSB register state persists across boot.
> On Allwinner A33, MUSB stays wedged in a_wait_bcon with
> DevCtl=3D0x99, Power=3D0xf0, and a frozen Frame counter even
> across hot-unplug and replug.
>
> Assert glue->rst briefly before deasserting it when
> SUNXI_MUSB_FL_HAS_RESET is set so MUSB starts cleanly.
> Tested on an Allwinner A33 Q8 tablet (Laser MID-786).
>
> Signed-off-by: Roadbobek <admin@roadbobek.com>

[Severity: High]
Per Documentation/process/submitting-patches.rst, the Author header and
Signed-off-by trailer must use a real full name rather than a single-word
handle or nickname.

[Severity: Low]
Since this fixes the reset initialization in sunxi_musb_init(), should it
include:

  Fixes: 132e23775779 ("usb: musb: sunxi: Add support for musb controller i=
n A31 SoC")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-usb-sunxi-=
reset-fix-v1-0-c2b76e0e84e1@roadbobek.com?part=3D1
