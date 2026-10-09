Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB49239E17C
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 03:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791517913; cv=none; b=jiHIOf+pPJp3FTcZ3DsAvOxr3JqqlHtIFcUK4JyuDKV0VYxvqA6hMfBctFghgkIwiyGv/X5pmvxGTSdsh/JaGOiMGLhkJJdujn3uxe/lO3N/POLvss1/bvXlKH73F7O91q3FxMDqBe/cMgdf/NorESOIMc2YA9befW9YNm25vB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791517913; c=relaxed/simple;
	bh=sitSXRSZ0M1I7L22MG0x1mJaxW0h5lL82m3HX8D0DoE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=QXgTeRN/m9B3OS3MOhxELK5y2pAn6NrYU5NaFp7E3tMvGsItBLFR5mlZmD2PHefFis8Cv6j3VnjiCA2Uxgo3XyKsqgqV1XerGbwqRmSwJlf3/k5nhx/S6MEajaZhLE3W2+++suW3slZJ93NmCgmY+S5gNLWKnuM0tuWJgWV1Wh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CvBFVI4a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CvBFVI4a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B00ED1F00893;
	Fri,  9 Oct 2026 03:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791517900;
	bh=KMtJR2ull+lSclSUDi3+90YICIqBl+dna0fosqMpxuQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CvBFVI4aNNSYBy1NUEiUx+gibioJN77qBKoL8uLt8o6TgcshPeY2FhkOw1IRKqAKb
	 vcJUvHEu3zlfsLfD8mG31NKRCoD18TRSwF+aHAN0qDS2u5bR5qCizCfEhzIy7Pb4ly
	 qVe5XUd35Xmzr3/SG8T7hfm3ux7zIbm+UkHipFGnCyJ3wqpUZufwpZ2pJVxnyD+lSp
	 emA1J4LMXpFF/GH0jBgOElLIt9UXTYLAhM5qjRpnEi7k6CzPEPoZBCnImyiW6sWR6V
	 2L/+PapiKbN6npKz26J22XQXl1txbOqan34PA4NbBmarWRed+XhvgmWn75YfZNtYPU
	 fwijLVlD/1ddw==
Message-ID: <sashiko-outbox-164792@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v18 03/13] ax88179_178a: Split driver into
 library and device specific code
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261008-ax88179a-v18-3-6fa1d4c40422@birger-koblitz.de>
References: <20261008-ax88179a-v18-0-6fa1d4c40422@birger-koblitz.de>
 <20261008-ax88179a-v18-3-6fa1d4c40422@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 03:51:40 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] net: incomplete locking of AX_MEDIUM_STATUS_MODE using medium_stat=
us_mutex
- [Medium] net: logic error evaluating old MTU value for jumbo frame config
- [Medium] net: ax88179: data race on rxctl between set_multicast and link_=
reset
--

commit c3c28c1c33511966acdb47b60e1d21464314591e
Author: Birger Koblitz <mail@birger-koblitz.de>
Subject: ax88179_178a: Split driver into library and device specific code

This commit splits the ax88179_178a module code into a common library for t=
he
AX88179/178a/179a and 279 controllers, and device-specific code. The module
is renamed to ax88179 to reflect the broader scope.

> diff --git a/drivers/net/usb/ax88179_lib.c b/drivers/net/usb/ax88179_lib.c
> --- /dev/null
> +++ b/drivers/net/usb/ax88179_lib.c

[ ... ]

> +void ax88179_set_multicast(struct net_device *net)
> +{
> +	struct usbnet *dev =3D netdev_priv(net);
> +	struct ax88179_data *data =3D dev->driver_priv;

[ ... ]

> +	if (net->flags & IFF_PROMISC) {
> +		data->rxctl |=3D AX_RX_CTL_PRO;
> +	} else if (net->flags & IFF_ALLMULTI ||

[ ... ]

> +		data->rxctl |=3D AX_RX_CTL_AM;
> +	}
> +
> +	ax88179_write_cmd_async(dev, AX_ACCESS_MAC, AX_RX_CTL,
> +				2, 2, &data->rxctl);
> +}

[Severity: Medium]
Can a data race occur on rxctl between this asynchronous write and the
synchronous write in ax88179_link_reset()?

The ax88179_link_reset() function runs in a workqueue and reads
ax179_data->rxctl to write it synchronously to the hardware. Since
ax88179_set_multicast() runs in softirq context, it can preempt
ax88179_link_reset().

If ax88179_set_multicast() interrupts ax88179_link_reset() after the
latter has read ax179_data->rxctl but before its synchronous USB
control message is submitted:

1. ax88179_set_multicast() updates ax179_data->rxctl and enqueues an
asynchronous write URB.
2. ax88179_link_reset() resumes and submits a synchronous write URB
with the old rxctl value.

The host controller will execute the async URB first and the sync URB
second. Could this revert the hardware to the old multicast configuration
while the driver state retains the new configuration, potentially causing
dropped multicast packets until the configuration is changed again?

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

[Severity: High]
Is this mutex fully protecting the AX_MEDIUM_STATUS_MODE register?

This newly added medium_status_mutex correctly serializes accesses to
the AX_MEDIUM_STATUS_MODE register in ax88179_change_mtu(). However,
other functions like ax88179_link_reset(), ax88179_net_reset(), and
ax88179_stop() perform read-modify-write operations on the exact same
register without acquiring this mutex.

Since ax88179_link_reset() is executed asynchronously from the
usbnet_deferred_kevent workqueue, could it overlap with
ax88179_change_mtu() and cause concurrent lockless modifications
to clobber the MTU or link duplex settings in the hardware?

> +	if (net->mtu > 1500) {

[Severity: Medium]
Does this check the old MTU value instead of the new one?

Because WRITE_ONCE(net->mtu, new_mtu) was moved to the end of
ax88179_change_mtu(), this condition evaluates the old net->mtu value.

If the MTU is being increased from 1500 to 9000, jumbo frames would
be incorrectly left disabled in hardware. Conversely, if it is being
decreased from 9000 to 1500, they would be incorrectly left enabled.

> +		err =3D ax88179_read_cmd(dev, AX_ACCESS_MAC, AX_MEDIUM_STATUS_MODE,
> +				       2, 2, &tmp16);

[ ... ]

> +		tmp16 &=3D ~AX_MEDIUM_JUMBO_EN;
> +		err =3D ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_MEDIUM_STATUS_MODE,
> +					2, 2, &tmp16);
> +		if (err < 0)
> +			goto err_out;
> +	}
> +	WRITE_ONCE(net->mtu, new_mtu);
> +	dev->hard_mtu =3D net->mtu + net->hard_header_len;
> +	mutex_unlock(&data->medium_status_mutex);
> +
> +	/* max qlen depend on hard_mtu and rx_urb_size */
> +	usbnet_update_max_qlen(dev);
> +
> +	return 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-ax88179a-v=
18-0-6fa1d4c40422@birger-koblitz.de?part=3D3
