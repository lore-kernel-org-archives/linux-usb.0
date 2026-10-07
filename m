Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224F83B3C1F
	for <linux-usb@vger.kernel.org>; Wed,  7 Oct 2026 03:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791342347; cv=none; b=GtaeMs0kkMqC4f9zp7uoUqlYF7Gqrft/R5QZFiP8Z9+XPI60kcyHQ3dd5Z9+PaX+QSOWX+l6g5CZDtvSMR5DNm8udPY2ujupPCk2jy0AJvSFNkW91vs50p+Z7SrheKyRN30lH+B/lKKoeyMr1mdbygxEyiHiaksik0I0Wa4N0Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791342347; c=relaxed/simple;
	bh=P6ORP3gvLDhiyBbEVen5Wm1eBxgkpKerMLwzbSXgPbs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=RTsKkfGJ73LTlgSxezC3oVGRgRNGMXjluxxRQpepLe6XDSpQodspPZ/1TDazNakhWIPp3ROCYFio2maxgmAqFTX/+55HeWkGGuu5z/XqHreQlue+4vURgjEPmx+D/eUSqqij6Pd9/mLaqToSxD1FP1TbCzoHhBvt5d0e924Bt+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IhJ8FAnJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IhJ8FAnJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D50F71F0089B;
	Wed,  7 Oct 2026 03:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791342346;
	bh=LSbAH7sAaKREzQr3tWy0INUgZRoJFMVgVXECtBxferw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IhJ8FAnJmsm5HvzoJqUjn01/8IPmqaDNna6D3Imae2EgZay0dx/mP6aB3nIHdJ7jR
	 Bl2Ng6+ellTyzakTQ8tCmiNmXxFgHQ7uaGgYjRBSVzYRaVIuLBV1OWU6VgO1Q/s35G
	 iq0K9UIDEK9UFc4We933NrfamPKXi5lFP8plaq2D5Q2lMFsM2vxaVrjJ9+e2uxGklJ
	 4Lm6OVat16rR73pxaAByxUndwWvQ27IBktiaJ/46z+HStJ6/FQaic8ytOU8xyqTfZg
	 R5KFV2yi4ixBZPgm5y5wjC7s2FGXSxu7hicBfIxGnPfhaJpBeGj3i3FAOF7F+KZfCg
	 f5XJm84AqHBnA==
Message-ID: <sashiko-outbox-162610@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v17 04/13] ax88179_178a: Add HW support for
 AX179A-based chips
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261006-ax88179a-v17-4-252814fe35ea@birger-koblitz.de>
References: <20261006-ax88179a-v17-0-252814fe35ea@birger-koblitz.de>
 <20261006-ax88179a-v17-4-252814fe35ea@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 03:05:45 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] net: usb: ax88179_178a: AB-BA deadlock between rtnl_lock and phyli=
nk_resolve
- [High] net: usb: ax88179_178a: direct modification of cloned SKB in tx_fi=
xup corrupts data
- [High] net: usb: ax88179_178a: unaligned memory access in rx_fixup when p=
arsing descriptors
- [Medium] net: usb: ax88179_178a: missing MAC_10 capability for AX88279 pr=
events 10Mbps links
--

commit 30ef18704c5826b2296627db92bef2b5bafb38bf
Author: Birger Koblitz <mail@birger-koblitz.de>
Subject: ax88179_178a: Add HW support for AX179A-based chips

This patch adds bindings and hardware support for AX179A-based USB-Ethernet
controllers, including the AX88279, AX88179A/B, and AX772D/E. It introduces
a vendor interface that can be activated to take precedence over CDC-NCM.

> diff --git a/drivers/net/usb/ax88179a_devices.c b/drivers/net/usb/ax88179=
a_devices.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/net/usb/ax88179a_devices.c
[ ... ]
> +static void ax88179a_mac_link_up(struct phylink_config *config,
> +				 struct phy_device *phy,
> +				 unsigned int phy_mode, phy_interface_t interface,
> +				 int speed, int duplex,
> +				 bool tx_pause, bool rx_pause)
> +{
[ ... ]
> +	if (duplex)
> +		mode |=3D AX_MEDIUM_FULL_DUPLEX;
> +
> +	rtnl_lock();
> +	if (dev->net->mtu > 1500)
> +		mode |=3D AX_MEDIUM_JUMBO_EN;
> +	ax88179_write_u16(dev, AX_ACCESS_MAC, AX_MEDIUM_STATUS_MODE, 2, mode);
> +
> +	ax88179_write_u16(dev, AX_ACCESS_MAC, AX_RX_CTL, 2, READ_ONCE(ax179_dat=
a->rxctl));
> +	rtnl_unlock();

[Severity: High]
Does this introduce an AB-BA deadlock with dev_close()? The phylink_resolve
workqueue runs asynchronously and calls mac_link_up, which acquires
rtnl_lock() here.

Concurrently, if the interface is brought down, dev_close() holds
rtnl_lock() and eventually calls ndo_stop (usbnet_stop) which delegates
to ax88179a_stop() and then phylink_stop(). Since phylink_stop() calls
flush_work(&pl->resolve), both threads could wait forever if the workqueue
is actively executing mac_link_up and blocked waiting for rtnl_lock().

[ ... ]
> +static int ax88179a_phylink_setup(struct usbnet *dev)
> +{
[ ... ]
> +	data->phylink_config.mac_capabilities =3D MAC_SYM_PAUSE | MAC_ASYM_PAUS=
E | MAC_100;
> +	if (data->is_ax88772d)
> +		data->phylink_config.mac_capabilities |=3D MAC_10;
> +	else if (data->chip_version < AX_VERSION_AX88279)
> +		data->phylink_config.mac_capabilities |=3D MAC_10 | MAC_1000;
> +	else
> +		data->phylink_config.mac_capabilities |=3D MAC_1000 | MAC_2500FD;

[Severity: Medium]
Will omitting MAC_10 here prevent the PHY from negotiating 10Mbps link
speeds for the AX88279?

The driver explicitly provides a bulk configuration for BULK_IN_SPEED_FS
(10Mbps full-speed) for this chip in the AX88279_BULKIN_SIZE array, but
without MAC_10, phylink might reject 10Mbps link modes entirely and
prevent fallback to legacy switches.

[ ... ]
> +static int ax88179a_rx_fixup(struct usbnet *dev, struct sk_buff *skb)
> +{
[ ... ]
> +	if (!skb || skb->len < sizeof(rx_hdr))
> +		goto err;
> +
> +	/* RX Descriptor Header */
> +	skb_trim(skb, skb->len - sizeof(rx_hdr));
> +	rx_hdr =3D le64_to_cpup((__le64 *)skb_tail_pointer(skb));

[Severity: High]
Could this cause unaligned memory access panics on architectures with strict
alignment requirements (like SPARC or older ARM)?

The usbnet framework uses a 2-byte IP alignment offset by default (and
ip_align =3D 1 for some chips here), meaning skb_tail_pointer(skb) is likely
not 8-byte aligned. Calling le64_to_cpup() on unaligned pointers can
trigger traps. Should this use get_unaligned_le64() instead?

[ ... ]
> +	/* Get the first RX packet descriptor */
> +	pkt_desc_ptr =3D (__le64 *)(skb->data + hdr_off);
> +
> +	pkt_end =3D 0;
> +	while (pkt_cnt--) {
> +		u64 pkt_desc =3D le64_to_cpup(pkt_desc_ptr);

[Severity: High]
Similarly, is pkt_desc_ptr guaranteed to be 8-byte aligned here? With the
2-byte IP alignment offset, this might also require get_unaligned_le64().

[ ... ]
> +static struct sk_buff *ax88179a_tx_fixup(struct usbnet *dev, struct sk_b=
uff *skb, gfp_t flags)
> +{
[ ... ]
> +	headroom =3D skb_headroom(skb);
> +	tailroom =3D skb_tailroom(skb);
> +
> +	if (!(headroom >=3D sizeof(tx_desc) && tailroom >=3D padding_size)) {
> +		ax_skb =3D skb_copy_expand(skb, sizeof(tx_desc), padding_size, flags);
> +		dev_kfree_skb_any(skb);
> +		skb =3D ax_skb;
> +		if (!skb)
> +			return NULL;
> +	}
> +	if (padding_size !=3D 0)
> +		skb_put_zero(skb, padding_size);
> +	/* Copy TX header */
> +	tx_desc_ptr =3D skb_push(skb, sizeof(tx_desc));
> +	put_unaligned_le64(tx_desc, tx_desc_ptr);

[Severity: High]
Could this corrupt data if the SKB is shared or cloned?

The validation checks for headroom and tailroom, but it appears to miss a
call to skb_cloned() or skb_cow_head() before modifying the packet
boundaries with skb_put_zero() and skb_push().

If the packet is being transmitted by subsystems that clone SKBs (like TCP
retransmits or packet sniffers), modifying this linear buffer will alter
the payload for all concurrent users, which can lead to silent data
corruption or use-after-free panics.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261006-ax88179a-v=
17-0-252814fe35ea@birger-koblitz.de?part=3D4
