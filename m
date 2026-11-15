Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739913;
	b=vsbQUqkX4gm3eagAkOvXiA6Hk869Vnf0Q0/TL7yuNqWjiCsYVqx4IDSIOJNv/7JJR04N
	 GDRveaMO2WQAN+jJez4tVs0GEIeZl/0ozJffjD4q8WpcFbcLhqDoZdfQj17U2XTWInTio
	 NhY6GuSqZE+5/IqhuQVfZp7AZZqcQqu1TUNofPLFY0MWq651co8N0pzs5+iO6sxyeKS9E
	 ULuF+75eBVtwJVqVk9h1/qeSa3bjGCQXwRGQLEJ1VOM3yW6ODsSr0nJhWCj6EPOtbac/4
	 IAMJpe6cYYrLZJDr9mFhADSU04BWcimnKeAf/82YBZSENJGwZfOlhAINWgjBObKXxhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739913;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9vgqJDbclLkwSUOf8OvkMBb93JtXdCXLdR3Og1BSZGY=;
	b=JOMvyZFZDkckod155ZxgXmSb9OOy/IwsXpjLqz6RFrcAgvryv6TTfFlMNQ2bCIueGL71
	 /SFsP2+utXJk+y54Dc1f0r1WNV2BZta87Mc5EQCIpBCOVqGdduWC56DqfUNAJoF7v0ANT
	 o4tYzizhk/ZKEc6ZHL8IZv45kXddwCUh7Yzh1YAZPkg1YKltxRmKc/vqhuNqYFvophs/p
	 f1eL3yZBdAP37mcyoiElPXbRqVaTSAa8CeRpTMDiMa+pZ6XP8bSfBuYGKX+hMRSwL1Dj8
	 xDF+PWzHwxPu9WahNKfaphD4gOn9Monopq6kBAChoif6BXKIHo05xA0/+UFFoyKNuRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AJcd6hqb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5A2606A332
	for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 10:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AJcd6hqb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94EE61F000C4;
	Sun, 15 Nov 2026 10:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794739912;
	bh=9vgqJDbclLkwSUOf8OvkMBb93JtXdCXLdR3Og1BSZGY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AJcd6hqb2pZdsJZVfvYJpvAyF0D/JgUGaIlh09W+22xbZGoeZGIxLQAcjeel+3ttB
	 iiNKLRDgvXF2Ms2mUK5DEO7z3J5n+DgzMJ+veJWW5ZLJBoJPKzfACS5FpgSOFvRjvF
	 O90QojCilqk6/n4rT4uXXCa+Fy4nEC2exu0Jm1ZFGvUS8CUFY6DSAopvSreDQVkmr6
	 k/g9k1j70IzhYzt7UzKi3lEfr4Ve/Vit5FQAJV2mYd44NmpTItX8/ITUFBZYqu5COy
	 EuI4QOUhyRrZEZGfrYhKx7iRFlY6ycrsyLi3uFcqJHyfxQ8pYKaGKQr7f7sY6pgjev
	 HM4vNETVKjK9Q==
Message-ID: <sashiko-outbox-215416@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v21 03/13] ax88179_178a: Split driver into
 library and device specific code
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261114-ax88179a-v21-3-c2d34410bcbe@birger-koblitz.de>
References: <20261114-ax88179a-v21-0-c2d34410bcbe@birger-koblitz.de>
 <20261114-ax88179a-v21-3-c2d34410bcbe@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 10:51:52 +0000
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
- [Medium] net: usb: ax88179: premature MTU state update in
  ax88179_change_mtu()
- [Medium] net: usb: ax88179: incomplete medium_status_mutex locking
--

commit 9cf9d4a99ae16c171272ec2bbd3db39766daf1ee
Author: Birger Koblitz <mail@birger-koblitz.de>

ax88179_178a: Split driver into library and device specific code

This commit splits the ax88179_178a driver into a shared library and
device-specific code, and renames the module to ax88179 with an alias for
ax88179_178a.

> diff --git a/drivers/net/usb/ax88179_lib.c b/drivers/net/usb/ax88179_lib.c
> new file mode 100644
> index 0000000000000..fbaf12b713b03
> --- /dev/null
> +++ b/drivers/net/usb/ax88179_lib.c

[ ... ]

> +int ax88179_change_mtu(struct net_device *net, int new_mtu)
> +{
> +	struct usbnet *dev =3D netdev_priv(net);
> +	struct ax88179_data *data;
> +	u16 tmp16;
> +	int err;
> +
> +	data =3D dev->driver_priv;
> +	mutex_lock(&data->medium_status_mutex);
> +	WRITE_ONCE(net->mtu, new_mtu);
> +	dev->hard_mtu =3D net->mtu + net->hard_header_len;
> +	if (net->mtu > 1500) {
> +		err =3D ax88179_read_cmd(dev, AX_ACCESS_MAC, AX_MEDIUM_STATUS_MODE,
> +				       2, 2, &tmp16);
> +		if (err < 0)
> +			goto err_out;
> +		tmp16 |=3D AX_MEDIUM_JUMBO_EN;
> +		err =3D ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_MEDIUM_STATUS_MODE,
> +					2, 2, &tmp16);
> +		if (err < 0)
> +			goto err_out;
> +	} else {
> +		err =3D ax88179_read_cmd(dev, AX_ACCESS_MAC, AX_MEDIUM_STATUS_MODE,
> +				       2, 2, &tmp16);
> +		if (err < 0)
> +			goto err_out;
> +		tmp16 &=3D ~AX_MEDIUM_JUMBO_EN;
> +		err =3D ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_MEDIUM_STATUS_MODE,
> +					2, 2, &tmp16);
> +		if (err < 0)
> +			goto err_out;
> +	}
> +	mutex_unlock(&data->medium_status_mutex);
> +
> +	/* max qlen depend on hard_mtu and rx_urb_size */
> +	usbnet_update_max_qlen(dev);
> +
> +	return 0;
> +
> +err_out:
> +	mutex_unlock(&data->medium_status_mutex);
> +	return err;
> +}

[Severity: Medium]
Does jumping to err_out leave net->mtu and dev->hard_mtu updated to
new_mtu when a register read or write fails?

When __netif_set_mtu() returns an error, netif_set_mtu_ext() assumes the
driver did not modify net->mtu, so it does not roll the value back or
run NETDEV_CHANGEMTU notifiers, and err_out also skips
usbnet_update_max_qlen().  This leaves net->mtu and dev->hard_mtu out of
sync with AX_MEDIUM_JUMBO_EN and dev->tx_qlen, and a retry with the same
new_mtu returns early in netif_set_mtu_ext() because net->mtu already
equals new_mtu.  Updating net->mtu and dev->hard_mtu only after
ax88179_write_cmd() succeeds would avoid this regression.

[ ... ]

> diff --git a/drivers/net/usb/ax88179_lib.h b/drivers/net/usb/ax88179_lib.h
> new file mode 100644
> index 0000000000000..9111a1395eb2f
> --- /dev/null
> +++ b/drivers/net/usb/ax88179_lib.h

[ ... ]

> +struct ax88179_data {
> +	struct mutex medium_status_mutex;  /* protect AX_MEDIUM_STATUS_MODE */

[Severity: Medium]
Can ax88179_change_mtu() still race with ax88179_link_reset() when
updating AX_MEDIUM_STATUS_MODE?

This patch adds medium_status_mutex and takes it in ax88179_change_mtu(),
but ax88179_link_reset() runs on dev->kevent without holding
medium_status_mutex or rtnl_lock:

CPU0                              kworker
ax88179_change_mtu()              ax88179_link_reset()
                                    if (dev->net->mtu > 1500)
                                      mode |=3D AX_MEDIUM_JUMBO_EN;
                                    ax88179_write_cmd(...,
                                      AX_RX_BULKIN_QCTRL, ...);
  mutex_lock(&medium_status_mutex)
  WRITE_ONCE(net->mtu, 4000)
  ax88179_read_cmd(...,
    AX_MEDIUM_STATUS_MODE, &tmp16)
  tmp16 |=3D AX_MEDIUM_JUMBO_EN
  ax88179_write_cmd(...,
    AX_MEDIUM_STATUS_MODE, &tmp16)
  mutex_unlock(&medium_status_mutex)
                                    ax88179_write_cmd(...,
                                      AX_MEDIUM_STATUS_MODE, &mode);
                                      <-- overwrites AX_MEDIUM_JUMBO_EN

In the reverse order, ax88179_change_mtu() can read AX_MEDIUM_STATUS_MODE
before ax88179_link_reset() writes the new link mode and then write back
stale speed and duplex bits.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114-ax88179a-v=
21-0-c2d34410bcbe@birger-koblitz.de?part=3D3
