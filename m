Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6991C257844;
	Wed, 24 Jun 2026 05:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782277678; cv=none; b=J/olukPFiyVNaKVd+XyBqFA51U2R6Cmf+tQiQy3yzo5XI3BaDc+e443meiPOMxTxlUa2XC00rbCCJf1UWjK1jyzqpp8E8CNG8S2tp57r+1bm6DYsrO8M2ve4j8TWR9CbM+MGvdgGNmhJDbsgQ+iZOKmKuJ9bMhm79BT6MgCa1I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782277678; c=relaxed/simple;
	bh=9w1WQ00abatgxQY3eXmjibr1tzoIv3NL4xrCKBv6yUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ew9R11NV12bHJiODtcNi6kSlczaP+Mnv6CXoP2HwLO2de2XOFvGSyyoRgkYhNakfZrmcOFCSwgqkajAQzk0+ord2BkPuVHuzPP5iZMJT2HHq6r4jYrXue88fqnGe8vRiSlGHBDH0PsZyUikN6FwkxZBqJdq6qkqVwvUr/NByuWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e8pCU1+8; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e8pCU1+8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782277677; x=1813813677;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9w1WQ00abatgxQY3eXmjibr1tzoIv3NL4xrCKBv6yUQ=;
  b=e8pCU1+8VR5f7uvGYQGtgAhrKWrKIGrIIP22796nyZPUhYA++iN9wQmQ
   S7z6H+JaCIpFIL1fPj+1bdrmVEzmsRk5uGb4CgWfXfXr6qqbBC+LoI40v
   FhkhCK/syR2shE3pwYTd6tc3Le42Pt14OhHi4PDxN0YTYx7IqDzGmDrnL
   yEbZwYBM7i4yBkJ5shjwelUIbZkh4bQbz5+m/QWJk3gY6jIYZc+AG1YnB
   2k06MadR7W5HQobNJZ4Kk8D5bf4p69fVX5us7puracGDJgkY3zk0yILqQ
   MDeVl8dVmlWRB3M0IzDTuwiUkuksteqSu+E0Q79C+vPuQfFr8ew2k/fia
   w==;
X-CSE-ConnectionGUID: LLCBGseoREuDa271lVMQ4A==
X-CSE-MsgGUID: mCQ5FLcLR8uKxMfi7cYYcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="105824753"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="105824753"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 22:07:57 -0700
X-CSE-ConnectionGUID: Rg0pNwekTGeKetUDUShrHg==
X-CSE-MsgGUID: 6H9NjPPISRqHuL8n3n1XjA==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 23 Jun 2026 22:07:54 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 6A44995; Wed, 24 Jun 2026 07:07:53 +0200 (CEST)
Date: Wed, 24 Jun 2026 07:07:53 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Rqirus <cmh79479@gmail.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: xdomain: notify peers after enumeration
Message-ID: <20260624050753.GG3066@black.igk.intel.com>
References: <20260624011131.2532004-1-cmh79479@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260624011131.2532004-1-cmh79479@gmail.com>

Hi,

On Wed, Jun 24, 2026 at 09:11:31AM +0800, Rqirus wrote:
> Service drivers may register local XDomain properties while discovery is
> still in progress. This can cause the properties changed notification to be
> sent before the peer is ready to act on it.
> 
> If the peer has already read the local property block before the service
> was registered, it may keep using the old property generation and miss the
> newly registered service. With ThunderboltIP this can leave the network
> service half-discovered after a warm reboot and the login request
> eventually times out.
> 
> Queue another properties changed notification after the XDomain reaches
> ENUMERATED so the peer can re-read the final local properties.
> 
> Signed-off-by: Rqirus <cmh79479@gmail.com>

You should be using your full name here.

The patch itself looks reasonable to me.

> ---
>  drivers/thunderbolt/xdomain.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
> index 86b2f7474..9c068d073 100644
> --- a/drivers/thunderbolt/xdomain.c
> +++ b/drivers/thunderbolt/xdomain.c
> @@ -1811,6 +1811,7 @@ static void tb_xdomain_state_work(struct work_struct *work)
>  			tb_xdomain_failed(xd);
>  		} else {
>  			xd->state = XDOMAIN_STATE_ENUMERATED;
> +			tb_xdomain_queue_properties_changed(xd);
>  		}
>  		break;
>  
> 
> base-commit: 502d801f0ab03e4f32f9a33d203154ce84887921
> -- 
> 2.47.3
