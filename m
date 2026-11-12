Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794499130;
	b=iQBQ0WF1PhhGAd50aZVci74LvFuhtADdwKQ+2MsdaxEnxXsesNdkkOYo5zycanTCVXW7
	 nfI22K42L3I1nN0u8Fyj4Ygm+1tKCIYbQZnoehTK8j028xsUCrvjdxFVZDLLzGU9H6Olb
	 0VXcKo+hJ9YIxbDwNTsm7N+JD8wt6bRVK3l/JbjxPHb2+tX22oYaaIQVgqXJr1JS3wdOz
	 6+fSAgvLIGckx3fGVSckxFVCxrMsjTT36fdemSmi1F3YaokSUV0ssCFM/YTYSCEVP59hI
	 Wg8vh7EUzcsnN6dtEAaO2+onu/eR0l+BAYZXwaWv8us6uHBzQ9k34reecsOAqGj0RHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794499130;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=jmk8iLYNqQa/kijQDVvPNukLWw0oZOUcoKfa89+szjQ=;
	b=0JfrA7C6OvBs5vDzAXQV6c/VQZIhb/SrlWXf6rXsGkeUyQXaLDtkSxJ4h+yFwU8pHezN
	 hauXiG0JCASmsTMZMKavrQsXoXJC0NOvk3cxL7o3d9lhU11Du7QpIMd3YR5SJre2i2ZWB
	 41x5BKGONn4AfYzIj3WxVyQlr4vX/zBBZpFOUdr82G0txNXuooulvspSo64PZCP3W4wui
	 tCCJ7evERDnGTKpR1aMzLy2i3wofnvgE/Ci5fy2lszK2YSz1Vb8Fenqp35pa44bRt5tEs
	 6Oe0uBnuA8Dl38nt+KBQ5Q0lPu8RX2DsMgwzlrBDPgAPXb583jytMSNCQVtiMsOcOjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d7HRCv25;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E144D606A32A
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 15:58:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E144D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d7HRCv25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794499130; x=1826035130;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RqQ5n8V4PiHL+jAiLZZ+GYcM+aYOsdyf7ThQrfOVWrQ=;
  b=d7HRCv25T6Vpf3fCRgR+ylKmQ4yB2k/R4Ez+vi4bKO1ZObux3aarXucm
   wZPYRdT6IvJqm9Cr+i/tnZsrgC89KNVrWIVRw3aQz+wMekV041LVcULyt
   /B1y2HosGxvw4C61IXy48vGw2hfHGhKLFNJJ0ZShuIZwapYA3Km5YH3hb
   JTZyztvjtckIv/NNihmXbKtPD+66mwp/f4gTTIgj5wUrHXcswKLx+iRBE
   z0M+nQyJc6nT4oCPg2ayq2BtbJMQGpwbVPVLnMEyaNsKk6jpVHq6tHLOo
   6HmBxYJUJuzHZOb1rsgO20iM/bvNMwPIsY1DUtujb21IJGdYSuLKsU6C+
   w==;
X-CSE-ConnectionGUID: EnqVhI2ORredZVwJjoPN2w==
X-CSE-MsgGUID: 5RDmD5DlTFG3FY0WLLp5YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3313431"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3313431"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 07:58:50 -0800
X-CSE-ConnectionGUID: qPffZPHBQ0+VrCfkLjekdQ==
X-CSE-MsgGUID: q9U8jIgCQpShlK3FDX0zUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="10420239"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa012.fm.intel.com with ESMTP; 12 Nov 2026 07:58:49 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 5FF2499; Thu, 12 Nov 2026 16:58:47 +0100 (CET)
Date: Thu, 12 Nov 2026 16:58:47 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Subject: Re: [PATCH] Documentation/thunderbolt: Update Mika Westerberg's
 email address
Message-ID: <20261112155847.GM259790@black.igk.intel.com>
References: <20261111124149.1324711-1-mika.westerberg@linux.intel.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261111124149.1324711-1-mika.westerberg@linux.intel.com>

On Wed, Nov 11, 2026 at 01:41:49PM +0100, Mika Westerberg wrote:
> From: Mika Westerberg <westeri@kernel.org>
> 
> My @linux.intel.com address will be going away soon so switch to use my
> @kernel.org address.
> 
> Signed-off-by: Mika Westerberg <westeri@kernel.org>

Applied to thunderbolt.git/next.
