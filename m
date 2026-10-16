Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03F63546E5
	for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 15:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792163071; cv=none; b=nSbGyLeQ8k5HRGbN06zng+4usb9hg5KhmMYC8MtYgLsrmjTAOI2Fw5nvcDcAFgDZFnYaYQlpQPejPzIerxMcVhu8uNQg25/RZQIu9BAgbkt2fpoocmtf37krULi7iS53IG1lfeWLVd4NKyTToA3taAzF+YSQ03ZqZkNb6udiuO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792163071; c=relaxed/simple;
	bh=gZ8M3YL4vY9/T1pAnpyOkHKYnY0l+cf+z0EF5NoQEA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GCbXHZAdFHgkpqRqQi2KET3Y5kukEiqIdIttnXSmp2Y2l6P4XDcKnlomu/1DZMLqOu1pbIyUnSxmcPp7bcHc25RU5TkrMcp6zBbiEJN0aLaOc2/ECHB0YkiaDXRuRWdK6Ejm4fvtWqD/RIi0X6T9k/pCl+AbGU+8MEQ5GIWdQPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=vw6mGejP; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="vw6mGejP"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-93e503815adso3210585a.1
        for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 08:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1792163069; x=1792767869; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QjMVhSxuyV4C5Y9lVNWGp1YsEKYu5m2G3O2NV9TfmW8=;
        b=vw6mGejPE0aLkGRv9hs9nCBeabPMPFWvgkNZcGFLmodh06ASEGBJfYYUEYjV8ZLbCh
         jIQBcLFz6AFKLw1eya7jeAZP1bBEFgljLCh5WTClX7it4JazLLpR+YNBfsX8rfhK+RA0
         Bb9hcSbEfxtN51KlPMoYkoGClJkiSfMUXMuLDtBPApKZPWh7E2JA7hYjRUJ0VsChM9mC
         ExHoRsPY46gkY6Rl7wB2EHPFDIHa03N7/mb3414T6DD1IxAAflzIfcR7nRthpWlRSYxn
         V2XCYpuI1bs/MaSou0NilaNYCJB8ng/zJsgvEFuD7wPhAsW+4Kalq3qCPgtZENUhUy7W
         ioRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792163069; x=1792767869;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QjMVhSxuyV4C5Y9lVNWGp1YsEKYu5m2G3O2NV9TfmW8=;
        b=o0UaMtYEP3Qyp4fJTbfiPtMXpKDhwao5LtKtOFsLVYGBAeNjJO3yPQT0kN5jIxSsTG
         VD6JhFla8sPR6/GWtCKZBkF3qQuAWwZGt99u04WIuOLr9g1llO5pFkK9ZlLjVPH6MP7N
         wx5zZAJW4H1yaepkXRjFSleRPlUTCn2V5Sown6mLZpn22yPseTfwhMG6J0WauWn63l/V
         bwFP4IZV0owSesgAwwAfjR93vrIF4olNPJ73j1qGInVLsrWmWPGCDXCKKSC/4DpaE+wZ
         xk4Zww66Ylr9N+Ujki6ZAdRyEYxVvuAKFzXnLjaXg+XQzmJxIZYAVavGXTCRjoCkupnc
         bgjg==
X-Forwarded-Encrypted: i=1; AKwUvBzNkL2L9B7O1Sd4o7mA72osNXBfL1hxZCkYYkyWzAr+iVIltb2pzhonkANdFdSBthnKKAwRgq70u+Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYJLkragrHTesGMO3fW5LdM8EXhWIarnU38O86sbSV5NOe0FXavd
	aVkcbSfPha6wtTLcfJ8uAd16LQBKDI2MaTOJ2fbx4BYL0MHlsY1tSEQbi1qyEdGdJv5zpwjXYtJ
	yN8Yt+A==
X-Gm-Gg: AYBFou2c8F/a+vECgfBhLFOCfjASGKb9qFIZYGSmn3LhdbGV+y9vxl+NQCvo8uBQNCx
	jCQaf8ZxLwFpMipNhx6yHT+fjny/yYmQeK++bsTIKmLOhwczt7AOzqOdO1eP2+Z6ceiERM6ashS
	I7S5shygIftUdfa5huartJUZtKQNjherSiL85Hhi6E+JSFm7loAwk3WfYnIKmj324SNlhAcej8D
	COrg+s9HBGAUgXLNzCZd7tawKYbX59znreMjjonTXYLEzPpGB2Rg61OP8dwoa9tnVCmNZbf6K8t
	qTO8Ha6T5PDIltadgtCEBhdzYHlhqhOdA88FX33s/XhISCTVixlA4+VaWKXfnriAJFxGTqDrnqD
	6zmLla/VlY71L8B08M5c8XDrC2ZSn30TRT7CmN1Higlk0cC9O29P6gHyfc3UUmMMs+4s+spLGnG
	qQ+e4EV9TPZG5SRiNrfOiMLKI8MmmeOq3eSEngk6/LS/kSmW/QZYPV5U8RvYmlZ6pwKd8kDvo=
X-Received: by 2002:a05:620a:439b:b0:93e:e1fd:b87f with SMTP id af79cd13be357-93f29e17275mr10664485a.83.1792163068256;
        Fri, 16 Oct 2026 08:04:28 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::4791])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a1b882asm227739285a.42.2026.10.16.08.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 08:04:27 -0700 (PDT)
Date: Fri, 16 Oct 2026 11:04:24 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Joe Wang <joe_wang@aspeedtech.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-aspeed@lists.ozlabs.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: ehci: Quiesce ASPEED EHCI before halting it on
 shutdown
Message-ID: <7dfc5ef1-a466-4d78-af65-147bee8fe698@rowland.harvard.edu>
References: <20261016-upstream_ehci_aspeed_shutdown-v1-1-8440c13b5652@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016-upstream_ehci_aspeed_shutdown-v1-1-8440c13b5652@aspeedtech.com>

On Fri, Oct 16, 2026 at 04:53:07PM +0800, Joe Wang wrote:
> On ASPEED EHCI controllers, clearing USBCMD.RS while both the periodic
> and asynchronous schedules are enabled may leave the controller unable
> to halt. If an asynchronous transaction is in progress when RS is
> cleared, it may run past the end of the micro-frame. The controller then
> clears its internal schedule buffer at the start of the next micro-frame
> while it is already walking the periodic schedule, issues a DMA read
> from address 0x0 and never sets USBSTS.HCHalted.
> 
> ehci_shutdown() calls ehci_silence_controller(), which halts the
> controller without first turning off the schedules. For ASPEED
> controllers, call ehci_quiesce() first to clear CMD_ASE/CMD_PSE and
> wait for STS_ASS/STS_PSS to clear, as ehci_stop() and
> ehci_bus_suspend() already do before halting. This is also the stop
> sequence recommended by ASPEED.
> 
> Quiesce the controller after setting rh_state to EHCI_RH_STOPPING.
> The asynchronous and periodic schedule-enable paths require
> EHCI_RH_RUNNING, so this ordering prevents them from restarting the
> schedules while the controller is being shut down.
> 
> Allow ehci_quiesce() to operate in EHCI_RH_STOPPING as well as
> EHCI_RH_RUNNING. As documented for enum ehci_rh_state, both states
> indicate that the controller may still be performing DMA, while
> lower states indicate that it is not.
> 
> The controller-death path in ehci_irq() also sets EHCI_RH_STOPPING
> and clears CMD_RUN, CMD_ASE and CMD_PSE. A quiesce call in that
> state writes the command register with these bits still cleared
> and polls the schedule status bits using the existing timeout
> limits, without re-enabling the controller or its schedules.
> 
> Signed-off-by: Joe Wang <joe_wang@aspeedtech.com>
> ---
> This issue was observed on a customer host platform using the AST2700
> PCIe EHCI (ehci-pci), and the root cause was confirmed by the ASPEED
> hardware team in RTL simulation. The stop sequence used here (clear
> PSE/ASE, wait for PSS/ASS to clear, then clear RS) is their
> recommended workaround and was confirmed to resolve the issue on that
> platform. All ASPEED EHCI controllers share the same design, so the
> workaround applies to every controller with is_aspeed set.
> 
> The quiesce is limited to ASPEED controllers to keep the change
> minimal for other platforms.
> 
> Tested on AST2700 (ehci-platform): ehci_shutdown() and unbind/bind
> (ehci_stop()) with a hub and USB mass storage under load, no
> regressions.

Under what circumstances does ehci_shutdown() run without ehci_stop() 
being called first?  Is controller death the only possibility?  If the 
controller is dead, will quiescing work?

Is there any real reason not to do this on all types of EHCI controller, 
not just ASPEED?

> ---
>  drivers/usb/host/ehci-hcd.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/ehci-hcd.c b/drivers/usb/host/ehci-hcd.c
> index 3c46bb18c7f3..d984987c8691 100644
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
> @@ -372,6 +372,14 @@ static void ehci_shutdown(struct usb_hcd *hcd)
>  	ehci->enabled_hrtimer_events = 0;
>  	spin_unlock_irq(&ehci->lock);
>  
> +	/*
> +	 * ASPEED EHCI may never halt if RS is cleared while both schedules
> +	 * are enabled, so turn them off first. rh_state is STOPPING at this
> +	 * point, which keeps them from being re-enabled.
> +	 */
> +	if (ehci->is_aspeed)
> +		ehci_quiesce(ehci);

Don't you want to check whether the controller has already been 
quiesced?

Alan Stern

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
