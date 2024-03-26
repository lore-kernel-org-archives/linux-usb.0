Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id EE83213C663
	for <linux-usb@vger.kernel.org>; Tue, 26 Mar 2024 14:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711463589; cv=none; b=awDiQSEYO1VfNwpofnLh4CRyEt1dZCTkMnU4/PYjX85i5NQgpLqfRk3LAE0QVaTAv1K+GPPnMDG4uLrxaU40mRpkVeMr+9mURJ2JcFDWMbXNnFcwV1SvXHe/mVgPO1G7keBJn9iN38Ijai5f4Pg93ZeswwdPrAS1bUjwtayXBvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711463589; c=relaxed/simple;
	bh=gVGaB2wU649i6m7quGvGwPCCVzUSloAIFvczb6LJ8nE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CVJ9upJjM+kAHSCEvjkyy2FdNF09PCBWUMZdr2//KocRK5368NFEhczazcxHC73FrvaesduWqxq69CjilCMNyMB2HZv6lpGLJaEODQFt0NVTt7GiD2/wvKzT9blRn8vpWepNjsYwPRB0W7jh9ir/WUYT7LnSpqM7HpT8ilo3cy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 891560 invoked by uid 1000); 26 Mar 2024 10:32:58 -0400
Date: Tue, 26 Mar 2024 10:32:58 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 2/2] USB: core: Fix deadlock in port "disable" sysfs
 attribute
Message-ID: <8d351a86-f85c-4e25-a5e2-e87d8d4c95b3@rowland.harvard.edu>
References: <604da420-ae8a-4a9e-91a4-2d511ff404fb@rowland.harvard.edu>
 <f7a8c135-a495-4ce6-bd49-405a45e7ea9a@rowland.harvard.edu>
 <2024032610-uptown-mammary-f0fb@gregkh>
 <2024032607-angelfish-scratch-2983@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024032607-angelfish-scratch-2983@gregkh>

On Tue, Mar 26, 2024 at 10:23:25AM +0100, Greg KH wrote:
> On Tue, Mar 26, 2024 at 10:22:32AM +0100, Greg KH wrote:
> > On Fri, Mar 15, 2024 at 01:06:33PM -0400, Alan Stern wrote:
> > > The show and store callback routines for the "disable" sysfs attribute
> > > file in port.c acquire the device lock for the port's parent hub
> > > device.  This can cause problems if another process has locked the hub
> > > to remove it or change its configuration:
> > > 
> > > 	Removing the hub or changing its configuration requires the
> > > 	hub interface to be removed, which requires the port device
> > > 	to be removed, and device_del() waits until all outstanding
> > > 	sysfs attribute callbacks for the ports have returned.  The
> > > 	lock can't be released until then.
> > > 
> > > 	But the disable_show() or disable_store() routine can't return
> > > 	until after it has acquired the lock.
> > > 
> > > The resulting deadlock can be avoided by calling
> > > sysfs_break_active_protection().  This will cause the sysfs core not
> > > to wait for the attribute's callback routine to return, allowing the
> > > removal to proceed.  The disadvantage is that after making this call,
> > > there is no guarantee that the hub structure won't be deallocated at
> > > any moment.  To prevent this, we have to acquire a reference to it
> > > first by calling hub_get().
> > > 
> > > Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> > > Cc: <stable@vger.kernel.org>	# Needs the previous patch in this series
> > 
> > What "previous patch"?  I don't see this as a series even on
> > lore.kernel.org.
> 
> Ah, found it, you sent it only to me for some reason, and not the lists.

Oops.  My apologies... maybe I'm getting rusty at this.  That was 
definitely a mistake, not intentional.

Alan Stern
