Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CF738E8D8;
	Wed, 26 Aug 2026 07:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787728265; cv=none; b=Dzw32Z0vaIoGtqqh2a3GRGhrN9jBPEvfrTO1YVQ9Q8IFKL8KgCcZ0HwWtQ974RUjNmnKmDAyM8+yDrzMQnBsjZ2ci0HnevaZz+zspIkV0zGhYMH4GsyCWeXo5N6HTk4AKpRK82F98F3f38RsuYFrHsEJXbGe+ry213t9DXrmgrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787728265; c=relaxed/simple;
	bh=jT+7QV12B8SECZ3ELYG3ykv7HSwA+SeO2eCHVU4+U7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d03xqSznZIOiXBDymZ8WyMgrMKxCS2ta6AK1KE/cb7MSi7KqvPefvo1Se9GACfaRPsd5boyLYn2VyMOUipRgiOWpdOwZAwX6BnkjNKjbpJBAZVpPR9pbMkO1MfqsMZSv5E9RhYGrAQYMAgYYErXqhqv0yJBE9qastwxLWqOYjuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vuRQuIZz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vuRQuIZz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D155A1F000E9;
	Wed, 26 Aug 2026 07:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787728262;
	bh=OcTEzof2r0Hpzqe3NIXzjuy5VAwvFFivUfx76V8C0UQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=vuRQuIZzaPyCsRq8AikdK1WUXQjp/CIY3SpQSJVFv6ubYthU99hHE6aeCwuM87JfD
	 6K43RF7B/MDPaFqXaOPZrzs9gkK2nExZnlU4MMAxnQ4A/trKumYJ5IEH6M1UXOO6s/
	 Upb2q3xDQ+J3eVc5tOBDs6VlVYzwXl1SVv1XT4/k=
Date: Wed, 26 Aug 2026 09:09:21 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Cheng Lingfei <chenglingfei@foxmail.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, Felipe Balbi <balbi@kernel.org>,
	Peter Chen <peter.chen@nxp.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+06ec7624018233e17113@syzkaller.appspotmail.com
Subject: Re: [PATCH] usb: gadget: goku_udc: fix kobject warning on probe
 failure
Message-ID: <2026082639-coach-varying-1c9a@gregkh>
References: <tencent_0AE8C419FE6042BA8081E98C88BA604FF00A@qq.com>
 <2026082616-glue-atlas-0cfd@gregkh>
 <tencent_73FAA277D81B3C4771D63F33904760133A08@qq.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_73FAA277D81B3C4771D63F33904760133A08@qq.com>

On Wed, Aug 26, 2026 at 03:00:37PM +0800, Cheng Lingfei wrote:
> On 8/26/2026 2:11 PM, Greg Kroah-Hartman wrote:
> > On Wed, Aug 26, 2026 at 11:35:58AM +0800, Cheng Lingfei wrote:
> > > goku_probe() calls goku_remove() when hardware initialization fails, but
> > > the gadget device is initialized only near the end of probe. As a result,
> > > goku_remove() calls usb_del_gadget_udc(), which drops a reference to an
> > > uninitialized gadget device and triggers a kobject warning.
> > > 
> > > Initialize the gadget device immediately after allocating the controller,
> > > but add it only after all hardware resources have been acquired. Track the
> > > gadget and proc entry registration state so goku_remove() can safely clean
> > > up both partial probe state and a fully initialized device.
> > > 
> > > Use the split gadget removal API and drop the final gadget reference only
> > > after all hardware resources have been released.
> > > 
> > > Also obtain the controller from the embedded gadget device in the release
> > > callback. Driver data is set on the PCI device rather than the gadget
> > > device, so using dev_get_drvdata() there fails to free the controller.
> > > 
> > > Use a per-device name for the debug proc entry so that multiple
> > > controllers can be registered without colliding on /proc/driver/udc.
> > > 
> > > Fixes: 3301c215a2bb ("USB: UDC: Expand device model API interface")
> > > Reported-by: syzbot+06ec7624018233e17113@syzkaller.appspotmail.com
> > > Closes: https://syzkaller.appspot.com/bug?extid=06ec7624018233e17113
> > > Tested-by: syzbot+06ec7624018233e17113@syzkaller.appspotmail.com
> > > 
> > > Signed-off-by: Cheng Lingfei <chenglingfei@foxmail.com>
> > 
> > No Assisted-by: line?
> > 
> > And do you see this happening in a real device and not just a fake one?
> > 
> > And why is this driver using proc at all, shouldn't that be in debugfs
> > instead?
> > 
> > thanks,
> > 
> > greg k-h
> 
> Thanks for the review.
> 
> I do not have TC86C001 hardware. The issue was reproduced only by
> syzbot, whose reproducer binds goku_udc to unrelated QEMU PCI devices
> through the PCI new_id interface.

Which is an invalid operation, you don't have to worry about that ever
happening in a real world situation.  syzbot is wrong here.

> The probe cleanup path itself can also be reached on real hardware if
> one of the probe steps fails, but I cannot claim that the issue has
> been reproduced on real hardware.
> 
> The proc entry is legacy diagnostic code from this old driver, so I
> agree that debugfs is the appropriate interface. I will rework the
> patch accordingly and send a v2.
> 
> I will also add the missing Assisted-by line.

thanks!

greg k-h
