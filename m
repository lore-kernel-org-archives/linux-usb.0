Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9127F3C8700
	for <linux-usb@vger.kernel.org>; Sun, 11 Oct 2026 04:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791694500; cv=none; b=RirXndo38f7MK5MooS1BsPw99ztjQDr04tiYBGqh4nci2F/opLFlKJf2Vvmfk+T4ChYGRSAztVDpCSMvv/JTCh2dVeOjiSIja4gYSMWthyx1/YuX0bpuBhLO/dDpaVLFyKeJG4FsAsjYpLT4/u0Cr/ON/LxXuFhTxOxGx7YdM/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791694500; c=relaxed/simple;
	bh=INvnWRm+wawdA5IL/Rp2vrWmiz6/Okej2ltvkFlzNCM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=DTJzpHcWzNH/3MXR8bi06dk5igX/Hj4FRA98bSvkacndazwhBzvbC3/Kkm2OCi2hauTEKduZT7iMwwQuzd4CynJun9MiCDfFzgLlBBFVZ6LpjpTcc2Kakx3UXpccc8HfTCTnG6ZTBxwIhh3CoPHpEN/h7xkO8lwz1BsOhuhxIqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pq94zfFy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pq94zfFy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E7A61F0089B;
	Sun, 11 Oct 2026 04:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791694499;
	bh=AESlE4N7BPn3dURp9DeSW7AKRbhx7yi6s1p8caILDXs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Pq94zfFypYg/rePWiRXDb3J6WBUCq4At6mZoTvHXlBtlP3d0zJYSuIrtPPkxBl73l
	 VpBLmUohcaeRB2PFgEgJLMYikSnTDsMAlh8iYf72q6yNZB3IMGtbtVgmeAS6ff3XZs
	 /CzsiWgLg1kzPzUPleT5EI2mw2D7LeFS1cu4nk1hucg8MP0znvzhu26MmlCX2zfQr6
	 B5dNbfFqTCS8j5i6Ec5p3hWMq1WO9jIo+PS4tzxXRS6uiOH6c6DS9gVMNb6/jnzzy8
	 wQ1gROoaS7F68NI6tVQB5Dulnbjm0Thfz/JK9H7VOVnVwLq8JexhOop4gPTt1E+QPr
	 gkDyhhlfYyHDQ==
Message-ID: <sashiko-outbox-167017@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v19 08/13] ax88179_178a: Add AX179A/AX279
 multicast configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261010-ax88179a-v19-8-7475173cfb56@birger-koblitz.de>
References: <20261010-ax88179a-v19-0-7475173cfb56@birger-koblitz.de>
 <20261010-ax88179a-v19-8-7475173cfb56@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Oct 2026 04:54:58 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] net: ax88179: TOCTOU race in AX_RX_CTL hardware update
--

commit 81a7ae4b83e41763b94eb2bd27f7e79602b4f8d5
Author: Birger Koblitz <mail@birger-koblitz.de>

ax88179_178a: Add AX179A/AX279 multicast configuration

Add support for conditionally setting the ip_alignement flag
AX_RX_CTL_IPE in AX_RX_CTL and make sure that AX_RX_CTL_DROPCRCERR
is also set to be consistent with the initial configuration in
ax88179_reset()

> diff --git a/drivers/net/usb/ax88179_lib.c b/drivers/net/usb/ax88179_lib.c
> index a314db4c97666..b4b00c8b4b623 100644
> --- a/drivers/net/usb/ax88179_lib.c
> +++ b/drivers/net/usb/ax88179_lib.c
[ ... ]
> @@ -351,9 +356,10 @@ void ax88179_set_multicast(struct net_device *net)
>  					AX_MCAST_FLTSIZE, AX_MCAST_FLTSIZE,
>  					m_filter);
> =20
> -		data->rxctl |=3D AX_RX_CTL_AM;
> +		rxctl |=3D AX_RX_CTL_AM;
>  	}
> =20
> +	WRITE_ONCE(data->rxctl, rxctl);
>  	ax88179_write_cmd_async(dev, AX_ACCESS_MAC, AX_RX_CTL,
>  				2, 2, &data->rxctl);
>  }

[Severity: High]
Is it possible for this asynchronous USB write to race with the synchronous
hardware update in ax88179a_mac_link_up()?

Since ndo_set_rx_mode (which calls ax88179_set_multicast) holds
netif_addr_lock_bh() while the phylink state machine runs in a workqueue
without this lock, these two functions can execute concurrently.

This asynchronous write is queued without holding medium_status_mutex.

Meanwhile, ax88179a_mac_link_up() reads data->rxctl, acquires
medium_status_mutex, and executes a synchronous USB write:

    ax88179_write_u16(dev, AX_ACCESS_MAC, AX_RX_CTL, 2,
                      READ_ONCE(ax179_data->rxctl));
    mutex_unlock(&ax179_data->medium_status_mutex);

If ax88179a_mac_link_up() reads data->rxctl before it is updated here, but
its synchronous USB URB is submitted after this asynchronous URB, will the
USB controller write the new value then immediately overwrite it with the
old value?

Could this leave the hardware state out of sync with the software shadow
state, causing the device to silently drop multicast or promiscuous
configuration?

> diff --git a/drivers/net/usb/ax88179a_devices.c b/drivers/net/usb/ax88179=
a_devices.c
> index 4207d2cc2b865..a6b0a3f47118c 100644
> --- a/drivers/net/usb/ax88179a_devices.c
> +++ b/drivers/net/usb/ax88179a_devices.c
> @@ -678,6 +678,7 @@ static const struct net_device_ops ax88179a_netdev_op=
s =3D {
>  	.ndo_set_mac_address	=3D ax88179_set_mac_addr,
>  	.ndo_validate_addr	=3D eth_validate_addr,
>  	.ndo_eth_ioctl		=3D ax88179a_mii_ioctl,
> +	.ndo_set_rx_mode	=3D ax88179_set_multicast,
>  	.ndo_set_features	=3D ax88179a_set_features,
>  	.ndo_vlan_rx_add_vid	=3D ax88179a_vlan_rx_add_vid,
>  	.ndo_vlan_rx_kill_vid	=3D ax88179a_vlan_rx_kill_vid,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010-ax88179a-v=
19-0-7475173cfb56@birger-koblitz.de?part=3D8
