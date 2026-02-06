Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB9A16DEB1;
	Fri,  6 Feb 2026 08:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770365250; cv=none; b=iUixP71ZGDXUUhAKI8J0sdXRViiEx72uYdyRcCSHGyV3e3F7VAHlUvmCFFmUClB1dwxacZijUXWyhuC8wg+dqL8hV287ReBitXuyAL0GTl8zQVT6spKIShYhwYDzlO0phmL70cG42+DqR3OLE/PGcy//+SyqvK7iLs1shT4tf0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770365250; c=relaxed/simple;
	bh=qJYmYKDFsOCXDA7Cw13WhUIK/F5z6U1JT54U3+9K0y8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KFtblOoabuDH86PpWvhrMNVZWjuTDD7+3mkHfMFHKwR76AmCWC9Gy0YYIvjUE/phKpoy2QNOiIqqPTG2iCPP7Y0H+U3eJYpsIi8HCR7XVvaN9zEFpVVfQKbu4Hs4Nzo0WH5cAA0htE3Q/DkAE5/9O2tD7DhoBxXksHCEztRySOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lxIM+i6C; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lxIM+i6C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770365250; x=1801901250;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qJYmYKDFsOCXDA7Cw13WhUIK/F5z6U1JT54U3+9K0y8=;
  b=lxIM+i6CBc8UsxFRoFv4oZbTl6e7bamp85uBKAYfSHqyVNg6O4/s10HW
   CZcqw5Imlt6kV/aNMdAZOFMwGtl6Rj/UBQD36AhJupXjMk9m/7g8vrpY/
   gUmIsFVaUO1zakHCgM01MSpuP21Yqo5nGxSRrZY9PR6MOAPfwK5WZDDqO
   8i5xqZtSQBqkSTaAeh05ZGQmTS5mRkVOjBQWeN+zxx7w4WqGYdVmyd5Yp
   +Ho9wSdmIUKijzaojMYlAInW6p2DkCgQurrcgxV3TS8DLYEsPsbdIS7IX
   gedCy7hJy+YRuNA0E+WQKqx+Xoj+BklMj6wJe3wCJsExdPhxM7y3lFkIF
   A==;
X-CSE-ConnectionGUID: Wzc6fUfeRHGKd0PFMpsaeg==
X-CSE-MsgGUID: 6wKz6ea6TRa9YFQTqVObXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="82941439"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="82941439"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 00:07:29 -0800
X-CSE-ConnectionGUID: zmA1Zu/BTJC7Kc4gnVxw5w==
X-CSE-MsgGUID: bprD+hwYQdyku/3HBrjPZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="210097407"
Received: from inaky-mobl1.amr.corp.intel.com (HELO kuha) ([10.124.222.151])
  by fmviesa007.fm.intel.com with SMTP; 06 Feb 2026 00:07:26 -0800
Received: by kuha (sSMTP sendmail emulation); Fri, 06 Feb 2026 10:06:57 +0200
Date: Fri, 6 Feb 2026 10:06:57 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Jan Remmet <j.remmet@phytec.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: Re: [PATCH v3] usb: typec: hd3ss3220: Check if regulator needs to be
 switched
Message-ID: <aYWhIe_Uc8DxhhUi@kuha>
References: <20260127-wip-jremmet-hd3ss3220_vbus_split-v3-1-009772f38265@phytec.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127-wip-jremmet-hd3ss3220_vbus_split-v3-1-009772f38265@phytec.de>

On Tue, Jan 27, 2026 at 04:37:16PM +0100, Jan Remmet wrote:
> Check regulator state as peripheral and detach can disable vbus.
> Without this check we will try to disable the regulator twice if
> we disconnect host and then connect as device.
> 
> Fixes: 27fbc19e52b9 ("usb: typec: hd3ss3220: Enable VBUS based on role state")
> 
> Signed-off-by: Jan Remmet <j.remmet@phytec.de>

You probable should remove the empty line after the Fixes tag.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linu.intel.com>

> ---
> This is a fixup from
> - Link to v1: https://lore.kernel.org/r/20260115-wip-jremmet-hd3ss3220_vbus-v1-1-b7d9adfbe346@phytec.de
> To
> - Link to v2: https://lore.kernel.org/r/20260123-wip-jremmet-hd3ss3220_vbus-v2-1-bcad313ce92b@phytec.de
> ---
> Changes in v3:
> - Fixed the fixme reference, sorry again...
> - Link to v2: https://lore.kernel.org/r/20260127-wip-jremmet-hd3ss3220_vbus_split-v2-1-f615d4e88634@phytec.de
> 
> Changes in v2:
> - added Fixes tag for the patch applied on usb-next
> - Link to v1: https://lore.kernel.org/r/20260126-wip-jremmet-hd3ss3220_vbus_split-v1-1-b2f946f1a4ae@phytec.de
> ---
>  drivers/usb/typec/hd3ss3220.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
> index a7c54aa8635f70d6979d98c95f80d4dac277fef2..3e39b800e6b5f4d0cbba957c0dd66c18f781ff38 100644
> --- a/drivers/usb/typec/hd3ss3220.c
> +++ b/drivers/usb/typec/hd3ss3220.c
> @@ -208,6 +208,9 @@ static void hd3ss3220_regulator_control(struct hd3ss3220 *hd3ss3220, bool on)
>  {
>  	int ret;
>  
> +	if (regulator_is_enabled(hd3ss3220->vbus) == on)
> +		return;
> +
>  	if (on)
>  		ret = regulator_enable(hd3ss3220->vbus);
>  	else
> 
> ---
> base-commit: 8acc379b664ec987dcc7eca25a5f5c4a9a4eb9c4
> change-id: 20260126-wip-jremmet-hd3ss3220_vbus_split-946802479e89
> 
> Best regards,
> -- 
> Jan Remmet <j.remmet@phytec.de>

-- 
heikki
