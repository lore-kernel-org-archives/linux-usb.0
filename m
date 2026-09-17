Received: from mail-qk2-f17.google.com (mail-qk2-f17.google.com [74.125.230.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C5A4DDB3A
	for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 15:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789659546; cv=none; b=JRuBjZcqPtUnanfMSWANB3nS+nCOMW2FRr8a6iJO49fJlPif5MOG7GvwQbN4MlfW5uswqo8geALTmKDWDVuDh+tT0JN/d5RJ/OW9LXigNIcRHoWCEPSWY6pbmdwmP0xh0L3JgSn0Q8CdLO5kc3hpgt5wOCs7+I8godLtS9g9b5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789659546; c=relaxed/simple;
	bh=273R7P4iV55BuQ0Vv3fFNp7dBDML9cdOiqCSVSzG80Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=saRl4JXz46iMCEm2UysjJRNj5+nyn9JuuTXzwPZflV8KWw5RqCliSQfvnYPD4bxH1QmJzNHFERV3IbmLdK4Zq/hajZwTzA/n2mHo7pu0qVubDab8bkGBIPjcEaFl3XyrQr3Ern6I8b2peNSUeMBnTKII5Oh/23lFgD+92qV74hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=XrzjwFf7; arc=none smtp.client-ip=74.125.230.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="XrzjwFf7"
Received: by mail-qk2-f17.google.com with SMTP id af79cd13be357-93910ca5aa7so96754385a.1
        for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 08:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1789659534; x=1790264334; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jc5S0ginpT++NJYPgFJw0iizISYmUmx4tHS2Km60SDM=;
        b=XrzjwFf70plw/4t5bMgrM7fpJ87WEKVY38wL7TJZNa1kXncLxwa2bNpAZIUfxg6reE
         WAYvgciPNmu6Xv/1Unc4HPt2EbF80ziBUR2OXV5vSwgcVV06OFATBIZiFIZAM7dsvV/K
         9tki7a1S5dz8OsXUyVmjT8odBXntGDN/27KQNAb5fpR+zqDQ+llSgozPzD/vD+u/gXF/
         V9Ngzvo3y8VybtLzEDqn7G4cMfNBMkUBD8voV8dD5ncoCLFbAdo2ht2mUBZNWb8M8sOa
         ETnhA376RRwdnwdKwUvnChTIho2vM5sHE6vhfXvwJ/KkEY0o13IuASIz//EKOAdbPO9L
         6BDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789659534; x=1790264334;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jc5S0ginpT++NJYPgFJw0iizISYmUmx4tHS2Km60SDM=;
        b=H7vkz3Y12Av939/AilwpUfjaJf8XabRoPUQP9YQiK4lIM05TyyGzONjd5f5xvsT5nf
         D+Nn/P1PbGQet+1sh5rnnk6XRKS3jvlQbDQQDj8/lyKDMiIj9n8uXkkb4w8bsjegi5LN
         J8q3Qc2knB1adxT8FKV0DLRRJ0POE8TMw2AN2UQ8l4XoeVSgOQWR5xnXqGD2vfjE2FgU
         Th99Sur5LDIR8M5/SOdmHQOkqs05vpOokiAYBXkwAZNZi+9hC3pxOhikSkRVLFoSlqgs
         FCCU776lRZR7//GGkh8a9OFkqYrIG4Sf5YaJztQ/zn0ipt/N2vYqLxS3hdA1DMANTCKP
         m41g==
X-Forwarded-Encrypted: i=1; AKwUvByjocHamO92fQtI/2sg0KAtp8BfPds2pEAg7GbjMm6dqt036kQyQk3PiIgh5tyG+MpCFE3F5GB8Sl4=@vger.kernel.org
X-Gm-Message-State: AFuF++kI3+tNdOOapF5EYsndkHzwijBIN1W7qaAq2p+1TPxsHw3jwYVd
	1CVDLI6+HhXUvIcWZaBJp3YFQ2ZuHONjU3JBDb2B4oNeWeUiVW08kyO0/5aZIuNtcA==
X-Gm-Gg: AYBFou2OA0OPuvVT/tg7fqqzLwoNnDvDGzifn1n6giJbRrWMqiVqsIuXNr/yDghEC4a
	SiO9c4sK/jULxSsRTQTXdfbcxgqwZDKISaaUJuUCrogQBR9eFXa365K7fpRxJ//+5aouxMPunuN
	slWR9jacC9mQ7tEMv39d9tOzp1lxHQsw6p1mUT3/6msfviPhLqD4+VEbsnSaN1QncFPwVR+VoLD
	1MIoMuVDUAcwZ73nMn3Q9eZPQRUjrFihVH9B5QEj1ccl8fxenQu3fKJ5n8er5hzY4u5N7nPu3LV
	TC6/ajbpOLNo7yuFjFxonVAAvte0/Vm1YadQaJGCvrshAfY9GsYaI44Ch8leVt68xGZWWQekyvC
	N92LaQ/ahvJPXgvd6TtNWjeLX9nE3ovUWwXRoX9xecLlxyyCOKXX0wmFNOuo1iDHunrQsW9tzPz
	bkTyr231zkogG2uzpR9EUpXXItG50jrR6bdKLVCUMnV7/KtNbd8svyXppSpGAXIgX5xXQZ2STW
X-Received: by 2002:a05:620a:254f:b0:939:57ca:7e0a with SMTP id af79cd13be357-93bb76a7bb1mr1296427185a.7.1789659533820;
        Thu, 17 Sep 2026 08:38:53 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b781dfde3sm498388785a.12.2026.09.17.08.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:38:53 -0700 (PDT)
Date: Thu, 17 Sep 2026 11:38:49 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Minseo Kim <neck3922@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrey Konovalov <andreyknvl@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, syzkaller@googlegroups.com
Subject: Re: [BUG] usb: gadgetfs: KASAN null-ptr-deref and intermittent UAF
 in ep_aio_cancel()
Message-ID: <9c07ce98-a5bf-4bcc-9304-e7f5e1747842@rowland.harvard.edu>
References: <cec9b2a0-3454-45a6-b128-51d708cc8cbc@rowland.harvard.edu>
 <CAFmvuTUwGr-=joWrsYMu-Ra3XpHTe_HFhaY5inJnhg=e5b=1PA@mail.gmail.com>
 <1a93bb26-9ded-4b71-b409-62896a2681a6@rowland.harvard.edu>
 <CAFmvuTUogd8MyQM02VpM7iHaopzrOoex+X-McQE28X1fgb_AeQ@mail.gmail.com>
 <0b6b13ff-789e-4ba4-9765-1052a154ef27@rowland.harvard.edu>
 <CAFmvuTXeg2LykJa060WUYAhhQpdwGV74VFkMb6Wu5zjyqWzxmw@mail.gmail.com>
 <f42b44ef-b083-4976-bf06-f2a21098474b@rowland.harvard.edu>
 <CAFmvuTUZ+iP313qz5J5vaT7QGz2y-tHQ6XMrq2tnvStZqXDECg@mail.gmail.com>
 <7a87e293-633c-4100-aa8d-91560ba5e5c5@rowland.harvard.edu>
 <CAFmvuTU9xfCWFaoXzE6J0uC6y6eCZ43CRg+JWkLV3dgLNYu5Cw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFmvuTU9xfCWFaoXzE6J0uC6y6eCZ43CRg+JWkLV3dgLNYu5Cw@mail.gmail.com>

On Thu, Sep 17, 2026 at 11:02:13PM +0900, Minseo Kim wrote:
> Hi Alan,
> 
> Thank you for the patch.
> 
> > Can you repeat these tests with the patch below applied on top
> > of the other two?  It should cause usb_gadget_unregister_driver() to
> > wait until ep_aio_complete() returns (the actual wait loop is in
> > dummy-hcd's dummy_udc_async_callbacks() routine).
> 
> Yes. With the new dummy_hcd change applied on top of the two GadgetFS
> patches, usb_gadget_unregister_driver() waited in
> dummy_udc_async_callbacks() until the held ep_aio_complete() callback
> returned in both the normal transfer path through dummy_giveback() and
> the direct giveback path in dummy_queue().
> 
> I used upstream v7.2-rc1 as the base. Because dummy_giveback() is not
> present in v7.2-rc1, both matched test trees also included the changes
> from upstream commit d5e5cd3654d2b5359a12ea6586120f05b28634ee
> ("usb: gadget: dummy_hcd: prevent fifo_req reuse during giveback").

Okay.  I recently rebased my kernel tree to v7.3-rc3, so a few 
discrepancies are to be expected.

> In the normal transfer case, I held ep_aio_complete() immediately after
> iocb->ki_complete(). Without the new dummy_hcd change,
> dummy_udc_async_callbacks(false) saw callback_usage equal to 0, and the
> ep0 close returned while the callback was still held. With the change,
> it saw callback_usage equal to 1, and the ep0 close task remained blocked
> in dummy_udc_async_callbacks(). The relevant part of the blocked close
> task's stack was:
> 
>     dummy_udc_async_callbacks [dummy_hcd]
>     gadget_unbind_driver
>     device_remove
>     device_release_driver_internal
>     driver_detach
>     bus_remove_driver
>     driver_unregister
>     usb_gadget_unregister_driver
>     dev_release [gadgetfs]

That is just as it should be.

dummy-hcd emulates a UDC driver.  With a real driver, givebacks would be 
triggered by a device interrupt (signalling completion of a request) and 
the synchronize_irq() call in gadget_unbind_driver() would wait until 
outstanding calls to the IRQ handler (and thus the completion handler) 
had completed.  But dummy-hcd doesn't have real hardware, so instead of 
device interrupts it relies on timer interrupts and its 
dummy_ucd_async_callbacks() routine is supposed to emulate 
synchronize_irq().  Thus it should wait until all outstanding completion 
handler calls have completed.

> After I released the callback gate, ep_aio_complete() returned,
> callback_usage fell to 0, and the same close completed. I observed this
> sequence in four separate runs with the new change.
> 
> To exercise the other accounting site, I separately tested the direct
> giveback path for a 64-byte write in dummy_queue(). With the change, the
> close task again waited in dummy_udc_async_callbacks() with callback_usage
> equal to 1. In the matched control, dummy_udc_async_callbacks() returned
> with callback_usage at 0, and gadgetfs_unbind() then remained in its
> existing udc_usage wait until I released the callback gate.

I wonder which part of the code was holding udc_usage above 0?

> I also repeated the case where the request was still on the endpoint
> queue when usb_ep_disable() began. Neither usb_ep_disable() nor the ep0
> close returned while the completion callback was held. After I released
> the callback gate, io_getevents() returned one completion with
> res=-ESHUTDOWN, and a subsequent check returned no additional completion
> event.

It all sounds good.  I will submit the patches, with your Signed-off-by: 
added to this one also, if that's okay with you.

Alan Stern
