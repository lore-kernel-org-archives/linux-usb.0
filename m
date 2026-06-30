Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F74F3659FB;
	Tue, 30 Jun 2026 08:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782807026; cv=none; b=nouP8OJ9pskUr4MT9UjDUE0ehYTBKpIycMiaPPEfDm9NtIVya8cdycGo9LTcZo9roy9U3lWnZMHpxYZ6OqHy429sCCc3a7HhwywrQOKcnKXor+qC4uONhFXXlX/EjluhGYZZA6dTjRBjpoL0kEYu9/oRSvZimESVplhYXzpr97U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782807026; c=relaxed/simple;
	bh=25FGaEp+ipBXfkQuMFDWvHPXFwBdQJHSHAUZJus4yl0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EpqEnJ8/+8x4kUFh0WA4mul1J7lgwz0ZrGZEX0IdulbKC4XrvB2LqS6dpwdLPAQf/xXnW06y2Qzz5ZnrRqHfBvRjq2YVPOAkkFAz1aobaXJt3BEWcyN2i3z2RAiQRPnnH14YIqRGsuKhNUTfaEjFH36AKcRJuX/NLpTFUG5S8JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PKU+s6gX; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PKU+s6gX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782807024; x=1814343024;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=25FGaEp+ipBXfkQuMFDWvHPXFwBdQJHSHAUZJus4yl0=;
  b=PKU+s6gXtiuCuwAd3DMZySb7Qpkr/DPF9qDVbSuKDjHhEyawE4awY/dj
   eUsPSzu/hr1LqM1Q98uPVI0JrFkM6PnZuci+SSgFl1CXCBtxD0LbcMO+z
   dfESYA442rTcU1VwaZ2CFs4DVhCkKFft4cU8XjgdNMxCUGCKP1NtW9WNr
   /hMHCBFa092w30nAkBuRw8/3ylE5l8JGv+O7Nz1ntt/yE8PNS91yBXOP9
   4IZ+Lx/lmvrTmfsUrQ5CgSaXw/0aPvwDOQwKLBnnkIDBe9UKB2u2KyNQQ
   kgqJEhnqB7YY+qCKu1RQLWLB7pfLt93feIiOfqL8XwPz77qhs/9w4pfCR
   g==;
X-CSE-ConnectionGUID: ngRH+95OTNWRQqpBtly2fg==
X-CSE-MsgGUID: iyNmeup/RLq40sZhfHl7Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="82625193"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="82625193"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 01:10:24 -0700
X-CSE-ConnectionGUID: fAShT8G3TgeBSF6bG/t64g==
X-CSE-MsgGUID: Em5iyTpOQq2nhHu0yu9sWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="248832317"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.152]) ([10.245.245.152])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 01:10:22 -0700
Message-ID: <4ba1dbbc-7597-4042-a443-4ffd292559de@linux.intel.com>
Date: Tue, 30 Jun 2026 11:10:19 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: xhci: prevent spurious root hub resume during
 suspend
To: Pei Xiao <xiaopei01@kylinos.cn>, mathias.nyman@intel.com,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, stern@rowland.harvard.edu
Cc: dengjie03@kylinos.cn
References: <368829d76a12e371e09f203e14b5c80b6515c025.1782804779.git.xiaopei01@kylinos.cn>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <368829d76a12e371e09f203e14b5c80b6515c025.1782804779.git.xiaopei01@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/30/26 10:36, Pei Xiao wrote:
> handle_port_status() unconditionally resumes the root hub when
> hcd->state is HC_STATE_SUSPENDED, regardless of whether a device is
> actually attached to the port.  This can cause system suspend to fail
> with -EBUSY if a spurious port change event arrives on an empty port
> after its bus has entered suspend.
> 
> Fix this by checking PORT_CONNECT in handle_port_status() before
> resuming the root hub.  If no device is actually present on the port,
> the event is spurious and should be silently ignored rather than
> aborting suspend.

Doesn't this change prevent handling device disconnects on suspended hosts?

Thanks
Mathias

