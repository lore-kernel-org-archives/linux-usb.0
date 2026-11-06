Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793986954;
	b=V+SpPEZdr6hgicYXB0zAUuJUPDiNoP69QC9B4r7GF5P5k46k84yoEu+mJ0/KHrCObuYH
	 qb9Ll8j6NMLAt2nw/bRmBP/P5ExjqRcVWgRXaGJ1lNvo6ZVJqGiICuO1PEvTBdaLuKXfy
	 LeZ21j1QqfVJUm9S8cSMRI70c3jJ3SQpJ1756Gek+/T2wqdbgtfEiZHWhz28RpAx5/K1q
	 5ZbLewSpHSruUBWbZwr/W1xV3ODUQrJhWXClkQgtD3kLTF+qVnlue9TNVnNxwhL7SoHOo
	 Fi0kAWKbNbOczKgwdCaFtNhbY1T6rZSqWiiMElELQfIeNa7KyBfdywpJP4HfK44ZcZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793986954;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=V4hQgC2uNHuhvF9QnB+g/Sz4anz/Mwy/0zqg8F8HwcE=;
	b=fY5fNwCEDrdyqFv/TP1I8V6v97sIA232RSvzdQGqjx6Z/fTwE90A8oVtl0zP9ARJCjTu
	 WCARHF5aN5RDfpHUZxLlPI9rUNkiEsfOavPn1R9ScxhRwjJvE4palfqRTU8UrXqR63xRS
	 JbSUGbO1tlydbby1AohY8unf+9dxI0W/pVytYEp5nPdyWdQw8rmXVZyY+2VO3RmC7cZiC
	 /cANL8lVa8srGmH0C9834wFudqG0mD4Hl3wJg51BbnxnvRiSDmUwxI3qIscZ2u8D/wRmg
	 CP0ptWHmuaYu/CS/I83piW6iieaujZBhOoS0YN9R+VYbFeCm58J1m85vhzd7l1rAvGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Zu8DsoHV;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701D1606A329
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 17:42:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 701D1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Zu8DsoHV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793986954; x=1825522954;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=j9WRjm5JR4TlN6ftk0mYasBgisBol0psl6TBJ5ZWfg4=;
  b=Zu8DsoHVS/LLvAXMr2pSdWhgzcnkLsQnKhIPWdRJYjDSFEeqU9flxviA
   jONRR9LmoZCMuet5Ewx4/SOErl0tneubTulsnN5kBXDwlxucEGz4bq0MW
   YpcEzvM+9TtOMJ3O/4xIWLGswuDtGKN84lXWzDpNH1byxybHicnO+4lrO
   HLrKSkoiizQRMyEbd8CQOTi3Re7+G2Xe23FSIN7L2QhzEM5i+l6FPmhfa
   iVj159QOtN0LoIfPChrFVbjr2n/BMqRUtQPA2fu5KcpsYatsZB3ghAZyJ
   8+MiScLxVisCqlvPHW6vGqPySNRlUJA9lk4PSpB6W/hXq9ZVcAZZCz4zW
   w==;
X-CSE-ConnectionGUID: PR8f+5oPQEKWvQFPeDygXw==
X-CSE-MsgGUID: U2fzAsqkRuq6/R9cxh2xRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2673703"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2673703"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 09:42:33 -0800
X-CSE-ConnectionGUID: NAIeYLopSxSHjSICFy3GEA==
X-CSE-MsgGUID: GZLbbeJVSIKwDhVsR2zgDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7200675"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 06 Nov 2026 09:42:30 -0800
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id C4D4E99; Fri, 06 Nov 2026 18:42:29 +0100 (CET)
Date: Fri, 6 Nov 2026 18:42:29 +0100
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: thunderbolt: release a non-Thunderbolt cable
 plug
Message-ID: <au4RhYRvP2s8Rzoa@black.igk.intel.com>
References: <20261104021516.1468625-1-vulab@iscas.ac.cn>
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
In-Reply-To: <20261104021516.1468625-1-vulab@iscas.ac.cn>

On Wed, Nov 04, 2026 at 02:15:16AM +0000, Wentao Liang wrote:
> tbt_ready() takes a reference on each cable plug with
> typec_altmode_get_plug() and keeps it in tbt->plug[] for the lifetime of
> the alternate mode.  When a plug reports an SVID other than Thunderbolt,
> the loop breaks without storing the plug, so the reference taken for it
> is never dropped.
> 
> Put that plug before leaving the loop on the SVID mismatch path.
> 
> Fixes: 100e25738659 ("usb: typec: Add driver for Thunderbolt 3 Alternate Mode")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/altmodes/thunderbolt.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/altmodes/thunderbolt.c b/drivers/usb/typec/altmodes/thunderbolt.c
> index 2e1b1a1da7d9..fad48aae6751 100644
> --- a/drivers/usb/typec/altmodes/thunderbolt.c
> +++ b/drivers/usb/typec/altmodes/thunderbolt.c
> @@ -340,8 +340,10 @@ static bool tbt_ready(struct typec_altmode *alt)
>  		if (!plug)
>  			continue;
>  
> -		if (plug->svid != USB_TYPEC_TBT_SID)
> +		if (plug->svid != USB_TYPEC_TBT_SID) {
> +			typec_altmode_put_plug(plug);
>  			break;
> +		}
>  
>  		plug->desc = "Thunderbolt3";
>  		plug->cable_ops = &tbt_cable_ops;
> -- 
> 2.34.1
> 

-- 
heikki
