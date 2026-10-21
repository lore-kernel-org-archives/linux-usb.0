Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792544298;
	b=h/FsDasb0xSN5Z8EkJu+j7EyFLG8f8kO6bADb6Fhp1Xg5HPJ3BR0JCy3etzxBrAhUFu6
	 iDkTFI3qemX8LZW6ktY5eSwZ5G3ISKAXBQtFC4dSB45+YCvAKYDAN6ZQLPILB/VPJv9UT
	 ChH6M4uqk8BQEf46mv4aBRY7YyD+x1e42YGge8CXK7svRSBf3JUkt66UMV/9NUsG7Su69
	 mLivPOBo5TO7JVC7JobeFzIcWz+g7qzMJyKubJR3viiBDWhJ0FTjMnnwBLSfcOibYeETK
	 GEPhKeWFWKG2ekHowVtS1NlSAfAfPzYunEQWWc7nIQNfi5XoW0YCzCs83dSEXQMJ1Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792544298;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=uBmNgaYndRJ1UyWvyqKYgaA0kvx/u36fuPLUIOdI9AI=;
	b=kkeDlsvj4VYu6coknjH6kfeXXbZM7zoZSekSxK42OlxIG3fteST2/HJObPrOXzslcK5o
	 ioZClu4R25aTOlRCneaXEOeztEUFe9Gc62ShByyXBRcAlbti6DlWyQzMji9tD7ZbTgjk0
	 QZVFPAIES04sWkHufE7lgmhCEQpgzlZ9WrP9nKxExYKdYGT3w/azMHkNC1MxOXCPrHCmx
	 ZBHjkmGa8EezcZilRfsswZb4bg5iqmHhKfLkbChobARhJH57xVXcprurCZ2EEU4a1P8S+
	 WbbUyJFG6ef7xonnE4Y5pOAWnt57hq/4Rorgm1j/YNqOLQwc6dtVQnBApqLdaRb17pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cv8UrZLb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D79A606A31A
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 00:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cv8UrZLb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AF281F000C9;
	Wed, 21 Oct 2026 00:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792544297;
	bh=uBmNgaYndRJ1UyWvyqKYgaA0kvx/u36fuPLUIOdI9AI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cv8UrZLb0X1dgC1AXhuxeRjS6yumBdhfKLjxV2pVGwFCXtoI0so5kbagMZnVXxyQ0
	 j/IjtMRwrH9tkDVqSPILOlzAys5SzJjbh8HNfGFXCWDDczy71+5dLcfaMreS3p//G0
	 LefSkzM//Dn1llCBj+dSUru9mMqMSrrmcyvv5lOrxP61gFpDgmaed0HUdkMMzovFKL
	 MfZX7Q2Fz2sICphG638QqLgkyj7HM5MiSZFweALNLvyKhcwLGoL3cGbWwxZdtCdD//
	 z6Oxp4BzeEhUD+7Pe2azi2DmZA2YCSq2sAdEg2hFAQA4o5j81t61LlkEKT3uJKoQxD
	 IakM6WK7E0RwA==
Message-ID: <sashiko-outbox-179651@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/7] usb: dwc3: gadget: Clear delayed stop on End
 Transfer completion
Reply-To: sashiko-reviews@lists.linux.dev
To: "Thinh Nguyen" <Thinh.Nguyen@synopsys.com>
Cc: =?utf-8?b?bGludXgtdXNiQHZnZXIua2VybmVsLm9yZw==?= <linux-usb@vger.kernel.org>
In-Reply-To: <c28a9660f7b6bfa626077ddcfbadd50e6b503f86.1792542945.git.Thinh.Nguyen@synopsys.com>
References: <cover.1792542945.git.Thinh.Nguyen@synopsys.com>
 <c28a9660f7b6bfa626077ddcfbadd50e6b503f86.1792542945.git.Thinh.Nguyen@synopsys.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 00:58:16 +0000
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
- [High] usb: dwc3: gadget: skipped request cleanup on DWC3_EP_DELAY_STOP c=
lear
--

commit f4ade355ebc7b629210edc8108aa9f5fb3f0bcc2
Author: Thinh Nguyen <Thinh.Nguyen@synopsys.com>

usb: dwc3: gadget: Clear delayed stop on End Transfer completion

This commit clears the DWC3_EP_DELAY_STOP flag in
dwc3_gadget_endpoint_command_complete() when an End Transfer command
completes, preventing a later retry on the next SETUP phase from stopping a
newly started transfer.

> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index df5407e757884..4de3b81cb6781 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -3875,6 +3875,7 @@ static void dwc3_gadget_endpoint_command_complete(s=
truct dwc3_ep *dep,
>  	if (dep->stream_capable)
>  		dep->flags |=3D DWC3_EP_IGNORE_NEXT_NOSTREAM;
> =20
> +	dep->flags &=3D ~DWC3_EP_DELAY_STOP;
>  	dep->flags &=3D ~DWC3_EP_END_TRANSFER_PENDING;
>  	dep->flags &=3D ~DWC3_EP_TRANSFER_STARTED;
>  	dwc3_gadget_ep_cleanup_cancelled_requests(dep);

[Severity: High]
Can clearing DWC3_EP_DELAY_STOP unconditionally here in
dwc3_gadget_endpoint_command_complete() in drivers/usb/dwc3/gadget.c skip
deferred request cleanup and leak usb_request objects (and their mapped DMA
buffers) if the endpoint was disabled or the controller disconnected while
DWC3_EP_DELAY_STOP was set?

In __dwc3_stop_active_transfer(), if dwc3_send_gadget_ep_cmd() with
DWC3_DEPCMD_CMDIOC returns -ETIMEDOUT while dep->dwc->ep0state !=3D
EP0_SETUP_PHASE (for example, while dwc->delayed_status is true in
dwc3_gadget_ep_dequeue(), __dwc3_gadget_ep_set_halt(),
__dwc3_gadget_kick_transfer(), or __dwc3_gadget_ep_disable() after commit
"usb: dwc3: gadget: Wait for End Transfer completion on ep disable", or via
__dwc3_gadget_start_isoc()), the driver sets DWC3_EP_DELAY_STOP and returns
0 without clearing DWC3_EP_TRANSFER_STARTED (and before scheduling error
recovery in commit "usb: dwc3: gadget: Recover from End Transfer timeout"),
while the End Transfer command remains in flight in hardware.

If __dwc3_gadget_ep_disable() or dwc3_gadget_soft_disconnect() then runs
before EP0 reaches EP0_SETUP_PHASE, dwc3_remove_requests() returns early
without giving back dep->started_list, dep->pending_list, or
dep->cancelled_list:

drivers/usb/dwc3/gadget.c:dwc3_remove_requests() {
	...
	dwc3_stop_active_transfer(dep, false, false);

	/* If endxfer is delayed, avoid unmapping requests */
	if (dep->flags & DWC3_EP_DELAY_STOP)
		return;
	...
}

And in __dwc3_gadget_ep_disable(), dep->endpoint.desc is cleared while
DWC3_EP_DELAY_STOP | DWC3_EP_TRANSFER_STARTED remain set:

drivers/usb/dwc3/gadget.c:__dwc3_gadget_ep_disable() {
	...
	if (dep->flags & DWC3_EP_DELAY_STOP)
		mask |=3D (DWC3_EP_DELAY_STOP | DWC3_EP_TRANSFER_STARTED);
	dep->flags &=3D mask;

	/* Clear out the ep descriptors for non-ep0 */
	if (dep->number > 1) {
		dep->endpoint.comp_desc =3D NULL;
		dep->endpoint.desc =3D NULL;
	}
	...
}

If the in-flight End Transfer command completes before dwc3_ep0_out_start()
runs, dwc3_gadget_endpoint_command_complete() now clears DWC3_EP_DELAY_STOP
and only calls dwc3_gadget_ep_cleanup_cancelled_requests(dep), which does
not clean up dep->started_list or dep->pending_list, and stops after the
first request in dep->cancelled_list when the endpoint is disabled:

drivers/usb/dwc3/gadget.c:dwc3_gadget_ep_cleanup_cancelled_requests() {
	...
		/*
		 * The endpoint is disabled, let the dwc3_remove_requests()
		 * handle the cleanup.
		 */
		if (!dep->endpoint.desc)
			break;
	}
}

Because DWC3_EP_DELAY_STOP has already been cleared, when
dwc3_ep0_out_start() later runs on entering EP0_SETUP_PHASE, it will skip
the endpoint instead of finishing the deferred dwc3_remove_requests()
cleanup:

drivers/usb/dwc3/ep0.c:dwc3_ep0_out_start() {
	...
		if (!(dwc3_ep->flags & DWC3_EP_DELAY_STOP))
			continue;

		dwc3_ep->flags &=3D ~DWC3_EP_DELAY_STOP;
		if (dwc->connected)
			dwc3_stop_active_transfer(dwc3_ep, false, true);
		else
			dwc3_remove_requests(dwc, dwc3_ep, -ESHUTDOWN);
	...
}

Additionally, in the dwc3_gadget_soft_disconnect() path where
!dwc->connected (while ep0state is still EP0_STATUS_PHASE after
dwc3_ep0_send_delayed_status() clears dwc->delayed_status),
dep->endpoint.desc is still non-NULL and DWC3_EP_ENABLED is still set. If
DWC3_EP_DELAY_START was set prior to disconnect, could
dwc3_gadget_endpoint_command_complete() also call
__dwc3_gadget_kick_transfer(dep) and start a new hardware transfer from
dep->pending_list while disconnecting?

Should dwc3_gadget_endpoint_command_complete() check whether the endpoint
was disabled (!dep->endpoint.desc) or disconnected (!dwc->connected) when
DWC3_EP_DELAY_STOP was set and invoke dwc3_remove_requests(dwc, dep,
-ESHUTDOWN) instead of kicking delayed transfers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1792542945.gi=
t.Thinh.Nguyen@synopsys.com?part=3D3
