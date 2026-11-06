Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793980883;
	b=noLfawRvoI1f+wdpaJlj32TIHa4HpALen3xCgRoRnilrOygr/2w4DV2KQJ51vKNpReJy
	 H1NSRO/xZM87w5+4O3z1PYWWDOGSQrCgW5aEc6lXpN0TJwZB3sZdg1e1b+snCf9ZrNG9t
	 Lt9/6n44HhygwMihFdNEXEVOqDnk+2Xls9Lq6jZ2ocOn0CH3FPIsxeqpd7q+Z+U/+Z1g1
	 OOJE1RdFSAa3vMCdILuNSlo+jwfrBG06mhkDbD+ubgT2YYYuOiRJV65DneObz0O6E9bIs
	 uS+Vp5wwCL1huYXHytgSJeUZIkaFPkqVfLU+YcpK0nc5K5UU5MXhHWsQOqiL2GrrUkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793980883;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=04aSCIs1SgK+nw9CQqx3CU3f3vq4VfxWLpVCcwztBHU=;
	b=qU4sh+xpeFu4N/XNeth4SHGERy/iWu4JzdXv0cZOjDVgxnD5aMOMzHDJR1Tl7uQpa3n1
	 vR9Ql69R51YiNtPSw54kHRpVcz14ggczme+vpAJa8ua8dc228BJaLuNjYp+BZ+/iJ61Hy
	 M8m2UMnlw6aLCi9gwDTxjEl3d/zj21VSXjr9u2R+4rORxiTZdbfoIn3M4uIQfNfSbXR/9
	 cx81GHT6xLxOAHLZx7ekXlT0urgPdEAoRxPX7OPi9OqfLCX5ZTX0QcntNZA3ABDjMZsjH
	 HzDrtvrw+XACoOaIi3kJq4drgU2Ih7RYuHpGxk2AmEsmqXckqemgmGKC9lM/Vyg7tiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OuwQuI03;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B54606A33A
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 16:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OuwQuI03
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FA501F008BE;
	Fri,  6 Nov 2026 16:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793980883;
	bh=04aSCIs1SgK+nw9CQqx3CU3f3vq4VfxWLpVCcwztBHU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OuwQuI034dJxmdOc5qt1GmLwRMdaDHt0cJJXq4NQwoNMNjSXNxzedjWCb/RZ3wy1c
	 LTpWv5ITgdhBROo9WnI0krm6rFnX5A3rZWW3zGE1+xiIHd/CLmS26lT1KBg3mKJjCe
	 Aqhk1aZIht4QCOlo7Z1vedN81mL/WiVrIsUsZGZYBul8EEG7ajZkJy/MgpLRz+9jD+
	 4DRXxW0lMC/ScPb1dbk7bPds+7efvep/Z90HzORBmNeJzkRsSiV0QRQ6rXfUpopxep
	 re0U7BBu/TSoJu58K0aaSjSAJ0msuna+FfVnnLujE7w9lzxxPhupsIjb47osgMOyZn
	 HsCVTV4AXvVqw==
Message-ID: <sashiko-outbox-201757@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH] thunderbolt: Tunnel only the first DP OUT of Apple
 Studio Displays
Reply-To: sashiko-reviews@lists.linux.dev
To: "Duff OMelia" <duff@omelia.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106154445.517940-1-duff@omelia.org>
References: <20261106154445.517940-1-duff@omelia.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 16:01:22 +0000
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
- [High] thunderbolt: tb_dp_out_is_spare_tile() breaks dual-SST 5K hosts
- [Low] thunderbolt: hardcoded DROM IDs and late check in
  tb_find_dp_out()
--

commit 56e4b7f54ea3c7e7cdb974a602ec3a77741d76e3
Author: Duff OMelia <duff@omelia.org>

thunderbolt: Tunnel only the first DP OUT of Apple Studio Displays

This commit skips tunneling any DisplayPort output adapter after the first
one on Apple Studio Displays (vendor 0x1, devices 0x801f and 0x8025) in
tb_find_dp_out().

> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index 57c11ba13459c..b015a71f4048d 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -1862,6 +1862,27 @@ static struct tb_port *tb_find_pcie_down(struct tb=
_switch *sw,
>  	return tb_find_unused_port(sw, TB_TYPE_PCIE_DOWN);
>  }
> =20
> +/*
> + * A Studio Display has a DP OUT adapter for each half of its panel, but=
 a
> + * host can drive the whole 5K panel over the first one alone. Tunneling=
 the
> + * second only takes a DP IN adapter that another display could have use=
d.
> + */
> +static bool tb_dp_out_is_spare_tile(struct tb_port *port)
> +{
> +	struct tb_switch *sw =3D port->sw;
> +	struct tb_port *p;
> +
> +	if (sw->vendor !=3D 0x1 || (sw->device !=3D 0x801f && sw->device !=3D 0=
x8025))
> +		return false;
> +
> +	tb_switch_for_each_port(sw, p) {
> +		if (tb_port_is_dpout(p))
> +			return p !=3D port;
> +	}
> +
> +	return false;
> +}

[Severity: High]
Does unconditionally skipping the second DisplayPort output adapter in
tb_dp_out_is_spare_tile() cause a regression on hosts or links that drive
the 5120x2880@60Hz panel as a 2x1 tiled display across two 2560x2880
streams?

Driving 5120x2880@60Hz over the first adapter alone requires over 21 Gbps
uncompressed, so it depends on Display Stream Compression and single-stream
mode selection in the host graphics driver.  On hosts without compression,
on Thunderbolt 3 links limited to 4-lane HBR2, or with drivers such as i915
that configure both tiles, skipping the second adapter even when free
DisplayPort input adapters exist prevents the second tunnel from being
created and leaves half the panel dark or limits the resolution.

>  static struct tb_port *tb_find_dp_out(struct tb *tb, struct tb_port *in)
>  {
>  	struct tb_port *host_port, *port;
> @@ -1879,6 +1900,11 @@ static struct tb_port *tb_find_dp_out(struct tb *t=
b, struct tb_port *in)
>  			continue;
>  		}
> =20
> +		if (tb_dp_out_is_spare_tile(port)) {
> +			tb_port_dbg(port, "skipping spare DP OUT tile\n");
> +			continue;
> +		}

[Severity: Low]
This isn't a bug, but device-specific workarounds matching sw->vendor and
sw->device belong in tb_quirks[] in drivers/thunderbolt/quirks.c rather than
hardcoded in tb_dp_out_is_spare_tile().  Also, checking
tb_dp_out_is_spare_tile(port) after tb_port_is_enabled(port) performs an
unnecessary hardware config space read on the skipped port on every
tb_find_dp_out() pass.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106154445.5179=
40-1-duff@omelia.org?part=3D1
