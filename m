Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AD13FB7EB;
	Thu, 11 Jun 2026 17:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781200426; cv=none; b=DsYhgC4a96gIEPgXQ7toWyPUSYvujcLonbEF0TzvCwc9Sf0OVxv1d6uIrqJDdn/g7Yzn2UGvC+vJ/e5kpR9rGPK1UPLQ2uIjaoWYu713TgCIxFUIjuSfiRuAHm0OymgWmQEZiz+xdTCGrEYTw2RS5vnzb4DOVKDjhFU4BvoooaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781200426; c=relaxed/simple;
	bh=UxJVMCh2UxOTKxNEaUE6+onL7ncaJ84ZYij4FeAmcac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aMP8t9N0VFmbyF0J2q5NTcGo1SjgCyyduoL8ULNGOYSIiPtddJSseOvBkXXK3v8sAwkxJhAAnAJl+yB9SdMNO2sDIfzquZjhCp24zfu2koC/zWCc8AVIk7wJuUNaEDSC/6MZMyR22q2NBKTG8nSEIixlUdBAeMrWFcBDAd464LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b+EoNJe4; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b+EoNJe4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781200426; x=1812736426;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=UxJVMCh2UxOTKxNEaUE6+onL7ncaJ84ZYij4FeAmcac=;
  b=b+EoNJe45vl3Jg2gsDyHnQ0XXV6m18/VVLRZHG352HEMMtiYmWb/mQeW
   kYatg0n8q8QorqYH8Mw1rU3R/PX/IvVDC5JlDNaOPWEyGe0XGybKcmaXc
   Fgf34CefRWejWkETDB+Q3C3jLJLJttlnEgYlasCuHRliiArt2abEAjywm
   VhlXXZnkcFRctG28eFcDLXoDF+MSPpegYwDkyOksTZfLtCifcIZ2iV8iK
   u2gYEdIqcTBcUJB3M49hlUX/NsyvxaU8+0EtG+3vqZyrD2IUmi7YWu8Kv
   HlrTxGsnH98CFVrbOUNiUXOc9kZ1ys9FMOOiBp+zNzITcv3FJnWGrI3kI
   A==;
X-CSE-ConnectionGUID: unpdTX5ET/Sdo7ikWlzWrg==
X-CSE-MsgGUID: UBvfheETSqu1fCCqcwC6zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82131866"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="82131866"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 10:53:45 -0700
X-CSE-ConnectionGUID: 7LtCkTSFSY+x1jYSrB89Qw==
X-CSE-MsgGUID: D9YrN5Q+ROmpfVVLTe0Vmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="284652813"
Received: from vpanait-mobl.ger.corp.intel.com (HELO [10.245.244.163]) ([10.245.244.163])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 10:53:43 -0700
Message-ID: <10322326-6b5a-4f6e-8c8b-e915363137ee@linux.intel.com>
Date: Thu, 11 Jun 2026 20:53:40 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOetlOWkjTogW1BBVENIXSB1c2I6IHhoY2k6IEZpeCBzbGVlcCBp?=
 =?UTF-8?Q?n_atomic_context_in_xhci=5Ffree=5Fstreams=28=29?=
To: =?UTF-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>,
 Michal Pecio <michal.pecio@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <TYUPR06MB6217153FC7FC9757871D501ED21B2@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <20260611094526.2f5ddbba.michal.pecio@gmail.com>
 <TYUPR06MB62176F41E25F9A5C5FA5AD52D21B2@TYUPR06MB6217.apcprd06.prod.outlook.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <TYUPR06MB62176F41E25F9A5C5FA5AD52D21B2@TYUPR06MB6217.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/11/26 11:33, 胡连勤 wrote:
> Hi Michal Pecio:
> 
>>> When a USB device with active stream endpoints is disconnected,
>>> xhci_free_streams() is called from the hub_event workqueue to
>>> free the stream resources while holding xhci->lock with irqs
>>> disabled.
>>
>> Pedantry: it (currently) holds the lock while freeing, but it isn't
>> called with the lock held, nor for the explicit purpose of freeing
>> things with the lock held. Not sure how to parse this sentence?
> 
> The above description has a problem; please update the description information:
> When a USB device with active stream endpoints is disconnected,
> xhci_free_streams() is called from the hub_event workqueue to
> free the stream resources.  It acquires xhci->lock with irqs
> disabled, but then calls xhci_free_stream_info() under the lock.
> 
>>> It calls xhci_free_stream_info(), which invokes
>>> xhci_free_stream_ctx(), which in turn calls dma_free_coherent()
>>> for large stream context arrays.
>>>
>>> dma_free_coherent() can sleep (e.g. via vunmap), triggering
>>> a BUG when called from atomic context.
>>>
>>> Call trace:
>>>   dma_free_attrs+0x174/0x220
>>>   xhci_free_stream_info+0xd0/0x11c
>>>   xhci_free_streams+0x278/0x37c
>>>   usb_free_streams+0x98/0xc0
>>>   usb_unbind_interface+0x1b8/0x2f8
>>>   device_release_driver_internal+0x1d4/0x2cc
>>>   device_release_driver+0x18/0x28
>>>   bus_remove_device+0x160/0x1a4
>>>   device_del+0x1ec/0x350
>>>   usb_disable_device+0x98/0x214
>>>   usb_disconnect+0xf0/0x35c
>>>   hub_event+0xab4/0x19ec
>>>   process_one_work+0x278/0x63c
>>>
>>> Fix this by saving the stream_info pointers and clearing the
>>> ep references under the lock, then calling xhci_free_stream_info()
>>> outside the lock where sleeping is allowed.
>>
>> I wonder if this copy is necessary or if it would suffice to start with
>> calling xhci_free_stream_info() unlocked (EP_GETTING_NO_STREAMS should
>> ensure that nobody submits new URBs and hopefully core won't attempt to
>> re-enable streams concurrently) and then grab the lock only to update
>> vdev->eps stream_info and ep_state fields.
> 
> I considered this approach, but there is
> a use-after-free window between freeing stream_info and clearing
> the pointer.
> The xHCI interrupt handler (xhci_irq()) holds xhci->lock while
> processing events, and several event handlers access
> ep->stream_info under the lock — e.g.
> ring_doorbell_for_active_rings() iterates
> stream_info->stream_rings[], and xhci_handle_cmd_set_deq()
> accesses stream_info->stream_ctx_array[].
> If we free stream_info first (outside the lock), then acquire the
> lock to clear the pointer, there is a window where the interrupt
> handler can still see the old (dangling) pointer and dereference
> freed memory. So we need to clear the reference under the lock first,
> then free the memory outside.

Good point, but the need for this reveals another bug.

This means xhci_free_streams() can queue a configure endpoint command
to remove streams, and xhci_irq() can ring the doorbell of a stream at the
same time xHC controller is processing the command to remove the stream


CPU0				CPU1				xHC controller

xhci_free_streams()
spin_lock()
state|= EP_GETTING_NO_STREAMS;					process old cmd/xfer
spin_unlock							write old event
xhci_configure_endpoint()					trigger interrupt
				xhci_irq()
				spin_lock()
				handling old event
				ring_db_for_active_rings()	process configure_endpoint cmd	 				

Looks like we assume streams are functional by checking if ep->stream_info
exists in many places where we should check ep_state stream flags instead.

We should for example prevent ringing stream doorbell if ep_state has
EP_GETTING_NO_STREAM flag set.

So I think this is a good targeted patch for this specific issue.
We should start fixing the other issues and hopefully end up where
Michal suggested.

Thanks
Mathias

