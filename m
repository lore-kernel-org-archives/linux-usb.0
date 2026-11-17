Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794914831;
	b=dYovntq5BHQnr2BTUlEi51CDf+zAqqhVkKaEmGNB6IXr0PiucWQpavJfbUeKmWE/KQwp
	 cOLQMjm0SdPM0LL58ipVAcugcwzSQ8mL8lTexHo6rcKkSiQgShiNQfeJkL9oVZ/IZZD3c
	 j9Wu+9l7J6Zd62mbCpIPJx3RQ59ApynUrSgnlDtJ3+wTkAvMuVEfSnpfb7+HQZbmHhu/J
	 Cj/e9hdh5vLJAhKcu/zHx7DoxYXDhjfbpJmmd4jhJxwcnC5sJG8+EEbcOxbaVED/iI/81
	 NEgHVhOkHwIy1JMbm5e38MTPGGTIcuzfZ3YcUehe5s90/kz4i5mSyQj10CGrdGDH65Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794914831;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=QPAPvGBfnkOn6DrmTpqDyduhHOhK/9G5n0SIw0otNC4=;
	b=PEdK3+U3yrl6+hTJMvGJ3er6vZZGqh3x8wEDgy4HCW5IUbGSt76r3qGSxAXOKJR9+GYB
	 14o1OZD0CR5TIehKVWYb8tDDZyK5zxL0bl8W17ByFdfRqwQ8M5US3NmDEX6LO4wvISWhG
	 nha85Ce0qlIhM08dBzWQmiWXT5LkdBGABrxN16gO4om6C06ELtXNhkLfxrTyzOp+J+4ZY
	 rPfUywJKFAkUOkTxan+zaQ9HJ8u9r1YFBJuxcvwoi43Ljizh9opRrBp16Mauat4KiIngO
	 0nAvq64Uv1X49WnYW6/aWdXPvR2N6NpWrgNOO9XiWygFfJDL+EVZbD51BfRAfx1a0lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Kvihhq6d;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85906606A31C
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 11:27:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85906606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Kvihhq6d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794914831; x=1826450831;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RYAO+nhlpdzE4/5k04Ukqsq9rR2H83xRzAS7sTbXMP4=;
  b=Kvihhq6d2TuPkE+VTk1ho/DjtD4e3Urf7HHWcZBR6lYYeIxYRBdTa7n6
   oaeV82QjCll+r+jYE83ArwfHLwFt6ROM1qtUTlEQlYeQDqR0u6eFvx28I
   5IgX5TMfB48OU15ni4AY6gbKR/K26266C6tpFCyVhnziEgI8YmEgF5aYi
   cDqOWnD8Wb/N1l0vlWw0c2qtvppEUD8AvM7/iWnCxFZd4phvO7oRi3lo3
   umgs3REawVpc+rTADvw7N7RsTTyM8/lY3CMR2T82wRXsR4EZ7Oj5lOzkY
   fLphKSdvK3jATJoy1EWta7NCZcvK3PqSbV/rP3sE2ghNCztX8kscVhVsU
   A==;
X-CSE-ConnectionGUID: 7nY+D+n7RHyPv7jPiZVWlQ==
X-CSE-MsgGUID: Fg/api3yTxyqi0KOxn/oIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3684324"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3684324"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 03:27:09 -0800
X-CSE-ConnectionGUID: HmPyOM8CREmdUEgel9Zv2g==
X-CSE-MsgGUID: HbRzGgOfQ2KmAj1u3vigeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="11619937"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa011.fm.intel.com with ESMTP; 17 Nov 2026 03:27:08 -0800
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id B899099; Tue, 17 Nov 2026 12:27:06 +0100 (CET)
Date: Tue, 17 Nov 2026 12:27:06 +0100
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: memoriaru@foxmail.com, RD Babiera <rdbabiera@google.com>
Cc: linux-usb@vger.kernel.org, badhri@google.com,
	gregkh@linuxfoundation.org
Subject: Re: [PATCH usb] usb: typec: tcpm: align SOP' Soft Reset handling
 with SOP
Message-ID: <avw6CtZkJqvwj4eL@black.igk.intel.com>
References: <tencent_E92BE5AC4B6F212D7B309853D803D54D270A@qq.com>
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
In-Reply-To: <tencent_E92BE5AC4B6F212D7B309853D803D54D270A@qq.com>

On Sat, Nov 14, 2026 at 06:20:54AM +0800, memoriaru@foxmail.com wrote:
> From: Zhang Hewei <memoriaru@foxmail.com>
> 
> The PD message duplicate-check and the SOFT_RESET state handling treat
> the SOP and SOP' channels differently:
> 
> - tcpm_pd_rx_handler() exempts PD_CTRL_SOFT_RESET from the MessageID
>   duplicate check on the SOP path (the USB PD spec 6.6.1.2 note: a
>   Soft_Reset Message always carries MessageID zero, so the duplicate
>   check must not drop it), but the SOP' branch of the same switch has
>   no such exemption. A cable that sends a second Soft Reset over SOP'
>   (MessageID zero again) has that message silently dropped by the
>   stale rx_msgid_prime comparison, and the cable-side re-negotiation
>   stalls.
> 
> - run_state_machine()'s SOFT_RESET case resets message_id/rx_msgid but
>   not message_id_prime/rx_msgid_prime, while the initiator path
>   (SOFT_RESET_SEND, SOP_PRIME branch) resets both counter pairs. After
>   a responder-side soft reset the prime counters stay stale.
> 
> Reset the prime counters together with the SOP counters and exempt
> Soft Reset from the SOP' duplicate check, aligning the SOP' handling
> with the SOP path.
> 
> Found by code inspection; a software TCPC stub was built for the
> responder path.
> 
> Fixes: 6bd181ba60 ("usb: typec: tcpm: add control message support to sop'")

+RD

> Signed-off-by: Zhang Hewei <memoriaru@foxmail.com>

You should CC stable:
https://docs.kernel.org/process/submitting-patches.html#select-the-recipients-for-your-patch

Thanks,

> ---
>  tcpm.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tcpm.c b/tcpm.c
> index bb90211..95f748d 100644
> --- a/tcpm.c
> +++ b/tcpm.c
> @@ -4200,7 +4200,8 @@ static void tcpm_pd_rx_handler(struct kthread_work *work)
>  		 */
>  		switch (rx_sop_type) {
>  		case TCPC_TX_SOP_PRIME:
> -			if (msgid == port->rx_msgid_prime)
> +			if (msgid == port->rx_msgid_prime &&
> +			    type != PD_CTRL_SOFT_RESET)
>  				goto done;
>  			port->rx_msgid_prime = msgid;
>  			break;
> @@ -6193,6 +6194,8 @@ static void run_state_machine(struct tcpm_port *port)
>  	case SOFT_RESET:
>  		port->message_id = 0;
>  		port->rx_msgid = -1;
> +		port->message_id_prime = 0;
> +		port->rx_msgid_prime = -1;
>  		/* remove existing capabilities */
>  		tcpm_partner_source_caps_reset(port);
>  		tcpm_pd_send_control(port, PD_CTRL_ACCEPT, TCPC_TX_SOP);
> -- 
> 2.39.5 (Apple Git-154)

-- 
heikki
