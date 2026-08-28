Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FDB470428
	for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 14:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787926213; cv=none; b=sDyf+nsoHV54xSZR5vkmZ6mF1w7xfQoLrFW8qu3kfpMkePO9DqNQ17UlbwrGGZn6/wv9i2w/YcXk6UuhmxrPNn+4eu/9QMb9LsjgTf0jpgMROiruDlM2ahmXcDP0U4gA1mzECdIlXAhNpfwzdCISxQ08uRHRVbGWkaZjY4mD3zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787926213; c=relaxed/simple;
	bh=ZNKccxZiCzly9I5k80F35B1pc+eR7vQ/qDH/pYuN0m8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ip60nSKABlJorQ6YZbygGj64MZVPpMi2C95LHZsTnzn3roFV6r75cjXlE2zwOwYy1O5QKLNVIUBBs8ubSV97qYDOsrXY7zK2itFxtxurUqO+8B5rk2JUwZRcincsedRKdDLu6qZd2lkdSs1LIhgBstXcV8YsWXmHhSfsOTzv9E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=TvOCVadC; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="TvOCVadC"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-936dfd009d1so182714485a.1
        for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2026 07:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1787926208; x=1788531008; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DMTxMAG/rJvYI6GDoxI7NDM2NcdqW0dm+aSGvfT6mdk=;
        b=TvOCVadC1WTItmA22XmsKcrfeIiy/ML5wGK/co9em10igxF8Yku06eJvoOSCxyfrLM
         fIZPDzlOkzXWr6E4yojYGEar2yz//3QL4Mp4AKxHagEAGXH1pxkXXaNVgyB8uS3MC96+
         i1keVpSBwc8qJIrsDzJlmVsdqxnrWCvYHrp5qXZRWDlE1Epweu4GrJvH0h5k3zVW/Wxf
         lU8YKakaJHNa393oM/EPH9qpc5nHpoy+2igaJ4Exjf65vyi2GYneEQZBuOPj3zolNdBb
         FwOUHD6H+esaqClg4YssScg5kZassGR2pTAWGWuvWF9pgjZj8JOs9RVqqFRo8tYnIlTg
         CEzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787926208; x=1788531008;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DMTxMAG/rJvYI6GDoxI7NDM2NcdqW0dm+aSGvfT6mdk=;
        b=V9cuOdtgo0dX9lWchCjGHfxmAqqBXRvI3kWYcySpqnwXPDVWUmIxh7q8ZJrJ2AtFWK
         ns993HEsd59H/KhwgPVJvNPiKYY7loQgxsYNz2OwAYjepubBsj7GIwB18+ZFzVaSg+gh
         xQTgTkuhlF+KJkXK+41xQpENy03bOpuKZAsdwOYAnDPpL9QYVPrr/538MI5MrAbvOavs
         nH45J7C8vD9w/VeKFhmLxgpV4HKswHINEkITgRUv3qSr/OzDqB5xNV5tZiPT1HD399S6
         +E7Oe27WZ8dieTxvcOGeqFvVlOQqHEKbe1QhqKuOhDYtGWF2wwG7zeNGzMb9J2pJRpfm
         sBcQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrhuz0T6WpaQCQvb3S9bDgz2mDKn9j360aPDivrb99eOP83YFrEYxZHytNdkeETWqdisMAlBO+RwaM=@vger.kernel.org
X-Gm-Message-State: AFuF++mk3Js/AaEwcXi09P5uJxhcdW20mmURpgujGtI01z3jl3XhOIyS
	xcbYP+0evYiR1Q5qREnPPv2GSa1KwMrW1SI7UvDRZGpw1C71wDcoXSUEPJmXxh1Q4g==
X-Gm-Gg: AR+sD12/2EMzn4oMVHS7iUWSuTbZBqiDXK3oGB5GFJWfTNJEdFVcFdLmoDurJUZ6P6W
	AkajdiqEapeKk1BMFA4TMs7N0xrJzb4VvMR6JKgrWBCDGO8UC0XJsSaNov5psAvrBwoQvodrpi2
	Ji51sOl3KGKTkeHb2WdWVG6lDAYtT7Mx/Ffe3iK5AjjUW+m2Sta7We2QR3/xxOiEyrF7q0TPCFP
	Nj1J9nU9iRyHksQ9HnxtDe+Hh39RNe38l3sX8rYBf9m8Mhr/j/0ASyS+HxbAr5GKfnsZuS8Ap61
	NLnWF0ImN+z5boiMiv4b4ihenlyDMOgXCej/rgRGEE1oU26k5WqQ+Uqfa0KbJ6YjY+niNfu0cSF
	O7kikkvCrEpYLFxnWf6CTjsjTLPGp8rrzn9qVtRrbDSIebNGxJ+DgTGY76HJ5y0bbL7SFyx6T/x
	SUBe6KgFg1OWj3hY77lddwLomPnPw+Dw71r2OWtkBtDnQf15cQ89031m5FRCYIWsJRNsJeLEKbg
	PkpT3E=
X-Received: by 2002:a05:620a:1588:b0:930:9cbc:7121 with SMTP id af79cd13be357-93900131031mr1301468585a.3.1787926205824;
        Fri, 28 Aug 2026 07:10:05 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90ce4460e0dsm15997766d6.11.2026.08.28.07.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 07:10:04 -0700 (PDT)
Date: Fri, 28 Aug 2026 10:10:01 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Oliver Neukum <oneukum@suse.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Michal Hocko <mhocko@suse.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Petko Manolov <petkan@nucleusys.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 net-next 5/6] net: usb: pegasus: Move long delayed
 work on system_dfl_long_wq
Message-ID: <b6cf44a1-d2b1-443d-8efe-c596ef89cc2a@rowland.harvard.edu>
References: <20260720100902.155605-1-marco.crivellari@suse.com>
 <20260720100902.155605-6-marco.crivellari@suse.com>
 <f972b514-87ef-45bc-8258-db199a4cc0b8@suse.com>
 <20260825151812.4aJyFUgE@linutronix.de>
 <31b46916-dd89-4ae9-89b9-9d39e29e8e69@rowland.harvard.edu>
 <20260828094318.bOajNBno@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828094318.bOajNBno@linutronix.de>

On Fri, Aug 28, 2026 at 11:43:18AM +0200, Sebastian Andrzej Siewior wrote:
> On 2026-08-27 12:01:02 [-0400], Alan Stern wrote:
> > > > These drivers have their own work queues because they are part of the block layer.
> > > > USB devices can share a device with a block device (storage & UAS) and
> > > > USB devices have common, per device operations, in particular reset
> > > > and runtime power management and disconnect handling. Because these operations
> > > > can be necessary to complete block IO neither they nor anything
> > > > they depend on can use IO to allocate memory. That is they need to
> > > > perform any memory allocation with GFP_NOIO or GFP_ATOMIC.
> > > 
> > > This is a networking driver. It has nothing to do with storage and UAS.
> > > It uses USB, yes.
> > 
> > Ah, but a composite USB device can have both a networking interface and 
> > a mass-storage interface.
> 
> okay.
> 
> > Suppose you have such a device, and suppose the disk attached to its 
> > mass-storage interface contains a swap partition.  Now suppose the 
> > device is being reset, and as part of the preparation for that reset the 
> > networking driver needs to flush its workqueue.  This means waiting 
> > until the work routines that are already running have completed.
> 
> The individual functions are usually independent. But if the USB core
> would reset the whole device it would reset each function.
> 
> > Since it's a general-purpose workqueue, you don't know what those work 
> > routines are going to do.  One of them might try to allocate memory 
> > using GFP_KERNEL.  Suppose that in order to satisfy the memory request, 
> > the kernel decides it needs to write some pages to the swap partition on 
> > the USB mass-storage interface.  But the mass-storage driver is stuck; 
> > it can't do anything until the device reset finishes.  Deadlock.
> 
> So you are saying, the USB-storage device is in reset and we wait until
> the networking part finishes its workqueue flush. That flush is stuck
> behind behind a memory allocation which waits on the storage device. So
> any URB passed to usb_submit_urb() just waits for the reset to complete?
> 
> > That's why USB drivers have to use their own workqueues.
> 
> While this does make sense I don't see how this is related to this
> patch. The pegasus driver uses `system_long_wq'. This is a system wide
> workqueue_struct and is not limited to USB or this driver.
> This workqueue is per-CPU meaning if you enqueue the work item on CPU3
> it will be executed on CPU3. However pegasus uses a delayed work item
> and the timer can fire on any CPU so even if it is enqueued on CPU3 it
> could be executed on CPU1.

It doesn't matter what CPU the work item runs on.  Here's the deadlock 
sequence, in brief:

	USB device reset cannot proceed until network interface's
	->pre_reset() method returns.

	The ->pre_reset() method cannot return until its call to
	flush_workqueue() returns.

	flush_workqueue() cannot return until the already executing
	work item finishes.

	The work item cannot finish until its kmalloc() call returns.

	kmalloc() won't return until the kernel can free up memory by 
	writing some pages to the swap partition.

	The write to the swap partition cannot take place until the
	usb_storage/uas driver carries it out.

	usb_storage/uas cannot do anything until the USB device reset
	is finished.

> Therefore the suggested change system_long_wq -> system_dfl_long_wq
> should not make a difference here: it is a different workqueue and it is
> unbound (instead of per-CPU) but given the usage it is unchanged but
> more obvious. Also its usage recommendations (use this for long running
> items) is the same.
> 
> The plan is remove system_long_wq from the tree.

The point Oliver was making is that the driver shouldn't be using a 
general-purpose workqueue at all.  Switching from one general-purpose 
workqueue to another ignores this point; it's not the right thing to do.

Alan Stern
