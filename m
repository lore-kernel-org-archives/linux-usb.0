Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793376157;
	b=4maK3n9/yQnVI622j2z3LZd/X/U7AJuLCTbucdZ4Sh+CZycCFPc7YjKO+YFx/X2cNGXb
	 icC/1d/wVp7cGASQp/BSd/NEQANBAzUobSSDNnBMXrIQbdpjRWB2RALqTHS+jkmVMUmsK
	 6SS1s1xFd0tlmE/6EAOt4Wh7XVdNJoJay4FbQpeyGtHF4Nqzjhhx0qXvjISZbXQlN4Plq
	 5Ox7AAsOwq0/Eu+JDSKs+BDIKJVJrStoHZCrmSdEMRJesJAx2ObXue7eypEZSY7frA906
	 w+gwFWMkgC9cZvFo3kqnIKz55uQmzF0FQjvWOTtIPUhEb57kItHaFk28fq7DSZjIC+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793376157;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=QZTdcyqeOpt0DCyqMQPWdeYMCXL2nR3OrjonML1Fzuk=;
	b=L1LU+yQKVJv+K573tT0HvceSmrjU9eLjspqQqyqhrD4xSGx5e/ZDNk6ippfIWGzvO2m8
	 X6YD6C9b415Nn0sJQtx6e/6hlsUuOeujOSIq00wwdnXXrtnBGmIoa7ZqvuC1w5kgJArEV
	 FKAuseIse1dz1+LTWKVPbYd9XYjKcmC/ngfDJfpvLyQRGyjNP/dbE0JEtnSCS1NJYqtze
	 ovBAsa2nPE1rvj8bl0gFF7wSq+4E1A0se1G3OOGUAYgyEHaB718BAk+W39gHUbXvEIbDP
	 u18mJjQTSRH/VrdurONPYwnW7LMiunf/RsvbGztzR4BDL/WwupcxERJOk0Fuq+ydMdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Fe/jcA0T";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6AE606A31C
	for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 16:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fe/jcA0T
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C772D1F0093A;
	Fri, 30 Oct 2026 16:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793376157;
	bh=QZTdcyqeOpt0DCyqMQPWdeYMCXL2nR3OrjonML1Fzuk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Fe/jcA0TJnGxLDfi5OO90O2/H4Sk1UaPFbgLCNPMHAL2shdCdRczJagctrlsEsuuM
	 AUqh7re9LpeXs+eWNynBleQrKHshXyNCbnRrfA+xH7fFmzkweZxiawS3yiP1cuzYKA
	 IgeSbFBZcz4S2ZsgZKkv51wRIs96k9kObiWjzF2Qn9qSt1AY61h6gXA0cpSbQJ61ZH
	 dxB7chqtlEhsMShXCcPCazJmnbSneb6VgHw+za9+CPSQSrVQdxcDCIKpz6t5UJyD6Y
	 axBwauBbHSSeoDbF3L1ci3xvaP8uOShoQCj9P8wOqUPN9/+mvDLgliegeye+qy/FS4
	 y+E8sNLVDPt8Q==
Message-ID: <sashiko-outbox-191206@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net] net: usb: lan78xx: only stop phylink if the
 interface is running
Reply-To: sashiko-reviews@lists.linux.dev
To: "YuanZhe Liu" <25031212351@stu.xidian.edu.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261029160204.2567-1-25031212351@stu.xidian.edu.cn>
References: <20261029160204.2567-1-25031212351@stu.xidian.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 16:02:36 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] net: usb: lan78xx: premature phylink teardown in lan78xx_disconn=
ect()
--

commit eb1582b80d2c934b47efc3b66502d9e9f347ba7e
Author: YuanZhe Liu <25031212351@stu.xidian.edu.cn>

net: usb: lan78xx: only stop phylink if the interface is running

This commit updates lan78xx_disconnect() to only call phylink_stop() when
netif_running() is true, avoiding a warning in phy_stop() when a USB device=
 is
unplugged while the network interface is down.

> diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
> index 181e8c087655c..6dc622a6ae783 100644
> --- a/drivers/net/usb/lan78xx.c
> +++ b/drivers/net/usb/lan78xx.c
> @@ -4594,7 +4594,8 @@ static void lan78xx_disconnect(struct usb_interface=
 *intf)
>  	net =3D dev->net;
> =20
>  	rtnl_lock();
> -	phylink_stop(dev->phylink);
> +	if (netif_running(net))
> +		phylink_stop(dev->phylink);
>  	phylink_disconnect_phy(dev->phylink);
>  	rtnl_unlock();

[Severity: Medium]
Does calling phylink_stop() and phylink_disconnect_phy() before
unregister_netdev(net) in drivers/net/usb/lan78xx.c:lan78xx_disconnect() ca=
use
out-of-order teardown, a duplicate phylink_stop() call, and a race window w=
hen
rtnl_lock() is dropped?

In drivers/net/usb/lan78xx.c:lan78xx_disconnect():

	rtnl_lock();
	if (netif_running(net))
		phylink_stop(dev->phylink);
	phylink_disconnect_phy(dev->phylink);
	rtnl_unlock();

	unregister_netdev(net);

When netif_running(net) is true, calling phylink_stop(dev->phylink) here ru=
ns
lan78xx_mac_link_down() without holding dev->dev_mutex and while dev->napi,
TX/RX URBs, and dev->urb_intr are still active.

Because phylink_stop() does not clear __LINK_STATE_START, the subsequent
unregister_netdev(net) call sees that the interface is still running and
invokes ndo_stop -> lan78xx_stop():

drivers/net/usb/lan78xx.c:lan78xx_stop() {
	...
	mutex_lock(&dev->dev_mutex);
	...
	clear_bit(EVENT_DEV_OPEN, &dev->flags);
	napi_disable(&dev->napi);

	lan78xx_terminate_urbs(dev);
	...
	phylink_stop(dev->phylink);

	usb_kill_urb(dev->urb_intr);
	...
}

This executes phylink_stop(dev->phylink) a second time after
phylink_disconnect_phy(dev->phylink) has already detached the PHY.

In addition, releasing rtnl_unlock() before unregister_netdev(net) leaves n=
et
registered while dev->phylink has already disconnected its PHY and freed the
PHY IRQ. In that window, a concurrent dev_open() -> lan78xx_open() can call
phylink_start(dev->phylink) on the disconnected phylink instance:

drivers/net/usb/lan78xx.c:lan78xx_open() {
	...
	phylink_start(dev->phylink);
	...
}

Similarly, dev->urb_intr remains active until lan78xx_stop() or later in
lan78xx_disconnect(), so an interrupt URB completion can still invoke
generic_handle_irq_safe(dev->domain_data.phyirq) after phy_disconnect() has
freed the IRQ.

Should lan78xx_disconnect() instead call unregister_netdev(net) first (which
automatically invokes lan78xx_stop() -> phylink_stop(dev->phylink) under
rtnl_lock() and dev->dev_mutex when the interface is running), and then call
phylink_disconnect_phy(dev->phylink) under rtnl_lock() afterwards?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029160204.2567=
-1-25031212351@stu.xidian.edu.cn?part=3D1
