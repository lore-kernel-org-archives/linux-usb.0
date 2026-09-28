Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10535475348
	for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2026 08:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790584422; cv=none; b=bL0mbj0dnGLoqCkfU3Euz4rLzqOZvTmr6NeHzBwMq+DjhxkwC6u/lsoYjNYQM3n9IbGVlQImgZd0paTJrr5XVRFC5oSpXSMIRTiZSIkj/V8X5stMK0ahEmxQl441fmC7n8NnveTorekO7PWS/U6bvXnZmgErKMUWhQBraQxbx9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790584422; c=relaxed/simple;
	bh=WgL5FQGY0Yvru/rXhiulvLPt4q4aZxBV22ra11rN4Qg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gytI9y+ET/uGIZ3wu8qW4B+ZswCEzlJPjK1enggbWL0K1GnQ3LW1UR6HcCitfpeIHIePcT3m2sJ2HGjRsQbwV8iF/IJLW5quEfN8oyLbQ8F2b+5Yzcum+k2zCwKKbwQBUmqjvUG2x0AIQEmFjkwLnKjIPk+N6orj0UdO8fUBrS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bAta+DCG; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bAta+DCG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790584421; x=1822120421;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WgL5FQGY0Yvru/rXhiulvLPt4q4aZxBV22ra11rN4Qg=;
  b=bAta+DCGxQTSHYnaZX41IBiN35Xh/a/hQsLOBb5Md+rm5rd8CkvZixa8
   Kq6BVBvW1WWiAxnkosexLS426SEttwGvjn7GR+J7t4onT/9fwRR999Pzw
   uf0mB1EAE4YdfiFer4ZkPN5O2fQTC35CLIgOjnWOZ/oilwbkBAlG3FFlx
   007/I8oYP+PWuqETF1mcp4acSv+oMH/og8LmLNQo0KeI7PyqTZV1Q+Rxh
   cRzEJuk5qxt1v9zaYTw/gV8GMffCTz2VcJ27mvLxCQgalB/fN2ilV8ELz
   EOFDWOi+Y8BKN1Ijo1B41ubxder2bDwn9l0I306/dphh0GR7WXFvLUwml
   g==;
X-CSE-ConnectionGUID: jvrIxcLGSnmWfO4JGGHnUQ==
X-CSE-MsgGUID: zj1+/oI+R+qQ844Zg4sSwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="90180743"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="90180743"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 01:33:40 -0700
X-CSE-ConnectionGUID: TKyANRmCQnyCK79veMj71g==
X-CSE-MsgGUID: NfWAlhfDQPSGSmvvW3kxaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="304465651"
Received: from abityuts-desk1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.65])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 01:33:39 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A76C5121BA9;
	Mon, 28 Sep 2026 11:33:40 +0300 (EEST)
Date: Mon, 28 Sep 2026 11:33:40 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/1] MAINTAINERS: Update usbio driver maintainers and
 reviewers
Message-ID: <aromZGGDP-rTsNCz@kekkonen.localdomain>
References: <20260803164533.58833-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803164533.58833-1-sakari.ailus@linux.intel.com>

Ping.

On Mon, Aug 03, 2026 at 07:45:33PM +0300, Sakari Ailus wrote:
> Israel's e-mail address is no longer functional so remove him as a
> maintainer of the usbio driver. At the same time, add myself as a
> maintainer and Antti as a reviewer for the driver.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  MAINTAINERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 88de4216d7d4..d1c26db44ca0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13430,9 +13430,9 @@ F:	Documentation/admin-guide/pm/intel_uncore_frequency_scaling.rst
>  F:	drivers/platform/x86/intel/uncore-frequency/
>  
>  INTEL USBIO USB I/O EXPANDER DRIVERS
> -M:	Israel Cepeda <israel.a.cepeda.lopez@intel.com>
>  M:	Hans de Goede <hansg@kernel.org>
> -R:	Sakari Ailus <sakari.ailus@linux.intel.com>
> +M:	Sakari Ailus <sakari.ailus@linux.intel.com>
> +R:	Antti Laakso <antti.laakso@linux.intel.com>
>  S:	Maintained
>  F:	drivers/gpio/gpio-usbio.c
>  F:	drivers/i2c/busses/i2c-usbio.c
> -- 
> 2.47.3
> 
> 

-- 
Sakari Ailus
