Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2939B285050;
	Mon,  9 Mar 2026 11:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773056059; cv=none; b=D3WuysVpYdl58+1GZM+FCH+kLTZHqmNA//1WICKsPLFi4FtIDTDmEezvXzS+F8NYJNDc49k10o3ZYZXD56K4zRYKPWpwiVZOhB1zxf0FeIz9OpgmtQC057tTkm12JTTOFHi2dSF/s8uPL6Zz7153lGW1pb8A5LiwfBgp+WwjoBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773056059; c=relaxed/simple;
	bh=hqcu7qx/hyMsD6C7ZpqhKNfzuPS+EcyCzrZ9uZ4KnDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gw0S4rBshQeMuhpWy1AMLY306yb4W4gt4DGoVCBnO4hRz0U9XCJd9L+b0CBFKIthKzoDhwN5GDl95MLVYanUnJtGhHi8BKnnz44nENwRuCcEuizaTUKzVpQiHH6dtzVsbvu114zv0aXCYY7ai9McgVvCrQDX6IFEbH+HQTR39Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lrLMfiyt; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lrLMfiyt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773056058; x=1804592058;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hqcu7qx/hyMsD6C7ZpqhKNfzuPS+EcyCzrZ9uZ4KnDQ=;
  b=lrLMfiytxtF9KsM9SZwtaXYzbDlcpnSLzN5mOGN0OosO2WLjn7uM75xj
   nrvAMCVWwkzdfjSts7f3L3NyYiOVsWfb2dxv1qFY0TF1+8Ri/kOMYyQ8L
   w6y/leD1pb+FbCZCGZOg6Y92rh05TS8Jr03nDG8PUVCE9Gjb+Adt/UJ/U
   8XMGSzQlewgubclGTuM6VHBfl9D5Wrf0ggXG6ZlNIjDUAipsEI8GofhkQ
   fkPfOSnk31BqZn344R1fZAgsV7RwcUMp+8qMJIMKRJrJZlXt8s8Tawu9/
   Y8G1bjXqbfNqTAVDayJ1CZ4TIQpfbC0pHfF86AERvKJGjzQKXtJmlfRnX
   A==;
X-CSE-ConnectionGUID: qQjpxncbT4WljOtzzaH5Jw==
X-CSE-MsgGUID: NmANxH18TuOwGXeHpuG2Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="73096533"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="73096533"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 04:34:17 -0700
X-CSE-ConnectionGUID: m+NByb55RR2ny33Ixwusuw==
X-CSE-MsgGUID: E3qz9KhkS16Q6a/rNoGmzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="218934532"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 09 Mar 2026 04:34:16 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id D4C2F98; Mon, 09 Mar 2026 12:34:14 +0100 (CET)
Date: Mon, 9 Mar 2026 13:33:34 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	kernel test robot <lkp@intel.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: ucsi: huawei_gaokun: make gaokun_ucsi_ops static
Message-ID: <aa6wDlolFS7FR5Fn@kuha>
References: <20260305144054.27848-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305144054.27848-1-mitltlatltl@gmail.com>

Thu, Mar 05, 2026 at 10:40:36PM +0800, Pengyu Luo kirjoitti:
> The gaokun_ucsi_ops structure is only used within its translation unit
> and is not referenced from any other file. Add the 'static' qualifier
> to avoid unnecessary symbol export.
> 
> Fixes: 00327d7f2c8c ("usb: typec: ucsi: add Huawei Matebook E Go ucsi driver")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202603050203.KD4RWA00-lkp@intel.com
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
> index c5965656b..ca749fde4 100644
> --- a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
> +++ b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
> @@ -193,7 +193,7 @@ static void gaokun_ucsi_connector_status(struct ucsi_connector *con)
>  	gaokun_set_orientation(con, &uec->ports[idx]);
>  }
>  
> -const struct ucsi_operations gaokun_ucsi_ops = {
> +static const struct ucsi_operations gaokun_ucsi_ops = {
>  	.read_version = gaokun_ucsi_read_version,
>  	.read_cci = gaokun_ucsi_read_cci,
>  	.poll_cci = gaokun_ucsi_read_cci,
> -- 
> 2.53.0

-- 
heikki
