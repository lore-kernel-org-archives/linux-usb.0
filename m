Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400F236EAA6;
	Fri,  3 Jul 2026 13:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783085245; cv=none; b=sN4zAPlLdAEmtQ7PoAmPxJAC6LunCJgcNji38H4ucI4b6bYjyz0/zAbSN83Ic9q/PcFhC/3Q3ns79AlqrXGvi5AuN1BIO7K40cN7U288h6DsKlJzgqZR1lFiB2d7XJUAXm3LHbQGS/NRR7w55+R3nUICE3a91eUqW6FyQ3ie12U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783085245; c=relaxed/simple;
	bh=XjmMadtYEQSISdFmunS32IrHp7ZhPRKYV+NzkcISDh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VcRwR0c7FQ9xcJxjLTqhkuH6biPOS6R9wmgW0gfAJ/LyowyKqvpMXdkgU/afQdmO8Wh3pbzyxe/4IBeHVgG6UyAV1elDcSAIKcQrMvjo9/jrzVBQVjY21qzlxlRpX07oLlTmutsnxgss1BHCg363tOluYHL3nE7LSzXjZTY7Gc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hLaVgM6v; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hLaVgM6v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783085244; x=1814621244;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XjmMadtYEQSISdFmunS32IrHp7ZhPRKYV+NzkcISDh0=;
  b=hLaVgM6vUO2XoIAgHhp5i7aIg2B3T+F2Rqhi6r7CkGA5z79Rp1jMER30
   gY/DoYkEP0LRCWnmyPH6K+4cBpkez/Id6mPsiZuGrNi1xxrH1HUQj7Lol
   arcf147e5OqLEPKeNMu/c2xI7ZW1yzsFyt5WlH3JNF37XLPraZNAsIn0O
   p0xK66XX5jzS/EkDZdMWt5U8bEmQsR/iXAqmq2//OLj+uriX1slyjxJ9i
   VRMxNC71OXX9I5HrJ3su4rBvZlxJruGAd6R2rFo3O48uFeZnzjdKD06mu
   H2X+oQQNagYI21LHxz00JJm4TlLT9uWNt7+1lR0rq1caA0P+5i6PbuP1F
   Q==;
X-CSE-ConnectionGUID: NqX+FXLTQ7ujqKuv/siG4w==
X-CSE-MsgGUID: oJj89g9YRMagHdkM+eT7DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="83704282"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="83704282"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 06:27:24 -0700
X-CSE-ConnectionGUID: ABif/ItmSCeswgYzmoYYyw==
X-CSE-MsgGUID: sdkHWbQ8SBC5/UySyaTKJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="283201961"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 03 Jul 2026 06:27:23 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 94AC695; Fri, 03 Jul 2026 15:27:21 +0200 (CEST)
Date: Fri, 3 Jul 2026 16:27:20 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: class: drop PD lookup reference
Message-ID: <ake4uMQUreEND_4A@kuha>
References: <20260702191329.2648043-1-shuangpeng.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702191329.2648043-1-shuangpeng.kernel@gmail.com>

On Thu, Jul 02, 2026 at 03:13:29PM -0400, Shuangpeng Bai wrote:
> usb_power_delivery_find() wraps class_find_device_by_name(). That helper
> returns a device reference that must be released by the caller.
> 
> select_usb_power_delivery_store() only needs this reference while calling
> the pd_set callback. Drop it once the callback returns. Otherwise the sysfs
> write can pin the selected USB Power Delivery object and prevent it from
> being released on unregister.
> 
> Fixes: a7cff92f0635 ("usb: typec: USB Power Delivery helpers for ports and partners")
> Signed-off-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>

You need to Cc stable@vger.kernel.org

https://docs.kernel.org/process/5.Posting.html#sending-the-patch

thanks,

> ---
>  drivers/usb/typec/class.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 0977581ad1b6..0595e8cb83aa 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -1619,6 +1619,7 @@ static ssize_t select_usb_power_delivery_store(struct device *dev,
>  		return -EINVAL;
>  
>  	ret = port->ops->pd_set(port, pd);
> +	put_device(&pd->dev);
>  	if (ret)
>  		return ret;
>  
> -- 
> 2.43.0

-- 
heikki
