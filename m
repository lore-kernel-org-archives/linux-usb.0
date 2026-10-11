Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0C633BBCD
	for <linux-usb@vger.kernel.org>; Sun, 11 Oct 2026 04:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791694497; cv=none; b=J/+Llz1ZwV0vcBycgQjPGKJWAWxCBLIi1lAfI1wgeJ/ReGEZE4R1bH9rqkq66gUuvV8pk5T9tJsnE84mEM4KJCMo+8+fUgAWjRgCiP9U0KeYwzg5e/eRqjYFiSarKySTXTU1Nw1hevytW0JMCsOX2fZ8yeRUJec6SpYaxBBk8Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791694497; c=relaxed/simple;
	bh=VUEYnU7xVnlUZi6FDiKLRq3XGNJhwX06wDMoZCxbq80=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=O5K7lEpnSxxMdt6x899iaxDdh5/vOCc9D2yjoZjRHQLl5zIQpCPJYtKMWi2DlYN0SywiRvi7rpRkkLYC1u71ruea7IiE2zA7mmtZZlvEReGvRhbQ1menTP5qqMzRz8V26bD27u5IjbLl/cnBA4+XmxGFQK3POAVWSNPukAIXIsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R1nbf1dl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R1nbf1dl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8535B1F0089D;
	Sun, 11 Oct 2026 04:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791694496;
	bh=XsLk3HA8CmCGs0VifvFzLmnTkr91B5l2WTVor17bYVI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R1nbf1dlmOhJ99cOg2LENd+jUVJ25NLH8axps5ghcp2iMJz74lWAV2zbGw8i8XEIn
	 0/D2ykIcvx3x8u8Nwd/+Zh9YQObPVDloQJKqTCnNsZT7TKvs8zJdicdFiDbWA/5OX8
	 m+lubfNYzX7Arsl2ix78HituHkhu3mYiZSZP79J9cmL87nAqPaftQ6u4nZ989Druly
	 T7Jpl1LbBhQQVNr7NVozYkfBJ2Ub7EqoX1bjpeL88TBAT5JHuUPiU3eiKD9JiA25sN
	 JAiZkPUsaA6hCif9B7+pDHJKbKkwu3o5yw9Ct/XXkMa7snGYKEfh8cMPxMMRGnh1yt
	 ByrHTgFPvM8nw==
Message-ID: <sashiko-outbox-167013@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v19 09/13] ax88179_178a: Add Suspend/resume
 support for AX88179A/772D/279
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261010-ax88179a-v19-9-7475173cfb56@birger-koblitz.de>
References: <20261010-ax88179a-v19-0-7475173cfb56@birger-koblitz.de>
 <20261010-ax88179a-v19-9-7475173cfb56@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Oct 2026 04:54:56 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] net: Missing MAC address hardware restore during device resume
- [Medium] net: Unchecked read from hardware registers clobbers state on su=
spend
- [Medium] net: usb: ax88179_178a: dropped error code in ax88179a_resume()
- [Medium] net: ax88179_178a: unaligned memory access in ax88179a_reset()
--

commit 899b3b4428f2b801666bb023701af9a492e4e1b0
Author: Birger Koblitz <mail@birger-koblitz.de>
Subject: ax88179_178a: Add Suspend/resume support for AX88179A/772D/279

The suspend and resume functions are called via the usb_driver structure,
for which the driver has only a single instance. Add wrapper functions
for the different implementations for the AX88179 and AX179A architecutres
in ax88179_lib which calls the 2 implementations in ax88179_178a and
ax88179a_devices, respectively.

> diff --git a/drivers/net/usb/ax88179a_devices.c b/drivers/net/usb/ax88179=
a_devices.c
> index a6b0a3f47118c..01d6a35f68b2c 100644
> --- a/drivers/net/usb/ax88179a_devices.c
> +++ b/drivers/net/usb/ax88179a_devices.c
[ ... ]
> @@ -126,6 +128,63 @@ static void ax88179a_status(struct usbnet *dev, stru=
ct urb *urb)
>  	phylink_mac_interrupt(data->phylink);
>  }
> =20
> +static int ax88179a_suspend(struct usb_interface *intf, pm_message_t mes=
sage)
> +{
[ ... ]
> +	/* Enable WoL */
> +	if (priv->wolopts) {
> +		ax88179_read_cmd(dev, AX_ACCESS_MAC, AX_MONITOR_MOD, 1, 1, &tmp8);
> +		tmp8 &=3D ~(AX_MONITOR_MODE_RWLC | AX_MONITOR_MODE_RWMP);

[Severity: Medium]
What happens if ax88179_read_cmd() fails due to a transient USB error?

It appears tmp8 could be zeroed out by the failure, which would cause the
subsequent bitwise operations and ax88179_write_cmd() to clear all other
configured bits in the AX_MONITOR_MOD register, potentially corrupting the
device state.

> +		if (priv->wolopts & WAKE_PHY)
> +			tmp8 |=3D AX_MONITOR_MODE_RWLC;
> +		if (priv->wolopts & WAKE_MAGIC)
> +			tmp8 |=3D AX_MONITOR_MODE_RWMP;
> +
> +		ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_MONITOR_MOD, 1, 1, &tmp8);
> +
> +		ax88179_read_cmd(dev, AX_ACCESS_MAC, AX_MEDIUM_STATUS_MODE, 2, 2, &tmp=
16);
> +		tmp16 |=3D AX_MEDIUM_RECEIVE_EN;

[Severity: Medium]
Similarly, could an unchecked failure of ax88179_read_cmd() here result in
tmp16 being written back as just AX_MEDIUM_RECEIVE_EN, unintentionally
clearing other bits in AX_MEDIUM_STATUS_MODE?

> +		ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_MEDIUM_STATUS_MODE, 2, 2, &tm=
p16);
> +
[ ... ]
> +static int ax88179a_resume(struct usb_interface *intf)
> +{
[ ... ]
> +	ax88179_write_u8(dev, AX88179A_PHY_POWER, 0, 0, 0);
> +	msleep(250);
> +
> +	ax88179a_reset(dev);

[Severity: Medium]
Could this new call to ax88179a_reset() during resume trigger unaligned
memory accesses?

Looking at ax88179a_reset(), the driver casts a 1-byte aligned u8 array to a
u16 pointer:

	u8 buf[5];
	tmp16 =3D (u16 *)buf;
	*tmp16 =3D AX_MEDIUM_RECEIVE_EN | ...

Is there a risk this could cause alignment faults on architectures that do
not support unaligned accesses natively?

> +
> +err_out:
> +	if (netif_running(dev->net)) {
> +		rtnl_lock();
> +		phylink_resume(ax179_data->phylink);
> +		rtnl_unlock();
> +	}
> +
> +	ax88179_set_pm_mode(dev, false);
> +
> +	return usbnet_resume(intf);

[Severity: Medium]
If the hardware initialization fails (for example, if ax88179_read_cmd fails
and jumps to err_out), the error code in ret seems to be discarded here
because this function always returns the result of usbnet_resume(intf), whi=
ch
is 0.

Should we return ret to properly inform the PM core of the failure?

> +}
[ ... ]
> @@ -1055,9 +1166,13 @@ static int ax88179a_reset(struct usbnet *dev)
>  	ax88179_write_u8(dev, AX_ACCESS_MAC, AX88179A_MAC_SWP_CTRL, 1, 0);
>  	ax88179_write_u8(dev, AX_ACCESS_MAC, AX88179A_MAC_TX_HDR_CKSUM, 1, 0);
> =20
> -	/* Read MAC address from DTB or asix chip */
> -	ax88179_get_mac_addr(dev);
> -	memcpy(dev->net->perm_addr, dev->net->dev_addr, ETH_ALEN);
> +	/* Read MAC address from DTB or asix chip, except when called
> +	 * from resume context.
> +	 */
> +	if (!ax179_data->in_pm) {
> +		ax88179_get_mac_addr(dev);
> +		memcpy(dev->net->perm_addr, dev->net->dev_addr, ETH_ALEN);
> +	}

[Severity: High]
Does skipping ax88179_get_mac_addr() during resume prevent the hardware MAC
address from being restored?

After a reset_resume, hardware state is lost. If ax88179_get_mac_addr() is
skipped because in_pm is true, it seems the software dev_addr is never
programmed back into the hardware AX_NODE_ID registers, leaving the hardware
filter with its EEPROM default MAC.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010-ax88179a-v=
19-0-7475173cfb56@birger-koblitz.de?part=3D9
