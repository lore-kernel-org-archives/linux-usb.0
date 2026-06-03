Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CE5401A06;
	Wed,  3 Jun 2026 07:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780472884; cv=none; b=Jh2wDWOpZawmGCoCdObDqo1lrpWvny8h3z+qmGndEoVl208g9e8O48e4P4jHKSYNHoGr08CGCFHKrrcXO4tZJrjcqkLnj1N6AE24BFynh/1r7bxFuO3SONgfmJzJexNfvHpr/a8/coJXZpN1+Fm5y1uva1MFOVIZ9XQ0uKXosNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780472884; c=relaxed/simple;
	bh=R0varl47y6eecK5sAbX/yN/lNdk4+09rb/0cRWawyNg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ab3oQtJSszdWei4h0S0C8DFbrZQkPHJ0sS1k1J06yCsmURUiyO1ermBkbqEeMa4F+XGCfLnMUWRfKrOoPwmAgjg9nUPWYnuzOwPRxhA9q+cYf2hbPPARe/hoMxd1It9KlL+oRQmHcQwM4lNV4IugViTPBOpCjzvW3vAqVwJpYEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cd16yeb1; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cd16yeb1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780472883; x=1812008883;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=R0varl47y6eecK5sAbX/yN/lNdk4+09rb/0cRWawyNg=;
  b=Cd16yeb1AJ3BmXxrIDvBfOIvxPG8dbI5UqTreQAzXRbVIAheAPABD6MW
   PJuJHM1630iMiRIbX+0XquexCRNmuaqw7FqZOgKvmuzWFMB2voEh8PcZ4
   U8bh0cOOVKvlqa16GGRiQHEWlVGgv0vCD3BIUSeHaLclr50G0eEPdIStJ
   37jOTYgNJ63HMMIQTa/IZT4KOSm/dnVukVSjBxj3A/5Y4lEb+cbtJ5tSD
   JC0lWPh0k61E2A8DVMXXiiX/w24taSTgl/AtmxAe4OsRu83LHyhAXk2Hl
   TM54PmGz9VLff/xwUaC8y/uISW8iWJ/GXoaEIs7zfa68BtqpmC4EmUeZC
   Q==;
X-CSE-ConnectionGUID: tU4UpxC7RGqtcU7yPkbKDA==
X-CSE-MsgGUID: thgb1ek1Q26lZxGdPLZZKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="92379434"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="92379434"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 00:47:16 -0700
X-CSE-ConnectionGUID: B7ETD4r5QyOhoDpMuqmpTQ==
X-CSE-MsgGUID: /zPB2LEJRiGJz/7bJg1v1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="282258414"
Received: from slindbla-desk.ger.corp.intel.com (HELO [10.245.244.174]) ([10.245.244.174])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 00:47:12 -0700
Message-ID: <077ba20b-9677-4812-a083-b5216281611e@linux.intel.com>
Date: Wed, 3 Jun 2026 10:47:09 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: core: config: fix SS companion log for interrupt
 endpoints
To: raoxu <raoxu@uniontech.com>, gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com, katieeliu@tencent.com,
 johannes.bruederl@gmail.com, kees@kernel.org, dengjie03@kylinos.cn,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <85BCDBC1F65453B0+20260603062536.517734-1-raoxu@uniontech.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <85BCDBC1F65453B0+20260603062536.517734-1-raoxu@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/3/26 09:25, raoxu wrote:
> From: Xu Rao <raoxu@uniontech.com>
> 
> usb_parse_ss_endpoint_companion() clears bmAttributes when it is
> non-zero for control or interrupt endpoints.
> 
> The diagnostic message reports Control for control endpoints and Bulk
> for the other branch. However, the other branch can only be an
> interrupt endpoint because bulk endpoints are handled by the following
> else-if branch.
> 
> Report the endpoint type as Interrupt instead of Bulk to avoid
> misleading descriptor diagnostics.
> 
> Signed-off-by: Xu Rao <raoxu@uniontech.com>

Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>

