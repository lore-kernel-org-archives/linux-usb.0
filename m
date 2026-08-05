Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E92D45D5CB;
	Wed,  5 Aug 2026 12:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785931403; cv=none; b=afFsHL0oQlrthBot7syF/hJ7+kVMeDFI6zDFjbpa0UAwwnquBMdqvv2UtS3AKq2AYgLzG748cbsvW5iBhACOj+1MjN9ZW7CegRCk0jgGATGXzjwumuz7f9y9wMKCitPIORWRlKCTBKw/nWuQjDnTwT4xTtp3CunGGes1UlftDWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785931403; c=relaxed/simple;
	bh=HNgHMhbdyWWDobBy2wqG8V95y4HHRXnl3TkKRDP3gG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QdNRZLUVvM4AEuMvd3RGl1WSkVYMKk/Bb0WsArhPJCL3fSfnPRlkzCEkSp+rWu8daZqOM1aJD3mtEQVH9MmVRY+w+g4ssQD+wa59JXAjC0zsAEpzTSr8pQzIiFFjgwE8oB6cArg9Jqcn0Hr57XS+GXv2jLRyqFjtDtU0sWasEzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WOiKPlZG; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WOiKPlZG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785931402; x=1817467402;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HNgHMhbdyWWDobBy2wqG8V95y4HHRXnl3TkKRDP3gG0=;
  b=WOiKPlZG65NKANIVkPgNBHqUroyE7X81VVX3VOElBIG3iguhg/bimNJx
   b91QV49VEw8lTuCpMcW23ALvf5UBq6k/CIh3R6Bg8wRMVw+KpCq5lNmSU
   lVeHgZB2a2O9p/UREqeZajFcnNRgjUIt3TQDzLY6SVFnHqM6jGMwy26P/
   t0yqrs6sPXm1HeuXJjiqVqRQRJjWKkbx2aNQTmM2re+yPFqL1+QAPNNSX
   V07ULbeLbuj0NZ6FhIcRjrwdknWthwXsEEI7Rjb3oRTsBCAyjoUcp87uM
   nfbqnVd+FqI946d4gGmVMGvRjc43gvPoOh6GReCtZ8KJzEQdLFWYU1Cwx
   Q==;
X-CSE-ConnectionGUID: /bQolwmuTsC/nyFSUubEmw==
X-CSE-MsgGUID: i15rc9KjQWuWG/w9O0bdQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="86512785"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="86512785"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 05:03:22 -0700
X-CSE-ConnectionGUID: xcT82E9BR0aT36WZAyo5og==
X-CSE-MsgGUID: 3ktuOLYiSZmSbI4PNe0suQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="291722378"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 05 Aug 2026 05:03:20 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 2BF7E99; Wed, 05 Aug 2026 14:03:19 +0200 (CEST)
Date: Wed, 5 Aug 2026 14:03:19 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: Retry if notification enable timesout
Message-ID: <anMmhwSSLEAnAZZI@black.igk.intel.com>
References: <mpearson-lenovo@squebb.ca>
 <20260729182203.3667583-1-mpearson-lenovo@squebb.ca>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729182203.3667583-1-mpearson-lenovo@squebb.ca>

On Wed, Jul 29, 2026 at 02:21:50PM -0400, Mark Pearson wrote:
> Found on Thinkpad E14 G8.
> When UCSI notifications are enabled the FW does not ack the enablement
> itself. Future commands will be acked correctly.
> 
> If this happens try enablement again and confirm acks are working
> correctly.
> 
> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 49f1c53721bb..ea25c44c2850 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -2082,6 +2082,12 @@ static int ucsi_init(struct ucsi *ucsi)
>  	ntfy = UCSI_ENABLE_NTFY_CMD_COMPLETE | UCSI_ENABLE_NTFY_ERROR;
>  	command = UCSI_SET_NOTIFICATION_ENABLE | ntfy;
>  	ret = ucsi_send_command(ucsi, command, NULL, 0);
> +	/*
> +	 * Some FW may not ack the notification enable the first time.
> +	 * If this happens, repeat to confirm it is actually working
> +	 */
> +	if (ret == -ETIMEDOUT)
> +		ret = ucsi_send_command(ucsi, command, NULL, 0);
>  	if (ret < 0)
>  		goto err_reset;
>  
> -- 
> 2.43.0

-- 
heikki
