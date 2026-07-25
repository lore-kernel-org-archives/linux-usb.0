Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6DE38CFFE;
	Sat, 25 Jul 2026 05:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784956902; cv=none; b=bX4Hh+J6QuD1anehQgT57XOWeDjEn53NQZrS977ldut2W796aB+khxY8KNCQwEyIr0sMCLxvaMNFUw9BxrsI2/KkkGPwUoZ/lj5jLmETa31OIT/9xqzrhvEWUyj+KwChRyKhU7rnB0uq9rxaJu5meMegeWMroN937vhTme/z/qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784956902; c=relaxed/simple;
	bh=qSfhInGtLc1yqnSlkwzIndD6rKh3VE2m76Nw8ydSkdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HNSHPFhvu/EqCCru0N5rXB+Xn+ZYrCZU0F7t5VCATMhLlsLo/v15WEbwhl6de40Y4JaLJNkjUcB/kSQS2uE5m1qUx+Y77ukfsURV9xrGVZ4m8hHFc8z9QCrRhJ8/eizHXGsL5cIyhz0ZvZ2wXJZ1oyAav/Oo1G1/5E+VOyS0yiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=eo3HhtUr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="eo3HhtUr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0FEC1F000E9;
	Sat, 25 Jul 2026 05:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784956901;
	bh=4M9GMMy5iS+YatH/p1NlJiHMY01ptgm2lWb7RXPEcBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eo3HhtUrftCKHYAzt6aTxRwdrSlDPTxcBwtqvGXhMeZNN/KaeptGLv7U+p0+edsAH
	 B+SFrj0IZpuUZeSvTMk05DERC7yBpuMX2A32QtpfL+dyHJdvWZVUqxhk6PzNscjINM
	 C623j9F0M5Pe0nqytVAiMiQMRU+b+BCEyXEDmvcM=
Date: Sat, 25 Jul 2026 07:21:30 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Akshay Gujar <Akshay.Gujar@harman.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	naveen.v@harman.com, oneukum@suse.com, stern@rowland.harvard.edu
Subject: Re: [PATCH v5 2/3] Documentation: ABI: document
 DEVICE_ENUMERATION_FAILURE uevent
Message-ID: <2026072515-pueblo-appealing-e245@gregkh>
References: <2026071745-ambulance-reload-4e29@gregkh>
 <20260724222506.471475-1-Akshay.Gujar@harman.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724222506.471475-1-Akshay.Gujar@harman.com>

On Fri, Jul 24, 2026 at 10:25:06PM +0000, Akshay Gujar wrote:
> On Fri, Jul 17, 2026 at 12:37:32PM +0200, Greg KH wrote:
> > > Document the DEVICE_ENUMERATION_FAILURE environment variable emitted
> > > in KOBJ_CHANGE uevents when device enumeration fails.
> > > 
> > > Signed-off-by: Akshay Gujar <Akshay.Gujar@harman.com>
> > > ---
> > >  Documentation/ABI/testing/sysfs-uevent | 25 +++++++++++++++++++++++++
> > >  1 file changed, 25 insertions(+)
> > > 
> > > diff --git a/Documentation/ABI/testing/sysfs-uevent b/Documentation/ABI/testing/sysfs-uevent
> > > index 0b6227706b35e..e362c34aa2ef6 100644
> > > --- a/Documentation/ABI/testing/sysfs-uevent
> > > +++ b/Documentation/ABI/testing/sysfs-uevent
> > > @@ -49,3 +49,28 @@ Description:
> > >  
> > >  Users:
> > >                  udev, userspace tools generating synthetic uevents
> > > +
> > > +What:          DEVICE_ENUMERATION_FAILURE
> > > +Date:          July 2026
> > > +KernelVersion: 7.3
> > > +Description:
> > > +               Some devices may be detected but fail to enumerate
> > > +               due to protocol-level errors or invalid responses.
> > > +
> > > +               A KOBJ_CHANGE uevent includes the following environment
> > > +               variable when this occurs:
> > > +
> > > +                 DEVICE_ENUMERATION_FAILURE=<dev_name>
> > > +
> > > +               The value is the kernel device name of the device for
> > > +               which enumeration failed, as returned by dev_name().
> > > +
> > > +               Example (USB):
> > > +
> > > +               ACTION=change
> > > +               SUBSYSTEM=usb
> > > +               DEVTYPE=usb_interface
> > 
> > This will be the port device, not the usb interface, right?
> 
> No, DEVTYPE=usb_interface is correct, the example was captured on
> real hardware. The uevent is not emitted from the port device itself.
> usb_port devices have no bus or class, so dev_uevent_filter()
> drops any event from them.It is emitted from the port's parent, 
> the hub's usb_interface device, while the failing port is identified in the payload instead.

So shouldn't we fix the fact that usb_ports are not on the bus and add
them to one?  Would that make things more obvious here as to what port
the issue is happening on, and potentially allow userspace to actually
figure out which physical port the problem is?

> Per your feedback on patch 1/3, In v6, this becomes explicit in the API.
> The caller passes the emitting device and the failed identifier as
> separate arguments. I will also reword the Description to make clear
> that the value is a bus-specific identifier of the port or slot that
> failed to enumerate, not the name of the emitting device, so the
> example cannot be misread.
> 
> > > +               DEVICE_ENUMERATION_FAILURE=usb1-port1
> > 
> > That looks right.
> > 
> > > +
> > > +Users:
> > > +               udev, userspace tools monitoring device enumeration failures
> > > \ No newline at end of file
> > 
> > Didn't checkpatch complain about this?
> 
> checkpatch did not flag it. Will fix the missing newline at EOF in v6.
> 
> > And is there actually udev code to handle this being proposed anywhere?
> 
> We currently consume this uevent via a netlink listener to show 
> system popups/notifications when device enumeration fails. Once the kernel 
> ABI stabilizes, a default udev rule example will be submitted separately.

That's great, thanks!

greg k-h
