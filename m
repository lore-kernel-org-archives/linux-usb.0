Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC823CF1F7
	for <linux-usb@vger.kernel.org>; Mon, 15 Jun 2026 08:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781513280; cv=none; b=nCkvp9sGR7fEGsa1r0XjyikvLYFn8AOLJ7/EQMOEuHcZa8cB1TDeEb18XvXcn88QH/TBNT054y/fVRONr6Ju8DBESur86nC65MUjyfFGsUibgec4hoIiEchv3QzRKXQzAu0yLiQqgHVr7gl9BCF/dx2W6rxlSBVwblDZC9CreQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781513280; c=relaxed/simple;
	bh=t0qiV0kGi2OQBQ2osZZAvySPqCdxjIpDAQfoNSRuB2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qs/4EbPhwbpblkQJn7pUFKlu1GZgzlwjA4Hld5GaexfoUMwo50Ag3PoXrJRqY4U1yfKKn8qbyh7Pi7a5lrDs/Ymq8Bgdx39Gvat7+rVf3eO/dCCRbhhoAhfK2C9FBIIyeficxRMe5anpwBaSU5cORt5v/0zYclYhvMkZeap4pAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iJoB51k9; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iJoB51k9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781513277; x=1813049277;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=t0qiV0kGi2OQBQ2osZZAvySPqCdxjIpDAQfoNSRuB2A=;
  b=iJoB51k9SB5ra6KsaLp5cYTuMP6JNwkblHhb4ZugBUXZr3JDGioXGnyB
   mzlnQFDOVFsiLv7Hb3ko4aytCadYvJAvkK3Z6hnUXRKtqmx9u4g/uZRwd
   BFvkdlk/dFDnXhjcSyMngBTkcIiUONyp75fw6e2ezy+JpX9Pnn6IiFXOm
   TFRfO7jjwVeH3RmjgtU3xIPIqKM7mek4CC494TCQUkG62MXwRc7pqqYlf
   32E/WYpgz27ic5xuSNy2tlNkO6Iy52GRTGZAoPJFnY4Zv9fgYvK6VDXHp
   wFD117o0Lx7VK7u48mP9TavqJsHPIyDWms4MRVjBpUqqpAp4XzbBCF7BO
   w==;
X-CSE-ConnectionGUID: t+Ypa7XITASvsFPVLtiTLQ==
X-CSE-MsgGUID: E185i4bVQ2aDoFaLlYG4pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="93636829"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="93636829"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 01:47:56 -0700
X-CSE-ConnectionGUID: 86ciwZ4eQEq7CN1v3SKhfw==
X-CSE-MsgGUID: uBRqg4GAQ4uCIbQivP5+Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="247292790"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO [10.245.244.39]) ([10.245.244.39])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 01:47:54 -0700
Message-ID: <79a7df51-a2ac-4206-987a-83737e1d316f@linux.intel.com>
Date: Mon, 15 Jun 2026 11:47:50 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/15] xhci: dbc: serialize enabling and disabling dbc
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 ravitejax.veesam@intel.com
References: <20260603091132.1110849-1-mathias.nyman@linux.intel.com>
 <20260603091132.1110849-9-mathias.nyman@linux.intel.com>
 <9ce24ff5-efab-4089-92d7-709862d68e6d@intel.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <9ce24ff5-efab-4089-92d7-709862d68e6d@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/15/26 09:11, Borah, Chaitanya Kumar wrote:
> 
> Hello Mathias,
> 
> On 6/3/2026 2:41 PM, Mathias Nyman wrote:
>> DbC can be enabled and disabled via sysfs, serialize those
>> with a mutex to make sure everything is done in the correct
>> order.
>>
>> remove xhci_do_dbc_stop() and integrate the register write and
>> dbc->state setting into xhci_do_stop()
>>
> 
> This patch seems to cause a regression in our CI. [1]
> 
> We could not revert the patch because of merge conflicts but resetting to the parent commit seems to heal the issue.
> 
> Could you please check why the patch causes this regression and provide
> a fix if necessary?

Ah, I see, deadlock when enabling DbC via sysfs on runtime suspended xhci

Appears this is an issue mid series in intel-next,
The last patch that enabled runtime pm for DbC should also fix this issue.

The DbC runtime pm support patch was dropped last minute from the upstream series.

I'll send it as a RFT, can you check it solve the issue in your CI

Details of deadlock issue while mid series:

dbc_store() {  // enable dbc via syfs
     mutex_lock(&dbc->enable_mutex);
     xhci_dbc_start(dbc);
         pm_runtime_get_sync(dbc->dev);
             xhci_dbc_resume()
                 mutex_lock(&dbc->enable_mutex);

Thanks
Mathias

