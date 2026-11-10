Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794279732;
	b=LxeKEDukC7C0meLrVMH8Idu26xsLJpykfvJ+mV8B9eXHD6sQ/00Ul/T9QEyeDDlbTqF8
	 wCUO8Qha2H1ureEYgF2zlXz7+xyZ0UOLsV/xbGVgLjVf2uMQZTvuyDIUeS9Cmg1d8lo5N
	 4kOTl/wjdZFpV9WABEdyWADsh3Fh8wQkXwLK+5463E3ps5jBeJqbm5eawNn6nm9fVKjf4
	 j1kggFzr51fQitd5pgd7yICEEa0GpV3iTNQUKbiaTs+UfR4aOQePWC6IIopKkQhuT4q4l
	 +a6T+yv1GLBlzLizlTLIamOfe5JlZr3oqwsfIfRLLXh3AgiHJCOL4TDfJzR4PNnwg4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794279732;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Bv9G+YW+0soDpx6wR2KUphiQIlxmVMHlDFQJD1A3CjA=;
	b=HboB8QAR66e0QzJ2mW4wxZ9dvVExXJGx9/L50oKjaGmFRZLCr6MeN6LMxC8UJh8U/Bzj
	 rTa36mzSeM5H9XaVOlaleI4YDrbkJNTCQ8SOXBT9cvPAcoED+bPPjmlZhAfK7aNTC8BN0
	 C0dLI1WRtetpCvDx6oQY0pNd47Qt9d2oKNSiaHVupdrGPNyF4hpKTVmMd6xtVxqTJ3iso
	 vnheptZ8FaaA/V9Ajt43xwbI/TBSRbl9XRD4oSuu1lkWeqSH9F+0C/BlcADN3cA5Oaysl
	 Y87v+6b6aBBCA1ZBgPlP707DvG7X4jaJcwHRnvq0Vp6v7AVsMLsrYpIrcv16Wux5+Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EC1o3nNR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63DD606A31C
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 03:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EC1o3nNR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B4CF1F0089F;
	Tue, 10 Nov 2026 03:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794279731;
	bh=Bv9G+YW+0soDpx6wR2KUphiQIlxmVMHlDFQJD1A3CjA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EC1o3nNRdTsGKyJfd84mCkCQCOZsTuhzOWE80CYIHaPDfSJGqaFTTfzZD3PZLZRiU
	 6P1Ym2hJt7TGOrabDBNvUvy9Uvy4z6h8V5a+46JPf8/tSb6FM+t/soCI5GWALoAu+6
	 2t+lr4CTPUUn3hX2NQTaskZXoh6tkhZ3rUGNx51F6KF7NeJVtEumq0mrq3SB1smgpU
	 hKiKAl6eCx5B0qJG+KiqsHdLjzet4Sk8TcaFkcgGkRS6TD6RDap8n13gvc2URZJtPC
	 UIHcexzzBj6ItYn/lPRQ8oHrLDHQFLMcscZPKGrA/jHwGp9zgCTsSx2czhUwYKwbFc
	 RDSNVDy0KYBpw==
Message-ID: <sashiko-outbox-206089@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/4] usb: gadget: gadgetfs: fix ep0 setup abort and
 unbind state races
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jing Lin" <kayano050408@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110-gadgetfs-v7-v7-2-6d05409cc61a@gmail.com>
References: <20261110-gadgetfs-v7-v7-0-6d05409cc61a@gmail.com>
 <20261110-gadgetfs-v7-v7-2-6d05409cc61a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 03:02:10 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] usb: gadget: gadgetfs: stale GADGETFS_SETUP event not aborted
  in gadgetfs_setup()
--

commit 774082278f145f38c9e9ce530cac34febc2f5393
Author: Jing Lin <kayano050408@gmail.com>

usb: gadget: gadgetfs: fix ep0 setup abort and unbind state races

This commit fixes ep0 state machine races when control requests,
disconnects, or unbinds overlap with userspace ep0 read, write, and poll
operations.

> diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legac=
y/inode.c
> index 1e7e8f4bb4916..6514220efc821 100644
> --- a/drivers/usb/gadget/legacy/inode.c
> +++ b/drivers/usb/gadget/legacy/inode.c
[ ... ]
> @@ -1545,6 +1589,21 @@ gadgetfs_setup (struct usb_gadget *gadget, const s=
truct usb_ctrlrequest *ctrl)
>  	u16				w_value =3D le16_to_cpu(ctrl->wValue);
>  	u16				w_length =3D le16_to_cpu(ctrl->wLength);
> =20
> +	spin_lock(&dev->lock);
> +	/* invalidate userspace copies started for an older control request */
> +	dev->setup_generation++;
> +
> +	/*
> +	 * Host may have given up waiting for a response to a previous
> +	 * delegated transfer.  Record the abort and return to the connected
> +	 * state before any early return or in-kernel response handling.
> +	 */
> +	if (dev->state =3D=3D STATE_DEV_SETUP) {
> +		dev->setup_abort =3D 1;
> +		dev->state =3D STATE_DEV_CONNECTED;
> +		ep0_readable(dev);
> +	}

[Severity: Medium]
What happens if a new SETUP packet arrives while a previous delegated
GADGETFS_SETUP event is still unread in dev->event[]?

When gadgetfs_setup() delegates a control request, dev->state stays in
STATE_DEV_CONNECTED until ep0_read() consumes the queued GADGETFS_SETUP
event:

drivers/usb/gadget/legacy/inode.c:gadgetfs_setup() {
    ...
delegate:
			dev->setup_in =3D (ctrl->bRequestType & USB_DIR_IN)
						? 1 : 0;
			dev->setup_wLength =3D w_length;
    ...
			/* state changes when reader collects event */
			event =3D next_event (dev, GADGETFS_SETUP);
    ...
}

If a second SETUP packet arrives before ep0_read() runs and is handled in
the kernel (such as USB_REQ_GET_DESCRIPTOR) or returns early without
calling next_event(dev, GADGETFS_SETUP), the STATE_DEV_SETUP check above
is skipped, leaving dev->setup_abort =3D 0 and the old GADGETFS_SETUP event
in dev->event[].  If the second request fails in setup_req() or
queue_ep0_req() at the delegate label, it also overwrites dev->setup_in,
dev->setup_wLength, and dev->setup_can_stall before aborting.

When userspace later reads the stale GADGETFS_SETUP event, ep0_read()
transitions dev->state to STATE_DEV_SETUP, and the subsequent ep0_read()
or ep0_write() samples dev->setup_generation after it was already
incremented, so userspace queues a stale ep0 response or stalls the
newer transfer.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-gadgetfs-v=
7-v7-0-6d05409cc61a@gmail.com?part=3D2
