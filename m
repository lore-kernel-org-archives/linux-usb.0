Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795625870;
	b=Rf/YHDq1qQr3ylfuIc8A28AEx1THo2rqNxZe5/9uP3RpFDZpywG+Gbaj/7VXS0RKMHnP
	 jAPtWV1xh5sa0yJ6eK8I6Ubb5R5EI4EcYQb2EKe3FQNvP9pbbgEO2jqwYs0dgQ1Z36i2H
	 FxunoO/R3BppIcg6WsqROTGr514/0qZSANtJYe2oC+c0E5hiPcz31FLNl+Vt5VxGLzjPE
	 HCzrJ+5SqrP4VmLk2FLMvwg7pR6tsd0Nfxyh2KgywDfXPmmgqYbdRueZkvqTrVmcIjtAG
	 3zJgQZYeRVynp/fNEckcHYGDT5jD5LKiQrnz/lF47yficEuMc7ofTGmTyplAT+Od8TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795625870;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=QnrGOKOZJesfH3g6LtoPTFP0D/LL20fZe/anvDh8n/Y=;
	b=qUKrj9biftPesD9AtjViw1hQGksx9jZfbPmKQ0ecFDx8jKMqlZtBfWqOtBQ0y2t9h/FY
	 ObYiunfDNDbNNQMbZ/pG9j5pppK5vLa+iJNGm6Ou5uWuptRi7KRVEzbjXpmsPtr3kJ/s4
	 fsgkodzKn//+1vNhqLvdfzmnIgKhhvJjnRIDnJ5+kbs8zUlrjmplGfPWcnxecLWaNpgRv
	 QULRMbiIX0608IX8jSVwWGK1k2tW6BcPXIMvvUq7xdz9oUMRifPzolNkwIMsY12ySS3ro
	 Eaa3yfCajPdTCBhLyfEz0L2wM8S83zTfbCJYMm/M50lkTeLSI0TnidAgwpRCsFoKofg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ndYOdFZf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DE9606A323
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 16:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ndYOdFZf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9E171F000C0;
	Wed, 25 Nov 2026 16:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795625869;
	bh=QnrGOKOZJesfH3g6LtoPTFP0D/LL20fZe/anvDh8n/Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ndYOdFZfmzTKOQPbOx+EXVqgPj5PwrMw9Y2SjyINBANolftWnRg7Jrt79p690Rm4B
	 dJ4amEUA7uMhdPGpw137rb7kRDHf2y54fc/8ZhWjG8ols7W9Tfovdcn5LBCzbUnQ+H
	 QXBy3cFLPogqARcEXKgoHtxqQlkdta5AP8TEe6CJeoaKKzf0Hgu0y4LdPU8Hot2Z7U
	 ZDBlKuxbWcbO+KD/H9QICvygU5BMfOldO8GyoZiO//TeNea57Y+K2qKatVBi+BNzEq
	 13sFvqkRI94afh6sKKcu4zpvl5/F5KYEMHbfkjXV6OTU5Kqsksp09vK2E7Arjei2HT
	 9kbYHwBsMlYGw==
Message-ID: <sashiko-outbox-233788@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 04/11] usb: dwc2: clean up old role on mode change
 during suspend
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabrice Gasnier" <fabrice.gasnier@foss.st.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261125-dwc2-low-power-fixes-stm32-v6-4-d5df33b93eaf@foss.st.com>
References: <20261125-dwc2-low-power-fixes-stm32-v6-0-d5df33b93eaf@foss.st.com>
 <20261125-dwc2-low-power-fixes-stm32-v6-4-d5df33b93eaf@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 16:57:49 +0000
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
- [Medium] usb: dwc2: device endpoint register access in host mode in
  dwc2_hsotg_role_lost()
--

commit 9eca46957e8d956eb9059255d4d71f159a5ec1a4
Author: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

usb: dwc2: clean up old role on mode change during suspend

This commit records the active role at suspend and, if register state is
lost during suspend while the OTG ID pin changes, cleans up the old role
and initializes the new role on resume instead of restoring the previous
role's register backup.

> diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
> index 295091a87b129..9b12c336e4aa9 100644
> --- a/drivers/usb/dwc2/gadget.c
> +++ b/drivers/usb/dwc2/gadget.c
> @@ -5251,6 +5251,26 @@ int dwc2_hsotg_resume(struct dwc2_hsotg *hsotg, bo=
ol lost)
>  	return 0;
>  }
> =20
> +/**
> + * dwc2_hsotg_role_lost - drop gadget state after a role change in suspe=
nd
> + * @hsotg: Programming view of the DWC_otg controller
> + *
> + * The core came back from register loss in host mode while the gadget w=
as
> + * active at suspend. Disconnect the gadget and clear stale software sta=
te
> + * without touching the endpoint registers, which are not usable in host=
 mode.
> + */
> +void dwc2_hsotg_role_lost(struct dwc2_hsotg *hsotg)
> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&hsotg->lock, flags);
> +	dwc2_hsotg_disconnect(hsotg);
> +	dwc2_clear_fifo_map(hsotg);
> +	hsotg->gadget.speed =3D USB_SPEED_UNKNOWN;
> +	dwc2_clear_lost_state(hsotg);
> +	spin_unlock_irqrestore(&hsotg->lock, flags);
> +}

[Severity: Medium]
Can dwc2_hsotg_role_lost() still access device endpoint registers while
the controller is in host mode, and leave endpoint state stale when
usb_ep_disable() is deferred?

When the USB bus is already suspended (hsotg->lx_state is DWC2_L2 or
DWC2_L1) at system suspend, dwc2_hsotg_suspend() returns early, leaving
hsotg->connected set, endpoints enabled with non-zero fifo_index and
fifo_size, and hsotg->op_state at OTG_STATE_B_PERIPHERAL.  On resume into
host mode, dwc2_hsotg_role_lost() runs before dwc2_hcd_restore() updates
hsotg->op_state to OTG_STATE_A_HOST, and calls dwc2_hsotg_disconnect():

1. dwc2_hsotg_disconnect() calls kill_all_requests() on every endpoint,
   which reads DTXFSTS(ep->fifo_index) and flushes the TX FIFO when
   hsotg->dedicated_fifos is set:

drivers/usb/dwc2/gadget.c:kill_all_requests() {
    ...
	if (!hsotg->dedicated_fifos)
		return;
	size =3D (dwc2_readl(hsotg, DTXFSTS(ep->fifo_index)) & 0xffff) * 4;
	if (size < ep->fifo_size)
		dwc2_hsotg_txfifo_flush(hsotg, ep->fifo_index);
}

2. dwc2_hsotg_disconnect() then invokes call_gadget(hsotg, disconnect).
   Gadget drivers that synchronously call usb_ep_disable() during
   disconnect enter dwc2_hsotg_ep_disable(), where the host-mode guard
   (hsotg->op_state !=3D OTG_STATE_B_PERIPHERAL) does not trigger because
   op_state has not been updated yet, so it reads and writes DIEPCTL,
   DOEPCTL, DAINTMSK and DTXFSTS while the hardware is in host mode.

3. Conversely, if a gadget function driver defers usb_ep_disable() to a
   workqueue or thread that runs after dwc2_hcd_restore() sets op_state to
   OTG_STATE_A_HOST, dwc2_hsotg_ep_disable() returns -EINVAL without
   clearing hs_ep->fifo_index or hs_ep->fifo_size, and usb_ep_disable()
   leaves ep->enabled set so the endpoint cannot be re-enabled on the next
   switch back to device mode.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-dwc2-low-p=
ower-fixes-stm32-v6-0-d5df33b93eaf@foss.st.com?part=3D4
