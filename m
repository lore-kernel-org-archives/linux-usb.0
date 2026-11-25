Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629585;
	b=403leFXump7HKb53t9WfNvfZb6oreYBmkqKLzKB7i1dp5Uy/ohxNt3h70fIYTgT7YEMA
	 ufoiJo/cXWdFs/2R6q9y2XoboDc1SFMAR1mXJifRnAmMPlW/HiMV3oTdCZiN8vnSL8Q8/
	 jUm5/mD6TM2P/KdSJLzq87ikkbBQ7ZipOtRoX1QAfpmxVvTssiiomk1v7lZ7akHrHaqYo
	 YU9EwWIW7d/5GYZWRhdiOqH8BZw63ytEbZFd1+sjMlPP/k1mEdHuuLy3uwGuaFyr3I9LT
	 Dz9cIZpz137yxgDeHstB+wX5Vg+0Mdo2jRbJ+YfgqWKF41gr2ErpRDdgOphRRf9625A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629585;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=8xxPoushT3am/9XRaYbwUd52a3PrzpZOtIAZVkV79f0=;
	b=2UKhbSi1FqzOPjZeeVJPcPdBZZk9wPhrOdFMwaxCkdfS4b8JJ1lMi2trMhaPTxsbidWG
	 c2TEjymqvGuvmSaITaVATAx2919UjFqU/T5OkCtr+zTh5Zr+QnRCjELZ2lEhSydNAQ0Ox
	 3DP/fY/Xlk7ATwoiOIwb61zBdwBNcvUwhvIjKOXMH0FXjhZbP9jVkirkBG6Fjsa+Y2uRL
	 wRNnNPhioZVOXE+B+fkIuk7Owl/naSQvx2DzyFL0YCWeo3ts9MJTWjB0uzFcYKPI6TZsk
	 eqGs9ZXeHM+T3gzwrkAyloD9V/RIrtKLT7xJ7Wj2Koi2SqxWtY0bSBFDwDFU4CxipNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RNluqWnU;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD81A606A31E
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 17:59:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD81A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RNluqWnU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795629585; x=1827165585;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=mj5BW8Q8V/pK5vwYlxYeLY3vr08StTBotxNKxAtr8nI=;
  b=RNluqWnUFqXOMrjk4LIlxiXwZIDKH9db1i4ur+yTaJUS6oN57hToWcbM
   fv3EGLf2j+jizyJ4J7clSUFyXDaqXihTxlKCDJgRYqFXcOfTflgkjX3hc
   qnT2MDakXkCGG7FdNYknpapPSF+QWrMo5r+0JMtVRXrtZkLIFMfLsUvz/
   VJQAO/Ezd1WwxaB99MHiUodj/9x+N99xcZEpEgDYAORBMIko8w9YolHPF
   ilRB0OTrjq/ciByVIEuX76ADrViWuxMjyQPGEGRoA84MTlgFPcdhYXEaU
   O6Ei57rAPnFujgtmR5N7ygC4OBrtVIOgjJY4l31lz+0MOgRUuCLPByZ0u
   Q==;
X-CSE-ConnectionGUID: 3b1uzFhfRoqLOhWf2+rgTg==
X-CSE-MsgGUID: XFdENTqDQWKXSZfsemRiTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4411247"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4411247"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 09:59:44 -0800
X-CSE-ConnectionGUID: dLurvYB3RKWRAxxuCtPing==
X-CSE-MsgGUID: Ryp4i//ERoWWMA5Yy+B14A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="11936150"
Received: from inaky-mobl1.amr.corp.intel.com (HELO [10.245.244.80]) ([10.245.244.80])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 09:59:44 -0800
Message-ID: <d34713e3-edf0-4e37-bfaf-73ad6e286c32@linux.intel.com>
Date: Wed, 25 Nov 2026 19:59:41 +0200
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: xhci: Demote isoch buffer overrun message to debug
 level
To: linux-usb@vger.kernel.org
References: <20261123-xhci-overrun-dbg-v1-1-4e5a2f11740d@albefly.com>
 <sashiko-outbox-229825@kernel.org>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <sashiko-outbox-229825@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/23/26 20:31, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found no new issues
> in this patch, but noticed 1 related pre-existing issue it does not
> introduce:
> - [Critical] usb: xhci: use-after-free in handle_tx_event() [1]
> --
> 
> commit a6e2659078b35c8ca15718bbecaa3c3d7eb80931
> Author: Alex Kononov <alex@albefly.com>
> 
> usb: xhci: Demote isoch buffer overrun message to debug level
> 
> This commit changes the logging of COMP_ISOCH_BUFFER_OVERRUN events in
> handle_tx_event() from xhci_warn() to xhci_dbg() to avoid flooding the
> kernel log on device-triggered overruns.
> 
>> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
>> index a1fa188680f58..39d214e8a0289 100644
>> --- a/drivers/usb/host/xhci-ring.c
>> +++ b/drivers/usb/host/xhci-ring.c
>> @@ -2815,7 +2815,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
>>   			  slot_id, ep_index);
>>   		break;
>>   	case COMP_ISOCH_BUFFER_OVERRUN:
>> -		xhci_warn(xhci,
>> +		xhci_dbg(xhci,
>>   			  "WARN: buffer overrun event for slot %u ep %u on endpoint",
>>   			  slot_id, ep_index);
>>   		break;
> 
> [Severity: Critical]
> This problem wasn't introduced by this patch, but can handle_tx_event()
> pass a freed td pointer to xhci_handle_halted_endpoint() [1]?

Adding the patch, and writing a separate fix for this sashiko reported issue.

Thanks
Mathias


