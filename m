Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D639036B935;
	Wed, 12 Aug 2026 09:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786525589; cv=none; b=ssAN5wmD4apGbNq0nevkl/DfdxBQslwKAW/X0nHggAWTrGs63RaHgUOTEnjWZt1v2Qec5I3Ws1XaycmLDanensQcRZZY9h6137vCcqccsBsAJt62BBQ7gEmPxSAWRUnrT3zlfJyXXwRk7t4G+7sncBpgjhYhkj2tdOUP+HpWAUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786525589; c=relaxed/simple;
	bh=qy6djTO7sWuBgh5JocslGluW87BsnxYQyKhEbMehVPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oKqlt2J2voruFNiC0rPJ/UyFisYQY6r1W49rqEK/UN5zNgfIWBxlVzGWKkIQjDe14KtcpWNtNDy5UzuAHAjN+8zZX1SmL6IAcXr5NXDFDQ2OC9mpm8r48PHWG6xBzp2JfaCcth0E1ID/9G2iYpCMK2tlhnF9H8kTUUHYyxHYOH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iMUdcEkt; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iMUdcEkt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786525588; x=1818061588;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qy6djTO7sWuBgh5JocslGluW87BsnxYQyKhEbMehVPU=;
  b=iMUdcEkt0vDLUIGCA0V734B44m3PSne8lLApaQWKfai1HmTN572IonpM
   DInvGTo8IOu8J1OJKncV4cBcuKe2dLgGtDfpFo7q8Au4EDv8RN4XvKE3s
   8b7CrajXWHLtYZcqB0ygqTE/HyHdZMzCm50pXANGwEbHw5uTVAX0tasxq
   XQZ0tgcOaN/uUFYkePbkTxPMvDgol+iHB0QQExFbUrq8rFQIVddQveeNm
   oy3OEITQlFqhrOqeu9KwcAsTgWy3JKW7knLrStn97sG868fFH8syCfRBI
   v91DUy0FWVvGW2C1hCV6vNYJPbIAzpMO2QIgAGTSHOWZZiqOjP5MsdxWO
   A==;
X-CSE-ConnectionGUID: dVYGPPqVSkW1UwELc/TDcw==
X-CSE-MsgGUID: 5F++5gK+QrGBVMJ9PQBNbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="90883576"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="90883576"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 02:06:27 -0700
X-CSE-ConnectionGUID: +WoxjT9iRL+SCobP3hxVLg==
X-CSE-MsgGUID: 1TQsVTFYQ42CZDB2zpZHRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="264179757"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 12 Aug 2026 02:06:26 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id C60C399; Wed, 12 Aug 2026 11:06:24 +0200 (CEST)
Date: Wed, 12 Aug 2026 11:06:24 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: raoxu <raoxu@uniontech.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: hd3ss3220: fix VBUS regulator error message
Message-ID: <anw3kAlK_KOtyEak@black.igk.intel.com>
References: <860D4D55E131FB70+20260807081422.626412-1-raoxu@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <860D4D55E131FB70+20260807081422.626412-1-raoxu@uniontech.com>

On Fri, Aug 07, 2026 at 04:14:22PM +0800, raoxu wrote:
> From: Xu Rao <raoxu@uniontech.com>
> 
> hd3ss3220_regulator_control() enables the VBUS regulator when @on is
> true and disables it when @on is false.  However, its error message uses
> the opposite operation name, so an enable failure is reported as a
> disable failure and vice versa.
> 
> Print the operation that was actually attempted.  Reporting the opposite
> regulator operation on failures can mislead debugging of VBUS problems.
> 
> Fixes: 27fbc19e52b9 ("usb: typec: hd3ss3220: Enable VBUS based on role state")
> Signed-off-by: Xu Rao <raoxu@uniontech.com>

Please CC stable. With that fixed:

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/hd3ss3220.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
> index 3e39b800e6b5..d0de5a2488f9 100644
> --- a/drivers/usb/typec/hd3ss3220.c
> +++ b/drivers/usb/typec/hd3ss3220.c
> @@ -218,7 +218,7 @@ static void hd3ss3220_regulator_control(struct hd3ss3220 *hd3ss3220, bool on)
>  
>  	if (ret)
>  		dev_err(hd3ss3220->dev,
> -			"vbus regulator %s failed: %d\n", on ? "disable" : "enable", ret);
> +			"vbus regulator %s failed: %d\n", on ? "enable" : "disable", ret);
>  }
>  
>  static void hd3ss3220_set_role(struct hd3ss3220 *hd3ss3220)
> -- 
> 2.50.1

-- 
heikki
