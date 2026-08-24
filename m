Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1803E4582DC
	for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 15:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787586669; cv=none; b=inzs/hb0HNu2lqq2unmCK2Mkvb4NaB1EfkjAIOb+eaHGZu5NdynQ6AjHXFxpAwuBlaahY3Di5D7qSip7CYufvoIo9lD/QsotFrEbzb72CvwDQhLwZlz1yXujNw5X1+qlDF4fCCb2yNlU6EAHXDRQ4YfdChePRWUNlMYIYKjHitc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787586669; c=relaxed/simple;
	bh=qg/ChErOcXRmHm700DpNogkyTqGYjFqbg4MsaZYLGt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MBH1KR4eK44a+rt8TrZRY+c7uK2bjgi3veH6hThv+l7/FH30tANMokt8dMpri45RcNYYR3YJiu0h3tWjd9pUXrE+AQMrSvKAUftPOJ0hHy0adsT2YV0tdQW2uTDN68AhDQIKJjT5CYQChM8viT+pPnqQWhrgP6oVvF1CaLxIuz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=oAePQ1t/; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="oAePQ1t/"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-930f618435cso195089285a.3
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 08:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1787586667; x=1788191467; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cR9r/XHGXcwDI/IJ82owPLkAmtUPCqo6EGSOKlEbxYI=;
        b=oAePQ1t/Motd1Zbt/dzt7SPCSQoRJUkK1l9JyorMonYFiRyRWaKbsvH3AS6hGbz0BO
         f3DuqQvxC4BWjfNntjc1/LEGqBUSOozpRrlxjM2Rqn5PuDLFYNVfcrCq3QoDF5h/KrEi
         cq/oz7c4BLM7nQrEd3iHRZYJ8OPOru3zYDNExc+aDqAw1jIYmSOZcAXEwlEiUyeuPTbk
         5XniBwFh93291uGNEoYylM1gwk9hzRMcnPA/9rRuluWqHjInoZGbbUxoRuRbfak8/OPC
         us/HLEZ9bg4GidDHbwJD/MxV4rEnR6xh9hOOkXQx2+838m4Sf/d1z/J8tj+P/TGC6wVm
         PiKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787586667; x=1788191467;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cR9r/XHGXcwDI/IJ82owPLkAmtUPCqo6EGSOKlEbxYI=;
        b=HxyEESjjV2OA6HQGsVkOIeuJABXshKVzoTEmrPy6i1GVtzQOYz67C88XpWwCdb5RrX
         Jy44Vfrd+nqgTJZahd5N4yfdyMTQsCkXPC/JCRqfhXHmekIyxmIj9o3CLWgFU5K9URKO
         pkFHVyI8kAX9o6s+XGqbBemnj1JTVzfTrHkgaBQ4nbShylL32b0dFjnE/mwerWwSNlYj
         ylskg2tz3EBdPXdXvcM9xBsMraGRGrwyVHABsf4uWMvurfWr+RdCVnaOg25NfuXhyWVb
         QsGdzbBYIqo6u4US61QUekRpRCJHjjJlCuyVcpPAQdorc++9fo5+KEgTrgCHotygE2d2
         RErQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrbk68TsmalXsIllkhlHsOsFJJCPE4HLkrvEhUwUyO2pSccxzrENOB6y43hfXwQE5p64qykZIDUEhM=@vger.kernel.org
X-Gm-Message-State: AFuF++lfMewXxZIrI85NZbMcMwQyCixs7luwF+Q+HNf2b4u+kJjOKmTn
	fc9KuJLIK4yonuPfNus6kbN1B+RABhQD+OnrKJr6TSMukZWOeDJE8bvG6e/yZJyKQQ==
X-Gm-Gg: AR+sD10LdK6gbFG7afqy6LacZGE3zP19vcVQByFtXaAIxXatWxjgLtSDU34Q+ii1vQg
	OEPZPAzOO3ZHlD0QOR1JgFpAvu7ebOESOjOEGE3/dvtlsWP9wPpwVQHw+U1bmIAbn2uLTcZEK1a
	V7zPUgGYCoYUODneOGGXM0ScpISe14ZeB5D7c9GLxbBYM++eKgAZhRPL9g3SFrCAyoFiGzUOWN4
	Zf+W8t1dmzk93RO95Qi1Zz/MNGBgqFiJVYxXT30MNm1P7EgIvDa/p+DTUSmyUW+uNV0bT27ndkn
	dJBzoQqQF1MspLez3jvcp3wVHRm4HGLrUOXXx4yeWEaGr24xuntOzDGb0KxTG5XckVc7nFnvsTP
	IHemTxLhe8XayE6Y4wUy6KZhxsttLEb9qSd21wLwRL4UsMNqKisSu7P/7TbYW7AUFUk3CyER/IM
	Euoz5bsv/SKSazCCdggxGXjGkMHjHvrPsmbVW11MD2adq4E6M59ML/5o+6mb2vtQ0xxNkGicgiX
	w9pAEhYr0rictHaPO3U1VUnDRC5zwlS
X-Received: by 2002:a05:622a:1919:b0:52d:844c:b0c2 with SMTP id d75a77b69052e-52e09b9f24bmr175329231cf.12.1787586666807;
        Mon, 24 Aug 2026 08:51:06 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52e09aca33esm49524261cf.21.2026.08.24.08.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:51:06 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:51:04 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Michal Pecio <michal.pecio@gmail.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: xhci: Fix isochronous scheduling regression
Message-ID: <25b021ba-338d-496b-81c3-0dc0a8777faf@rowland.harvard.edu>
References: <20260821114706.34b095b1.michal.pecio@gmail.com>
 <327f6412-5d07-4bee-a51c-06f1ce5823e6@rowland.harvard.edu>
 <20260821180350.3648f011.michal.pecio@gmail.com>
 <de41d8f4-e8d2-47d6-8be2-f191b28aecd9@rowland.harvard.edu>
 <5aa2f501-6980-44c8-b7fd-77f6b3b98bd5@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5aa2f501-6980-44c8-b7fd-77f6b3b98bd5@linux.intel.com>

On Mon, Aug 24, 2026 at 06:21:22PM +0300, Mathias Nyman wrote:
> On 8/22/26 05:38, Alan Stern wrote:
> > On Fri, Aug 21, 2026 at 06:03:50PM +0200, Michal Pecio wrote:
> > > On Fri, 21 Aug 2026 10:44:07 -0400, Alan Stern wrote:
> > > > Maybe it's time to correct the hcd_periodic_completion_in_progress()
> > > > implementation.
> > > > 
> > > > For instance, we could add an atomic giveback_count field to the
> > > > usb_host_endpoint struct.  The HCD would increment the field (while
> > > > still holding its private lock) before doing a giveback, and
> > > > __usb_hcd_giveback_urb() would decrement the field after calling the
> > > > completion handler.
> > > > 
> > > > What do you think?
> > > 
> > > I would go as far as incrementing it on successful usb_submit_urb() and
> > > completely doing away with those list_empty(td_list) checks in HCDs.
> 
> This sounds like a good idea.
> 
> Regarding theoretical race conditions:  If URBs for some odd and unknown
> reason are submitted by several callers to the same endpoint (no idea why
> or how this would happen) then, usb_hcd_submit_urb() could theoretically call
> hcd->driver->urb_enqueue(hcd) for the second URB right when .urb_enqueue(hcd)
> returned for the first URB, but _before_ increasing the atomic counter.
> 
> In this case hcd would incorrectly assume both first and second URB start a
> new isoc stream. This would be avoided by hcd still checking list_empty(td_list)

This is why my original suggestion had the HCD incrementing the counter 
while holding its private lock.

> Anyway, suggested solution still sounds like an improvement compared to what
> we currently have.

> > Possible alternative: Make the URB_ISO_ASAP flag take precedence over
> > the "queue is non-empty" condition.
> 
> xhci driver does this. If URB_ISO_ASAP is set then xhci driver always sets
> the SIA "Start Isoch ASAP" flag for the transfer blocks.

I wasn't very precise before.  I meant URB_ISO_ASAP should take 
precedence when there are no active URBs but there may still be some 
URBs being given back.  In other words, when the list_empty test 
succeeds.  If the list of queued URBs is not empty then new URBs should 
always be assigned to the next available slot -- unless we decide to 
support a new URB_USE_FRAME flag and the flag is set.

The point here is that if the class driver wants to change the alignment 
between URBs and uframes, without worrying about the BH giveback race, 
all it has to do is set URB_ISO_ASAP.  If it doesn't care about the 
alignment (implying that it also doesn't care if some URBs are assigned 
to expired slots) then the race doesn't matter.

And of course, if the class driver wants to maintain the alignment then 
it should resubmit URBs from the completion handler, so that the queue 
doesn't empty out unless there is an underrun.  Then the BH giveback 
race won't be an issue.

> The urb->start_frame value set by xhci driver might not be correct in this
> case.

Do you mean it might be wrong because xhci-hcd can't tell what uframe 
the xHC hardware actually selects?

Alan Stern
