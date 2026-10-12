Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2980C431A51
	for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2026 08:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791792654; cv=none; b=FcJ+pepfUS7wlVNj8DS1f92vYgKc3hIrQxfpZxLPVeylgiaSs/MoY4Zg3yhnr5KT49icW6jn0gnmHU0Dddi4azhKzeUqaF1+nk2r1IUpaif/gNXg42dubuRwoMwVBwDQK+yjDwMjfroRa99s58pOvyWXBeXl2Uhis93hMSYBE7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791792654; c=relaxed/simple;
	bh=9tzxsnlFqLCAzHuCuH8yjX3qQgX6iKJNPexnadJ/z04=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=FEG0kgFwa0w0pzHXlxDIek9vnyUV3g/AOSAJhMfCxiv8weyfa1ygvQpfxQ/GwscARZZ2RJECT22xLmqYjaAEt7OfugGcxh4pSaBcpo/pnTQk01DUNnBA4KMagF9XD1MABawG0QWdYYOnxiwGyIBcqldsboNwVErvTxVxpPB+K6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iLwptBBd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iLwptBBd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 915191F0089B;
	Mon, 12 Oct 2026 08:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791792652;
	bh=qqoR6ZmQO+vcEyWbCKMtK6kfPWCs+/rFxb4D4K9xD8Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iLwptBBdQq/Uei0XEbWnMpqlv+SFLBlVHU+M/jOd5v/X1F+7423c8B1QePoWtU0kB
	 QgkfQVO5LNm5Ltg96fld76upg3x3nXc+2r//5rlQ1SgiSbpwYCflHLK1AGqRcxPC71
	 1Ytnre4xWL89xjU+2K5G/CVGqAtqNs3ucHk9jZ7lIwlCcebPVdSebYYZZFtH++NZkd
	 wf9F412MOGuMVyqoOdj47TW4u4VCFte1+JAsYVdzecA/eHHhmiW3dHFnfZQuGmXFsy
	 72lDBdP3oOg/cI+IksyCyyjzxCcLkaq6UBl/unhoRY/CFggOvhu8uWMRhFbXHH2UA5
	 gOXLm+vKeyXtg==
Message-ID: <sashiko-outbox-167825@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] usb: gadget: u_serial: fix stale req->dep warn on
 disconnect/reconnect
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daehwan Jung" <dh10.jung@samsung.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <1860250540.01791791282424.JavaMail.epsvc@epcpadp2new>
References: <CGME20261012060557epcas2p4ce5468f159a857c5caf2c81b59cc3f60@epcas2p4.samsung.com>
 <1860250540.01791791282424.JavaMail.epsvc@epcpadp2new>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 08:10:52 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] usb: cdns3: use-after-free on request->buf in gadget giveback
--

commit 8f8778218c9b936c4a5d0fa16a09a9091afc687a
Author: Daehwan Jung <dh10.jung@samsung.com>

usb: gadget: u_serial: fix stale req->dep warn on disconnect/reconnect

When DWC3_EP_DELAY_STOP defers ENDXFER, giveback of -ESHUTDOWN requests
arrives after gserial_disconnect(). This commit frees the stale request
in gs_read_complete() when the port is already disconnected to prevent
subsequent warnings.

Link to v3: https://lore.kernel.org/all/20260727051335.1745955-1-dh10.jung@=
samsung.com/

> diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/=
function/u_serial.c
> index cdd1dfc666c4f..ba6af7127fc47 100644
> --- a/drivers/usb/gadget/function/u_serial.c
> +++ b/drivers/usb/gadget/function/u_serial.c
> @@ -459,10 +459,21 @@ static void gs_read_complete(struct usb_ep *ep, str=
uct usb_request *req)
>  {
>  	struct gs_port	*port =3D ep->driver_data;
> =20
> -	/* Queue all received data until the tty layer is ready for it. */
>  	spin_lock(&port->port_lock);
> -	list_add_tail(&req->list, &port->read_queue);
> -	schedule_delayed_work(&port->push, 0);
> +	if (!port->port_usb) {
> +		/*
> +		 * The port was disconnected: gserial_disconnect() has already
> +		 * freed read_pool/read_queue and reset the request counters.
> +		 * Free this request now instead of queueing it, otherwise
> +		 * gs_rx_push() would return it to read_pool and the next
> +		 * gserial_connect() would submit it on the new OUT endpoint.
> +		 */
> +		gs_free_req(ep, req);

[Severity: High]
Does this cause a use-after-free when used with the cdns3 USB controller?

The cdns3 driver evaluates request->buf after calling the giveback handler:

drivers/usb/cdns3/cdns3-gadget.c:cdns3_gadget_giveback() {
    ...
		usb_gadget_giveback_request(&priv_ep->endpoint,
					    request);
		spin_lock(&priv_dev->lock);
	}

	if (request->buf =3D=3D priv_dev->zlp_buf)
		cdns3_gadget_ep_free_request(&priv_ep->endpoint, request);
    ...
}

If gs_read_complete() synchronously frees the request via gs_free_req() when
the port is disconnected, will the subsequent check in cdns3_gadget_givebac=
k()
dereference the freed request pointer?

> +	} else {
> +		/* Queue all received data until the tty layer is ready for it. */
> +		list_add_tail(&req->list, &port->read_queue);
> +		schedule_delayed_work(&port->push, 0);
> +	}
>  	spin_unlock(&port->port_lock);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/1860250540.01791791=
282424.JavaMail.epsvc@epcpadp2new?part=3D1
