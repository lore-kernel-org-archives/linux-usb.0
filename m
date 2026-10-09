Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF15347FC0
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 10:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540976; cv=none; b=lD+xZkE32X+NkbsnNJnj1UAdrk5dfBsHyDJJeUEnXn8tG7+Qn+N1lBUqbqYlnEwTRWPqm+V7JPvOYZz7HFVyEyk5FE/w5GLzP0yqHHlwJHbqxUPmaae8QwB2fAMMctUNBv8vLX7fky2evqPJyNeM5CIV9j2fDVhydoACyfyhm1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540976; c=relaxed/simple;
	bh=Qg6fki4tP2VSVJw0dDdnvFfg1DlEPQDilPWKNOTxVrU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=LD/LgCljaFF/vviHczGoWUk0MuupZuG5aPc7NlGQ8LQpKGbPcp/9uG1xCgGhvFBMTK+/1dF7xV/aHBXlSWQQFx0V9XsYrLqDFAe9zUxOh0mpBiYN/HpDpzq3i65wGDk94PIrWCGKjdXyk8BhoiRAnEJ51FUp12zhWfU+SgCjJPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CRdQGCdG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CRdQGCdG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD8D11F000FF;
	Fri,  9 Oct 2026 10:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791540975;
	bh=QBoeMUUtIJ/Tb9pAhw/JmROVS2DBSdk2qJKUV0pfe7U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CRdQGCdGaOSKtF/80jyXbAWa0Sjq4vhH7qgRy/nqIIAPmdAE0rNvd41S9HzI0vhtd
	 A8sSiN/o9DuSAGDJhrrnlPkl7CL7+wl8bgjnct4LkzF1gOyprY/ZUAHxr6ckbkRp0g
	 +TZGceRMRkI8xdXxAPEYM9Hc3f1LplclzFTYdAPbp/iXNdajjSOHXG9et2rCQTURcG
	 BnArkSulFZmr/v3aBkk1/3tQ7+Ni+OpcvCKXxAR86Z0Dkcc28RbVjCNIjd1IV1nfhr
	 Tmjpr8sf953JBNi/+hnhsQrkFd23ozZ1bIM7Fg/43FcFqmkLXd3XXiup0dixKbqNg5
	 BO9RaWNpZp/Vw==
Message-ID: <sashiko-outbox-165215@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 10/14] usb: xhci: Don't set the skip flag on non-isoc
 endpoints
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mathias Nyman" <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261009095834.561578-11-mathias.nyman@linux.intel.com>
References: <20261009095834.561578-1-mathias.nyman@linux.intel.com>
 <20261009095834.561578-11-mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 10:16:14 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] usb: xhci: invalid completion of URB with -EINPROGRESS on COMP_MIS=
SED_SERVICE_ERROR
--

commit dfab6709cb637a348bd004519bdfe39df717cdc4
Author: Michal Pecio <michal.pecio@gmail.com>

usb: xhci: Don't set the skip flag on non-isoc endpoints

These events are unique to isochronous endpoints, ignore them otherwise.
Update debug messages to reflect new policies. We could also log invalid
events as errors, but it seems nobody has ever had problems with that,
so don't bother.

> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index 8b915a1d5b256..2dd11732bb87c 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -2778,16 +2778,18 @@ static int handle_tx_event(struct xhci_hcd *xhci,
>  		 * Set skip flag of the ep_ring; Complete the missed tds as
>  		 * short transfer when process the ep_ring next time.
>  		 */
> -		ep->skip =3D true;
> +		if (ep_ring->type =3D=3D TYPE_ISOC)
> +			ep->skip =3D true;
>  		xhci_dbg(xhci,
> -			 "Miss service interval error for slot %u ep %u, set skip flag%s\n",
> -			 slot_id, ep_index, ep_trb_dma ? ", skip now" : "");
> +			 "Missed Service Error for slot %u ep %u, skip %d, try now %d\n",
> +			 slot_id, ep_index, ep->skip, !!ep_trb_dma);
>  		break;

[Severity: High]
In handle_tx_event() in drivers/usb/host/xhci-ring.c, for non-isochronous
endpoints, does using break instead of return 0 here cause the event to
improperly fall through into the rest of the handler?

If the event's DMA matches the current TD, it appears it is passed to
process_bulk_intr_td() or process_ctrl_td(). Since those functions do not
handle this completion code, does the URB's status remain initialized to
-EINPROGRESS, completing the URB with an illegal status code?

Additionally, if the event DMA does not match the current TD, does the code
fall back to the debug_finding_td error path, fatally shutting down the host
controller with -ESHUTDOWN?

>  	case COMP_NO_PING_RESPONSE_ERROR:
> -		ep->skip =3D true;
> +		if (ep_ring->type =3D=3D TYPE_ISOC)
> +			ep->skip =3D true;
>  		xhci_dbg(xhci,
> -			 "No Ping response error for slot %u ep %u, Skip one Isoc TD\n",
> -			 slot_id, ep_index);
> +			 "No Ping response error for slot %u ep %u, skip %d\n",
> +			 slot_id, ep_index, ep->skip);
>  		return 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009095834.5615=
78-1-mathias.nyman@linux.intel.com?part=3D10
