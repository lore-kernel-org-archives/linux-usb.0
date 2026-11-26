Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795698946;
	b=ybsg5X2CvWlI7cH1f+cjUu/i2urq3EDtUaWniydSQCLl57GVH57DTyfDnq7OHuP9DBAn
	 BJlZ25TlLiHMQl938DWL2sTJwA/A0kSxwifU5uU5P2Wf+vI0Kob4sn2MNq1mM7q0H1jvA
	 kyA8dvwCIU/ZUbBoAPf34FG3wK9I8PUsNyubO/AWDjTg5IVriTYZYwP190cTwqVv28qXN
	 v9cgNXEafZoW/SR/HR40/MWt87Zwc97dqJflkJsqRp8DAHyTfVutf0BGDXTzv/CZ/HjM9
	 Uda3qmAHDD43bSmqrDpOVTjaZaK3JuGFIU63/SI1MRE9A5u9lDe/5ti4nz+WU6BJ1Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795698946;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=GvDqoLhRjz3SzZ4+j+yRgEKCt2Q8nfj7SGIC89jVjXs=;
	b=be7tddszW9U1P3VloS4HUbF2WzBMpnvRRIcRiOZ4N1mfbOeVcL1New10/uZJXCZevE40
	 M8niaHA3NBpADfUke9CFv7NwlpwAr8Y8NYiohPG0U+5fHm/Rh6LPc372iAhA9ee5DfoyX
	 ktxBmC5UWzYCMK1VVU1IrZKjh0TUENk+bo3gec2hem659TmWLUykGNRyZ1GcwnVIL+Ly+
	 CvpXi4selP7Ntr6Ebobkq24kLmudX8AqRBnufNiPPDiQFkWWOa/0S+PmsKBKNeNGGCs46
	 VXtNOgFN5CC6DuF4cWaHaMDAA5qBhbz+VlLNwntPIHW4gj/+16M4jNfbjXPBZT3QAyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CopYRojt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996B0606A31C
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 13:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CopYRojt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25B891F000CA;
	Thu, 26 Nov 2026 13:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795698946;
	bh=GvDqoLhRjz3SzZ4+j+yRgEKCt2Q8nfj7SGIC89jVjXs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CopYRojtJDoSPETrCqEqEJBd1T5cJE5mkXreX1Grw96fF7Uk1NERkqmJOPyTaW39k
	 IHumJ0XEttcAkbT6QfRp6sffPkyDzY11MjU9GWcBSi1AT8mZ7eAWmc1Mjbi7hg8eif
	 9CLlGwmGOJFh5h0mrxibUF80AJ7RqIceEIafkqB9p/Bj7YvMN946gFGYbOlyQJqtlI
	 nY0nyOlM72el5eanrDmxUlzwGrpp5wu4NPqhUh+e+6Yz0YS1xCkOGHODsML9Uwqhbg
	 OBBtz8TIBo3ZIMnHIXIvLYzHbWXKfAKJZ32IJkCgIIwv6fXKu7LcQeZRVw2kdvwWnF
	 GA6l8MxIeBOZQ==
Message-ID: <sashiko-outbox-235585@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] usb: dwc3: gadget: cancel err_recovery_work
 after usb_del_gadget
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261126-topic-usb_dwc3_fixups-v2-4-c0cc2b75c518@oss.qualcomm.com>
References: <20261126-topic-usb_dwc3_fixups-v2-0-c0cc2b75c518@oss.qualcomm.com>
 <20261126-topic-usb_dwc3_fixups-v2-4-c0cc2b75c518@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 13:15:45 +0000
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
- [Medium] usb: dwc3: gadget: pullup(0) bypasses connect_mutex during
  err_recovery_work
--

commit 3b95ee598d65cf846e93b3b11ae644862c07819a
Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

usb: dwc3: gadget: cancel err_recovery_work after usb_del_gadget

This commit moves cancel_work_sync(&dwc->err_recovery_work) to after
usb_del_gadget() in dwc3_gadget_exit() so that work queued during gadget
unbind is canceled before freeing endpoints.

> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index 8f40e8dfa3f21..3c20f2ef64576 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -5047,9 +5047,9 @@ void dwc3_gadget_exit(struct dwc3 *dwc)
>  	if (!dwc->gadget)
>  		return;
> =20
> -	cancel_work_sync(&dwc->err_recovery_work);
>  	dwc3_enable_susphy(dwc, true);
>  	usb_del_gadget(dwc->gadget);
> +	cancel_work_sync(&dwc->err_recovery_work);
>  	dwc3_gadget_free_endpoints(dwc);
>  	usb_put_gadget(dwc->gadget);
>  	dma_free_coherent(dwc->sysdev, DWC3_BOUNCE_SIZE, dwc->bounce,

[Severity: Medium]
Can an in-flight dwc3_err_recovery_work() restart the controller and EP0
DMA after usb_del_gadget()'s pullup(0) returns early?

kworker                           CPU0
dwc3_err_recovery_work()
  mutex_lock(&dwc->connect_mutex)
  dwc3_gadget_soft_disconnect()
    dwc->pullups_connected =3D false
  if (dwc->softconnect)
                                  dwc3_gadget_exit()
                                    usb_del_gadget()
                                      ...
                                      dwc3_gadget_pullup(g, 0)
                                        dwc->softconnect =3D false
                                        if (pullups_connected =3D=3D is_on)
                                          return 0;
  dwc3_gadget_soft_connect()
    __dwc3_gadget_start()
    dwc3_gadget_run_stop(dwc, true)
  mutex_unlock(&dwc->connect_mutex)
                                    cancel_work_sync(&dwc->err_recovery_wor=
k)
                                    dwc3_gadget_free_endpoints(dwc)
                                    dma_free_coherent(..., dwc->ep0_trb, ..=
.)
                                      <-- controller and EP0 DMA active

In dwc3_gadget_pullup(), dwc->pullups_connected =3D=3D is_on is checked bef=
ore
acquiring dwc->connect_mutex:

drivers/usb/dwc3/gadget.c:dwc3_gadget_pullup() {
    ...
	if (dwc->pullups_connected =3D=3D is_on) {
		pm_runtime_put(dwc->dev);
		return 0;
	}

	synchronize_irq(dwc->irq_gadget);

	/* Serialize against dwc3_err_recovery_work() */
	mutex_lock(&dwc->connect_mutex);
    ...
}

Because cancel_work_sync() now runs after usb_del_gadget(),
dwc3_err_recovery_work() can run concurrently with gadget unbind.  Once
dwc3_err_recovery_work() clears dwc->pullups_connected and passes the
dwc->softconnect check, dwc3_gadget_pullup(g, 0) sees
pullups_connected =3D=3D false and returns early without waiting on
dwc->connect_mutex.  dwc3_err_recovery_work() then calls
dwc3_gadget_soft_connect(), leaving the controller running with active DMA
on dwc->ep0_trb when dwc3_gadget_exit() frees the endpoints and coherent
buffers.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-topic-usb_=
dwc3_fixups-v2-0-c0cc2b75c518@oss.qualcomm.com?part=3D4
