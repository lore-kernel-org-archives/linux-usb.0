Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794036110;
	b=gMxzE/3ur33l7ZkuoNYDr0nPSQ5ENsdvxcBrgl3t3qOpd3FfYXK92tlz8KfJH+/jcuIH
	 9fg3mf2fzpywTRaV/cppdbqw3dSlSLXchxdbrJ+2Xv/qk+L7trFGNoTbx+5E6LUuJjskD
	 tnkPCeCI5+rQo0L6NgqZAKAgiwiZTPBQprTIpsrJD2v79dP60smcHeudzW4sbx5OLIxDS
	 v7m2ANLOJWhQqBo3cwNmT3uaYYgMwtYVSjLXyOQxjxxFxnukpAk/m6/rVWL2sj0i+r986
	 XcRxgwDVYPyUgkMobqVdMuuZb361WgHCWFNeHL5c/Azhe/Qrg2i4ThTBrRK52oCEptg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794036110;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=CeuuIBNacG9d8tHy2RcX+7bp4ML+qmaYxaiNYBj1n5o=;
	b=nxijg4kz/pOXyA4T6Tg4KqTCFIpAA015gW4ikBIaR7gO+ZezUSh71753DcVT+zYX5qRw
	 RtVAyEqepzNn/80V12RrZGsxryhe19//4uSDOjoXlX4yX/8jl1SOhdtFgpl+f3HSoGCSM
	 zhy8U0f7ZTPR4AfeURdpLfJ6U8PYo0gAz3VJ7ScL2AJssxdUYAzy5sf54QaN/N5S0GT1B
	 Qf9BejnxCPNpsx3/HCNLR/v3jDu8/xITaKAMt7AV5o1aJa7TXGF9u/1ik0h+bM7Vj/UlW
	 RRQX1Uvfa3uBpjFyDhZh+eCfZWyyKde9nGFOerMkXJjh0Qq5vo1wN+SP1HI7r2oJc6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gjy0RVWK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26DD606A333
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 07:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gjy0RVWK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 590061F0089F;
	Sat,  7 Nov 2026 07:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794036110;
	bh=CeuuIBNacG9d8tHy2RcX+7bp4ML+qmaYxaiNYBj1n5o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Gjy0RVWK2DLRiHCH373zXccvgJ47jcRV/ROzDgRH51BAI+mCWjdlHRrniqhx0kK3E
	 qFHf4/jjFQkGM501wxUsWRYJRRhWMBk8SLVCBzRmjtdMwY73kMmIO+fX+9KSwntXCY
	 6pf/vIOCr0ElyMpl7/NCFZWhSKrNVud6FaL1hnAFA2ecDBCfUiOQM2YwysSKe+u8wJ
	 j2o/Ua38TXbV3EqxF47usH1AgpVb8rNU6tfWJTBTM6Ok9jwoYYhSrtGl99UwZeuGER
	 3zOSaFgWw6YNtYc15zB4CCT7oBJvdk0CXmyEn63gtbJgjGI21AqWcLMWukZyA0tdAP
	 Ec4x9iYPF/g+g==
Message-ID: <sashiko-outbox-202693@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v20 03/13] ax88179_178a: Split driver into
 library and device specific code
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106-ax88179a-v20-3-37b5a1189983@birger-koblitz.de>
References: <20261106-ax88179a-v20-0-37b5a1189983@birger-koblitz.de>
 <20261106-ax88179a-v20-3-37b5a1189983@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 07:21:50 +0000
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
- [Medium] net: usb: ax88179: incomplete medium_status_mutex locking in
  ax88179_link_reset()
--

commit 8e0b6dd22d7460dd33bd4e07faf824de7c0a7ad6
Author: Birger Koblitz <mail@birger-koblitz.de>

ax88179_178a: Split driver into library and device specific code

This commit splits common helpers and definitions out of ax88179_178a.c
into ax88179_lib.c and ax88179_lib.h, renames the module to ax88179, and
adds medium_status_mutex and error handling to ax88179_change_mtu().

> diff --git a/drivers/net/usb/ax88179_lib.c b/drivers/net/usb/ax88179_lib.c
> new file mode 100644
> index 0000000000000..063427ff55e42
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
Does jumping to err_out leave net->mtu and dev->hard_mtu updated when a
register read or write fails?

netif_set_mtu_ext() assumes dev->mtu is unchanged when ndo_change_mtu()
returns an error, so it neither restores the old MTU nor fires
NETDEV_CHANGEMTU notifiers, and err_out also skips
usbnet_update_max_qlen().  This leaves net->mtu and dev->hard_mtu out of
sync with the hardware AX_MEDIUM_JUMBO_EN setting and dev->tx_qlen, and
causes later attempts to set the same new_mtu to return early in
netif_set_mtu_ext() because dev->mtu already equals new_mtu.  Updating
net->mtu and dev->hard_mtu only after the register access succeeds would
avoid this regression.

> diff --git a/drivers/net/usb/ax88179_lib.h b/drivers/net/usb/ax88179_lib.h
> new file mode 100644
> index 0000000000000..9111a1395eb2f
> --- /dev/null
> +++ b/drivers/net/usb/ax88179_lib.h

[ ... ]

> +struct ax88179_data {
> +	struct mutex medium_status_mutex;  /* protect AX_MEDIUM_STATUS_MODE */
> +	u8  eee_enabled;
> +	u8  eee_active;
> +	u16 rxctl;
> +	u8 in_pm;
> +	u32 wol_supported;
> +	u32 wolopts;
> +	u8 disconnecting;
> +};

[Severity: Medium]
Should ax88179_link_reset() also take medium_status_mutex when updating
AX_MEDIUM_STATUS_MODE?

ax88179_link_reset() runs from usbnet_deferred_kevent() without rtnl_lock
or medium_status_mutex, reads dev->net->mtu, sleeps in a USB control
transfer for AX_RX_BULKIN_QCTRL, and then writes AX_MEDIUM_STATUS_MODE:

drivers/net/usb/ax88179_178a.c:ax88179_link_reset() {
	...
	} else if (GMII_PHY_PHYSR_GIGA =3D=3D (tmp16 & GMII_PHY_PHYSR_SMASK)) {
		mode |=3D AX_MEDIUM_GIGAMODE | AX_MEDIUM_EN_125MHZ;
		if (dev->net->mtu > 1500)
			mode |=3D AX_MEDIUM_JUMBO_EN;
	...
	ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_RX_BULKIN_QCTRL, 5, 5, tmp);
	...
	ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_MEDIUM_STATUS_MODE,
			  2, 2, &mode);
}

This allows a race with ax88179_change_mtu():

CPU0                              kworker
ax88179_change_mtu()              ax88179_link_reset()
                                    read dev->net->mtu (1500)
                                    ax88179_write_cmd(... BULKIN_QCTRL ...)
  mutex_lock(&medium_status_mutex)
  WRITE_ONCE(net->mtu, 4000)
  read AX_MEDIUM_STATUS_MODE
  write AX_MEDIUM_STATUS_MODE
    (sets AX_MEDIUM_JUMBO_EN)
  mutex_unlock(&medium_status_mutex)
                                    write AX_MEDIUM_STATUS_MODE
                                      <-- overwrites AX_MEDIUM_JUMBO_EN

If the writes interleave in the opposite order, ax88179_change_mtu() can
read AX_MEDIUM_STATUS_MODE before ax88179_link_reset() updates it and
write back stale speed and duplex bits.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-ax88179a-v=
20-0-37b5a1189983@birger-koblitz.de?part=3D3
