Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081ED4C754C
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 12:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791547598; cv=none; b=GBFhr06l0ersSmWbNrdMoCVqn9PZSZykq1zjFXV6LDn+PDdmWe8949csMAsbjXvFhWf18CESmG+Q368rgaQnhaLodU9yKW0WcvlVbnWiQqVK4AkjQ3ETPEZ4cqQLgI0dhONanfxeOlPLPqEzIIo6x3/gH23AJLJuF7O+36kj1vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791547598; c=relaxed/simple;
	bh=YRfvP8dfkzLQj1ui078c82HLQmhGz5WrfhEMP9WxLug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DNeC4PgUt79tpYAg2y+hZBRqhG9rkHSti/Y0SsHqqg5y7P2oS+XyiWLulnfoUWJy/tt1IswJ+aC0wg+LrJ66ptFXz6pBBEO182SeRvtOUdydC6vhyNr7PTqQ5BauQ6feag3HCB5GCCZqcbaJDe2WvBhN5sCqoXZjOOZVbl2WNDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V/xT6I7M; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V/xT6I7M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791547593; x=1823083593;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=YRfvP8dfkzLQj1ui078c82HLQmhGz5WrfhEMP9WxLug=;
  b=V/xT6I7MUAEt8HwAUAJuv9vjjgAxPaKs38rpcWD6dg0mIuxjufPxXBjN
   Jm+u2Kl/T/daqpk1IbCVAp4gCTL+jKVChp7aYfSDvIJQ6c2QqMr2l8loG
   ERaNWMbpNsfB4homW5H9uLFrKHqhX/IdHaGJSICtKsG7r2TTKL6Ps0J52
   Ntjh3UfF+3ixOn/bl0VKCs9t9qxnayAkJx4F1Eqp7tIjbWqG2TiuyVrca
   k7r0lfGWF/6dH3l63q4wEqNW4INzJmmkZiNs7ExUxtUUMFqy61wSv26T6
   JysGHoaJMdOOuc6fkliB8an8n2Td2qWxMuObwAaoqa0Qxaxcsi8Eoq21j
   g==;
X-CSE-ConnectionGUID: PZerHVPZRIiE6ggYP22cuA==
X-CSE-MsgGUID: DvRTy1SFSOKeCh40njGSCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="352714"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="352714"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 05:06:32 -0700
X-CSE-ConnectionGUID: MaRVcIMYTIKHxpzYEAUIew==
X-CSE-MsgGUID: BVU4eG2GQeW75WWF6nDesw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="235853"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO [10.245.244.17]) ([10.245.244.17])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 05:06:32 -0700
Message-ID: <50dca803-4a2d-47a9-b65c-a03a13634e45@linux.intel.com>
Date: Fri, 9 Oct 2026 15:06:28 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/14] usb: xhci: Don't set the skip flag on non-isoc
 endpoints
To: USB <linux-usb@vger.kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
References: <20261009095834.561578-1-mathias.nyman@linux.intel.com>
 <20261009095834.561578-11-mathias.nyman@linux.intel.com>
 <sashiko-outbox-165215@kernel.org>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <sashiko-outbox-165215@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/9/26 13:16, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] usb: xhci: invalid completion of URB with -EINPROGRESS on COMP_MISSED_SERVICE_ERROR
> --
> 
> commit dfab6709cb637a348bd004519bdfe39df717cdc4
> Author: Michal Pecio <michal.pecio@gmail.com>
> 
> usb: xhci: Don't set the skip flag on non-isoc endpoints
> 
> These events are unique to isochronous endpoints, ignore them otherwise.
> Update debug messages to reflect new policies. We could also log invalid
> events as errors, but it seems nobody has ever had problems with that,
> so don't bother.
> 
>> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
>> index 8b915a1d5b256..2dd11732bb87c 100644
>> --- a/drivers/usb/host/xhci-ring.c
>> +++ b/drivers/usb/host/xhci-ring.c
>> @@ -2778,16 +2778,18 @@ static int handle_tx_event(struct xhci_hcd *xhci,
>>   		 * Set skip flag of the ep_ring; Complete the missed tds as
>>   		 * short transfer when process the ep_ring next time.
>>   		 */
>> -		ep->skip = true;
>> +		if (ep_ring->type == TYPE_ISOC)
>> +			ep->skip = true;
>>   		xhci_dbg(xhci,
>> -			 "Miss service interval error for slot %u ep %u, set skip flag%s\n",
>> -			 slot_id, ep_index, ep_trb_dma ? ", skip now" : "");
>> +			 "Missed Service Error for slot %u ep %u, skip %d, try now %d\n",
>> +			 slot_id, ep_index, ep->skip, !!ep_trb_dma);
>>   		break;
> 
> [Severity: High]
> In handle_tx_event() in drivers/usb/host/xhci-ring.c, for non-isochronous
> endpoints, does using break instead of return 0 here cause the event to
> improperly fall through into the rest of the handler?
> 
> If the event's DMA matches the current TD, it appears it is passed to
> process_bulk_intr_td() or process_ctrl_td(). Since those functions do not
> handle this completion code, does the URB's status remain initialized to
> -EINPROGRESS, completing the URB with an illegal status code?

Not an issue,

MISSED_SERVICE_ERROR is completion code only applies to isoch endpoints

see xhci spec section 4.10.3.2 Missed Service Error
"This error only applies to Isochronous endpoints."

> 
> Additionally, if the event DMA does not match the current TD, does the code
> fall back to the debug_finding_td error path, fatally shutting down the host
> controller with -ESHUTDOWN?

Not an issue

This completion code is exclusive to isoch endpoints, meaning td->skip
flag will always be set on this error, thus never taking the debug_finding_td
error path.

Keeping this patch, will send as part of v2


-Mathias
