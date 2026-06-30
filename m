Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D2F3672AA;
	Tue, 30 Jun 2026 09:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782813332; cv=none; b=rwDhC6NWNhPMHD+pEOZzGWN+e+55XjE6rwKwvME6FTCRRIsQeHFQZ8rDcOBS19hIHcH89fGAeg2JTrlDjE3B12yAOqcifLpSi9gyFj0iSZe18SsW481ah3X6zyPG7dGFZoKkNrshiLiyITEDknoMgdFfwclBYq2HhUb6XyigAfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782813332; c=relaxed/simple;
	bh=37Q482x8iPzQC4fXjAYLpDLdf1CF178L0KR0JEH894E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nRFNwuIfayR409XWkxITvoWbg8hIexj0M2EzkW/aKFnYl604pDnnftYRms0lULIVNnFIE48v6mIwFZTGgYYr9u+x8MoHIIyHVOQPDtfe9qW4xGRWgecdz8YuiOI9FEaiLa8SRXaK1rv5unwv27lsoCMQEH+rZ+4USUQLIIxLMsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j/2ufVLl; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j/2ufVLl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782813332; x=1814349332;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=37Q482x8iPzQC4fXjAYLpDLdf1CF178L0KR0JEH894E=;
  b=j/2ufVLlqiOdUTSBJ1pOJZC/xLWXVIl9Qe8mqusLPPSPA3/P11v20Uvs
   uysy15QtGjpYmkKmbFh3g0qtBqyY2lM/V3DXcLL8HqF7GOMT3KlKYcSgT
   LSgMQ69XwImGIMw7zvEtXxrb7AXdRJY9S7NUrLkhrWc07GimyKcJJZcTM
   N/nST02RJwa9tHHrCmkdy21dmTzGO4tU2k95z4wCT86T5uZQylhTSzOxz
   QjFV/Jy+BN/ccCR6e2ITrFtcGoBq9vFn5bQQ+wFxtB37GgNjTeGz0eyu0
   HcaXWxSb6HOmz3F65HAZcmuWGYeyvF9rxvmPozxqURrP4Lue9wILStVDm
   A==;
X-CSE-ConnectionGUID: VCNeHqkcSTuoJYpqilLhpw==
X-CSE-MsgGUID: M3vjlgbPRQaFjgc/rQfFfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83398393"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="83398393"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 02:55:32 -0700
X-CSE-ConnectionGUID: IbrxWx3ZRt+M4mSk/mKz8A==
X-CSE-MsgGUID: V5iBEkwFQbKjG9Xyza+JDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="250533727"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa006.jf.intel.com with ESMTP; 30 Jun 2026 02:55:30 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 739DA95; Tue, 30 Jun 2026 11:55:28 +0200 (CEST)
Date: Tue, 30 Jun 2026 12:55:27 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Badhri Jagan Sridharan <badhri@google.com>
Cc: gregkh@linuxfoundation.org, amitsd@google.com, kyletso@google.com,
	rdbabiera@google.com, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v1] usb: typec: tcpm: Defensively bound altmode array
 accesses
Message-ID: <akOSj0k8GTHh5fUy@kuha>
References: <20260629225729.2749896-1-badhri@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629225729.2749896-1-badhri@google.com>

On Mon, Jun 29, 2026 at 10:57:29PM +0000, Badhri Jagan Sridharan wrote:
> While svdm_consume_modes() already prevents mode_data.altmodes from
> exceeding ALTMODE_DISCOVERY_MAX during SVDM discovery, defensively
> bounding array iteration indices against ALTMODE_DISCOVERY_MAX in altmode
> registration and unregistration helpers guarantees protection against
> out-of-bounds accesses in the event of memory corruption.
> 
> Ensure that tcpm_register_plug_altmodes() is also bounded alongside
> tcpm_register_partner_altmodes() and tcpm_unregister_altmodes.
> 
> Assisted-by: Antigravity:gemini-3.5-flash
> Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
> Reviewed-by: RD Babiera <rdbabiera@google.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpm.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 7ef746a90a17..c9ac9381b17c 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -2029,7 +2029,7 @@ static void tcpm_register_partner_altmodes(struct tcpm_port *port)
>  	if (!port->partner)
>  		return;
>  
> -	for (i = 0; i < modep->altmodes; i++) {
> +	for (i = 0; i < modep->altmodes && i < ALTMODE_DISCOVERY_MAX; i++) {
>  		altmode = typec_partner_register_altmode(port->partner,
>  						&modep->altmode_desc[i]);
>  		if (IS_ERR(altmode)) {
> @@ -2047,9 +2047,10 @@ static void tcpm_register_plug_altmodes(struct tcpm_port *port)
>  	struct typec_altmode *altmode;
>  	int i;
>  
> -	typec_plug_set_num_altmodes(port->plug_prime, modep->altmodes);
> +	typec_plug_set_num_altmodes(port->plug_prime,
> +				    min(modep->altmodes, ALTMODE_DISCOVERY_MAX));
>  
> -	for (i = 0; i < modep->altmodes; i++) {
> +	for (i = 0; i < modep->altmodes && i < ALTMODE_DISCOVERY_MAX; i++) {
>  		altmode = typec_plug_register_altmode(port->plug_prime,
>  						&modep->altmode_desc[i]);
>  		if (IS_ERR(altmode)) {
> @@ -4891,11 +4892,11 @@ static void tcpm_unregister_altmodes(struct tcpm_port *port)
>  	struct pd_mode_data *modep_prime = &port->mode_data_prime;
>  	int i;
>  
> -	for (i = 0; i < modep->altmodes; i++) {
> +	for (i = 0; i < modep->altmodes && i < ALTMODE_DISCOVERY_MAX; i++) {
>  		typec_unregister_altmode(port->partner_altmode[i]);
>  		port->partner_altmode[i] = NULL;
>  	}
> -	for (i = 0; i < modep_prime->altmodes; i++) {
> +	for (i = 0; i < modep_prime->altmodes && i < ALTMODE_DISCOVERY_MAX; i++) {
>  		typec_unregister_altmode(port->plug_prime_altmode[i]);
>  		port->plug_prime_altmode[i] = NULL;
>  	}
> 
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> -- 
> 2.55.0.rc0.799.gd6f94ed593-goog

-- 
heikki
