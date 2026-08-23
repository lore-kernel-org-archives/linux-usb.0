Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932483D6CD8
	for <linux-usb@vger.kernel.org>; Sun, 23 Aug 2026 14:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787495498; cv=none; b=TOoGMOXmhwYpRAFmjT+/kzU1jv2HD7f7K2Cwb7uQkC1v5wMLw00zIj/2cIGK/5cgPPmhI9ytOJOYMb0/1CMFQxGKF30Pm0+k7iTKNoop8zt5nq3x87SxYHWfX/4EOrpP93gE5mPx5zf2NyRmiJBBBx9j79571NV2sgUGEGUSjEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787495498; c=relaxed/simple;
	bh=mEvtVi9t3NVeOL9Jdw/IDqIRtX3kZibIHAqZt1ID4AQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F3qWs4ASgr9ERR6bXQHQb0tC9lWAx5nqQVXwdD5ODfvieYsn75tAoVLFcZzlaZcPnbKtLDbXk+ZWhZpuGVs/T4rs6J6RhYvbT1XVlXVWReWrXAMIJFVglIpNm3wD8wVdLUJL7nOIQtKaJzNRXi20ZywFsdVrujBVU76x+XsBG8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=HuEUNIEQ; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="HuEUNIEQ"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-936cda0e3fbso187203185a.3
        for <linux-usb@vger.kernel.org>; Sun, 23 Aug 2026 07:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1787495492; x=1788100292; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bJ+wwSqN4An2CyZ4OdrqujUv6iCKOhazdx1oXLxdWwk=;
        b=HuEUNIEQaOu4nPay2pj1pVxojOJa38maUwZN5arKkG7FuTpsXniWTlOyzULAb/xx9o
         i+FycImy5DF+gh4XHAkVToCvsJpucyGZQ/7jATvrGhwAHQywPHvPteYRHoTAglFhfC51
         KD1yv2eIQNIku4PuJjT8A1qlGBH3aTOncNSPB8lxpKhRFQLIG3znvCbOlHL0VkgQf+LS
         nnizta+U+8QaOZpCZF2GD54jTTVOkVrTmzLZFGUGIioZwOoI+GNsTyp00dAA85gJNbJn
         htfo5f0+ixOWIBsjR9xRAMFsCDCu7SM9lFhU04gr2lddtJWIE88MBiZvhGM4zUhhjThQ
         phUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787495492; x=1788100292;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bJ+wwSqN4An2CyZ4OdrqujUv6iCKOhazdx1oXLxdWwk=;
        b=N0iQ1YnskyNB/TuVRnJTlwX+TYRZJvId3FhX0HBnTrgDzUmkF0SLkJ6rhArDK2SCc7
         zigB7Grxz4Cc5qFSZz5D6ZhZOfOVM4P3Vo0rxnjKAUPCEOo/SiTRVp0te4jTHgtjDBw3
         6VsH0u//TpT2RMAKV/8AToLhuqwVvoG7e2P9m/joRxF9BHl6HtxPHmn+Aj4efw4OrMUJ
         KwfV6Fo+eMZT/8cVoLmjV59FeqZXEhIQTW8YydV2Nb9K1AQcn0bAcsEg/9geF1hruv6t
         UdK8cpkVAeAc/ixgVjyhnac2H8/Rfc5vlRQYhHBQR8l9OJY6J9bieki0/MMdQ29xO3yJ
         P+uA==
X-Forwarded-Encrypted: i=1; AHgh+Rp5W5APuL8cKLkK8XNzETpnpMorVCXWZpVb9brZT/BuEMgHPMpC8ZLwmeJpVfKYhAAC2EEbSBHL7iY=@vger.kernel.org
X-Gm-Message-State: AFuF++lR5lsb/HAKi5n4u6ARXiBlKr8xSr2U0idwjgZUpIEyvEPHRU0J
	LaiMxKZVUiCx8eIrJne/Wf9J1uMGO6sppgRpLI1CSF31nVxUcB1YQv/4NGD+UfyXJ7G2gKljoPa
	CkXRYwg==
X-Gm-Gg: AR+sD10r2sv2ug2bOnsyK6Btgcq+qivQiHqFBAuis0vzB8yETV1UPhhUgd1vw9xB4ey
	iJHZMZ+9FmOIDhJMYQWgJzgPWIsnwZIRb+ll+zAChz1KN90BxFMojeSd6zRTolu2D1JsyahTONU
	HnYwN1sOipp8EiCEgTe4iYnAcf+jGABl70HpVj33IYcpkAB8BiTa/mWQwmReumMZEhja8lA8mZt
	ldQPCud0KXL+boWQ5Huqn+S+OMCO/8yubMZk5sYQbEvb/rB6GU5D7XYH2TqiaH/jQc63fd53BGd
	nE7OoZIViS7PrF5zszsuXn+5gmtLxFNOfNencTBPjIxZpCAOuDr+Vawe36PTVjgreWwjyJqqWgt
	Aor3FECczOvHifB/YaxyW93csJqjgRfBObJ7O4tZrmTe05u548aiNRPwamKhLw+Ds1Dw0bNgDJw
	G9xjITYrYtMN2LFmZXH6SOTzxZm28U2oCmnst47Yv1UJ67LI3hx0m5xkE6lrZDfw==
X-Received: by 2002:ae9:f115:0:b0:937:26c3:747f with SMTP id af79cd13be357-937468baea7mr879186885a.15.1787495492393;
        Sun, 23 Aug 2026 07:31:32 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::dfd8])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93749d9537fsm307153285a.31.2026.08.23.07.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 07:31:31 -0700 (PDT)
Date: Sun, 23 Aug 2026 10:31:28 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Oliver Neukum <oneukum@suse.com>, Ming Lei <ming.lei@canonical.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: hcd: Cancel BH giveback works on removal
Message-ID: <f107bce6-85e8-48ce-b744-7daf41cce565@rowland.harvard.edu>
References: <20260823125831.6ea35650.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260823125831.6ea35650.michal.pecio@gmail.com>

On Sun, Aug 23, 2026 at 12:58:31PM +0200, Michal Pecio wrote:
> Turns out, we do actually need to flush them, because workers use the
> 'high_prio_bh' and 'low_prio_bh' members of 'usb_hcd' for a brief time
> after all URBs are completed to track pending completions and possibly
> reschedule themselves, see usb_giveback_urb_bh() implementation.
> 
> Flushing would suffice if the works don't reschedule themselves, but
> cancel_work_sync() is more robust against stray completions.
> 
> Syzbot may have found the issue due to unlucky hard IRQ timing. It can
> be reproduced by adding udelay(3000) in the work function, disabling RH
> autosuspend to maintain the status URB and unbinding a real HC:
> 
> [10818.828029] ehci-pci 0000:00:12.0: USB bus 1 deregistered
> [10818.828077] hcd_release freeing high_prio_bh ffff88814a950978
> [10818.829211] usb_giveback_urb_bh still running on bh ffff88814a950978
> 
> Reported-by: syzbot+cade843a1e4af0651f5e@syzkaller.appspotmail.com
> Link: https://lore.kernel.org/linux-usb/6a8a5047.dbb3a75c.13dd47.003e.GAE@google.com/
> Fixes: 94dfd7edfd5c ("USB: HCD: support giveback of URB in tasklet context")

While that is logically correct, in fact the patch won't apply as-is to 
any commit earlier than 8fea0c8fda30129b ("usb: core: hcd: Convert from 
tasklet to BH workqueue").

> Cc: stable@vger.kernel.org
> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
> ---

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/core/hcd.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index ee19628cd653..b17fd8a0a90a 100644
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c
> @@ -3053,14 +3053,12 @@ void usb_remove_hcd(struct usb_hcd *hcd)
>  	mutex_unlock(&usb_bus_idr_lock);
>  
>  	/*
> -	 * flush_work() isn't needed here because:
> -	 * - driver's disconnect() called from usb_disconnect() should
> -	 *   make sure its URBs are completed during the disconnect()
> -	 *   callback
> -	 *
> -	 * - it is too late to run complete() here since driver may have
> -	 *   been removed already now
> +	 * Hopefully no complete() callbacks are running anymore; disconnect()
> +	 * methods should have waited for them to prevent UAF of driver data.
> +	 * However, we still must kill these works so they don't UAF the HCD.
>  	 */
> +	cancel_work_sync(&hcd->high_prio_bh.bh);
> +	cancel_work_sync(&hcd->low_prio_bh.bh);
>  
>  	/* Prevent any more root-hub status calls from the timer.
>  	 * The HCD might still restart the timer (if a port status change
> -- 
> 2.48.1
