Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136173FD15E;
	Tue, 30 Jun 2026 10:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782815463; cv=none; b=KlZv9Keb4EDMBYFFlRQrHdgLes6wBJKe6mX9NksuBI1wxSARSUCb2koS8fm6Dz1D3O6UxU/2kUhxxgWrSVYvUkYhrexewc8Z6f6BuumSGrsB9UR5FnbIovHMwrRn5XGi9YZOjcDbQ9pWBKSb1pAPWNhqtYhgAm/0qHShYep/F50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782815463; c=relaxed/simple;
	bh=w2zJjc0mlqhV9a6H/3fB7R2sAl42l1ogKc/1eNMaXSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X2dwT5ahSsvlL8yHiWnhUN2D7vh6dGU1i2vipyR9MFsjn0HZczU3oMqvUjDz8eOyXfEpwb+St3D62qzomtaNDg1+3Ckc2k9XaqkVomQYyA0w/1OFKeunqOH4cKPrboCihEaT0hM7bRz/Hg6b7N+DYRYxo0TwrJ8+a6//YhVKdP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GIuAOKsX; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GIuAOKsX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782815462; x=1814351462;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=w2zJjc0mlqhV9a6H/3fB7R2sAl42l1ogKc/1eNMaXSE=;
  b=GIuAOKsX3m0xed+50bDqnZDBCZuK6BsykPTgiKGzpjJq4exvPukXhavc
   OdqRGpfViV3z41jWCMtcx4h7FL+mmX7jf8guWdzglczAC58zKYJIw3gVb
   qPEb/yZnsCx6+BPsR9S2bcypQvEX37tEyeisiLzArPhbvY4y5FZLHWc4f
   Vd4+Zp0QGez2hj4Oq7U6NSuYblJ/YQLIUJqZWscug1sl2HeEFNJmj8Ben
   Y5tRCd6D+lLt0OlJw6RfC+yyw6g7ApwK2xPJ28z3X/08mkOyBBBk3Lx9c
   ss12Oi/rcPMVn4CdN6iUriDJ602+jCSeF3UCDfsKkBSSLFEXiey3mpt7C
   w==;
X-CSE-ConnectionGUID: 8aeNU1KSRPK1SA1/Lk3s+g==
X-CSE-MsgGUID: /P72qIy6RDGHpHFHYXAJRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="71047624"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="71047624"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 03:31:01 -0700
X-CSE-ConnectionGUID: mHXrrIjwSoKUAmocmZr96Q==
X-CSE-MsgGUID: xExt8gUjQaO9TQulA7nw5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="251825854"
Received: from rvuia-mobl.ger.corp.intel.com (HELO [10.245.245.197]) ([10.245.245.197])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 03:30:58 -0700
Message-ID: <22af27b3-0595-4490-a9ab-9a7fdf4cef47@linux.intel.com>
Date: Tue, 30 Jun 2026 13:30:54 +0300
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
 <4ba1dbbc-7597-4042-a443-4ffd292559de@linux.intel.com>
 <939cee9f-d4d7-4b42-8337-f765d39feb10@kylinos.cn>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <939cee9f-d4d7-4b42-8337-f765d39feb10@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/30/26 11:43, Pei Xiao wrote:
> 
> 
> 在 2026/6/30 16:10, Mathias Nyman 写道:
>> On 6/30/26 10:36, Pei Xiao wrote:
>>> handle_port_status() unconditionally resumes the root hub when
>>> hcd->state is HC_STATE_SUSPENDED, regardless of whether a device is
>>> actually attached to the port.  This can cause system suspend to fail
>>> with -EBUSY if a spurious port change event arrives on an empty port
>>> after its bus has entered suspend.
>>>
>>> Fix this by checking PORT_CONNECT in handle_port_status() before
>>> resuming the root hub.  If no device is actually present on the port,
>>> the event is spurious and should be silently ignored rather than
>>> aborting suspend.
>>
>> Doesn't this change prevent handling device disconnects on suspended
>> hosts?
>>
> *Thank you for your reply. I’m not familiar with xHCI or these registers.
>   Can’t we tell the difference between a real unplug and a situation where
>   the device is physically still attached but portsc reports a disconnect?

Not really. In your case it really looks like a disconnect.

Port Status: 0x202a0
	Disconnected
	Disabled
	Link: Rx Detect
	Powered
	Unknown port speed
	Connect Status Change

Is it only this specific device that disconnects on suspend, or can this be
reproduced with any usb device?

Thanks
Mathias
