Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F1E33BBCD
	for <linux-usb@vger.kernel.org>; Sun, 11 Oct 2026 04:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791694495; cv=none; b=RXTp2Wfs2X0vVBqFQe812SvCzNxWcl7JQNDYFCKQaVPuRr5w3Vbld7epsi7ntEV45eCeELFMBNd/QskvbVEgsJcnjkpGgpjsZlOfdzssxoQ/8BVtNgA1Pg37gxZ+oW/IYI+ug8hBL/QPMd3IqjkjJx/XSb7RXpWskVNLqz8salE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791694495; c=relaxed/simple;
	bh=p8h3fg9RlkYYoJU0VWIXcQk7Omgjcr3Sa6DjUBzi6OE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=k5LDvchkH7qa6wFSOlFyX0rwOESci3OJe2ODv9SmAWrofyU2ATDQbezWZZSK36cKlNxZarWAPBOzI6VK5sClAxtOK1t6P/njFDUL10seJqOWrmqQfW60cQ1Ai/4nvn0JfhQnRDwC+3PinKZkQ/CB/bHXImzEvxZI2ju5ENjq610=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jlzfx7As; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jlzfx7As"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 675051F0089D;
	Sun, 11 Oct 2026 04:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791694494;
	bh=69AAXy6J2mPXPS6ebCx+4NMpfQsTnWfZ5oNViRDAaeQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Jlzfx7AstbLBXz9EX6Sn9knCBrH6t1+Wq7Pw+qTueEoDTLzjnswwHwk9v1r/ZFBlT
	 44JWd6eow3Lek6D/yARE2+NTGi201ABnefKcZhhMqWFPbGCMWR1XiGYVoS9jofLEdo
	 VREa1dEYTSl/NeAQFxdIjnkluAe1yy6ml2S5KxqkudHYRBiGiD5/TLt6klUKLcZ16M
	 snmE2uChmUhVJswoDqFE+za9lWFtnOwpIOGtN6Q3KYDAxmS25kYwqRbYW39w9S3zh3
	 gfipqJJcl9HVvtR/LBPY4/6IPwhE04sLvY/riC50rqb6g1YJ6I+fZQ7w3XwjEqTrXV
	 zKxYQ5JHTGcMQ==
Message-ID: <sashiko-outbox-167010@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v19 04/13] ax88179_178a: Add HW support for
 AX179A-based chips
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261010-ax88179a-v19-4-7475173cfb56@birger-koblitz.de>
References: <20261010-ax88179a-v19-0-7475173cfb56@birger-koblitz.de>
 <20261010-ax88179a-v19-4-7475173cfb56@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Oct 2026 04:54:53 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] net: ax88179a: perm_addr overwritten by dev_addr on interface up
- [Low] net/usb: unaligned memory access via cast of u8 buf[5]
--

commit 8f7d8eac10e2d0c51938d5773370c574a2391e9a
Author: Birger Koblitz <mail@birger-koblitz.de>

ax88179_178a: Add HW support for AX179A-based chips

This commit adds bindings and hardware support for AX179A-based USB-Ethernet
controllers. It introduces a vendor mode switch for CDC-NCM fallback, adds
new device entries, and provides hardware-specific initialization sequences
via ax88179a_devices.c.

> diff --git a/drivers/net/usb/ax88179a_devices.c b/drivers/net/usb/ax88179=
a_devices.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/net/usb/ax88179a_devices.c
[ ... ]
> +static int ax88179a_reset(struct usbnet *dev)
> +{
> +	struct ax88179_data *ax179_data =3D dev->driver_priv;
> +	u16 *tmp16;
> +	u8 buf[5];
> +	u16 rxctl;
> +	u8 *tmp;
> +
> +	tmp16 =3D (u16 *)buf;
> +	tmp =3D (u8 *)buf;
[ ... ]
> +	ax88179_write_u8(dev, AX_ACCESS_MAC, AX88179A_MAC_ARC_CTRL, 1, 0);
> +	ax88179_write_u8(dev, AX_ACCESS_MAC, AX88179A_MAC_SWP_CTRL, 1, 0);
> +	ax88179_write_u8(dev, AX_ACCESS_MAC, AX88179A_MAC_TX_HDR_CKSUM, 1, 0);
> +
> +	/* Read MAC address from DTB or asix chip */
> +	ax88179_get_mac_addr(dev);
> +	memcpy(dev->net->perm_addr, dev->net->dev_addr, ETH_ALEN);

[Severity: Medium]
Is it safe to unconditionally overwrite the permanent MAC address during an
interface reset?

During routine interface resets (e.g., bringing the interface up via
usbnet_open()), the usbnet framework calls the driver's .reset callback,
which points to ax88179a_reset().

If a user changes the MAC address while the interface is down, that custom
address is correctly written to the hardware. However, when the interface
comes back up, ax88179_get_mac_addr() reads that temporary custom MAC back
from the hardware and copies it into dev->net->perm_addr.

Does this permanently clobber the immutable perm_addr with the user's
temporary MAC address and break tools like ethtool -P?

[ ... ]
> +	if (ax179_data->chip_version < AX_VERSION_AX88179A)
> +		*tmp =3D AX_MONITOR_MODE_PMETYPE | AX_MONITOR_MODE_PMEPOL | AX_MONITOR=
_MODE_RWMP;
> +	else
> +		*tmp =3D AX_MONITOR_MODE_RWMP;
> +	ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_MONITOR_MOD, 1, 1, tmp);
> +
> +	/* Configure default medium type =3D> giga */
> +	*tmp16 =3D AX_MEDIUM_RECEIVE_EN | AX_MEDIUM_TXFLOW_CTRLEN |
> +		 AX_MEDIUM_RXFLOW_CTRLEN | AX_MEDIUM_FULL_DUPLEX;
> +	if (!ax179_data->is_ax88772d)
> +		*tmp16 |=3D AX_MEDIUM_GIGAMODE;
> +	ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_MEDIUM_STATUS_MODE, 2, 2, tmp1=
6);

[Severity: Low]
Does assigning to *tmp16 cause an unaligned memory access here?

The stack buffer u8 buf[5] has a natural alignment of 1 byte. Casting it to
u16 *tmp16 and directly assigning a 16-bit value violates C standard
aliasing and alignment rules. On architectures lacking hardware support for
unaligned accesses, this causes alignment faults.

Since this patch introduces the ax88179_write_u16() helper, could that be
used instead to avoid the unaligned cast entirely?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010-ax88179a-v=
19-0-7475173cfb56@birger-koblitz.de?part=3D4
