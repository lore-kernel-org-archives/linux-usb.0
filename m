Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E0039FCBA;
	Thu, 19 Mar 2026 21:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773954284; cv=none; b=K/nHWDnjJ6V4xFWFz4MnjEtiialLrSQr8K4ejjvsL7C09dEAQvRfPTkQeTDmHPu9asG7dtIhLfWhIodxGr+lGCl/eZYi5Vlj3huNVIYqYlQsWFjn94SjqQ3xzmAV29LHoEQICppcUoZGfuDnkor+LD6Jt4jCZuQnLDdl1rreIf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773954284; c=relaxed/simple;
	bh=Z60uOZsRLTE3JWL04DIj+2qCmD5+rtCC4TYF3FIGR2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gM3QXMw0ozyLtmr++hTNXSbNbI8ZPleEixOYwX6GN6VikCLOtEEQ3qHnSc2jfLTB8igiAH8BC4AF0Bqlz8LsTOyULl+lMKyExSxfA7KLk9ORAx2ath76/1pYKYRPx2RY1UylgJNyfJasdm38L2MsCp76VnH/bcLOImUqIOfajNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TZoNnTII; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TZoNnTII"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773954283; x=1805490283;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Z60uOZsRLTE3JWL04DIj+2qCmD5+rtCC4TYF3FIGR2A=;
  b=TZoNnTIIqzkB9mqIEawcvdwCM5J0P/L9r0bQoNsVue3uAN0Ixh6aLcaY
   6K4be+2oRyy/5lz/h7I7Yvbga23vQOjO2A4rjYxtL4hgEDqwGcx0IKiWZ
   8UnJOP/gQ+Wst9bo/zt+V4WozdxonJBo0hksvQXaVCpLEhyUbF2PvgVhX
   wCgXWLy8RKbBrRQniryXwR6j55Bj1C/cvbO0wTeENRSDS9M6AaHNgASnZ
   +BKNtQHKBTnRA9vfep1/LUzCua2Wc2bVbD68hRoOkBW0/bImSdXPeeQct
   TqqQJk5qg+cm6lcvpw4mzuC/gTHL54+POElDhNuLmgkqXNQJJ25l7gdtt
   A==;
X-CSE-ConnectionGUID: PEGymgz3QiWMKKD7Huwp5w==
X-CSE-MsgGUID: +X9bd3AxScu/5L7W6O3aag==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="74949427"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="74949427"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 14:04:43 -0700
X-CSE-ConnectionGUID: MiOizI2uS0isayDd+5Qa2g==
X-CSE-MsgGUID: f9uJXEHARK+x8YQppARO1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="218958065"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.244.144]) ([10.245.244.144])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 14:04:41 -0700
Message-ID: <d9ae5a8b-3aa0-451e-8a42-80ef73e2d210@linux.intel.com>
Date: Thu, 19 Mar 2026 23:04:38 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: xhci: Fix debugfs bandwidth reporting
To: Michal Pecio <michal.pecio@gmail.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Xu Rao <raoxu@uniontech.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260304114928.110be4c4.michal.pecio@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260304114928.110be4c4.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/4/26 12:49, Michal Pecio wrote:
> Replace kernel USB speed numbers with xHCI protocol IDs expected by HW.
> They are numerically equal up to high speed, but instead of SuperSpeed
> we were querying SuperSpeed+.
> 
> Gen1 hardware rejects such commands with TRB Error, which resulted in
> zero available bandwidth being shown.
> 
> While at that, report command failure as IO error, not zero bandwidth.
> 
> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>

Added to queue

Thanks
Mathias
