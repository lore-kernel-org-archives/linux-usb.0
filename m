Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BA73D5246;
	Tue, 23 Jun 2026 12:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782216641; cv=none; b=mB50UPcouFgsX7zeubaiP9KKMLGcA/ERqmbp+PchEKPBBa5VKmxOlAaDcHg/wAwLhypYP07esVPLTp4By98VjNc1YZDjCGwZWx36GaHdHvGJo2RfUf8vA9NzU/a1YDsmDW3ovxwK89Asf3HRY9OpEoy2pG320YdziZ4eq+5vXWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782216641; c=relaxed/simple;
	bh=bdw3fx2OSp5PKm3CB65s1U0mGoLipoBGM62h2QeAj1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VV6v/hfVNtAMa8swBtHlYoUJ6HVYGMAJRR9DnTJKJ0QO6l386XfJMX1k8gaAFwHc9E7Xos4yPMzE+lwNLoRE+CIf/4N3OADaN4H4b5mCYJFOoVo1e8OIdyvpVpcbPVKGSiCwPG+1deU7BTdxGYagEUH++NAYxc8xQIAbEhGdbzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZiwPt7/x; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZiwPt7/x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782216639; x=1813752639;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bdw3fx2OSp5PKm3CB65s1U0mGoLipoBGM62h2QeAj1U=;
  b=ZiwPt7/xm+uAfsH1f9kGMXl36Z47D2ap0chgLHm3INHEC2VR7DusL+IM
   7kxGBGzQnKD+C8Wy61bQ3ZKgX7h3erK2JVNuLZ8v4URD+ztnfzSDa5GU/
   7VyF26lPs2A8uL3onQ13yr0nnkohOEfK4uVTlwVWdTs9qJ5RZ0YVafFOu
   C6lXwPThG+jzR+EYaqD6yJJ3gEwpgwiuTs9YvzPhvGT6W8xIRwLZj6J0M
   TpdwtXaJ8dT84m4SGyPPxcQaNSwiRpjX8E9a8OJvGYmfc76uf7rZwZ57t
   eFl5JBf0Vl0V1Clu/1SVv49lQrrFADHojGbiRTIGtQ4ofT/8pdObg3iew
   A==;
X-CSE-ConnectionGUID: s9eojOHOSZ+HVjp4O/IpIQ==
X-CSE-MsgGUID: Ed/KG66KQcuWv4jP54aPKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="94347719"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="94347719"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 05:10:38 -0700
X-CSE-ConnectionGUID: JzIHRZy0T3CtVUNmhecKJg==
X-CSE-MsgGUID: 4DKAY8SASLOrU6UD4ROq4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="247159526"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 23 Jun 2026 05:10:37 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 0753695; Tue, 23 Jun 2026 14:10:36 +0200 (CEST)
Date: Tue, 23 Jun 2026 15:10:34 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Pengyu Luo <mitltlatltl@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: typec: ucsi: gaokun: unwind notifier on UCSI
 register failure
Message-ID: <ajp3uoW7wkrYQwW6@kuha>
References: <20260622153230.75195-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622153230.75195-1-pengpeng@iscas.ac.cn>

On Mon, Jun 22, 2026 at 11:32:30PM +0800, Pengpeng Hou wrote:
> gaokun_ucsi_register_worker() registers the EC notifier before calling
> ucsi_register().  If ucsi_register() fails, the worker currently only logs
> the error and leaves the notifier registered.  Later EC events can then
> call into an unpublished UCSI instance.  The remove path also
> unconditionally unregisters the notifier and UCSI device even if the
> delayed worker failed before both were published.
> 
> Unregister the notifier immediately when ucsi_register() fails, and track
> only the fully published state.  The remove path then tears down the pair
> only if both publication steps completed.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Changes since v1:
> - Drop the two-flag bookkeeping objected to by Greg Kroah-Hartman.
> - Keep the existing registration order, but use a single flag that is set
>   only after both the notifier and UCSI device are published.
> - Unregister the EC notifier immediately if ucsi_register() fails.
> - Compile-tested only; no Gaokun hardware was available.
> 
>  drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
> index ca749fde49bd..0dcbbff5f205 100644
> --- a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
> +++ b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
> @@ -98,6 +98,7 @@ struct gaokun_ucsi {
>  	struct device *dev;
>  	struct delayed_work work;
>  	struct notifier_block nb;
> +	bool registered;
>  	u16 version;
>  	u8 num_ports;
>  };
> @@ -457,8 +458,12 @@ static void gaokun_ucsi_register_worker(struct work_struct *work)
>  	}
>  
>  	ret = ucsi_register(ucsi);
> -	if (ret)
> +	if (ret) {
>  		dev_err_probe(ucsi->dev, ret, "ucsi register failed\n");
> +		gaokun_ec_unregister_notify(uec->ec, &uec->nb);
> +		return;
> +	}
> +	uec->registered = true;
>  }
>  
>  static int gaokun_ucsi_probe(struct auxiliary_device *adev,
> @@ -504,8 +509,10 @@ static void gaokun_ucsi_remove(struct auxiliary_device *adev)
>  	struct gaokun_ucsi *uec = auxiliary_get_drvdata(adev);
>  
>  	disable_delayed_work_sync(&uec->work);
> -	gaokun_ec_unregister_notify(uec->ec, &uec->nb);
> -	ucsi_unregister(uec->ucsi);
> +	if (uec->registered) {
> +		gaokun_ec_unregister_notify(uec->ec, &uec->nb);
> +		ucsi_unregister(uec->ucsi);
> +	}
>  	ucsi_destroy(uec->ucsi);
>  }
>  
> -- 
> 2.50.1

-- 
heikki
