Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E85639EF1C
	for <linux-usb@vger.kernel.org>; Tue,  6 Oct 2026 16:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791303181; cv=none; b=bUncUo9QKaD9wGHzfwuN3KrRD5EuWN5aJaxbk03CJQEIN8Obta1YrDNvh4cGSy9RDobJMpRxX/2EfD+OOd0DU2drxZIXHapTEDXOgBQtYZRGBHwCnE4SueTNOzRv2pD1avhBZEpxvq6MJ9dIOi5DHNw4MrkVcTYk09aADZ7viuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791303181; c=relaxed/simple;
	bh=FinCzGcBafJaML69pfuQwMTlzuvGAQ8+PIem8FA6fkA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rzgBfDFEk+r5UGsrWe+Lh2LuMgco45O1FqTYcJcW9RSOAKzBcTH+J7feT5Oj3DJQCOcEfv+86uzQqaxNw89oobKRUtAGAeIHSjQLkXAHgU/03ZjsePNIkEOyjzWtqRR2wDr5xXnZcY4/WB5oBLuLGsw+vDa2EcntCJ+wwtx3RZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aTFqWpT/; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aTFqWpT/"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso26405975e9.3
        for <linux-usb@vger.kernel.org>; Tue, 06 Oct 2026 09:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791303178; x=1791907978; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=da/zXONwF/VGMpDytwVjUzJii6EVxO1k5dm4c4ZEj3M=;
        b=aTFqWpT/07gCgIOADMUoBjJAEECYvQ/ln9a/VEjJpnPW7lTOJmimFoyi0CHta4Rfcg
         sVLxapbuUwI4Mv9ORlzrQKGTaTYE+oHFONaRQo8kGgPbBKGhi85tH9vqcMXaC5n/eJcB
         4P1g1GyDYdH9/3xx7msylXzTBLT8xlmo4keY1RtFJmgvnZVbyec3T0AcQR/tX47LtJi+
         rk12yAvuzc3QwzYT5REH+WoV3rGUQAXuUAGSOSH/9fpKMKR4LeeQSexuipWIeRpXY3xL
         i6+sCF7MqHT1fvAeyQ2DnDwECbyM7txxrh0CP3N4twFeuAYSKCC2h/4aWcRKAPwbNMSL
         uhcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791303178; x=1791907978;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=da/zXONwF/VGMpDytwVjUzJii6EVxO1k5dm4c4ZEj3M=;
        b=Vrh6/UyrapFDKbmudzd4vGs+Z+P21QCUsDp3HFb5pT8HstBNBe2JSNhBRtzdGRJR6D
         6AYHXG8kFo3/bnjOaqCTq8SSG10XFi+fO/fkMQlhGcDvAPjKoo6zJOU7pUN5N3M+RLE0
         D+oJ53p7RsOM3G4YBEGqLadAAIce66tBXyovOp874HKdptpfiJIrVn5No0qiH1T70HA9
         vg4cGVPvFfwLB4Z1077VDAba9EtsdL+crymkFn2cIuPImwofOjpoiGbU+gy9t8GwDxFI
         AqQ6gkGQc8ZiRW50yQltgLd15CyR83AW3DyvC4nN7/kheeM5vkDW8Qx/XSpJsNKDjfqR
         gySg==
X-Forwarded-Encrypted: i=1; AKwUvBw+jrRhvY7cwh/mR0f8KuJjOP4wpLetqJrPMXfhT4dIR1+wzc/2Q1qa7gyuhEzgXpvB76VG7PW+YxI=@vger.kernel.org
X-Gm-Message-State: AFuF++k625za94klK4UR+pOsR7RCgYpmDKO1iiM6YiEFWbe7QnMILRPv
	pQs+Tg+BhPQS+gxpRGmvztntkWj6iLz/670HKM7gXzVxkR62eXrwFcSjORuYacHL
X-Gm-Gg: AYBFou2hrUmhBq+fdhSF3db0EUV2ro/0WuYC3sP8gTGREdHLVy9DFzobL+F4csNHyR4
	jpVOr5YpeII3UTAmBWoyW5+K7CTBQ5S6NlN8hU+e912uSH10akh1jrcPBdx/048gdXJRhVDgKr+
	zfBvnokzFVTBXnaQmDc8xAYCVSm67ZHGEJemm99heVQxFzykzmojF35IBMZLfG9f2fqJpAHcm3z
	A47NxqgTOGowfT3PS3Fa8ICl3VpTncyiuEd2xR+5dR1d7JvkmUe8jUIrEa8l5HnTntlFo4YxWpu
	M2Y3eE8b9yJC4X0v9QKU/7MvyYXD5SaEwYXAHCgACeQfQedV0JCZwzLJuk9pNKL87uP1WHAoibN
	8DFDQNkqu7LsQBwj4624+xD/DINHDe5/HnZnvx5cjToR/Z4EMMUdj3ZrjGZB/EzajPFw8Fv2q/V
	bltmzfElbYHIr27tVBa0ah/xzGxBeAW1rD2/KnYHTHAPnpLtZtdY74FYUOtVCLs/SoT2MSZLA2p
	9l5918ufA==
X-Received: by 2002:a05:600c:6098:b0:49c:fed6:cd3f with SMTP id 5b1f17b1804b1-4a1680ed16emr180086805e9.23.1791303178097;
        Tue, 06 Oct 2026 09:12:58 -0700 (PDT)
Received: from foxbook (bez186.neoplus.adsl.tpnet.pl. [83.28.37.186])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03950375dsm174452625e9.1.2026.10.06.09.12.57
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 06 Oct 2026 09:12:57 -0700 (PDT)
Date: Tue, 6 Oct 2026 18:12:54 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Niklas Neronin <niklas.neronin@linux.intel.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org, Harald Judt
 <h.judt@gmx.at>, Lovekesh Solanki <lovekeshsolanki00@gmail.com>
Subject: Re: [PATCH 1/5] usb: xhci: clear stale bandwidth data after
 hibernation
Message-ID: <20261006181254.309bde85.michal.pecio@gmail.com>
In-Reply-To: <20261006152427.3735383-2-niklas.neronin@linux.intel.com>
References: <20261006152427.3735383-1-niklas.neronin@linux.intel.com>
	<20261006152427.3735383-2-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  6 Oct 2026 17:24:23 +0200, Niklas Neronin wrote:
> Controllers using software managed bandwidth accounting maintain
> periodic endpoint bandwidth information in struct 'xhci_interval_bw_table'.
> 
> Each root hub port owns a bandwidth table and a list of TT bandwidth
> domains, where each TT has its own bandwidth table. Virtual devices
> reference the bandwidth table of their current bandwidth domain through
> 'bw_table' or 'tt_info'.
> 
> Historically, resume from S4 re-allocated the entire xHCI driver state,
> which implicitly cleared all bandwidth accounting data. After the
> hibernation resume path was optimized to preserve parts of the driver
> state, virtual devices and TT bandwidth information were freed and
> recreated, but the root hub bandwidth tables were left intact.
> 
> As a result, stale bandwidth accounting data could remain in the root
> hub bandwidth tables across hibernation resume, leading to incorrect
> bandwidth calculations after devices were rediscovered.
> 
> Fix this by resetting all software bandwidth accounting state in
> xhci_rh_bw_cleanup() so that resume starts with a clean bandwidth state.
> This includes 'xhci->num_active_eps', which must remain consistent with
> the cleared bandwidth tables.

If that's the case then it would make sense to put this inside
xhci_rh_bw_cleanup() rather than xhci_resume(), wouldn't it?

> Fixes: <2a70e5dc0301> ("usb: xhci: optimize resuming from S4 (suspend-to-disk)")
> Reported-by: Harald Judt <h.judt@gmx.at>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=222071
> Suggested-by: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
> Tested-by: Harald Judt <h.judt@gmx.at>
> Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
> ---
>  drivers/usb/host/xhci-mem.c | 16 +++++++++++++++-
>  drivers/usb/host/xhci.c     |  1 +
>  2 files changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
> index af8d4b74c4ba..75577f441cdd 100644
> --- a/drivers/usb/host/xhci-mem.c
> +++ b/drivers/usb/host/xhci-mem.c
> @@ -1903,24 +1903,38 @@ EXPORT_SYMBOL_GPL(xhci_remove_secondary_interrupter);
>  void xhci_rh_bw_cleanup(struct xhci_hcd *xhci)
>  {
>  	struct xhci_root_port_bw_info *rh_bw;
> +	struct xhci_interval_bw_table *bw_table;
> +	struct xhci_interval_bw *interval_bw;
>  	struct xhci_tt_bw_info *tt_info, *tt_next;
>  	struct list_head *eps, *ep, *ep_next;
>  
>  	for (int i = 0; i < xhci->max_ports; i++) {
>  		rh_bw = &xhci->rh_bw[i];
>  
> +		rh_bw->num_active_tts = 0;
>  		/* Clear and free all TT bandwidth entries */
>  		list_for_each_entry_safe(tt_info, tt_next, &rh_bw->tts, tt_list) {
>  			list_del(&tt_info->tt_list);
>  			kfree(tt_info);
>  		}
>  
> +		bw_table = &rh_bw->bw_table;
> +		bw_table->interval0_esit_payload = 0;
> +		bw_table->bw_used = 0;
> +		bw_table->ss_bw_in = 0;
> +		bw_table->ss_bw_out = 0;
> +
>  		/* Clear per-interval endpoint lists */
>  		for (int j = 0; j < XHCI_MAX_INTERVAL; j++) {
> -			eps = &rh_bw->bw_table.interval_bw[j].endpoints;
> +			interval_bw = &bw_table->interval_bw[j];
> +			eps = &interval_bw->endpoints;
>  
> +			interval_bw->num_packets = 0;
>  			list_for_each_safe(ep, ep_next, eps)
>  				list_del_init(ep);
> +			interval_bw->overhead[LS_OVERHEAD_TYPE] = 0;
> +			interval_bw->overhead[FS_OVERHEAD_TYPE] = 0;
> +			interval_bw->overhead[HS_OVERHEAD_TYPE] = 0;
>  		}
>  	}
>  }
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index a9e47e178c28..4708fabba84a 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -1185,6 +1185,7 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
>  		for (int i = xhci->max_slots; i > 0; i--)
>  			xhci_free_virt_devices_depth_first(xhci, i);
>  
> +		xhci->num_active_eps = 0;
>  		xhci_rh_bw_cleanup(xhci);
>  
>  		xhci->cmd_ring_reserved_trbs = 0;
> -- 
> 2.50.1
> 
