Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699368;
	b=bx7pYU76c9mtiVHBChxQIZ72xrWMPN4MIhEHAWr+ljwQoBV3PrP+Hvw7wn3HE6rnUIvA
	 ZqvuxMf3ulgcwmiKbpSrMJSAZyDy9pyjc9Y+hHm+JWJH/nuXOY1siF/XrOpRcmVVgk99M
	 2K2+afp/Gir6X2GGMa474IVsjOKmh2mtww1OtgrbgHVb3CoHvF6PvqFJyuoyOuxiQn2eP
	 SFVPW3xncSoWJA01IH1g8qeX7iEAy0g2TXmEwd3eeSPipbd8710JJIMnNHHWORDKnw77o
	 1JDseVVrfZ4PKEQMUvZRIkfb1jmW1pCn9fi1IV+2hX2B03zlXNa5+T0FysacAFu8cDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699368;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9OPtD7DKvh0rLfUXzc1kW2iZOAHc7HHD2LBOga+1QW4=;
	b=LlUbnO7SEpA54N3ADbWKd/BcK5KJsTD2PBTXsVHfQ5UrGDtCiRFeo4HxBQNkZQIicwVG
	 Yb++4o1cCRUyanxLW8MG72vzJ5q8/Je1kxob1OgmGp/da3/wyG9Y6TEl/+BV1heYMnZsm
	 sOKizOKa113HMG/vhR2D7KLgI0xjkyZnIoGxvzsYNFhHFU1tOdmyy2n4NDi+/7tD28Ls+
	 5OrQncDvgRw2xl3zTm7ltUQDsfAx0RSIHWZStknlqlYTPnXhczQeQDGqFPRo7PQWomgkw
	 m/hiSYDm0QVSWeFvqzTmwodGz7nAMmnfYE/d8iuFL0BcQibrou3pEKK/SHbDKdW2HdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JRK8l8XP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E845606A31E
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 13:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JRK8l8XP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 207681F000C6;
	Thu, 26 Nov 2026 13:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795699368;
	bh=9OPtD7DKvh0rLfUXzc1kW2iZOAHc7HHD2LBOga+1QW4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JRK8l8XP9eTCoQedVLdUrjixnAOHHwBlF4IU6jvstt9HIbCVJd1WohKaH1Oef5Vpi
	 NlMcr/lNfqq8SNzSCn7lGAruYM227iK1Qffj7EP52y8jd2+rflC7rI40hfMiOVBpvi
	 eg6t62FcDeDwQYdQyfiR57v49JF64vWuLkN5PRA3aMw7Hg5a4dkW+C/HkdbvlrpNeL
	 ucfAD4DgAoogr8AuknV6Wgp4lKtf0KJJOSBZz/kKNazQ8YFuZ+5PF8lQfeNSZVkUH0
	 2RHV67KZbWuxS8wLHSjEI2+dMeDrC0RNsjrqf69gNE54Z+nzt70IuNAHDlKi1chOjB
	 LD0Nn4XG9yx3g==
Message-ID: <sashiko-outbox-235592@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] usb: dwc3: gadget: clear softconnect on stop and
 failed pullup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261126-topic-usb_dwc3_fixups-v2-2-c0cc2b75c518@oss.qualcomm.com>
References: <20261126-topic-usb_dwc3_fixups-v2-0-c0cc2b75c518@oss.qualcomm.com>
 <20261126-topic-usb_dwc3_fixups-v2-2-c0cc2b75c518@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 13:22:47 +0000
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
- [Medium] usb: dwc3: gadget: race with dwc3_err_recovery_work() on
  softconnect
--

commit a9997a16426be60f4fb31e8b8d1b87b342415fd2
Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

usb: dwc3: gadget: clear softconnect on stop and failed pullup

This commit clears dwc->softconnect when dwc3_gadget_pullup() fails and when
dwc3_gadget_stop() stops the gadget under connect_mutex.

> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index 4fab2d57e7d3b..d7e22b5598768 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -2884,8 +2884,12 @@ static int dwc3_gadget_pullup(struct usb_gadget *g=
, int is_on)
>  	ret =3D pm_runtime_get_sync(dwc->dev);
>  	if (!ret || ret < 0) {
>  		pm_runtime_put(dwc->dev);
> -		if (ret < 0)
> +		if (ret < 0) {
>  			pm_runtime_set_suspended(dwc->dev);
> +			spin_lock_irqsave(&dwc->lock, flags);
> +			dwc->softconnect =3D 0;
> +			spin_unlock_irqrestore(&dwc->lock, flags);
> +		}
>  		return ret;
>  	}
> =20
> @@ -2902,6 +2906,11 @@ static int dwc3_gadget_pullup(struct usb_gadget *g=
, int is_on)
>  		ret =3D dwc3_gadget_soft_disconnect(dwc);
>  	else
>  		ret =3D dwc3_gadget_soft_connect(dwc);
> +	if (ret) {
> +		spin_lock_irqsave(&dwc->lock, flags);
> +		dwc->softconnect =3D 0;
> +		spin_unlock_irqrestore(&dwc->lock, flags);
> +	}
>  	mutex_unlock(&dwc->connect_mutex);
> =20
>  	pm_runtime_put(dwc->dev);
> @@ -3130,10 +3139,13 @@ static int dwc3_gadget_stop(struct usb_gadget *g)
>  	if (dwc->sys_wakeup)
>  		device_wakeup_disable(dwc->sysdev);
> =20
> +	mutex_lock(&dwc->connect_mutex);
>  	spin_lock_irqsave(&dwc->lock, flags);
>  	dwc->gadget_driver	=3D NULL;
> +	dwc->softconnect =3D 0;
>  	dwc->max_cfg_eps =3D 0;
>  	spin_unlock_irqrestore(&dwc->lock, flags);
> +	mutex_unlock(&dwc->connect_mutex);
> =20
>  	free_irq(dwc->irq_gadget, dwc->ev_buf);
> =20

[Severity: Medium]
Can dwc3_err_recovery_work() still reconnect the controller during unbind,
or act on a failed pullup(1), because dwc3_gadget_pullup() updates
dwc->softconnect and checks dwc->pullups_connected outside
dwc->connect_mutex?

On the unbind path, dwc3_err_recovery_work() temporarily clears
dwc->pullups_connected before reconnecting:

CPU0 (kworker)                    CPU1 (gadget unbind)
dwc3_err_recovery_work()
  mutex_lock(&dwc->connect_mutex)
  dwc3_gadget_soft_disconnect()
    dwc->pullups_connected =3D false
  if (dwc->softconnect)
                                  dwc3_gadget_pullup(g, 0)
                                    dwc->softconnect =3D 0
                                    if (dwc->pullups_connected =3D=3D 0)
                                      return 0
    dwc3_gadget_soft_connect()
      dwc->pullups_connected =3D true
  mutex_unlock(&dwc->connect_mutex)
                                  dwc3_gadget_stop(g)
                                    mutex_lock(&dwc->connect_mutex)
                                    dwc->gadget_driver =3D NULL
                                    dwc->softconnect =3D 0
                                    mutex_unlock(&dwc->connect_mutex)
                                    free_irq(dwc->irq_gadget, ...)
                                      <-- controller left running

Similarly, because dwc3_gadget_pullup(g, 1) sets dwc->softconnect =3D 1
before pm_runtime_get_sync() and before taking connect_mutex, an
in-progress dwc3_err_recovery_work() can observe dwc->softconnect =3D=3D 1 =
and
call dwc3_gadget_soft_connect() even if pm_runtime_get_sync() subsequently
fails and rolls dwc->softconnect back to 0.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-topic-usb_=
dwc3_fixups-v2-0-c0cc2b75c518@oss.qualcomm.com?part=3D2
