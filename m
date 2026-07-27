Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD14F3D649D;
	Mon, 27 Jul 2026 19:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785180729; cv=none; b=f+KePpt/HkV++WDusSMlKkRdIqkJz4/H7uOJkVWAvt7/yW1wZk3Wbv0mqkoLfwJhdGVQorJKfe3pFGXciOuEJm0dSCfjJvMOQ5YqS3wIe5zaOdK6gnKJlYY8+f6xmGuFFBDk3ws3pe/t9eoXSO4U8ucHBUitjyP7fcxlk1XlGqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785180729; c=relaxed/simple;
	bh=imySKtymizcr/G+E9N+ZkJJZ5eO4BPDEQ/J5aqrX10g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ROxVX6IdAM2b8Mz/qi77khV/+pRjVyGM9zZL+miA4zKJAd3hNUc84EdZv3l53XSDB1UvpmwwkenQo7v8Rxgm9LCNzdVuVaAA9y8iDmuor1vYSmijps55KM61UMZ6BAjFypIRbOvIP4n7tQl77e/jjeT4Pl+z6OUI80h5sTlNAew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JYIh7ifp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JYIh7ifp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE0AC1F000E9;
	Mon, 27 Jul 2026 19:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785180727;
	bh=zJq1LrULGW53vDRkQilGY/7CZCS1QRoj4/zZdNWAfxY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JYIh7ifpZ1xEQGua6A+7fwtjsQMmFFgBHBPUlr3x2YmKCWEqntb+3siYRYHWGdAPb
	 uR5pgsWcLmovme/GA4zon+BZT909bX9WZ1U0KPsbToBVRN+WAFgok5kJNh5hJBfi2t
	 IeDRnYuVbWhLHmAWzSd91WAv4YNtkDU32AYdO9EI=
Date: Mon, 27 Jul 2026 21:31:54 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Akshay Gujar <Akshay.Gujar@harman.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	naveen.v@harman.com, oneukum@suse.com, stern@rowland.harvard.edu
Subject: Re: [PATCH v5 2/3] Documentation: ABI: document
 DEVICE_ENUMERATION_FAILURE uevent
Message-ID: <2026072747-snowshoe-outrank-7a49@gregkh>
References: <2026072515-pueblo-appealing-e245@gregkh>
 <20260727133232.556324-1-Akshay.Gujar@harman.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727133232.556324-1-Akshay.Gujar@harman.com>

On Mon, Jul 27, 2026 at 01:32:32PM +0000, Akshay Gujar wrote:
> On Sat, Jul 25, 2026 at 07:21:30AM +0200, Greg KH wrote:
> > > > > +What:          DEVICE_ENUMERATION_FAILURE
> > > > > +Date:          July 2026
> > > > > +KernelVersion: 7.3
> > > > > +Description:
> > > > > +               Some devices may be detected but fail to enumerate
> > > > > +               due to protocol-level errors or invalid responses.
> > > > > +
> > > > > +               A KOBJ_CHANGE uevent includes the following environment
> > > > > +               variable when this occurs:
> > > > > +
> > > > > +                 DEVICE_ENUMERATION_FAILURE=<dev_name>
> > > > > +
> > > > > +               The value is the kernel device name of the device for
> > > > > +               which enumeration failed, as returned by dev_name().
> > > > > +
> > > > > +               Example (USB):
> > > > > +
> > > > > +               ACTION=change
> > > > > +               SUBSYSTEM=usb
> > > > > +               DEVTYPE=usb_interface
> > > > 
> > > > This will be the port device, not the usb interface, right?
> > > 
> > > No, DEVTYPE=usb_interface is correct, the example was captured on
> > > real hardware. The uevent is not emitted from the port device itself.
> > > usb_port devices have no bus or class, so dev_uevent_filter()
> > > drops any event from them.It is emitted from the port's parent, 
> > > the hub's usb_interface device, while the failing port is identified in the payload instead.
> 
> > So shouldn't we fix the fact that usb_ports are not on the bus and add
> > them to one?  Would that make things more obvious here as to what port
> > the issue is happening on, and potentially allow userspace to actually
> > figure out which physical port the problem is?
> 
> Adding usb_port devices to usb_bus_type does not fit. usb_device_match()
> only handles usb_device and usb_interface, so ports would fall through
> unmatched, and bus-managed binding would conflict with the existing
> usb_port_driver assignment.

We can change usb_device_match() to not do that :)

> Userspace can already resolve the physical port directly from the
> event today:
> 
>   DEVPATH=/devices/.../usb1/1-0:1.0
>   DEVICE_ENUMERATION_FAILURE=usb1-port1
> 
> which corresponds to:
>   -> /sys/devices/.../usb1/1-0:1.0/usb1-port1
> 
> Appending the payload name to DEVPATH gives the exact sysfs path to
> the failing port on the hub.

That feels odd, as the port is the device having the problem.

> I dropped the DEVPATH line from the documentation example by mistake.
> Will restore it in v6 so the emitter/payload relationship is clear.

Ok, maybe your next version will make more sense, as I'm confused now :)

thanks,

greg k-h
