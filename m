Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795465820;
	b=pOZFP/cDnJfx0M/x4oPr8xmhB+PZE0t3ZfsQZRn2/DORW7IBMais4goUPanpTGLXikjs
	 e3XYd8s1imvFo6RZHQ7qP8Fyu0HF2jDF8SpmkkarID90u5W2CSN1Ad57BGMYRDlFHE3IC
	 J5Dfd9dH+BTFvGkI+k+UUbU1+znJLrP9BujMoVpCBsg0DGO+kuUrtzCXUj9q8ckrcrXim
	 BH8dVqsw1Y+VVlivKwaJOlFA70Kt9glCnS/fX6Y5dnKTC2s/YEo6fFtOvmzNCnzwDgBzk
	 ygABMSxacbgLIO7o5odeO/VcTyZ2d90MEMb9Zao4vus24Lqeu1fEllE0gjpIpVxHNJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795465820;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Ek9MsgC6HgRnN+6jsWwMnDvGNex1fqGz52HopGoKvIU=;
	b=4gwcNjcQSt7BQQ89leBvEHDaHUz3OSU9N5RboG5YZPZCKqlwrKkePw4d1Q4i6opbO1UO
	 i3X9WbvSg8IVbjnfA415Je6x/reI6kidknXL7CBJhiJtl+i04CFASp0uctFHIlKhzTZZS
	 L5X5bjKWwq9Ry5On3Lh3sz3M0bfJGLkSkedMXV1eEfAGK16sPpN31/MPv6vD4ZincF5FE
	 zdVK2eLwIt/ARbYXnqJxh1JnJznqfXlxbLInnFsBCH3B5O6S/4YSIdTLFpaArOXqjM8Dk
	 x3vic9sCA44unnLbo+1GnBLGZEeKE8w+vIzKEYpRU/lXABH0R+/8XuG7LGumEZ9Pigw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZH0541sg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33537606A32A
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 20:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZH0541sg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C20761F000C4;
	Mon, 23 Nov 2026 20:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795465819;
	bh=Ek9MsgC6HgRnN+6jsWwMnDvGNex1fqGz52HopGoKvIU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZH0541sgqi1uijHT8d3RZbp0Iw5f7vtCys97gumllmlT6Ewi3jO3azetEKO1k9QUR
	 KaYXIVr52Clv4GQID8bftBKc7wqnDDg1wvBLRhXwtcBjwS+yNYEWcjr+AVAfikWQ87
	 zb7KwH9IKbwlgqSzu/Rn0m5pCawpthVENmxAmgPakxMZN3bSYIbMSC26B1UmcyMbm4
	 Jm8qpLGV22uaKczco6JIeQy/EMFcnLIAMJGNsOhOnpPUTckO73ubYUFC4Z/2iSZfqO
	 4T0mFiCz2kJbzUW3XWGCGC8CLMkcXNoAbqOYvcPSPhB7vf1XOs0M3BsC9S1COAHoNs
	 PtFgkDWDpdguw==
Message-ID: <sashiko-outbox-229992@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: dwc3: gadget: destroy connect_mutex after
 usb_del_gadget
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261123-topic-dwc3_gadget_fix-v1-1-dec7679b81b7@oss.qualcomm.com>
References: <20261123-topic-dwc3_gadget_fix-v1-1-dec7679b81b7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 20:30:19 +0000
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
- [Low] usb: dwc3: gadget: missing Fixes trailer for commit 1ff77cbefe5a
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [Critical] usb: dwc3: gadget: premature connect_mutex and work
  teardown in dwc3_gadget_exit() [1]
--

commit 12a4a58348a4c5787efa091b578e45677e1
Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

> usb: dwc3: gadget: destroy connect_mutex after usb_del_gadget
>
> usb_del_gadget() unbinds the function driver, which may still call
> dwc3_gadget_pullup() and take connect_mutex. Destroying the mutex
> before that point leaves a live lock behind during teardown.
>
> Avoid it.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

[Severity: Low]
Should this include a Fixes tag for the commit that introduced
connect_mutex and placed mutex_destroy() before usb_del_gadget()?

  Fixes: 1ff77cbefe5a ("usb: dwc3: gadget: fix IRQ storm on invalid event b=
uffer count")

> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index a76f669a796c2..673f4bffb8ca8 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -5027,9 +5027,9 @@ void dwc3_gadget_exit(struct dwc3 *dwc)
>  		return;
> =20
>  	cancel_work_sync(&dwc->err_recovery_work);
> -	mutex_destroy(&dwc->connect_mutex);
>  	dwc3_enable_susphy(dwc, true);
>  	usb_del_gadget(dwc->gadget);
> +	mutex_destroy(&dwc->connect_mutex);
>  	dwc3_gadget_free_endpoints(dwc);
>  	usb_put_gadget(dwc->gadget);
>  	dma_free_coherent(dwc->sysdev, DWC3_BOUNCE_SIZE, dwc->bounce,

[Severity: Critical]
This problem wasn't introduced by this patch, but can
dwc->err_recovery_work still be rescheduled before usb_del_gadget()
finishes [1]?

dwc->irq_gadget remains active until usb_del_gadget() stops the UDC and
calls dwc3_gadget_stop() -> free_irq():

CPU0                                    <hardirq>
dwc3_gadget_exit()
  cancel_work_sync(&dwc->err_recovery_work)
                                        dwc3_check_event_buf()
                                          schedule_work(&dwc->err_recovery_=
work)
  usb_del_gadget()
    ...
    dwc3_gadget_stop()
      free_irq(dwc->irq_gadget, ...)
  mutex_destroy(&dwc->connect_mutex)
  dwc3_gadget_free_endpoints(dwc)
  usb_put_gadget(dwc->gadget)
                                        dwc3_err_recovery_work()
                                          mutex_lock(&dwc->connect_mutex)
                                          ...  <-- use-after-free

Should cancel_work_sync(&dwc->err_recovery_work) also be moved after
usb_del_gadget() (right before mutex_destroy())?

[1] https://sashiko.dev/#/bug/linux-daa55f7b-cbeb-467d-b442-1d3982b1d885

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-topic-dwc3=
_gadget_fix-v1-1-dec7679b81b7@oss.qualcomm.com?part=3D1
