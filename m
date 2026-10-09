Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91C84570CD
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 06:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791528092; cv=none; b=XH5lqeugaMOq1H5RCLXuDOg6KnTVy136Oec/3sFWPlQ1QyZHb+oI1RXmjYRwS2zqMPMe/JUk1fCHzXjA+pqmwOFgqtkLSkTaAdCoOPbFURsd3WRO3ZDcqfdypXqS3l7gDfTbzRjkS2/hPrEFH/NiWFNxeG3PUabygGwlWBl+75Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791528092; c=relaxed/simple;
	bh=mhamxOoXmHgMw0jSubpKQaxojkw4rguQ84ffb1TcIQ4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=RNgllIh+SyT3pDVwJ365rvxRrBK2dZrVRxnu0w4Wmm55WuHZsxDM3v3nWA6gUonH4pYC+52AUplOIoPSadeeADL0dUfp4ebFLKe99AVbl4bfelHu2No89qQx4H3ZPjh38trSwfbo2D26BUnVdbVaigr4brJa0Kr7jFgM8ow8ppQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fWrBCy6q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fWrBCy6q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48E351F000FF;
	Fri,  9 Oct 2026 06:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791528090;
	bh=bRaFojak+oKcHOOUiQ9jQdz1rRXuQ/+WQ0B1EZxCeIw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fWrBCy6q/aJpxW9X5qLhiCq4Ck5bHw9Rdc0Xldp1XtUPT1cM5i0ttDEg12mT8xg74
	 3+usl6qWi/kE7D+7vIrlvdGCm4g1zn/lT3cgkd7nqPmk+xdV6RbZsr7JAdUJq+TMo5
	 n8Tmso2B1/qUIiy+fd8QKE7qxld+dgx5aP11kHpdZjY8M+H8Jn0nnHCmzyMNGAWya2
	 xukUL0gf3Ok1mkxpAQ2wFElbQuX1igaL+F+e48j5dRyg42lR0hKPa5U9DIa+IxRroI
	 yT4/h54ngcGH0jxtDl6+8eRwpTll1qlywvQ9MncMpWzUvI7NYtnxF5m3YoaFAVt7V7
	 sUsWLuGq8irJQ==
Message-ID: <sashiko-outbox-164956@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] usb: cdns3: cdnsp: Enable eUSB2v2 1KB bulk
 packet capability
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pawel Laszczak" <pawell@cadence.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261009-eusb2v2-packet-size-v4-3-a505ee17b460@cadence.com>
References: <20261009-eusb2v2-packet-size-v4-0-a505ee17b460@cadence.com>
 <20261009-eusb2v2-packet-size-v4-3-a505ee17b460@cadence.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 06:41:29 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] usb: cdns3: TRB logic uses incorrect 512-byte maxp for 1024-byte e=
USB2v2 endpoints
- [High] usb: cdns3: Missing hardware capability check for eUSB2v2 MPS upda=
te
--

commit 5efa1eec93f4abee65d86f70cca3c1177b04dfda
Author: Pawel Laszczak <pawell@cadence.com>

usb: cdns3: cdnsp: Enable eUSB2v2 1KB bulk packet capability

This commit implements peripheral-side changes in the Cadence (cdnsp) driver
to support eUSB2v2 1024-byte Bulk MaxPacketSize. It checks for eUSB2v2
capability in the HCCPARAMS2 register, delegates bulk max packet update
requests to the composite layer, and dynamically configures the hardware
endpoint for a 1024-byte packet size when the feature is active.

> diff --git a/drivers/usb/cdns3/cdnsp-ep0.c b/drivers/usb/cdns3/cdnsp-ep0.c
> index 5cd9b898ce971..090d20b307ee2 100644
> --- a/drivers/usb/cdns3/cdnsp-ep0.c
> +++ b/drivers/usb/cdns3/cdnsp-ep0.c
> @@ -253,6 +253,8 @@ static int cdnsp_ep0_handle_feature_device(struct cdn=
sp_device *pdev,
>  		 */
>  		cdnsp_enter_test_mode(pdev);
>  		break;
> +	case USB_DEVICE_BULK_MAX_PACKET_UPDATE:
> +		return cdnsp_ep0_delegate_req(pdev, ctrl);

[Severity: High]
Does this code need to verify that the controller is actually eUSB2v2 capab=
le
(pdev->gadget.is_eusb2v2) before delegating the request?

The composite gadget framework unconditionally sets gadget->eusb2v2_mps_act=
ive =3D 1
when it receives USB_DEVICE_BULK_MAX_PACKET_UPDATE without checking
gadget->is_eusb2v2:

drivers/usb/gadget/composite.c:composite_setup() {
    ...
        case USB_DEVICE_BULK_MAX_PACKET_UPDATE:
            if (ctrl->bRequestType !=3D (USB_DIR_OUT | USB_RECIP_DEVICE))
                goto unknown;
            if (ctrl->bRequest !=3D USB_REQ_SET_FEATURE)
                goto unknown;
            gadget->eusb2v2_mps_active =3D 1;
    ...
}

If a malicious or improperly configured USB host sends this request to a
non-eUSB2v2 capable device, this delegation allows the flag to be set, lead=
ing
to cdnsp_endpoint_init() configuring a 1024-byte maximum packet size on
unsupported hardware.

>  	default:
>  		return -EINVAL;
>  	}

[ ... ]

> diff --git a/drivers/usb/cdns3/cdnsp-mem.c b/drivers/usb/cdns3/cdnsp-mem.c
> index 419309c8439e3..a499887ed5618 100644
> --- a/drivers/usb/cdns3/cdnsp-mem.c
> +++ b/drivers/usb/cdns3/cdnsp-mem.c
> @@ -976,8 +976,13 @@ int cdnsp_endpoint_init(struct cdnsp_device *pdev,
>  	if (!usb_endpoint_xfer_isoc(pep->endpoint.desc))
>  		err_count =3D 3;
>  	if (usb_endpoint_xfer_bulk(pep->endpoint.desc) &&
> -	    pdev->gadget.speed =3D=3D USB_SPEED_HIGH)
> -		max_packet =3D 512;
> +	    pdev->gadget.speed =3D=3D USB_SPEED_HIGH) {
> +		if (pdev->gadget.eusb2v2_mps_active)
> +			max_packet =3D 1024;

[Severity: High]
Does the TRB generation logic in drivers/usb/cdns3/cdnsp-ring.c need to be
updated to handle the 1024-byte max packet size?

While the hardware endpoint context is correctly programmed to 1024 bytes h=
ere,
functions in cdnsp-ring.c still rely on usb_endpoint_maxp(ep->desc), which
evaluates to 512 bytes.

For example, calculating ZLP boundaries:

drivers/usb/cdns3/cdnsp-ring.c:cdnsp_queue_bulk_tx() {
    ...
    if (preq->request.zero && preq->request.length &&
        IS_ALIGNED(full_len, usb_endpoint_maxp(pep->endpoint.desc))) {
        need_zero_pkt =3D true;
        num_trbs++;
    }
    ...
}

Calculating bounce buffer alignment:

drivers/usb/cdns3/cdnsp-ring.c:cdnsp_align_td() {
    ...
    max_pkt =3D usb_endpoint_maxp(preq->pep->endpoint.desc);
    unalign =3D (enqd_len + *trb_buff_len) % max_pkt;
    ...
}

Calculating TRB TD size:

drivers/usb/cdns3/cdnsp-ring.c:cdnsp_td_remainder() {
    ...
    maxp =3D usb_endpoint_maxp(preq->pep->endpoint.desc);
    total_packet_count =3D DIV_ROUND_UP(td_total_len, maxp);
    ...
}

This causes the driver to incorrectly calculate ZLP boundaries on 512-byte
boundaries instead of 1024, fragment TRBs into 512-byte bounce buffers, and
provide wrong TRB_TD_SIZE metrics to the hardware scheduler.

> +		else
> +			max_packet =3D 512;
> +	}
> +
>  	/* Controller spec indicates that ctrl ep avg TRB Length should be 8. */
>  	if (usb_endpoint_xfer_control(pep->endpoint.desc))
>  		avg_trb_len =3D 8;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009-eusb2v2-pa=
cket-size-v4-0-a505ee17b460@cadence.com?part=3D3
