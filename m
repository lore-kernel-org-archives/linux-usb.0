Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE56934D385
	for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 14:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785422811; cv=none; b=kqspqvONQKSRBqsBUxU7FNlgHP7HbvqloQwoO4g6aCSaj0YF9nED2JNfBH5hePec9gaF7YsOlwxNFbnrxWVvyUQOIs1312QkH32hsS/VKidYX/9imAP6ZLeSd/W6FVxpSC33pytzJZAv/XlFoz/7swRdjRQErMYLDOHRTFh8baI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785422811; c=relaxed/simple;
	bh=1cyoeDA5NXkA+ehHJHQdPrusTAUSjWWmV1Nz+jMfAng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Az82n5MHLevJ3fQKJ/AzmTlwZdhS8H+xKYzq7q1zMkCx09zJ0DBXzBH7l6RDBC8KCqT8ZDIn72h3Nv5dkm7xBNDn8h/+OKR0WpH42c7onhD0nj0pbBEKatllf9xAmytELa+eyhk/M1JneGMZItuY6v5H6CEgRak+hW6xEcRVV+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QhMQsUzD; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QhMQsUzD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785422809; x=1816958809;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=1cyoeDA5NXkA+ehHJHQdPrusTAUSjWWmV1Nz+jMfAng=;
  b=QhMQsUzDLCuQZnUETJ/lhJ/IuzmKZ69LL9JXspfWnUYU2tikFHQRoSFf
   THxj0by6HJd4e/bTofkwTeOhE+qHdSS84ozTzF9WqrN0nQU9Fq9cjHecx
   z9Kh2qvYXni4MWBs7gMRLAhDB5ZleuZzSVtuyyCB73Ijj/HLlQfxRfWpK
   p4+4ilKVSz45dhe/xJGe5lIFrjnbfOLrG+GLfNX9LesXxSp329F2cORI5
   dBifGKYZrHB0RVyBTkJeCSdQjNL9vGo8ra28GtGGfJhvZ4v5eBH+WNBq/
   256JcWfnxC0zj1EkvN1CM41U/HIJ61x5MBqkrF4iEJFZxljqJSpkffjHv
   Q==;
X-CSE-ConnectionGUID: 0bnwLlHLSuSDP0WCHE++dw==
X-CSE-MsgGUID: aKkDHHNuTiSIjGBvOJtPmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="97199386"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="97199386"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 07:46:48 -0700
X-CSE-ConnectionGUID: EBjwiuUNSuauiiXNP177+A==
X-CSE-MsgGUID: wN4b3GpmRrCPKML7sNEZxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="253992035"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.245.174]) ([10.245.245.174])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 07:46:47 -0700
Message-ID: <896e46c6-eb45-46cc-a8d6-7b515cc3cc15@linux.intel.com>
Date: Thu, 30 Jul 2026 17:46:44 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression: webcam freezing since Linux 6.15
To: Michal Pecio <michal.pecio@gmail.com>, Bart Nagel <bart@tremby.net>
Cc: linux-usb@vger.kernel.org, mathias.nyman@intel.com
References: <20260723081440.0228c59e.michal.pecio@gmail.com>
 <20260723081440.0228c59e.michal.pecio@gmail.com> <amJ9jAtK8rNWDO7V@spiral>
 <amKUdIRBrsFiDTiV@spiral> <20260725115956.321185a1.michal.pecio@gmail.com>
 <ame6T_LjiJBeJ2W3@spiral> <20260728003131.085171ee.michal.pecio@gmail.com>
 <ampPGn-3C9PSEZQz@spiral> <20260730130814.65f7891c.michal.pecio@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260730130814.65f7891c.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/30/26 14:08, Michal Pecio wrote:
> On Wed, 29 Jul 2026 12:37:01 -0700, Bart Nagel wrote:
>> I didn't seem to have the "before" blobs your patch indicates in my
>> repo and it didn't want to apply where I was (at the first failing
>> commit) so I went to 6.18.28 and applied your patch there.
> 
> Sorry, forgot to say that the patch was made for 6.15, but if it works
> on 6.18 then fine. The alien blob IDs are other (unrelated) patches.
> 
>>      [  340.443735] xhci_hcd 0000:00:14.0: Miss service interval error for slot 7 ep 2 ep_trb_dma 10aea6260 td_dma 10aea6270, set skip flag
>>      [  340.443740] xhci_hcd 0000:00:14.0: Event 23 for old TD end DMA 10aea6260 after 7us
>>      [  340.443743] xhci_hcd 0000:00:14.0: BAILING OUT
>>      [  340.443858] xhci_hcd 0000:00:14.0: Miss service interval error for slot 7 ep 2 ep_trb_dma 0 td_dma 10aea6270, set skip flag
>>      [  340.443861] xhci_hcd 0000:00:14.0: Miss service interval error for slot 7 ep 2 ep_trb_dma 0 td_dma 10aea6270, set skip flag
>>      [  340.444110] xhci_hcd 0000:00:14.0: Found td. Clear skip flag for slot 7 ep 2.
> 
> As expected, ep_trb_dma points one entry before the first pending TD.
> The driver would throw out all TDs searching for the one which doesn't
> exist anymore, but we prevented it and later recovered normally after
> getting some event (not logged) which pointed to a valid TD.
> 
> So the fix works, maybe with exception of one edge case (see below).
> We could potentially use it, or revert the bisected patch (it was only
> an optimization, maybe nobody will notice), or add a quirk for this
> particular chipset to ignore ep_trb_dma in Missed Service Errors.
> 
> Long term solution would be improving detection of events pointing to
> completed TDs and/or not skipping when we don't have a sensible TRB
> pointer. But we also need a "trivial" fix for stable kernels like 6.18.
> 

How about something like this:

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 4f98d8269625..639f15dec947 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2614,6 +2614,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
  	unsigned int slot_id;
  	int ep_index;
  	struct xhci_td *td = NULL;
+	struct xhci_td *ev_td = NULL;
  	dma_addr_t ep_trb_dma;
  	union xhci_trb *ep_trb;
  	int status = -EINPROGRESS;
@@ -2648,6 +2649,14 @@ static int handle_tx_event(struct xhci_hcd *xhci,
  	/* find the transfer trb this events points to */
  	ep_trb = xhci_dma_to_trb(ep_ring->deq_seg, ep_trb_dma, NULL);
  
+	/* find the td this event points to */
+	list_for_each_entry(td, &ep_ring->td_list, td_list) {
+		if (trb_in_td(td, ep_trb_dma)) {
+			ev_td = td;
+			break;
+		}
+	}
+
  	/* Look for common error cases */
  	switch (trb_comp_code) {
  	/* Skip codes that require special handling depending on
@@ -2795,7 +2804,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
  	}
  
  	/* If the TRB pointer is NULL, missed TDs will be skipped on the next event */
-	if (trb_comp_code == COMP_MISSED_SERVICE_ERROR && !ep_trb_dma)
+	if (trb_comp_code == COMP_MISSED_SERVICE_ERROR && !ev_td)
  		return 0;
  
  	if (list_empty(&ep_ring->td_list)) {

Should be trivial enough, handle MSE on link trb, and is in the right
direction for a longterm fix.

knowing ev_td will allow us to simplify the horrible do { } while (ep->skip)
loop later.

Thanks
Mathias

