Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0F320B80B;
	Wed,  3 Jun 2026 00:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780445979; cv=none; b=Kn4Zj2PsCD99KhENrssVtR/H7GpE9EXPekFocSZf+ajvVqX2iyDQLXWa+eL8Wh3ChZGXX/75lUh58NatxbixbVYXcoP35sHDCMQwcAV0fj07k99BK8q95onvZkfrPEAC+FjdSkfdb2KmEm6+pfygUqBS8PDwfflRPJd0DdzNCHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780445979; c=relaxed/simple;
	bh=E8CgUkBleqHr3ZeR11PP0Hh76U24SJ7qOoBnLUvOFb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L4UwO0wTSOoA41gFggW97kXO4BICbYRJi35rJnq/mJ983XdTHdR91lkOct+ICRkmxNhjyeN2MaUQ504Y8+ZSNgcTQfaVwTmZA8Ww40OtlwugeKJ1eZ2IlEMErK7Jon39fiqBbdGiO+QmfVFFMmcDGvVK+dMti2h4MgjLXs7I7b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J6xBCqEn; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J6xBCqEn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780445978; x=1811981978;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=E8CgUkBleqHr3ZeR11PP0Hh76U24SJ7qOoBnLUvOFb4=;
  b=J6xBCqEnggTYPn4wj/ujbo/Te5p1gUKO5JQbzTc6xsdSok7IpAch0d4x
   P/GgPscSc98DX17O4xWXxazkLM/TRX4keKs6F+qdgwttnoKFsEo/uJpb/
   SosZrsoSFKiMlsu+dv1Ghj9vTDEPtS72oXTUMVPZWI01drw+7zXdKTw85
   Ty1qBT3sASRcUY3B1P0g0Dy/kGTFJDk/xNRfK0xmuw4OiWHL2eIUGw5Mx
   B7ZU3n1lMM0dS6YxbO9bWAaM6XDZ8iC4b9e9x7bv9vPixsraWGtOPQqB8
   I3pBd44VAMW8rWK1H+nT0LQygUZsdgH71vPjY+hh6seP6d/OvsJtnCjD0
   w==;
X-CSE-ConnectionGUID: WIITxhJnRjeAN32hzdRCrQ==
X-CSE-MsgGUID: UtHl/MfmRb2kneOCeho/5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81274880"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="81274880"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 17:19:37 -0700
X-CSE-ConnectionGUID: rv3y7TC3Qf2JGLTu60hCIg==
X-CSE-MsgGUID: 4Xmt+lIwSaqf1IqrCtddFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="248998056"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.116])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 17:19:35 -0700
Date: Wed, 3 Jun 2026 03:19:32 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Michael Jamet <michael.jamet@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Yehezkel Bernat <yehezkel.bernat@intel.com>
Subject: Re: [PATCH 2/6] thunderbolt: property: Unify
 format_dwdata()/parse_dwdata()
Message-ID: <ah9zFHZsPCu05JSd@ashevche-desk.local>
References: <20260524-thunderbolt-big-endian-v1-0-6044edca78e7@weissschuh.net>
 <20260524-thunderbolt-big-endian-v1-2-6044edca78e7@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260524-thunderbolt-big-endian-v1-2-6044edca78e7@weissschuh.net>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, May 24, 2026 at 03:06:44PM +0200, Thomas Weißschuh wrote:
> Both function do the same. They are about to change. To make that
> easier, implement one in terms of the other.

...

>  static inline void format_dwdata(void *dst, const void *src, size_t dwords)
>  {
> -	cpu_to_be32_array(dst, src, dwords);
> +	return parse_dwdata(dst, src, dwords);

Why return?

>  }

Can't you simply kill this and use parse_dwdata everywhere?

-- 
With Best Regards,
Andy Shevchenko


