Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795791575;
	b=Jk/GKnjUF6F1lQLVCb5Cs9GL+k6vNC+VEQKbAkKUTSG6IxVKuMzkP5pgfM75snXdcanI
	 xppSiq3ocftwkNovGK9SSSnQk+uUPMR8s/S6DkR3k86yC69pmW5HTU5PG0++mZFkXIn6t
	 3+Rmet0OHOoTI9ytTigaAd4HZ5WHQVBgbRs0LjURJGbKd9eRSRXhPFfnaha0EwRKi2DBW
	 dDXwVSmtDKMBdoIh42G5g5VNT2DKB88qevEbzbPKoX2RpOT2V1ElKT8njxvf4T2CmKoog
	 rTV0XYwgeD+Z2ohRCKbFo6pD3z1+TcPze4Ss0Mc0kntT0QNZEJ6/1MOje83JQUIk8CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791575;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=nX2CPo8CBMweGT7/roWvy3x78jLU7yFDBJzf47c2uX0=;
	b=3rAH1DuKraCgcWuR1XFvjlO2I32W1JXpzRAKkTideIqloEifD/CTmxOrjZ6JkJOYAc8F
	 16wqDWPvkPzzizZImPOQSrSctEQ6LVBWoiQl3MQnePN1OP/PyJpTKRMPusSq460HbAfWt
	 3NekrB0zxHc8H3IoCiGibSGKp4iGdcpGkLKVtIVHYWFC4byGJdo3mdsAFyfdHeY2OEDM5
	 vIb4on6hyNdi8/hEq59Br6iE9P4goI8n5K+cu2ZzMlniMnYsLGBFqKcLt0ENdnfG+iW9J
	 5jBKWTq4oN2oMBetQ6qjDWMohXHe2y3cH3PbvbA1UmR71gTWcNLOyS01GCHtSRhWfeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="aY1N+M/b";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E6F606A31E
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 14:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aY1N+M/b
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1AB01F000C1;
	Fri, 27 Nov 2026 14:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795791574;
	bh=nX2CPo8CBMweGT7/roWvy3x78jLU7yFDBJzf47c2uX0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aY1N+M/b8WA3RZjol+lExU3fHiVJ7GIDcGSq4rvQazZGgNsQ54GAddsGI/cnkPXLy
	 HePryBpp7tWazhYHJlmeYwJq6aznaorl3i0XHu/EeSnL4gX/fUGtho8AOj3RfhO+Ok
	 BsDjIKHlLXjU2MD8gItMs8uOc6Dv+Hculf4QNG5aAW2qNoDDvnJ7unBwYgsNQX6/tW
	 SBBVmhjYo01W+R2PuPQRBtH/hgPZI5CyXb6jzZZpoFVwAaaNfkCcIWH76dKRVvLiWX
	 4AdEUgMZWwqSYaufHj//LqkHh5YIxGnIYPPnzJ0fQqjVvceANVvhP5gwTpt7Tae7ZY
	 9cb5yBzAboCkQ==
Message-ID: <sashiko-outbox-237654@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] usbip: vhci_hcd: time out unanswered unlink requests
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongyu Xie" <xiehongyu1@kylinos.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <179579060266.47199.14552707473292683159@kylinos.cn>
References: <179579060266.47199.14552707473292683159@kylinos.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 14:59:34 +0000
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
- [High] usbip: vhci_hcd: use-after-free of priv in vhci_urb_dequeue()
- [High] usbip: vhci_rx: premature unlink watchdog disarm in
  vhci_recv_ret_submit()
--

commit 4a96b2f220c57ad22b859e73a1c3d66273ce70e1
Author: Hongyu Xie <xiehongyu1@kylinos.cn>

usbip: vhci_hcd: time out unanswered unlink requests

This commit adds per-request deadlines and a per-device watchdog timer for
queued CMD_UNLINK requests in vhci_hcd so unanswered unlinks tear down the
connection instead of hanging callers in usb_kill_urb().

Link: https://lore.kernel.org/all/1d6db53d-07ab-46ad-adc4-d09c95b2c83f@mail=
.kernel.org/

> diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
> index 39e8faf4c18cd..18a0d42ba3904 100644
> --- a/drivers/usb/usbip/vhci_hcd.c
> +++ b/drivers/usb/usbip/vhci_hcd.c

[ ... ]

> @@ -949,6 +1057,15 @@ static int vhci_urb_dequeue(struct usb_hcd *hcd, st=
ruct urb *urb, int status)
>  		struct vhci_unlink *unlink;
> =20
>  		spin_lock(&vdev->priv_lock);
> +		if (!urb->hcpriv) {
> +			/*
> +			 * URB was just picked up by vhci_rx and will be
> +			 * given back shortly; no CMD_UNLINK needed.
> +			 */
> +			spin_unlock(&vdev->priv_lock);
> +			spin_unlock_irqrestore(&vhci->lock, flags);
> +			return 0;
> +		}

[Severity: High]
Can vhci_urb_dequeue() already have dereferenced a freed priv before
reaching this !urb->hcpriv check?

pickup_urb_and_free_priv() runs under vdev->priv_lock without holding
vhci->lock, whereas vhci_urb_dequeue() reads urb->hcpriv and dereferences
priv->vdev under vhci->lock before taking vdev->priv_lock:

CPU0                                  CPU1 (vhci_rx)
vhci_urb_dequeue()
  spin_lock_irqsave(&vhci->lock, ...)
  priv =3D urb->hcpriv;
                                      vhci_recv_ret_submit()
                                        spin_lock_irqsave(&vdev->priv_lock,=
 ...)
                                        pickup_urb_and_free_priv()
                                          list_del(&priv->list);
                                          kfree(priv);
                                          urb->hcpriv =3D NULL;
                                        spin_unlock_irqrestore(&vdev->priv_=
lock, ...)
  vdev =3D priv->vdev;  <-- use-after-free
  if (!vdev->ud.tcp_socket)
    ...
  spin_lock(&vdev->priv_lock);
  if (!urb->hcpriv)

In the !vdev->ud.tcp_socket branch above this block, urb->hcpriv is not
rechecked under vdev->priv_lock at all, so the same race also performs a
second list_del(&priv->list) and kfree(priv).  Deriving vdev from
urb->dev->portnum (as vhci_urb_enqueue() does) and holding vdev->priv_lock
before reading urb->hcpriv would avoid touching a freed priv.

[ ... ]

> diff --git a/drivers/usb/usbip/vhci_rx.c b/drivers/usb/usbip/vhci_rx.c
> index a678e7c898375..c71645499a7b5 100644
> --- a/drivers/usb/usbip/vhci_rx.c
> +++ b/drivers/usb/usbip/vhci_rx.c
> @@ -63,6 +63,8 @@ static void vhci_recv_ret_submit(struct vhci_device *vd=
ev,
> =20
>  	spin_lock_irqsave(&vdev->priv_lock, flags);
>  	urb =3D pickup_urb_and_free_priv(vdev, pdu->base.seqnum);
> +	if (urb)
> +		vhci_complete_unlink_locked(vdev, pdu->base.seqnum);
>  	spin_unlock_irqrestore(&vdev->priv_lock, flags);
> =20
>  	if (!urb) {

[Severity: High]
Does calling vhci_complete_unlink_locked() here disarm vdev->unlink_timer
before the RET_SUBMIT payload has actually been received from the socket?

After releasing vdev->priv_lock, vhci_recv_ret_submit() still calls
usbip_recv_xbuff() and usbip_recv_iso(), which perform blocking
MSG_WAITALL reads on ud->tcp_socket before usb_hcd_giveback_urb() runs:

drivers/usb/usbip/vhci_rx.c:vhci_recv_ret_submit() {
    ...
	/* recv transfer buffer */
	if (usbip_recv_xbuff(ud, urb) < 0) {
		urb->status =3D -EPROTO;
		goto error;
	}

	/* recv iso_packet_descriptor */
	if (usbip_recv_iso(ud, urb) < 0) {
		urb->status =3D -EPROTO;
		goto error;
	}
    ...
}

If the peer stalls after sending the 48-byte RET_SUBMIT header without
sending the transfer buffer or ISO descriptors, vhci_rx blocks forever in
sock_recvmsg().  Because pickup_urb_and_free_priv() has already cleared
urb->hcpriv and vhci_complete_unlink_locked() has already cancelled the
watchdog for any earlier unlink, both pre-existing unlinks and any later
vhci_urb_dequeue() call from usb_kill_urb() are left with no active
watchdog timer, and usb_kill_urb() still hangs indefinitely.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/179579060266.47199.=
14552707473292683159@kylinos.cn?part=3D1
