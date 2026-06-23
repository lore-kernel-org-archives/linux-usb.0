Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C783D5246;
	Tue, 23 Jun 2026 12:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782216734; cv=none; b=DdXmQIG+SzfvtrAg8uOkBpHrNRALEBilt2Q3duxQzqQSrF2taYYttTnTyK2M3iB4H8AN8Wkehyibh8xn/+gk161lfdW9nhAbjbKP+UaGqkCVypmTqeDiO+9G1KhEnkMEwpPnA6fNlRprhhfPhSI5D4PvkxYIKxYTMxlFq7oQjHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782216734; c=relaxed/simple;
	bh=EH9EcIzna55ddB1ECPmL4CvMEQp02/oALQmFNP80KY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EJ8irTMprjLiMNPI7lWplmRqJmH21cn/ur5eymWOQf7kf0xO69/gCkggAH6/N4730gWbnXDnCwUdzyUaT4OmgnwLc0kLS893AZgxdUcZcQrrCPZlptyXP337qJy/OZukC71Oek5iyFvBlZGUzkruSaPOy+PN6oKpvxAzsMRmWTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S6Cdi3Jw; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S6Cdi3Jw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782216733; x=1813752733;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EH9EcIzna55ddB1ECPmL4CvMEQp02/oALQmFNP80KY4=;
  b=S6Cdi3Jwy04z8rorOgFSmXH52Gbf23tg0wh07Ry0Qzkz8xaJHFVC6Pl+
   sNyQIoPLI2J+j/pmnXKlwcEa0RKAbDPHWUN6SVlXE0QMkoxVZ0h20IPss
   hLmROHRrQIutq4YeE8gqKlLyOBZo1NG9WI27PNpsDDGhBDu5LiNI24O55
   X2H6qrxn8l0tsGcKw9qCWF2m2s/S93NP4DX6e/XvUsGdKYpCnQuM+LYjz
   eJXvAOtpKCh8hu5lmvOAhD6z4X+xw4rSacbM3LV5IKuaaIBuEVT2fng1X
   TSBgDMxWe+9lr2gpg9g3Cn2Yg8Z6wCwjTJOjdmludtwQqbwgtFVy3Q/5O
   w==;
X-CSE-ConnectionGUID: NqLnLojhS0uOl5HJwRvAJw==
X-CSE-MsgGUID: rmunu6WJRxuHx6ojBna5oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="81936889"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="81936889"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 05:12:12 -0700
X-CSE-ConnectionGUID: VITcNh0OTTq6e3Td4U7s+A==
X-CSE-MsgGUID: QjycDJ8bQWKHTHZiCfdhVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="243142744"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 23 Jun 2026 05:12:10 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 2A6FC95; Tue, 23 Jun 2026 14:12:09 +0200 (CEST)
Date: Tue, 23 Jun 2026 15:12:07 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Badhri Jagan Sridharan <badhri@google.com>
Cc: gregkh@linuxfoundation.org, amitsd@google.com, kyletso@google.com,
	rdbabiera@google.com, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, stable <stable@kernel.org>
Subject: Re: [PATCH v1] usb: typec: tcpm: Validate SVID index in
 svdm_consume_modes()
Message-ID: <ajp4F-xwmRnwb8BE@kuha>
References: <20260622220803.305750-1-badhri@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622220803.305750-1-badhri@google.com>

On Mon, Jun 22, 2026 at 10:08:03PM +0000, Badhri Jagan Sridharan wrote:
> In svdm_consume_modes(), the SVID value is read from pmdata->svids using
> pmdata->svid_index as an array index without bounds validation:
> 
>     paltmode->svid = pmdata->svids[pmdata->svid_index];
> 
> If pmdata->svid_index is driven beyond SVID_DISCOVERY_MAX (16), it results
> in an out-of-bounds read of the pmdata->svids array. Because pd_mode_data
> is embedded inside struct tcpm_port, indexing past svids reads into
> adjacent fields. In particular:
> - At index 16, it reads the altmodes count.
> - At index 18 and beyond, it reads into altmode_desc[], which contains
>   partner-supplied SVDM Discovery Modes VDOs.
> 
> By injecting a chosen SVID into altmode_desc[0].vdo and driving svid_index
> to 20, the partner can force paltmode->svid to be loaded with an arbitrary,
> partner- chosen SVID, which is then registered via
> typec_partner_register_altmode().
> 
> Fix this by validating that pmdata->svid_index is non-negative and strictly
> less than pmdata->nsvids before accessing the pmdata->svids array inside
> svdm_consume_modes().
> 
> Assisted-by: Antigravity:gemini-3.5-flash
> Fixes: 4ab8c18d4d67 ("usb: typec: Register a device for every mode")
> Cc: stable <stable@kernel.org>
> Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
> Reviewed-by: RD Babiera <rdbabiera@google.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpm.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 7ef746a90a17..bc531923b1ca 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -2000,6 +2000,11 @@ static void svdm_consume_modes(struct tcpm_port *port, const u32 *p, int cnt,
>  		return;
>  	}
>  
> +	if (pmdata->svid_index < 0 || pmdata->svid_index >= pmdata->nsvids) {
> +		tcpm_log(port, "Invalid SVID index %d", pmdata->svid_index);
> +		return;
> +	}
> +
>  	for (i = 1; i < cnt; i++) {
>  		if (pmdata->altmodes >= ALTMODE_DISCOVERY_MAX) {
>  			/* Already logged in svdm_consume_svids() */
> 
> base-commit: 1c2b66a7d7257d2652aa41f9a860ecb96dde27dd
> -- 
> 2.55.0.rc0.786.g65d90a0328-goog

-- 
heikki
