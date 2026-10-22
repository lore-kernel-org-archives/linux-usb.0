Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792633666;
	b=ZDK+hfT6zgyDdzwqy+W9pTLV88/x/5sQVMKaHhY2p5docouHfOhFBK27PmqgOOKJYULg
	 HH2R0BDnK2YIsFPaGt38Vh+x5cJ4Q2z2xrQW2N5P4ixhRNNwCu95YpLMljKSEGAoZrqyU
	 McHzipvHSY9WQIgt4h3JNWcoQRVlqntUoNlq4sqiABiH9IiKhfe7z5OxM2ohACPX+tN9s
	 rI7czqa3DR4UPNo4gA5JRXR2BIskgRL3fZNnNcoVNbNoZYZri6FDry7Ez5tU55/gy37DS
	 luAsHEDWT+L1b4HCvl+SlPbXYDE/tAQF71RePqHDLSk+vwfKuvQQLzjHzDabkGgGp1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792633666;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=gYKqhMNUDqm7sf/jtPqhDcMNm1ldVrzzvJB2Y2KBTPk=;
	b=ntL3dV2H2KObhSXpvQkVY7avQF5mpYSqVmEiNwc34PMXbG+agD5ysoEq8R2xNui0newm
	 Tn8TcKxOX8jQ5JQg3w1VxJ6FIgbBDILu+5Q15j+xVawJA1FP1QmMl/JL4ZWj1QORXPINr
	 4Ou1ktK/z5wVeV0zQkFhLwuDXYLsVKeweY+2rbvOtHHtjFxiyKNEC//CCIbGDRp2jKk2J
	 +gzWXriR4V8P4F265ge4TOAbWUwmw6RtyJD3z22WqgQI9imr5wOmKIjIbqYqXpqbyQJUn
	 W04a9U6cbF+L6FLbHJkEwPaRp8/oRnt8Lxj21tmPoB4KYHwhIvWLiryYvBCehM4TkxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=nXxj1A75;
	arc=none smtp.remote-ip=209.85.222.173
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D61606A319
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 01:47:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6D61606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=nXxj1A75
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93a40a9a01aso55629885a.0
        for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 18:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1792633665; x=1793238465; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gYKqhMNUDqm7sf/jtPqhDcMNm1ldVrzzvJB2Y2KBTPk=;
        b=nXxj1A75zJ3ME9bxbMTnoHw8JSyLmgR58jQTvpfcRcZnEsPfyyAJxz6MiOMRf77ipP
         PpRl3Zq3XnJMhS26FnGpIq7XjEQnA1+akk2dlr3iHML6tiOtvyvs9rg+QKBS6+GmJURS
         +vXULOnY6aic56GzVQ4rX2rEOwofw2rSJeZ3nnsZNybcrvh8gU56XwmnhQqk2m4GO6AP
         MxQpAFtjXjJquLGhtAX0Pejz8bGlplFy2Vnse4mGDX4PdiexnkVo2MEaIYszu+G+r4Sh
         epvdo4ez6HruQW59ldwf0xmEKzX4OO1WJFdUSW/f8KTOYQvASZdq9UElMqetcflJASuO
         0NrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792633665; x=1793238465;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gYKqhMNUDqm7sf/jtPqhDcMNm1ldVrzzvJB2Y2KBTPk=;
        b=GVX/gyWom5cImGj78NwmY0XsYLjEgDY7HcVX2Ecvec8F6pKZoR4zGzlUdVhEQ3J5kQ
         RBcXyVFG0P5GURESC1cOAeg9D4NB+H+DyIuqZzJxjyLNlvJaO0CkuhHCDI5SLmMWPMCu
         tL+GsSzmQt/jmwjRP2WWmdy7WBPPVVsEGX9Dig0ELtUHvL1uHTBMYrXHAenxRxbtpvj6
         AfV3NT3OnJPoqIAzspGpOJ41pO9yZBVR6NM046mJqUD0SjuUmKt1/G8qnNhX+d0qHUm7
         aYKe/YVI9jru9ySOGcduyjr+WhaYYMkXUFYmakUTB8+ZDtPqW8TUxv77H6pZLyAgM3e8
         wxsw==
X-Forwarded-Encrypted: i=1; AKwUvBwvo7LjIA7yHLhinKXAtg+qFa4/9HDS2GcWD9L5gSdhfxuRBtZKyAH3DAL1BcGt7W6XRQR1DPsSg3g=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNz6iEj47JTRA0EqXKVAUfTa6ts9/thkN5QpmsBdiqKoh/ehjS
	nv+q5E+f8FEv81ewxeU8w31y+SQkRcbkwIHZHwzfPgB3Oaa1OaeeSadTdPU75vPCDg==
X-Gm-Gg: AYBFou2JdbDcimHu6GMttaOoJCowYPou4Rr/7x5Agn4SHbNHna/tbv2lU1iSZxZfnbH
	GSbedBgl0kZRdkZleSjfzAHQFdp1yizg9CBR/lMmBA/eqVNQznwv42YMECV71ysvDxGuC6qnFDw
	O76gIbEMSl4pSbqFdqia2DxeCQTy7yv843nxqEZFdBgZexo1BHx+4qzdQB1xZrTGjULKIcY/TTG
	aX+xHWCfWaSiLlmvInDhZoqQUEjnX/ppKFR21J4bgu0ExYEtzwe2YbAlpLMjcqFjo/xGauS2PeC
	7oD1wc4aOYBbvqLIgspqT9pOzRqYMRBaR6dHQnT4ULr6xbyME1VPPIceKkkMF56dY34sgxHXJzR
	yWwX44u3UJBsneiBqOLdxdjDm3hq17mH0Voz1xWjHq3aILTeWcDxxgKdSO3taeFHPd80YiFh+cV
	vZW3JHqe6vdF/+F89jbRMx3Re65LPvk3OzZqbnj3h4mgg0XsHqtCmF38N/ZFeNhzw3FDjKWYOY1
	GPuATzsPuYnmUs7HNV2s7DR6XJZagGnvczr9be7tzw7oWilvW3FmsPq
X-Received: by 2002:a05:620a:84c4:b0:93f:16d4:3c0a with SMTP id af79cd13be357-93f6248e92emr176006185a.4.1792633664545;
        Wed, 21 Oct 2026 18:47:44 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::4791])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f56e246cesm398743785a.38.2026.10.21.18.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 18:47:43 -0700 (PDT)
Date: Wed, 21 Oct 2026 21:47:39 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Joe Wang <joe_wang@aspeedtech.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-aspeed@lists.ozlabs.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: ehci: Quiesce controller before halting it on
 shutdown
Message-ID: <0acd4f35-4b99-41aa-a9c6-2764a6744c8d@rowland.harvard.edu>
References: <20261022-upstream_ehci_aspeed_shutdown-v2-1-62712169bc07@aspeedtech.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022-upstream_ehci_aspeed_shutdown-v2-1-62712169bc07@aspeedtech.com>

On Thu, Oct 22, 2026 at 09:21:11AM +0800, Joe Wang wrote:
> ehci_shutdown() runs from the .shutdown callback during reboot,
> poweroff and kexec, for example when LinuxBoot firmware boots the
> final OS. The HCD is not removed in that path, so ehci_stop() is not
> called and the controller may still be running. ehci_shutdown() then
> halts it without first turning off the schedules, leaving a DMA master
> running while the system shuts down.
> 
> On ASPEED EHCI controllers, clearing USBCMD.RS while both the periodic
> and asynchronous schedules are enabled may also leave the controller
> unable to halt. If an asynchronous transaction runs past the end of
> the micro-frame after RS is cleared, the controller walks the periodic
> schedule with a cleared internal buffer, reads from address 0x0 and
> never sets USBSTS.HCHalted.
> 
> If the controller was running, call ehci_quiesce() before halting it,
> as ehci_stop() and ehci_bus_suspend() already do. Do this after
> rh_state is set to EHCI_RH_STOPPING, so that URB submissions and
> hrtimer events cannot re-enable the schedules, and let ehci_quiesce()
> accept that state: like EHCI_RH_RUNNING, it means the controller may
> still be doing DMA. The controller-death path in ehci_irq() also sets
> EHCI_RH_STOPPING, but it has already cleared CMD_RUN, CMD_ASE and
> CMD_PSE, so a quiesce there cannot re-enable anything.
> 
> Signed-off-by: Joe Wang <joe_wang@aspeedtech.com>
> ---
> This issue was observed on a customer host platform using the AST2700
> PCIe EHCI (ehci-pci), and the root cause was confirmed by the ASPEED
> hardware team in RTL simulation. The stop sequence used here (clear
> PSE/ASE, wait for PSS/ASS to clear, then clear RS) is their
> recommended workaround and was confirmed to resolve the issue on that
> platform.
> 
> When the controller is running, the added delay at shutdown is bounded
> by the two existing 16-uframe handshakes in ehci_quiesce().
> 
> Tested on AST2700 (ehci-platform): reboot with a hub and USB mass
> storage under load, ehci_shutdown() on already halted controllers,
> and unbind/bind (ehci_stop()); no regressions.
> ---
> Changes in v2:
> - Apply to all EHCI controllers, not only ASPEED (Alan)
> - Quiesce only if the controller was running (Alan)
> - Link to v1: https://lore.kernel.org/r/20261016-upstream_ehci_aspeed_shutdown-v1-1-8440c13b5652@aspeedtech.com
> ---
>  drivers/usb/host/ehci-hcd.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)

Acked-by: Alan Stern <stern@rowland.harvard.edu>

> diff --git a/drivers/usb/host/ehci-hcd.c b/drivers/usb/host/ehci-hcd.c
> index 3c46bb18c7f3..d9d816eedc66 100644
> --- a/drivers/usb/host/ehci-hcd.c
> +++ b/drivers/usb/host/ehci-hcd.c
> @@ -274,7 +274,7 @@ static void ehci_quiesce (struct ehci_hcd *ehci)
>  {
>  	u32	temp;
>  
> -	if (ehci->rh_state != EHCI_RH_RUNNING)
> +	if (ehci->rh_state < EHCI_RH_RUNNING)
>  		return;
>  
>  	/* wait for any schedule enables/disables to take effect */
> @@ -356,6 +356,7 @@ static void ehci_silence_controller(struct ehci_hcd *ehci)
>  static void ehci_shutdown(struct usb_hcd *hcd)
>  {
>  	struct ehci_hcd	*ehci = hcd_to_ehci(hcd);
> +	bool		was_running;
>  
>  	/**
>  	 * Protect the system from crashing at system shutdown in cases where
> @@ -367,11 +368,19 @@ static void ehci_shutdown(struct usb_hcd *hcd)
>  		return;
>  
>  	spin_lock_irq(&ehci->lock);
> +	was_running = ehci->rh_state == EHCI_RH_RUNNING;
>  	ehci->shutdown = true;
>  	ehci->rh_state = EHCI_RH_STOPPING;
>  	ehci->enabled_hrtimer_events = 0;
>  	spin_unlock_irq(&ehci->lock);
>  
> +	/*
> +	 * Turn off the schedules before halting. rh_state is STOPPING now,
> +	 * so they cannot be re-enabled.
> +	 */
> +	if (was_running)
> +		ehci_quiesce(ehci);
> +
>  	ehci_silence_controller(ehci);
>  
>  	hrtimer_cancel(&ehci->hrtimer);
> 
> ---
> base-commit: 2f2f7eeef8b0a1a9b9ca998231419873ccae8d4e
> change-id: 20261016-upstream_ehci_aspeed_shutdown-9ccffedb2a1c
> 
> Best regards,
> -- 
> Joe Wang <joe_wang@aspeedtech.com>
> 
