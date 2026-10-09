Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60233A382B
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 03:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791517909; cv=none; b=GLt12nCzg2gE9ilt8liHDPXndxhBfkM3U+E8BbR+Ze7JXNpAdJrHGHmVWkzc3E9JOTppZvUz0MxjdqjQrPX7ooJhw9YPCxj/uT6UGvXQxXpxt3samQoI1HEeXO+xLPXLWISpABSx9asE1wrYC2RWPrZpbwBwxScZ8sISCHsyxaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791517909; c=relaxed/simple;
	bh=A4IxazqWpbLbej4MDpq3AimFijQqPWSlupcAT/yeFp8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=ORsg706Y6EpDkdYKva6HWd622QRX6MSz5OxRIgS7bwSoLZbIb0uH2VXVwo+Ymbt5gxGkplC76edFFafFwQLiNblJb2SoN8fqWy40qJCDuTBGp7TtOzzaLkJG2l6xNfEGQXS6rSh61jG4dq2JnVk3fmre6z1lrKuhDMoO5ZH7760=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XsBVfrhy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XsBVfrhy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 554F41F0089B;
	Fri,  9 Oct 2026 03:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791517903;
	bh=6TnyHXSLmlUS6nE7RcJTFUmZPe2NIYwM10kk2BKyG/g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XsBVfrhyw48+tfvd/RzhvHa3OzNFCnhM4ypORO4jugFnxaoe6N+bKQ6rpUZgU1eCm
	 ZsEFUrj0lL5p0fuaBp0M91bxBZS0FfLANB0vDIhGvGccE9a3gOtpFs6Q87V8L3Q7Be
	 GxBbkQNlcEjclaFZWGXG/RWuI9WxAxZCXkkyZSQ12kPZ50KDI0hAmNYinoaEj4Sl9B
	 S2KrWGTLA2s7QynMOQojk8uHklMCsq69MPCbk4OPPLAypXKnj4nGXJSq4pTPRi8G2p
	 KUiGmzhkYTw05w4eGkc92oAxaf96eE3c+Bt+SrTSUpO8NBOirHIi8SADXWEt9tW7p1
	 xu/9b57wZbDvQ==
Message-ID: <sashiko-outbox-164796@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v18 08/13] ax88179_178a: Add AX179A/AX279
 multicast configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261008-ax88179a-v18-8-6fa1d4c40422@birger-koblitz.de>
References: <20261008-ax88179a-v18-0-6fa1d4c40422@birger-koblitz.de>
 <20261008-ax88179a-v18-8-6fa1d4c40422@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 03:51:42 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] net: ax88179_set_multicast() data race on data->rxctl
--

commit 547e4ec41af3f2201955124dd2564e630771c80f
Author: Birger Koblitz <mail@birger-koblitz.de>

ax88179_178a: Add AX179A/AX279 multicast configuration

This commit adds support for conditionally setting the AX_RX_CTL_IPE flag
in AX_RX_CTL based on ip_align. It also ensures AX_RX_CTL_DROPCRCERR is
set to match the initial configuration in ax88179_reset().

> diff --git a/drivers/net/usb/ax88179_lib.c b/drivers/net/usb/ax88179_lib.c
> index 0efc2eb95e4b3..ea19700c8230f 100644
> --- a/drivers/net/usb/ax88179_lib.c
> +++ b/drivers/net/usb/ax88179_lib.c
> @@ -321,10 +321,14 @@ int ax88179_set_eeprom(struct net_device *net, stru=
ct ethtool_eeprom *eeprom, u8
>  void ax88179_set_multicast(struct net_device *net)
>  {
>  	struct usbnet *dev =3D netdev_priv(net);
> -	struct ax88179_data *data =3D dev->driver_priv;
>  	u8 *m_filter =3D ((u8 *)dev->data);
> +	struct ax88179_data *data;
> +
> +	data =3D dev->driver_priv;
> =20
> -	data->rxctl =3D (AX_RX_CTL_START | AX_RX_CTL_AB | AX_RX_CTL_IPE);
> +	data->rxctl =3D (AX_RX_CTL_START | AX_RX_CTL_AB | AX_RX_CTL_DROPCRCERR);
> +	if (data->ip_align)
> +		data->rxctl |=3D AX_RX_CTL_IPE;

[Severity: High]
Does this non-atomic modification of data->rxctl introduce a data race?

It appears data->rxctl is updated here without lock synchronization. If
ax88179a_mac_link_up() is executing concurrently, could it fetch an
intermediate torn state?

For example, a concurrent reader might observe the state like this:

ax88179a_mac_link_up()
   ax88179_write_u16(dev, AX_ACCESS_MAC, AX_RX_CTL, 2, READ_ONCE(ax179_data=
->rxctl));

Could this result in corrupting the hardware register by committing a
partially updated rxctl state to the device?

> =20
>  	if (net->flags & IFF_PROMISC) {
>  		data->rxctl |=3D AX_RX_CTL_PRO;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-ax88179a-v=
18-0-6fa1d4c40422@birger-koblitz.de?part=3D8
