Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A6042314F;
	Fri, 31 Jul 2026 10:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785494108; cv=none; b=O7a99yhbFdk089U71J/Ir611KswcrzD88U1VuPGepFdLDv16+sLzi7ZdibhWvH3hzgO5FLF36+BDFQsD6i5q1wr4WG7m8xG2jVzWW3JKG6poL4Nhb5QJjEm98erEF+/ewZ87wzSrJAQTJCWxDcW0BLD9+YrqX1kAgrTKYPc7KDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785494108; c=relaxed/simple;
	bh=fJ25phReqDl+LsZhLfOtJxLhKb7e7xC7DO2w/83q9AU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UvOofU8iHCY7m9lBdzM+TSv9zoNxNonmmydN3JBzjF/n84JaAejMYsPOYmTSiZKGW6D3DiyFF0XNy5fywzZseSrAzmqVdTcZB+FZzY6urJ6SBhL8EuDYsV3BeMVkmCgulhEn6k+k1xZpLkRZ9FHeqdCeVBVTWCWRwxdIqxjYNQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rea8G6HA; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rea8G6HA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785494088; x=1817030088;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=fJ25phReqDl+LsZhLfOtJxLhKb7e7xC7DO2w/83q9AU=;
  b=Rea8G6HAGOOVeFyZua4ekFqeqlzCMlZTzG0oExS/cdTipW/2GnJRt+Bz
   xDsWojzESZQmyzxUgVbGhUjj4JucyoBr4waEW/Sk3zSo3tSAnd9BwNhJ9
   Bz8C0Z+KxN8KAM3B97Rs85DME3v3KVMs/Nrl9mKuj9kpvn7qXRgiLk220
   MW0fF740wcjsbEiKpSTr3yaLuTj89zPP4ikNF73vcgcdFM06kRQTh43sY
   xjSG8pTgUjLT473pEXeS6CQRn3DuVeF6wvtR+Xk8nFR/b9etCqzIrhTMp
   5nJM1O0dGNIsmq3X2suDKRz+Qf7xbX3P7SNIYozOo3koHC02RlhJFubjl
   g==;
X-CSE-ConnectionGUID: AVOSEj3BSGm/qzxSU84geQ==
X-CSE-MsgGUID: oQF9gwt7SMuSZmuikovWJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="96706924"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="96706924"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 03:34:43 -0700
X-CSE-ConnectionGUID: gjDkyHhQRPSn6j/gO1F54Q==
X-CSE-MsgGUID: 2Z7/JifDQDm/JrVOzwgA6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="298748392"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.244.73]) ([10.245.244.73])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 03:34:41 -0700
Message-ID: <30a8cabf-44db-4023-9b1e-58d7b261bb4e@linux.intel.com>
Date: Fri, 31 Jul 2026 13:34:37 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] usb: xhci: Honor PORTSC.TM if valid
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@intel.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "usb4-upstream@oss.qualcomm.com" <usb4-upstream@oss.qualcomm.com>,
 Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20260715-topic-dwc3_tunneling_state-v2-0-026487a08119@oss.qualcomm.com>
 <20260715-topic-dwc3_tunneling_state-v2-2-026487a08119@oss.qualcomm.com>
 <amFCwDiD-StHHV9c@vbox>
 <2baa405c-5f9c-487a-8969-82d697e8cb1e@oss.qualcomm.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <2baa405c-5f9c-487a-8969-82d697e8cb1e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/28/26 11:44, Konrad Dybcio wrote:
> On 7/23/26 12:57 AM, Thinh Nguyen wrote:
>> On Wed, Jul 15, 2026, Konrad Dybcio wrote:
>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>
>>> Currently, the only way for the USB core to determine whether the link
>>> is native or tunneled is via an Intel vendor-specific Extended
>>> Capability.
> 
> [...]
> 
>>> -	/* Don't try and probe this capability for non-Intel hosts */
>>> +	/* Prefer the XHCI v1.2 ext_cap if advertised */
>>> +	offset = xhci_find_next_ext_cap(base, 0, XHCI_EXT_CAPS_USB3_TUNNELING);
>>> +	if (offset) {
>>> +		if (!(readl(base + offset) & XHCI_USB3_TUNNELING_SUPPORTED))
>>> +			return USB_LINK_NATIVE;
>>
>> Second, don't return early here. Check if XHCI_EXT_CAPS_USB3_TUNNELING
>> present and supported:
> 
> So if the extcap is supported and exposed, but it says "this port
> is not tunneling-capable", can we not trust that data?

The extcap 18 bit only states if tunnel mode bit reporting in PORTSC is supported, not if
port is tunnel capable.

Supporting tunneling and exposing extended capability ID 18, but not reporting tunneling in PORTSC
register would be odd, but due to the phrasing it could be possible.

Thanks
Mathias
