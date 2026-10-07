Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD7F3B6BE3
	for <linux-usb@vger.kernel.org>; Wed,  7 Oct 2026 03:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791342346; cv=none; b=Y8SyoheFMZegiPVuJh1B8r5a+BTSIQdJ8M/cq6leMW57TVFO9iAP78sjDJrnks+UauW4N1t2uOQjbD4l4fJpodE4VsF8IKnwthL+qpZ7usvQJ+UcCWEoqVSSEssJ9qhunySePGS0KydYh03YY7rtlyH3Ly10CmnX8bWr6BuaWq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791342346; c=relaxed/simple;
	bh=9MgDZj0WV3IeIXyTxBIZJLYCXyK4UOjkAsBE7gR/xpM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=bmqN0DwZ+SKDHZx2l2jn6j3VDORAafmHFNbcgmBUINj5vGT2G2V7ucavQGQ9LJVjPGSZETtW3Z5Lr/x1+sBsfFlqJarkqpEWc+FLX9FpqhUFT7nOcnFBz7eJyLh3FcwVh9bl1YeIC5CVFZidgNUt7Qja5wI9qVIlvmIk96SKC88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GvyaHrqH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GvyaHrqH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35BB01F0089D;
	Wed,  7 Oct 2026 03:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791342345;
	bh=GOcRrVT+zqWPEUBfeBh8G+dttqQc57RPLbrTCsegAnI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GvyaHrqH0d2opMVT/ZJ+bKYwl5pZHSRH3vWtcmpJITre9qc7CpwtlnAZt/AZgtYuG
	 8ny/GH2v+yeE2p7gnvYJCSF1daem7lYAvJDwNnrnDtMWnvxXXkQkqYF6H45gkDRH1s
	 Uc6xJPXvZ2xT38fPiiNxHVoizsFIsXKV57ISsCtHT+likQ4+jC/NMscRkRCfV7JAoT
	 h7TlJndZ2RWA7aSNXMmRWTfl5qvjxGqR741syF6l5h6Z8rNQ5kn/ZjJ/uWdSSEoOa+
	 tv2f2p2WA94hH5V/wUhYDG9QqEIZTHKxvWTtQztzbLDM7HemWJfpYNwIQfp8qGUCIJ
	 R6++p8fGPsdEA==
Message-ID: <sashiko-outbox-162609@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v17 11/13] ax88179_178a: Update driver name and
 information
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261006-ax88179a-v17-11-252814fe35ea@birger-koblitz.de>
References: <20261006-ax88179a-v17-0-252814fe35ea@birger-koblitz.de>
 <20261006-ax88179a-v17-11-252814fe35ea@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 03:05:44 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] net: skb data corruption in ax88179a_tx_fixup due to missing skb_c=
loned check
- [High] pm: leaked pm_mode state in ax88179a_suspend error path
--

commit beecb9dc824b9046a2ddbab47f74bb933e48f1e8
Author: Birger Koblitz <mail@birger-koblitz.de>

    ax88179_178a: Update driver name and information

    Add additionally supported devices to Kconfig description, add further
    requirements such as PHYLINK. Update driver name in usb_driver and
    update MODULE_DESCRIPTION to include the additionally supported chips.

> diff --git a/drivers/net/usb/ax88179a_devices.c b/drivers/net/usb/ax88179=
a_devices.c
> new file mode 100644
> index 0000000000000..929fa51280e84
> --- /dev/null
> +++ b/drivers/net/usb/ax88179a_devices.c
> @@ -0,0 +1,1284 @@

[ ... ]

> +static int ax88179a_suspend(struct usb_interface *intf, pm_message_t mes=
sage)
> +{
> +	struct usbnet *dev =3D usb_get_intfdata(intf);
> +	struct ax88179_data *priv;
> +	u8 tmp8 =3D 0;
> +	u16 tmp16;
> +	int ret;
> +
> +	priv =3D dev->driver_priv;
> +	ax88179_set_pm_mode(dev, true);
> +
> +	if (netif_running(dev->net)) {
> +		rtnl_lock();
> +		phylink_suspend(priv->phylink, !!priv->wolopts);
> +		rtnl_unlock();
> +	}
> +
> +	ret =3D usbnet_suspend(intf, message);
> +	if (ret) {
> +		rtnl_lock();
> +		phylink_resume(priv->phylink);
> +		rtnl_unlock();
> +		return ret;
                ^^^^

[Severity: High]
Could this early return bypass ax88179_set_pm_mode(dev, false) and leave the
driver's internal PM state permanently corrupted?

If in_pm remains true, this could cause subsequent control commands to
bypass runtime PM locks, leading to aggressive auto-suspend and eventual
USB timeouts.

> +	}

[ ... ]

> +static struct sk_buff *ax88179a_tx_fixup(struct usbnet *dev, struct sk_b=
uff *skb, gfp_t flags)
> +{
> +	u64 tx_desc =3D skb->len & AX179A_TX_DESC_LEN_MASK;
> +	int frame_size =3D dev->maxpacket;
> +	struct sk_buff *ax_skb;
> +	u64 *tx_desc_ptr;
> +	int padding_size;
> +	int headroom;
> +	int tailroom;
> +	u16 tci =3D 0;
> +
> +	/* TSO MSS */
> +	tx_desc |=3D FIELD_PREP(AX179A_TX_DESC_MSS, (u64)skb_shinfo(skb)->gso_s=
ize);
> +
> +	headroom =3D (skb->len + sizeof(tx_desc)) % 8;
> +	padding_size =3D headroom ? 8 - headroom : 0;
> +
> +	if (((skb->len + sizeof(tx_desc) + padding_size) % frame_size) =3D=3D 0=
) {
> +		padding_size +=3D 8;
> +		tx_desc |=3D AX179A_TX_DESC_DROP_PADD;
> +	}
> +
> +	if ((dev->net->features & NETIF_F_HW_VLAN_CTAG_TX) && (vlan_get_tag(skb=
, &tci) >=3D 0)) {
> +		tx_desc |=3D AX179A_TX_DESC_VLAN;
> +		tx_desc |=3D FIELD_PREP(AX179A_TX_DESC_VLAN_ID, (u64)tci);
> +	}
> +
> +	if (!dev->can_dma_sg && (dev->net->features & NETIF_F_SG) && skb_linear=
ize(skb)) {
> +		dev_kfree_skb_any(skb);
> +		return NULL;
> +	}
> +
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
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: High]
Are we writing into the SKB headroom here without checking if the buffer is
shared?

If a cloned SKB (such as during packet capture, TCP retransmits, or
broadcast) happens to have sufficient headroom and tailroom, this skips
skb_copy_expand and directly modifies the shared buffer.

This would corrupt data for all other clones holding a reference. Should
this call skb_cloned() or unshare the SKB buffer first?

> +	put_unaligned_le64(tx_desc, tx_desc_ptr);
> +
> +	usbnet_set_skb_tx_stats(skb, 1, 0);
> +
> +	return skb;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261006-ax88179a-v=
17-0-252814fe35ea@birger-koblitz.de?part=3D11
