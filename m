Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793114878;
	b=0cX6jhG2vlQWvgQoZrHQgzjT61TSY29HAw+U2xYx5Yp27esPTQdf2nK4/WVgt0HYB6wb
	 kf4bh/fS5ivuTlEHh5cj+WeNQBSILLedqd3dF67Ir2wCgVYmrocoHEpqtvE3eUzBHI4b4
	 XRn5hGBA0jKT82k95vahze2s2Mt8gmiioCOHdMgPitPhL7wKBFjbbwITc/DhOMeIh5CAd
	 6IGx8oFlvI5wPubNngq4ZRTB9VbD1OsS+OcjO9tUJY3yiGGQ6ciwGOFxNSCBqNaN2yek/
	 UbNsYs73laD6txf0BHK1csbk1UEw2z4bw1j/pqodRv0TxRs3ybH9yBsr+0vDEQlnlGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114878;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IpUJT+aDCm0oqQaHoThZMgk49xZEVRAK44ut9AeNxy4=;
	b=bS9I4z8E6peNSbvvB1RwGQ3ckDz7tTlOwINo4uRUWC4LOyWXOAsV2hX69/pfowR1ggUM
	 UETX54DPepy51PvR+/S5FKutVwGg0u8ZWTldXb96Sv8G3xuMP+e6E+RlebWlpGaFxLa/+
	 xiiBpj7QM+d0rCTctZ3MHWKhnC5NiCXN6R3og0/IxaSdA6+/Sl1sGVM776uaLQvxCsHew
	 JJvh6JLXqxEGBwlXmWVpFvBOEuE5BNl9u/sQOwa2bkjBihe5pSvUeBoXlIUKawAA4bPJq
	 /9oeOfESvAoqeJtoDo0o0eEb1PguieRx98HYTi6tg+QjGcPHexCsCCpPSSh4scireHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ONbETOdX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA126606A31A
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 15:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ONbETOdX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BAD31F01825;
	Tue, 27 Oct 2026 15:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793114877;
	bh=IpUJT+aDCm0oqQaHoThZMgk49xZEVRAK44ut9AeNxy4=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=ONbETOdXap8zB1YQ+eK9VN9HZMrTMlUuuEMDGLvbuFeYYQDq/0crri88/M3MVtZnX
	 lul8JSYSpjks2uiH+XaV+WbBLeX9o9i1WAkQpncKNz9zQiDSD10+e5GyNBMoCUYQoZ
	 6uT8g97RAvS6JeOqGpLAqY2zigkhX8nCuTDqSJa0SdHu7QozdRFLT+B9CwxhvH7hzu
	 WHn+OW8lDgW9SO23Tj8BxagWyeUCtEjni0mkWcIwgF6oPTmC+H3GMX95SCUkO3O514
	 cDSognv1qT6bKZFxcI4hiVnpaFUSCL9GpmgEiDVMuCxWXwJt3vmqApQ5krPDRz9EE7
	 gBg6mN7c+9Jkw==
Message-ID: <sashiko-outbox-186835@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 05/19] usb: cdns3: switch the role unlocked on resume
Reply-To: sashiko-reviews@lists.linux.dev
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
In-Reply-To: <20261027-llm-usb-v1-5-b9751ddb9c7c@linuxfoundation.org>
References: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
 <20261027-llm-usb-v1-5-b9751ddb9c7c@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 15:27:56 +0000
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
- [High] usb: cdns3: role switched in cdns3_controller_resume() while in_lp=
m is true
--

commit 4cc15afc73e105403285c3f1673e0d0dcaa8187a
Author: Josef Bacik <josef@toxicpanda.com>

usb: cdns3: switch the role unlocked on resume

This commit moves the OTG role switch during system resume out of
cdns_resume() into a new cdns_resume_role() helper called before acquiring
cdns->lock. This avoids calling sleeping functions from atomic context when
the controller loses power during suspend and the role changes while asleep.

> diff --git a/drivers/usb/cdns3/cdns3-plat.c b/drivers/usb/cdns3/cdns3-pla=
t.c
> index e3f32c3e95352..674625cdd4d48 100644
> --- a/drivers/usb/cdns3/cdns3-plat.c
> +++ b/drivers/usb/cdns3/cdns3-plat.c
> @@ -268,7 +268,7 @@ static int cdns3_controller_suspend(struct device *de=
v, pm_message_t msg)
>  static int cdns3_controller_resume(struct device *dev, pm_message_t msg)
>  {
>  	struct cdns *cdns =3D dev_get_drvdata(dev);
> -	int ret;
> +	int ret, role_changed;
>  	unsigned long flags;
> =20
>  	if (!cdns->in_lpm)
> @@ -292,8 +292,12 @@ static int cdns3_controller_resume(struct device *de=
v, pm_message_t msg)
> =20
>  	cdns3_set_platform_suspend(cdns->dev, false, false);
> =20
> +	/* It resumes the device, which cannot be done from runtime resume */
> +	role_changed =3D PMSG_IS_AUTO(msg) ? 0 : cdns_resume_role(cdns);
> +
>  	spin_lock_irqsave(&cdns->lock, flags);
> -	cdns_resume(cdns);
> +	if (!role_changed)
> +		cdns_resume(cdns);
>  	cdns->in_lpm =3D false;
>  	spin_unlock_irqrestore(&cdns->lock, flags);
>  	cdns_set_active(cdns, !PMSG_IS_AUTO(msg));

[Severity: High]
Can calling cdns_resume_role() with interrupts enabled while cdns->in_lpm is
still true cause an unhandled interrupt storm?

When the controller loses power during system suspend and transitions to
USB_ROLE_DEVICE on resume (for example, because a peripheral cable was
connected while asleep), cdns_resume_role() invokes the following call chain
before cdns->in_lpm is cleared:

  cdns_resume_role()
    cdns_hw_role_switch()
      cdns_role_start()
        __cdns3_gadget_init()

In drivers/usb/cdns3/cdns3-gadget.c, __cdns3_gadget_init() enables the gadg=
et
block, starts the gadget (which binds the gadget driver and enables
USB_IEN_INIT and USB_CONF_DEVEN), and requests cdns->dev_irq:

	cdns_drd_gadget_on(cdns);
	pm_runtime_get_sync(cdns->dev);

	ret =3D cdns3_gadget_start(cdns);
	...
	ret =3D devm_request_threaded_irq(cdns->dev, cdns->dev_irq,
					cdns3_device_irq_handler,
					cdns3_device_thread_irq_handler,
					IRQF_SHARED, dev_name(cdns->dev),
					cdns->gadget_dev);

Because VBUS is present and device interrupts are enabled in hardware, the
level-triggered cdns->dev_irq can fire immediately while cdns_resume_role()
is still running.

However, cdns3_device_irq_handler() in drivers/usb/cdns3/cdns3-gadget.c (as
well as cdns_drd_irq() in drivers/usb/cdns3/drd.c) checks cdns->in_lpm at t=
he
entry of the handler:

	if (cdns->in_lpm)
		return ret;

Since cdns->in_lpm is not set to false until after cdns_resume_role() retur=
ns
and cdns->lock is acquired, the handler returns IRQ_NONE without masking or
acknowledging the pending hardware interrupt, which can cause the kernel to
disable the IRQ line or trigger spurious wakeup handling on shared IRQ
platforms.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027-llm-usb-v1=
-0-b9751ddb9c7c@linuxfoundation.org?part=3D5
