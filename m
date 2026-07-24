Received: from esa.hc5016-32.iphmx.com (esa.hc5016-32.iphmx.com [207.54.81.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F95C3A7D91;
	Fri, 24 Jul 2026 22:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.54.81.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784931773; cv=none; b=IN5YSoMMv8sLh73SoDkt9PsDCjMhNPU6xs1mNjZAyn92HkVxluoAcAwRciAbq+SM8ponzOfFn4G4fHUNIPx0KFOAS4yIcOwmxPVsdK9ROZLrsXicAyTe2VZdLefdcLrls20nPqJB6Uu5WmMFIKSrh3eKQ9Wuv7QjCMEiMEol1T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784931773; c=relaxed/simple;
	bh=CCsM9Z/K8s6uUt8R4KzN5oXkp21lospi4XQwQR4Rngo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GE7wWaYuWwKt+4NAu0uNAfz1MVEw8H53+gnryD7I3LCZM1UqtIlYwb7i+tteBgg36j9T5PnETWREH8mxuiDgZp9QE7+to/n3u0kRuPs/TulbHGwRoL5ruWeOXk9qqMb95pkkfbke2DZ/ujI766syHHdAjS85TVIN9j7gcl9pBFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=harman.com; spf=pass smtp.mailfrom=harman.com; dkim=pass (2048-bit key) header.d=harman.com header.i=@harman.com header.b=esATGcLZ; arc=none smtp.client-ip=207.54.81.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=harman.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=harman.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=harman.com header.i=@harman.com header.b="esATGcLZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=harman.com; i=@harman.com; q=dns/txt; s=CES-HARMAN1;
  t=1784931772; x=1816467772;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0kSIIlQLAdIBihgfRjb4JsqS55YP4diy19J2Z3Ij31w=;
  b=esATGcLZl5WuadB0IL2qlmKLGPpjClDFw4GK4uq9x9c5rz/ixVh6Fe6Q
   a6hHdbW7JK3dBqKztAbf3COgRocL72TGYmMwoKexPmJeT9Tckk8InzRlx
   nwtj3bcOMcod/terS2dX6xPRNWrOEYd9ASrGOgd4pgueulCv/AVy8Z+tl
   4ekJzUIQUQdFovPSIU/gGvoMOR5Pm4TKwdQbQ+WyJrht5By+RsiBqjJBR
   Sy3kFGUsyGjSZgieNSwsH5/K3QRDstC3TCrQfU2boLGyJuB5bp1eXVQRm
   dwD6Y0y8thi41rjJlavqnHEH2wRrJGi4WPXSyZBAAGa1VJyW4VTxW4sMr
   w==;
X-CSE-ConnectionGUID: h6t464O9TwCW9n7NphUBAA==
X-CSE-MsgGUID: TyAGu11mQviiBPFjwyhtLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11855"; a="120739742"
X-IronPort-AV: E=Sophos;i="6.25,183,1779163200"; 
   d="scan'208";a="120739742"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO INMDWSHYB09.ad.harman.com) ([199.27.113.4])
  by esa3.hc5016-32.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 18:22:44 -0400
Received: from INMDWSHYB09.ad.harman.com (10.92.6.246) by
 INMDWSHYB09.ad.harman.com (10.92.6.246) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sat, 25 Jul 2026 03:52:41 +0530
Received: from awsmblx423bs002.localdomain (10.63.34.68) by
 INMDWSHYB09.ad.harman.com (10.92.6.254) with Microsoft SMTP Server id
 15.2.2562.43 via Frontend Transport; Sat, 25 Jul 2026 03:52:41 +0530
Received: by awsmblx423bs002.localdomain (Postfix, from userid 530975)
	id 7E3087D7ED; Fri, 24 Jul 2026 22:22:41 +0000 (UTC)
From: Akshay Gujar <Akshay.Gujar@harman.com>
To: <gregkh@linuxfoundation.org>
CC: <Akshay.Gujar@harman.com>, <linux-kernel@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <naveen.v@harman.com>, <oneukum@suse.com>,
	<stern@rowland.harvard.edu>
Subject: Re: [PATCH v5 1/3] driver core: add device_enumeration_failure_notify() helper
Date: Fri, 24 Jul 2026 22:22:41 +0000
Message-ID: <20260724222241.471042-1-Akshay.Gujar@harman.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <2026071752-proponent-ruckus-36bc@gregkh>
References: <2026071752-proponent-ruckus-36bc@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

On Fri, Jul 17, 2026 at 12:40:43PM +0000, Greg KH wrote:
> > Hotpluggable buses may detect that a device is physically present,
> > but enumeration can fail early due to protocol-level errors. Such
> > failures are currently only visible via kernel log messages, with no
> > structured notification to userspace.
> > 
> > Introduce device_enumeration_failure_notify(), a helper in the driver
> > core that emits a KOBJ_CHANGE uevent with
> > 
> >   DEVICE_ENUMERATION_FAILURE=<dev_name>
> > 
> > This helper is intended for use by bus drivers such as USB and PCI.
> > 
> > Signed-off-by: Akshay Gujar <Akshay.Gujar@harman.com>
> > ---
> >  drivers/base/core.c    | 44 ++++++++++++++++++++++++++++++++++++++++++
> >  include/linux/device.h |  2 ++
> >  2 files changed, 46 insertions(+)
> > 
> > diff --git a/drivers/base/core.c b/drivers/base/core.c
> > index 4d026682944f2..6694a0c30f61b 100644
> > --- a/drivers/base/core.c
> > +++ b/drivers/base/core.c
> > @@ -3830,6 +3830,50 @@ int device_add(struct device *dev)
> >  }
> >  EXPORT_SYMBOL_GPL(device_add);
> >  
> > +/**
> > + * device_enumeration_failure_notify - notify userspace of enumeration failure
> > + * @dev: device that failed to enumerate a connected child
> > + *
> > + * Emit a KOBJ_CHANGE uevent with
> > + * DEVICE_ENUMERATION_FAILURE=<dev_name>.
> > + *
> > + * If @dev has not yet emitted its ADD uevent, the event may be sent
> > + * from the parent device instead.
> > + *
> > + * The caller must hold a reference to @dev.
> > + *
> > + * See Documentation/ABI/testing/sysfs-uevent for more details.
> > + */
> > +void device_enumeration_failure_notify(struct device *dev)
> > +{
> > +	char *envp[2] = { NULL, NULL };
> > +	struct device *uevent_dev;
> > +
> > +	if (!dev)
> > +		return;
> > +
> > +	/*
> > +	 * If enumeration fails before @dev has emitted its ADD uevent, the
> > +	 * device may still be in an early state (e.g. without a bus or class
> > +	 * assigned). Emit the event from the parent device instead, while
> > +	 * including DEVICE_ENUMERATION_FAILURE=<dev_name>.
> > +	 *
> > +	 * The caller holds a reference to @dev, so dev->parent remains valid.
> > +	 */
> > +	uevent_dev = dev->kobj.state_add_uevent_sent ? dev : dev->parent;
> 
> This is going to confuse people, if events show up for a parent device,
> and for an actual device, in different busses/times, right?  Why
> shouldn't the device itself always just be the one as it's up to the bus
> to determine when to call this?
> 
> For your USB example, is the uevent sent state ever hit yet when you
> want to emit this?

No. Passing &port_dev->dev directly drops the uevent in kobject_uevent_env() 
because dev_uevent_filter() returns 0 for usb_port devices (no bus/class).

The event must therefore be emitted from the port's registered parent,
the hub's usb_interface device (port_dev->dev.parent).

To keep the helper simple, v6 will explicitly take the emitting device 
and the failed identifier, removing all internal fallback logic:

    int device_enumeration_failure_notify(struct device *dev,
                                          const char *failed_id);

USB caller in hub_port_connect():

    device_enumeration_failure_notify(port_dev->dev.parent,
                                      dev_name(&port_dev->dev));

> > +	if (!uevent_dev)
> > +		return;
> 
> How can that happen?  A device will ALWAYS have a valid parent pointer.

With the fallback removed there is no parent handling in the helper
at all, so this check will be gone in v6.

> > +
> > +	envp[0] = kasprintf(GFP_KERNEL, "DEVICE_ENUMERATION_FAILURE=%s",
> > +			    dev_name(dev));
> > +	if (!envp[0])
> > +		return;
> > +
> > +	kobject_uevent_env(&uevent_dev->kobj, KOBJ_CHANGE, envp);
> 
> You loose this error if something went wrong?

Will return the error to the caller.

	ret = kobject_uevent_env(&dev->kobj, KOBJ_CHANGE, envp);
	kfree(envp[0]);
	return ret;

Will send v6 with these changes.

Thanks,
Akshay
