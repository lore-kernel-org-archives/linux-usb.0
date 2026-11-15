Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794735115;
	b=Htt9vGrPcXODdCYztoOhAEXvJJEqV4pWNbSczbxMOizv64Cp2GnEr0hBr0o9MxvHQgwE
	 2P0fyg3+DbkATxZqYjru6S5aPL+gEAIg/lNKngkZHeEkPLC1nDte20YNyq+zDeCEX2+uu
	 sG9kvdOT/R/uboml/xN0WKi0moJkMCvfJTXI6VCCFEl+CgLsFd86eZk/AMXzeB5sVKtGn
	 DIzf8wGQPKUduHEt3CC/9rtZVU9KWEQx3CBNymWYohbhTXaxFaMu7/esBOdkxdkcyZ2nS
	 p9imaXBr0VWbb4Peadfe3DBQH/xfxtLtb8rSts08aq2UEgg6TpwfHBG+0E0NNY+uDbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794735115;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=sGPnELDC28O1ikM1dqyhbHp/uZz8LGTusx0+7Cq6nnw=;
	b=gyA8ZXWHkAJshdQ9/ajwVheFtSq+zjtsDncluLtlsxlhVcy0EnmDpNFlJvTb4fb472mB
	 rvJQKPUkHpZVBcfWx14aNGLy5QWV4xulBYnXzRDvQwx/GMvTj6lxLUa36tD3sJFjrZpQf
	 VO/v0sdmnWKaY+kl3hy9BBt8iMaF5pKnWXmX3atvN8WUYgjsjkksxrupQJCqb2gnArVNq
	 5ZU3IUcpS0tU001YmLhyLV4UWDHO/zxoHLXrwAfwW5rdosBGcUWtxDftbct6LJOGeLtCb
	 Bcf+oJSDK7B/49RRlBP4w8F5PqlK0T1adUjNDxhN6AqfFoXVDzgMq7GDOVscfnZFVCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KQEUAw97;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E23606A327
	for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 09:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KQEUAw97
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BA831F000C4;
	Sun, 15 Nov 2026 09:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794735114;
	bh=sGPnELDC28O1ikM1dqyhbHp/uZz8LGTusx0+7Cq6nnw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KQEUAw97CCewZYXlHW+LiVYOsiMgzrN6LCRtKiwxCDf+ulq2Pr0QKdngBbJpSeq/t
	 J0gJVPjVnbUf5iV39GZ3n7kKBN/VncjnHy0dxfSCGBgxwaO5hYtCCGe+0BACufVq/Y
	 8haRP1RhiyeNDdgkbZTn9MfD9ou/jI/UOY9o8TaDZOboTXLu4097tmi2fseA7SXkN3
	 cNI11+Fgrt1GTR+bcp4pGmXk+nVvXrPrZGYNI+G4TyF4anzQTlnh+GQ3wFkBgRqc74
	 UyXg5tEMmGMHlM1iDMYf+qDX4JHMzK2D+LGYXuHUr8s86WXxoWgfOS0V4Jw0uixYg8
	 yBy7P20OImIIA==
Message-ID: <sashiko-outbox-215366@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] net: hso: fix tx skb leak when the device stops
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aibing Chen" <chenaibing@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261114093133.465-1-chenaibing@cmss.chinamobile.com>
References: <20261114093133.465-1-chenaibing@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 09:31:54 +0000
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
- [High] net: hso: race on skb_tx_buf between hso_net_close() and
  hso_resume()
- [Low] net: hso: missing Fixes trailer in commit message
--

commit 759e4b053ce61e8448ad5b49402e8bd576be78fd
Author: Aibing Chen <chenaibing@cmss.chinamobile.com>

> net: hso: fix tx skb leak when the device stops
>=20
> hso_net_start_xmit() stashes the skb in odev->skb_tx_buf and stops the
> queue when hso_get_activity() reports -EAGAIN, which happens when the
> USB device is suspended or no longer configured.  If the interface is
> then brought down, or the device is disconnected, that skb is simply
> left behind: hso_net_close() and hso_free_net_device() never release
> it, and hso_net_open() clears the pointer, so the skb and its data
> buffer are leaked.
>=20
> Free the pending skb in hso_net_close(), which is also reached from
> unregister_netdev() on disconnect.
>=20
> hso_resume() loses a frame in the same way when the device is still not
> ready: it passes skb_tx_buf to hso_net_start_xmit() and then clears the
> pointer unconditionally, so a frame stashed again by that call is never
> freed.  Clear the pointer before the call instead and let
> hso_net_start_xmit() stash it again if it has to.
>=20
> Reported-by: syzbot+bf62ca9997f43d2fa521@syzkaller.appspotmail.com
> Link: https://lore.kernel.org/all/6af74e31.fe96acdb.12252b.0009.GAE@googl=
e.com/
> Signed-off-by: Aibing Chen <chenaibing@cmss.chinamobile.com>

[Severity: Low]
Should this commit include Fixes tags for the two commits that introduced
these skb_tx_buf leaks?

  Fixes: 72dc1c096c70 ("HSO: add option hso driver")
  Fixes: c213f286f2cf ("[netdrvr] hso: dev_kfree_skb crash fix")

> diff --git a/drivers/net/usb/hso.c b/drivers/net/usb/hso.c
> index 71caa3764b239..03956fa8ee537 100644
> --- a/drivers/net/usb/hso.c
> +++ b/drivers/net/usb/hso.c
> @@ -728,6 +728,13 @@ static int hso_net_close(struct net_device *net)
> =20
>  	hso_stop_net_device(odev->parent);
> =20
> +	/*
> +	 * A frame stashed by hso_net_start_xmit() will never be transmitted no=
w,
> +	 * so drop it instead of leaking it.
> +	 */
> +	dev_kfree_skb(odev->skb_tx_buf);
> +	odev->skb_tx_buf =3D NULL;
> +
>  	/* done */
>  	return 0;
>  }
> @@ -3055,12 +3062,13 @@ static int hso_resume(struct usb_interface *iface)
>  				/* First transmit any lingering data,
>  				   then restart the device. */
>  				if (hso_net->skb_tx_buf) {
> +					struct sk_buff *skb =3D hso_net->skb_tx_buf;
> +
>  					dev_dbg(&iface->dev,
>  						"Transmitting"
>  						" lingering data\n");
> -					hso_net_start_xmit(hso_net->skb_tx_buf,
> -							   hso_net->net);
>  					hso_net->skb_tx_buf =3D NULL;
> +					hso_net_start_xmit(skb, hso_net->net);
>  				}
>  				result =3D hso_start_net_device(network_table[i]);
>  				if (result)

[Severity: High]
Can hso_net_close() and hso_resume() race on skb_tx_buf and cause a
use-after-free and double free?

When hso_net_start_xmit() stashes a frame while the USB device is
suspended, hso_get_activity() schedules async_get_intf to resume the
interface.  hso_net_close() runs under rtnl_lock without holding the USB
device lock, cancelling async_get_intf, or synchronizing with hso_resume():

CPU0                              CPU1
hso_resume()                      hso_net_close()
  if (hso_net->flags & IFF_UP)
    skb =3D hso_net->skb_tx_buf;
                                    clear_bit(HSO_NET_RUNNING, &odev->flags=
);
                                    hso_stop_net_device(odev->parent);
                                    dev_kfree_skb(odev->skb_tx_buf);
                                    odev->skb_tx_buf =3D NULL;
    hso_net->skb_tx_buf =3D NULL;
    hso_net_start_xmit(skb, ...)
      memcpy(..., skb->data, ...) <-- use-after-free
      dev_kfree_skb(skb)          <-- double free

If CPU0 clears hso_net->skb_tx_buf just before CPU1 calls dev_kfree_skb(),
CPU1 frees NULL and finishes closing the device, after which CPU0 calls
hso_net_start_xmit() and hso_start_net_device() on the stopped device,
either submitting URBs after close or re-stashing and leaking skb in
skb_tx_buf.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114093133.465-=
1-chenaibing@cmss.chinamobile.com?part=3D1
