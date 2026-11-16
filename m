Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794858400;
	b=EjK+nJ9eBOIqyjyAINuq9KnwukwZXQthATawS5NkseSoxFEfviBUOZlD6iSBsU6vfCbl
	 ZUqlClsXIvMRiJYipsURiLwRdrzGcAYBbWZ5gY7rUis2KjVjvSNqI0pYYTill2H7k2pRY
	 3aElc6ddXpV9xoqU9ShdRPNFHz+MNg/DVdrV7ZWOqBhxieGZiK0aBc1yC9ppRsQDIdJuW
	 EC4LhEtwggDlUQ7dgkugml9O3xweFjoQPuP4RRvsVqBFa7JSFT0sO+zGCCyMicuot7ffG
	 rhrcHx6Mp0Ch9CFv8Nf7krRnBceEKpvu3zUViA138u4HzshEXwQnSI/pMBa5J9cC67g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794858400;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=zb7mq2xJX/ZYamu2+qvxUVDUmQJx1K1iDO1eKvq5Y9U=;
	b=hmTPPryo9h83gm4h15O27XUkiza8ZjqO209iiCoGvarNagHxR2bZKea8/kxKCLMd4ER4
	 3SeIimKv4j0LclWTaGLIR+Q34kHQaRaU4in3LobL2HchD6XFbURU66jGSXXa/z5TBkt2c
	 FnH5mHbd/Lh56K+qc48fv1Gh3IwUIieH1d1qNCmmP6BfLpCSi7Hd+TQdC1CVzqoFeaOyT
	 8NVuevCYrSAfvfzfnLSgUrd3oCLs3L7uGW0pep0TlP+98FF2pDCKHKrcrY6Ckn28ZaHIB
	 Z0pVcMvZBiGxObHLR/8dIprr3I6dRjf1bTLZYI/yUUGcuTK0fxTh2G5EPpGUaD2lrnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hSZhd9Wb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320B7606A32A;
	Mon, 16 Nov 2026 19:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hSZhd9Wb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52BBB1F000C4;
	Mon, 16 Nov 2026 19:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794858400;
	bh=zb7mq2xJX/ZYamu2+qvxUVDUmQJx1K1iDO1eKvq5Y9U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hSZhd9Wbync0B6ksFunj6j0IBCt5dTJ6dBwolUGl3Jm7448D2ahQFgb067KA8VUVA
	 409lPICzD8atswI1/7uXgP8t7ek3IgOuETOsid0DUjK4j0R0CxHIAO0r2eDEBXA+le
	 XsZTk2XCqvgk1wV41LBduWvOCUnHGwfrjELap4q3LmEXap60arWrjxDkGc/R6CWbSL
	 I7LlJKNwntzHqPU+RYQ5lBQrgZeOVEgNs9bl+lZCOFrqEObw1IZFD/VjcBOsj3fX5K
	 kNQgjEtgnsF2c5T7VxMoQopPSwgR9wjdAyw0MlV6b6ejmPk6hZ1i8O6eojBc+4QvTn
	 p8/z3AKxvXWhw==
Message-ID: <sashiko-outbox-217601@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/6] usb: gadget: udc: crg: Add ring and transfer
 management
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petar Stepanovic" <pstepanovic@axiado.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116-axiado-ax3000-usb-device-controller-v5-3-49271ed5c793@axiado.com>
References: <20261116-axiado-ax3000-usb-device-controller-v5-0-49271ed5c793@axiado.com>
 <20261116-axiado-ax3000-usb-device-controller-v5-3-49271ed5c793@axiado.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 19:46:37 +0000
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
- [Medium] usb: gadget: udc: crg: missing session check in
  crg_udc_queue_pending_trbs()
--

commit 4959c938e3393a398d380564ec6cf72791b96459
Author: Petar Stepanovic <pstepanovic@axiado.com>

usb: gadget: udc: crg: Add ring and transfer management

This patch adds event ring initialization, event processing, and transfer
ring TRB management for the Axiado AX3000/AX3005 UDC driver.

> diff --git a/drivers/usb/gadget/udc/crg/crg-udc-ring.c b/drivers/usb/gadg=
et/udc/crg/crg-udc-ring.c
> new file mode 100644
> index 0000000000000..348d2b611a332
> --- /dev/null
> +++ b/drivers/usb/gadget/udc/crg/crg-udc-ring.c
[ ... ]
> +int crg_udc_queue_pending_trbs(struct crg_udc_ep *udc_ep_ptr)
> +{
> +	struct crg_udc_request *req;
> +	struct crg_gadget_dev *crg_udc =3D udc_ep_ptr->crg_udc;
> +	u32 generation =3D crg_udc->udc_event[0].generation;
> +	u32 ep_generation =3D udc_ep_ptr->generation;
> +	int ret;
> +
> +restart:
> +	/* A giveback can reset/disable the endpoint while udc_lock is dropped.=
 */
> +	if (crg_udc->resetting || crg_udc->port_reset_pending ||
> +	    crg_udc->endpoint_recovery_pending ||
> +	    !udc_ep_ptr->desc || udc_ep_ptr->halt_failed || udc_ep_ptr->nuking =
||
> +	    udc_ep_ptr->ep_state !=3D EP_STATE_RUNNING)
> +		return 0;
> +
> +	list_for_each_entry(req, &udc_ep_ptr->queue, queue) {
> +		if (req->all_trbs_queued)
> +			continue;
> +
> +		/* A large request must finish its current TD before the next
> +		 * TD (or the next USB request) can be submitted: the event
> +		 * handler uses all_trbs_queued to complete the USB request.
> +		 */
> +		if (req->td_pending)
> +			return 0;
> +
> +		ret =3D crg_udc_build_td(udc_ep_ptr, req);
> +		if (ret =3D=3D -ENOSPC || ret =3D=3D -EBUSY)
> +			return ret;
> +		if (ret) {
> +			dev_err(crg_udc->dev,
> +				"failed to build pending transfer: %d\n", ret);
> +			/* Giveback removes req and drops udc_lock: callbacks can
> +			 * remove or free every saved request-list iterator.
> +			 */
> +			crg_udc_req_done(udc_ep_ptr, req, ret);
> +			if (generation !=3D crg_udc->udc_event[0].generation ||
> +			    ep_generation !=3D udc_ep_ptr->generation)
> +				return 0;
> +			goto restart;
> +		}

[Severity: Medium]
Can crg_udc_queue_pending_trbs() publish TRBs and ring the doorbell after a
concurrent suspend or teardown has stopped the controller?

When crg_udc_req_done() drops udc_lock (either inside this loop or in a
caller right before invoking crg_udc_queue_pending_trbs()), another context
can stop the session before controller reset runs:

CPU0                                  CPU1
crg_udc_handle_xfer_event()
  crg_udc_req_done()
    spin_unlock(&crg_udc->udc_lock)
                                      crg_udc_suspend()
                                        crg_udc->suspended =3D true;
                                        crg_udc_set_pullup(..., false)
                                          /* clears CRG_U3DC_CTRL_RUN */
                                        spin_unlock(&crg_udc->udc_lock)
                                        synchronize_irq()
    spin_lock(&crg_udc->udc_lock)
  crg_udc_queue_pending_trbs()
    crg_udc_build_td()                <-- publishes TRBs and rings doorbell

During this window, crg_udc->resetting is still false, generations have not
changed, and data endpoints remain in EP_STATE_RUNNING, so the check at
restart passes even though crg_udc_session_ready(crg_udc) is false.

Checking !crg_udc_session_ready(crg_udc) at restart would prevent queueing
TRBs once the session is no longer ready.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-axiado-ax3=
000-usb-device-controller-v5-0-49271ed5c793@axiado.com?part=3D3
