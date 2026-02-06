Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AD73112A5;
	Fri,  6 Feb 2026 08:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770368305; cv=none; b=h/Dx0XuQ6NhAlhGayXRA9wWB/h6fWWqd39ZPv8OWpwuBFwBo5y2JB9DULuWKEtXrvA22fODBUww6jHlUu2182DmqEOW94H/dLjWg9eftyxtJz+3wmudZKByjIzhV+rY0LhRBzhUrb654ZXAYlgSBtqq8y9MhLu383+R5zAlXMd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770368305; c=relaxed/simple;
	bh=RfkybW3Vpr03M9+yxdtp7SFYVvoPBsMDiXGPUdmD9rY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SPuut+P/G+Nzq5zJBlVofgWTCpaGckDdhJGhc0LDLtWZHAoWZfcMaaUCKbMh55LtgMnqvHUJedCTTGYH1uDpgv51ECIsGY4idGbg+qaTqE5/htQf/YZmLGBw6Rv6l+L2A0v6BARSSZDSYZ0VYOy3c/yMyEvW+IQDOUggaQldY+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nsQTC2R8; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nsQTC2R8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770368304; x=1801904304;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RfkybW3Vpr03M9+yxdtp7SFYVvoPBsMDiXGPUdmD9rY=;
  b=nsQTC2R8iS3YGsio8GXpP+9HcpvskWn9Q5mBX5EU6230ZWPSMu2zo0ZV
   qBBZ/0JHzcYFcKci2IowI6h1x4rg8cWCVn/79ZmUL3L22t+RugaPhSkVn
   fmVmpz+OjeCCB4gKGEcYKrH6Jr2shXqsxw/GA5DfxJwKTTPSLMa/UQ7oB
   vR/zCifJ44X6XsQQjd1ml1ws9HWavq5FX2e56ehhDpXMUwYFzkm4FApW+
   Xvvw3IkvVJi77DWDPwct7oyI7uyPyAjnafhCpD6idUQWHFibmPxGsayEe
   8iKRhdgGm9TVwQRwu+aPrqQW1Bu72qk4GVj+/vXAGoLhjutHrPEgaOeay
   Q==;
X-CSE-ConnectionGUID: uNexWWk8R7GNUYT6XjYh9Q==
X-CSE-MsgGUID: 2F+yQaFNStGzovKyIHhpMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="75191691"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="75191691"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 00:57:58 -0800
X-CSE-ConnectionGUID: vyWo2XC/SPuGUgf+zzAD4g==
X-CSE-MsgGUID: ghMdz7wRRhaLawjZ/HeDGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="241302834"
Received: from inaky-mobl1.amr.corp.intel.com (HELO kuha) ([10.124.222.151])
  by fmviesa001.fm.intel.com with SMTP; 06 Feb 2026 00:57:53 -0800
Received: by kuha (sSMTP sendmail emulation); Fri, 06 Feb 2026 10:57:23 +0200
Date: Fri, 6 Feb 2026 10:57:23 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andrei Kuchynski <akuchynski@chromium.org>
Cc: Jameson Thies <jthies@google.com>, Benson Leung <bleung@chromium.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Johan Hovold <johan@kernel.org>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>, Madhu M <madhu.m@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	Pengyu Luo <mitltlatltl@gmail.com>,
	Fedor Pchelkin <boddah8794@gmail.com>
Subject: Re: [PATCH] usb: typec: ucsi: Add Thunderbolt alternate mode support
Message-ID: <aYWs815nqAGCdIa-@kuha>
References: <20260126090616.2224907-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126090616.2224907-1-akuchynski@chromium.org>

Hi Andrei,

On Mon, Jan 26, 2026 at 09:06:16AM +0000, Andrei Kuchynski wrote:
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * UCSI Thunderbolt Alternate Mode Support
> + *
> + * Copyright 2025 Google LLC

2026

> + */
> +
> +#include <linux/usb/typec_tbt.h>
> +#include <linux/usb/pd_vdo.h>

We now need to include everything instead of relying other
headers to do that for us (although, I don't think this rule is
documented anywhere yet). Include at least these:

linux/err.h
linux/dev_printk.h
linux/device/devres.h
linux/gfp_types.h
linux/types.h
linux/usb/typec_altmode.h
linux/workqueue.h

Otherwise this looks good to me.

thanks,

-- 
heikki
