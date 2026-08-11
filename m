Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF1F39DBCC;
	Tue, 11 Aug 2026 07:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786432480; cv=none; b=l2npEKaGSgT918de6arbJ2Mdvaj24qiYAYw4yJuFXPPy5+Y8th1nkwkTDyHPAAfs3UVoIhPcfJtjIWl5vFl+zhqSQ4WwXdQARvkPYXJJYTKvgkmo+BDMM2RCG5qG966nCWppNgvLmHxt/n/a1yD3yqC+D2Du8yRs2PuZ6U47mEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786432480; c=relaxed/simple;
	bh=vSe7ryBzBTYHIUxNQLrO67nwh37VVpWpMgFeOq6RrF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Euu+nePmVGXVfDRb/86qajwYPFBNLD/KAy1y93iFppxOHJIjdhAs/6PJNm3nEy1g4D5ORTfDcWKtxuaKM1vPrIEuGem/iYTY+GVdSjsA2lVkHIwBOReQA/p1PluZNQ3SbO72RYqB0UWDhPkizlD+G2IT4OMchzNOf193tuzoCXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=exqHCzyJ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="exqHCzyJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786432478; x=1817968478;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=vSe7ryBzBTYHIUxNQLrO67nwh37VVpWpMgFeOq6RrF8=;
  b=exqHCzyJ0df6o/38jGhKTJ6QHNzyKanz6PR1AsVmey66QLfuVuViEK41
   LU8y/MkHNhMUoPK4c4Mge3CKpSMVtL2BUg7AKxlf6YAkK0W65OGLMiKqe
   36kS/RieUvaGIxEA7jEyT2784hl6gK6BPDqUvcCfoRG9EiC6R3FNbWYD5
   WTTZ4tGjyOtSbR9uRIU3B+KqOH+oDCONia2nbOoyQxqfPoesREhZS+IsO
   t6g2XkV2H20d9T9/dEFa3DRJSGB502/hQmAI+z5//CJ2d4PlQTTWxPwU9
   bbXRzONJOaqO6zt2yd/ReUCJ59A08wc1p1KiMi0r68UjUZBEHUF6Qycmr
   A==;
X-CSE-ConnectionGUID: ZIuqujqYSu+IaSiqyP/WYA==
X-CSE-MsgGUID: nwhOk5fXRTy06vbbfv/DeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="90839282"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="90839282"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 00:14:37 -0700
X-CSE-ConnectionGUID: iJ0IIMOwRLWuloOdP6ixVQ==
X-CSE-MsgGUID: ck0048Y7TFeQ3ubPdwknTg==
X-ExtLoop1: 1
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.207])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 00:14:34 -0700
Date: Tue, 11 Aug 2026 10:14:33 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: hub: Set proper message when
 usb_hub_create_port_device() fails
Message-ID: <anrL2XsX-Ec0GPvK@ashevche-desk.local>
References: <20260728100005.413868-1-wenst@chromium.org>
 <ann84DKCXCPLtgeX@ashevche-desk.local>
 <CAGXv+5HGZwAKpGpyV4=QHfg7yBQPx-syc1Gma2qad_tzW_RLog@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5HGZwAKpGpyV4=QHfg7yBQPx-syc1Gma2qad_tzW_RLog@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Aug 11, 2026 at 11:51:07AM +0800, Chen-Yu Tsai wrote:
> On Tue, Aug 11, 2026 at 12:31 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Tue, Jul 28, 2026 at 06:00:04PM +0800, Chen-Yu Tsai wrote:

...

> > The 'message' is local to the function, why devm?
> > Shouldn't __free() be sufficient?
> 
> I hadn't thought of that.
> 
> The scope shouldn't be a problem, since it's declared and used at the top
> level. But we'd need a kfree_const() variant of __free(kfree). All the
> other error messages are just plain C string constants.

Sure, I just sent a patch.

-- 
With Best Regards,
Andy Shevchenko


