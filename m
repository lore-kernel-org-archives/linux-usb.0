Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933695;
	b=GGPjoLknCbOyIhAV3apMm/E7Fa86Bp2PscYsGmiu3wJLRrB4rT5XG4FnptRRIc7KvyEo
	 y+uxh9z4g7+d07/UcmdASpYFTBkIUwYqVKkEkqwbRz1OfF/wffCTJTJcFlrf4/UXd4LHm
	 FHKQbtLWsVI5vEDUugu4fy6NO1zoJFBbCXFscqSlxw8I++0hxfeoHJMxghJSFfibKwxcZ
	 DEJg+sEzmAbYidGwZnzOf1odR4bTS+5iJuuoszJ7gLpLXNUSPPD4Ct5HN/CyRKzMQUxK0
	 h/bVOHqbFOgZlTdmnoWgGwIcXxy9BD83yIsVXcGhBq/sicRFtN3zK1diC3hNEXmgyWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933695;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Hor1vtwoA78bEKg5lwdnqrFtMLS+DcyFtayJQOgydSU=;
	b=eb5EKqViVVljwQp6eT/lcPazLzgbF+7VZSz60i8+eql0jXHr+Iqd5WP48NHWGFk+lC7u
	 nu1HuGWoGcG0YDslvicGWERG3n833LT1qS8fG3qAPGGuFV7gfTF4U1g28PMxc13fZeZNj
	 GWf9NUnp1BxvMWHIlAGTkThurXKikSueXwpRo/y0lcBdDL6dizFsYSaBxnat7gUYkn0W+
	 Fn/p5h/MWsOCA5yfWC2CNmDQgmkRh9WlCxKlqYhSD6cvKi0s6lp/xs2vUrCLo3sI1DZTg
	 NC1bF3yuJYT6Co0qpIhWd8um0hkvSsxCzaOCoGuC8mZhkdO5zNiqExmAYP6Hvh3S7iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I2138Vy7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD6C606A31C
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 16:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I2138Vy7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 271941F000C4;
	Tue, 17 Nov 2026 16:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794933695;
	bh=Hor1vtwoA78bEKg5lwdnqrFtMLS+DcyFtayJQOgydSU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I2138Vy7Xrx/dIwU1oBkbfvfACGw1m2voWcJ8vFFR9XqBpgKJn4oVpjgbBnDLiLZm
	 7amkbG7w5GX1Ol4N6+fY0Cxa3rbzrREd06f4LaKsZXSIwHnnVwo2eNk37jWCpujaS7
	 qOxXGHvPapuY3o+OjvEfUcpNOdWkiP3orWGN/wl5e6jy7erYHMItJ1UdogENZMtx13
	 RaN64OGadINK6OPFZ3GITArYFU/UVzaOm53mV+pwfgmWEKPgu0B/p3yQD+xewtJYB8
	 oMpwGv5KH558y75megD7lX7EykvTruqMgJnupJDx1X8x9rNnNNQX4+g5uJoDhpJCxX
	 GNYhb+Ayvs3zA==
Message-ID: <sashiko-outbox-219176@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND] usb: octeon-hcd: fix the kernel-doc of struct
 octeon_hcd
Reply-To: sashiko-reviews@lists.linux.dev
To: "Orgad Shaneh" <orgads@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261117163937.3727045-1-orgads@gmail.com>
References: <20261117163937.3727045-1-orgads@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 16:41:34 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The struct octeon_hcd comment opens with /** but names its members
> without the @ prefix, so kernel-doc sees none of them and warns about
> every member. aebbc7d63407 added sof_timer without a line at all,
> which the robot reports as a new W=3D1 warning.
>=20
> Prefix the members with @, drop "pipe", which is no longer a member,
> and describe the three that were missing: periodic, nonperiodic and
> sof_timer. scripts/kernel-doc -Wall reports nothing for octeon_hcd
> afterwards.
>=20
> Fixes: aebbc7d63407 ("usb: octeon-hcd: sleep on an hrtimer for far-off pe=
riodic transfers")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202610151637.5srThc2q-lkp@i=
ntel.com/
> Signed-off-by: Orgad Shaneh <orgads@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117163937.3727=
045-1-orgads@gmail.com?part=3D1

