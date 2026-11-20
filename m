Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795179871;
	b=gui3JnjDLdTdyL2PtY/tbTJqYSK3+n7VXCWp/2gJ6amSjy8FyhL4y2PiAuuOkHxBcZVc
	 sSlieidSLEZEep/cX/oSmDrIkZBVSGNlKlDymoj/BcW8lFhGjeN7reLmlMCtp+rIJ8z63
	 pN6gPeBRU4IaoBdhynfhHmvRXCgYWKrVHXCqIMhh3CM7wClxFIMib2QNGLYU8ek0BEjDS
	 u8r0duLOxtTgJ+tOUVd+xB3BKC0sN4cgy7MZDNMEVfg6+D/L+f+wxHGtBGcCmwf0k3V3d
	 PvaaJqGYH19xvRY0BUXTGRQ546BuH6fChU3z50HGdEHVIpZdv/7IdLyMd2sSb9AYSqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795179871;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=57NqVdT5Ut497wVZVij6dLcLAO9M4UJHmoqxupxCIXk=;
	b=mqTjOClQ0GF2uK3f9OeLTmh28ytWGBs3L53Brf1aGJ1aPEyVNedMgQ0C6eRVAx+HdfxU
	 jDbyQqvXzZcvKxydaT6ufmppel9W1wCzbwhT3bzhyexbZvsRVxMItJE03+ncjRtcrAVAx
	 kWaPHY+JQDJ3gDPRUoBX/dffVCCQ0iD7BTUX9suuw0uvPiCQU5riq2dIL91AkiRabn+Hr
	 ZZrpRb1K9Rp0osWpyF7qggIacXV4LtVEeaZ3C71Xu3f9KML1jLmKojROzddl4P/a5FRAN
	 TEQNmLaBQGHGvCJzkjlm249V9xk2tbq5PMDYNoAztuOMumZ5Jng3kcZtSKXUMAkQwZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=boNlYjUq;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1A0606A334;
	Fri, 20 Nov 2026 13:04:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD1A0606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=boNlYjUq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795179871; x=1826715871;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lc+LDUmFAPm2RQSNsqpd1cHScsqx8B8ucTDvbZujHis=;
  b=boNlYjUq1q6YJCrbNN3T9yJUsamLkV1/+81HB3X3AeVY1LANgQ1d31iw
   WhzczoLWHyxH8I40J5VdT/ZGew0zHWzUxwlyvHNxq+zn0HSR+yzOt3LPv
   e8jSBjxbg7nJSXjepx0dKWm48UYdORRASQ9ZVdn8riPsWLBsXV4qeW7qV
   Cvptn54MpQPkfXStLDFCnIJJqZ9Sun9cuRBeUirnp9E5ONzQmi55++9Ia
   No3Blm8EpFtiJvx6Bu9Q5ZSdoUhzb2qhM2M5NRHgd3y/+vSHp2xLjc7pG
   vWNo3Nk+4pxdk2xHKxsmyuXq+ijNbEcfx5UQeYOlnUX/lj+k5mX7eFh9V
   g==;
X-CSE-ConnectionGUID: N+85d0qVQF2hJGxpyErOFw==
X-CSE-MsgGUID: oj+T8NF5QXOl5ENNWkhpNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4054554"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4054554"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 05:04:30 -0800
X-CSE-ConnectionGUID: nf4Kvsf8Qa6A9vxe3Iq4ww==
X-CSE-MsgGUID: LtnVtiCwScCvf3630yj+cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="10595490"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 20 Nov 2026 05:04:28 -0800
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 5D46999; Fri, 20 Nov 2026 14:04:26 +0100 (CET)
Date: Fri, 20 Nov 2026 14:04:26 +0100
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Alexey Charkov <alchark@flipper.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>, Yueyao Zhu <yueyao@google.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: fusb302: Keep interrupt flags across a
 failed register read
Message-ID: <awBFWmpR9hPkcerN@black.igk.intel.com>
References: <20261117-fusb302-irq-read-error-v1-1-a85d45b91912@flipper.net>
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
In-Reply-To: <20261117-fusb302-irq-read-error-v1-1-a85d45b91912@flipper.net>

Hi Alexey,

On Tue, Nov 17, 2026 at 12:25:31PM +0400, Alexey Charkov wrote:
> Reading INTERRUPT, INTERRUPTA or INTERRUPTB clears its flags in the chip,
> so bailing out on an I2C error in a later read loses the flags already
> read. On Flipper One, a NACK on INTERRUPTB just as a source raised VBUS
> lost VBUSOK. The driver kept treating VBUS as off, so TCPM never attached
> as a sink and left every Source_Capabilities unanswered.
> 
> Keep the flags pending until they are handled, and retry the reads a few
> times, as such errors pass. Otherwise a flag left pending waits for the
> next interrupt.

I did not quite understand this. What's the i2c error? Shouldn't the
i2c adapter driver take care of the retries?

> Fixes: c034a43e72dd ("staging: typec: Fairchild FUSB302 Type-c chip driver")
> Signed-off-by: Alexey Charkov <alchark@flipper.net>

No stable?

Thanks,

> ---
>  drivers/usb/typec/tcpm/fusb302.c | 62 +++++++++++++++++++++++++++++++++-------
>  1 file changed, 51 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
> index 83bd287dadc7..9fb76fdd3b7b 100644
> --- a/drivers/usb/typec/tcpm/fusb302.c
> +++ b/drivers/usb/typec/tcpm/fusb302.c
> @@ -100,6 +100,10 @@ struct fusb302_chip {
>  	bool intr_togdone;
>  	bool intr_bc_lvl;
>  	bool intr_comp_chng;
> +	/* interrupt flags read from the chip, but not handled yet */
> +	u8 pending_interrupt;
> +	u8 pending_interrupta;
> +	u8 pending_interruptb;
>  
>  	/* port status */
>  	bool vconn_on;
> @@ -1499,6 +1503,43 @@ static irqreturn_t fusb302_irq_intn(int irq, void *dev_id)
>  	return IRQ_HANDLED;
>  }
>  
> +/*
> + * Reading an interrupt register clears its flags in the chip, so keep them
> + * pending until handled: a bus error on a later read would otherwise lose
> + * them. Such errors pass, so retry a few times.
> + */
> +static int fusb302_read_interrupts(struct fusb302_chip *chip, u8 *status0)
> +{
> +	int ret, tries;
> +	u8 flags;
> +
> +	for (tries = 0; tries < 3; tries++) {
> +		if (tries)
> +			usleep_range(1000, 2000);
> +
> +		ret = fusb302_i2c_read(chip, FUSB_REG_INTERRUPT, &flags);
> +		if (ret < 0)
> +			continue;
> +		chip->pending_interrupt |= flags;
> +
> +		ret = fusb302_i2c_read(chip, FUSB_REG_INTERRUPTA, &flags);
> +		if (ret < 0)
> +			continue;
> +		chip->pending_interrupta |= flags;
> +
> +		ret = fusb302_i2c_read(chip, FUSB_REG_INTERRUPTB, &flags);
> +		if (ret < 0)
> +			continue;
> +		chip->pending_interruptb |= flags;
> +
> +		ret = fusb302_i2c_read(chip, FUSB_REG_STATUS0, status0);
> +		if (ret >= 0)
> +			return 0;
> +	}
> +
> +	return ret;
> +}
> +
>  static void fusb302_irq_work(struct work_struct *work)
>  {
>  	struct fusb302_chip *chip = container_of(work, struct fusb302_chip,
> @@ -1521,18 +1562,17 @@ static void fusb302_irq_work(struct work_struct *work)
>  	intr_bc_lvl = chip->intr_bc_lvl;
>  	intr_comp_chng = chip->intr_comp_chng;
>  
> -	ret = fusb302_i2c_read(chip, FUSB_REG_INTERRUPT, &interrupt);
> -	if (ret < 0)
> -		goto done;
> -	ret = fusb302_i2c_read(chip, FUSB_REG_INTERRUPTA, &interrupta);
> -	if (ret < 0)
> -		goto done;
> -	ret = fusb302_i2c_read(chip, FUSB_REG_INTERRUPTB, &interruptb);
> -	if (ret < 0)
> -		goto done;
> -	ret = fusb302_i2c_read(chip, FUSB_REG_STATUS0, &status0);
> -	if (ret < 0)
> +	ret = fusb302_read_interrupts(chip, &status0);
> +	if (ret < 0) {
> +		fusb302_log(chip, "interrupts left pending, ret=%d", ret);
>  		goto done;
> +	}
> +	interrupt = chip->pending_interrupt;
> +	interrupta = chip->pending_interrupta;
> +	interruptb = chip->pending_interruptb;
> +	chip->pending_interrupt = 0;
> +	chip->pending_interrupta = 0;
> +	chip->pending_interruptb = 0;
>  	fusb302_log(chip,
>  		    "IRQ: 0x%02x, a: 0x%02x, b: 0x%02x, status0: 0x%02x",
>  		    interrupt, interrupta, interruptb, status0);
> 
> ---
> base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
> change-id: 20261116-fusb302-irq-read-error-8a3ca5ef9ebc
> 
> Best regards,
> --  
> Alexey Charkov <alchark@flipper.net>

-- 
heikki
