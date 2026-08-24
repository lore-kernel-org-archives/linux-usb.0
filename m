Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288EA40DB51;
	Mon, 24 Aug 2026 11:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787571045; cv=none; b=XeNNr6huiA3e/zOrvIcVQ46BKgEGbHLVW3oE3wzzHItDy+MPh067UkfCA6MIb18dGQoIWfv8iW3sdwGSMerMDMVPPZ88Qj9JObFJuIY1VsAVw3PgSU+xNf+0QTmQ3EJAYaH5Fn5NmPPd9EccL8kOeuDAZLt/sw3r/+pr/BvZ9ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787571045; c=relaxed/simple;
	bh=GP8wZtqjruHsbTyR3J4PDQDDVmSrCezj465xeEf/l3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n/d3cy0MViUgPXa8Y/iAtIV2Sr4no/ZEL6bkf9T4S5kECQ/nMwo16/OEE43mSoYj5PkB9CMr5PpN+4Ald+EGWzspXpdVhM1BIhufH4Un3kXIwEY7RYpYE20k1xLmOkicgH5+qIsjdGyx3NmY6hzXtDnATSEGKvaGeJAnvazG6zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XZcCBUGV; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XZcCBUGV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787571044; x=1819107044;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GP8wZtqjruHsbTyR3J4PDQDDVmSrCezj465xeEf/l3Y=;
  b=XZcCBUGVfLJYWf4xjNoMVWPDDWFCJw/Q1h4+T5UwSjv4m9tK8PqeYpS9
   2fBTxh0CpK3G+xCI3og1iT5cmwLbJXYEhHaahZCWUwyA1171gyF14r+86
   VCdHIqQJsp+YV7S6tlWhIcTNTsmscVW7NC42grpfvWF8WGk+yf4hrU7+f
   o9MEYAzQ2TJRVjI+uWSVJ8voqdbC8uVT5MYdE2dsrJbMvVXuRzVHqeBgp
   fIuv1yS2tQdNji/RPUbCojDfx+xC3DeDcQEFH/ImcsBxVbBZ5c1pIwzYe
   wbewsC1qgSMXCvkUmQ+4XyIFsgLcGPvTBjZml6pDW8ldahbjTSgbYMvag
   Q==;
X-CSE-ConnectionGUID: Rn/i8KHZQV6Id8qEZ5FGpA==
X-CSE-MsgGUID: DrtJyncRTOmpxBJ5pho7gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="88145367"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="88145367"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 04:30:43 -0700
X-CSE-ConnectionGUID: LhYp9fhfQXSTli61QbQmbg==
X-CSE-MsgGUID: NSiZk8rKTdu90QK4rMHVXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="265670080"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 24 Aug 2026 04:30:41 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id CC7A499; Mon, 24 Aug 2026 13:30:39 +0200 (CEST)
Date: Mon, 24 Aug 2026 13:30:39 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Akash Kumar <akash.kumar@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/3] usb: typec: ucsi: ccg: Add support for
 cypd6129/cypd6229
Message-ID: <aowrX4f-Xe00iIxz@black.igk.intel.com>
References: <20260821-shikra-usb-dt-v7-apply-v2-0-628885fc1d0e@oss.qualcomm.com>
 <20260821-shikra-usb-dt-v7-apply-v2-2-628885fc1d0e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-shikra-usb-dt-v7-apply-v2-2-628885fc1d0e@oss.qualcomm.com>

On Fri, Aug 21, 2026 at 07:34:32PM +0530, Akash Kumar wrote:
> Add cypd6129 and cypd6229 compatible strings to the of_device_id
> match table so the driver binds to boards describing these Cypress
> PD controllers in their device tree. No other driver changes are
> needed since the chip is accessed through the same generic UCSI/HPI
> I2C register protocol as the existing cypd4226 support.
> 
> Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi_ccg.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
> index d46ca942026e..37b96d662e59 100644
> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
> @@ -1527,6 +1527,8 @@ static void ucsi_ccg_remove(struct i2c_client *client)
>  
>  static const struct of_device_id ucsi_ccg_of_match_table[] = {
>  		{ .compatible = "cypress,cypd4226", },
> +		{ .compatible = "cypress,cypd6129", },
> +		{ .compatible = "cypress,cypd6229", },
>  		{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, ucsi_ccg_of_match_table);
> 
> -- 
> 2.43.0

-- 
heikki
