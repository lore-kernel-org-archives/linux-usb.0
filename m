Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76601891A9;
	Sat,  4 Jul 2026 07:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783148451; cv=none; b=a8fUbOaojQ1MzPUZqYWuIXivity6sex3NQ60+Hp9w1ECaWAqHh4FHsoA+5zTi29pkNEoAxbz3SVsFHtyQnLGQeuD5i0NK+3wME2kG13R3W8sAKJgN5FSZeIxsYFgk+8axe07ZKZesp/1/pcXh8rriyRKX/gxlKOEzxg6MgKlsD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783148451; c=relaxed/simple;
	bh=uXthKJNDIrFcG8T1vak4YAthJgX+Gh1tOHaQgBEnJoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=of7mO0KHJ036+yLblBJhNZml4NhxYXfO5iv5exIw+CZvNpsb/PYFBAjSMtq/1unIQEHeUJXtqbkLV1NB/paYnoGzDNJxkJAb1fUnolafVQyyrzvfs5NlvYJwHsNzXJgd614BUiZNIR5RNTiXZKYOo7tuE0a2jJWiUfFWGYjYEIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=nEs17KFK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nEs17KFK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B44581F000E9;
	Sat,  4 Jul 2026 07:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783148450;
	bh=RJC+XQeELETUPyjnwpcY8zcOLDj9UTxIfmWmwbg3m6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nEs17KFKNgAb3DVsVFOKVW51YKnUq3sbjthtuF8aMa8GIoTqgDYpB9gjOvBIHAFwV
	 Wg/S2DYwNnBfpMyJ3SYJW/eUuPtpHVCBf+qPq875CalmL/2pbB/6oYe0RnMfnPireO
	 a4Yj3LSlUJMbUnAeYH0fwmFosKXsjSGNVqG7bN+s=
Date: Sat, 4 Jul 2026 08:59:34 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: typec: class: do not pin the alt mode driver
 module
Message-ID: <2026070405-clumsy-dyslexic-17ae@gregkh>
References: <20260701102831.34954-2-pmenzel@molgen.mpg.de>
 <ake1nru1TZS_lQ2O@kuha>
 <e9a01bf6-7c7f-4cdf-9eff-0cfa5f45ff7d@molgen.mpg.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e9a01bf6-7c7f-4cdf-9eff-0cfa5f45ff7d@molgen.mpg.de>

On Fri, Jul 03, 2026 at 11:29:39PM +0200, Paul Menzel wrote:
> Dear Heikki,
> 
> 
> Thank you for your reply.
> 
> Am 03.07.26 um 15:14 schrieb Heikki Krogerus:
> 
> > On Wed, Jul 01, 2026 at 12:28:26PM +0200, Paul Menzel wrote:
> > > Plugging or unplugging a USB-C dock on a Dell XPS 13 9370 running v7.1.1
> > > triggers a WARN splat and, on unplug, a module refcount underflow:
> > > 
> > >      WARNING: drivers/usb/typec/class.c:311 at typec_altmode_update_active+0x100/0x110 [typec]
> > >      Workqueue: USBC000:00-con3 ucsi_poll_worker [typec_ucsi]
> > >      Call Trace:
> > >       ucsi_altmode_update_active+0x101/0x1a0 [typec_ucsi]
> > >       ucsi_check_altmodes+0x92/0xd0 [typec_ucsi]
> > >       ucsi_poll_worker+0x3a/0x110 [typec_ucsi]
> > >      WARNING: kernel/module/main.c:957 at module_put+0x96/0xa0
> > >      Workqueue: events ucsi_handle_connector_change [typec_ucsi]
> > >      Call Trace:
> > >       typec_altmode_update_active+0x6f/0x110 [typec]
> > >       typec_remove+0x85/0x90 [typec]
> > >       device_release_driver_internal+0x19e/0x200
> > >       ucsi_unregister_altmodes+0x49/0xb0 [typec_ucsi]
> > >       ucsi_unregister_partner+0x9e/0x160 [typec_ucsi]
> > >       ucsi_handle_connector_change+0x386/0x420 [typec_ucsi]
> > > 
> > > For a partner or plug alt mode, typec_altmode_update_active() takes a
> > > reference on the bound alt mode driver's module when the mode is entered
> > > and drops it when the mode is exited, to keep the driver from being
> > > unloaded while a mode is active.
> > > 
> > > That reference counting is unbalanced.  The get and put are keyed on
> > > adev->dev.driver, but the alt mode driver bind/unbind runs asynchronously
> > > and is not serialised against the active state changes issued by the UCSI
> > > poll and connector-change workers.  If the mode is reported active before
> > > the driver has bound, no reference is taken but adev->active is set, and
> > > the module_put() on unbind then underflows the refcount.  try_module_get()
> > > can also fail when the module is already going away.  These are the splats
> > > above, seen for years via Fedora ABRT on several Dell laptops.
> > > 
> > > The pin is not needed.  When the alt mode driver is unbound—including
> > > on module unload, which unbinds first—typec_remove() puts the mode back
> > > into TYPEC_STATE_SAFE, clears adev->active and adev->ops, and the driver's
> > > own remove callback drains its work (cancel_work_sync() in
> > > dp_altmode_remove()).  The mode is torn down cleanly without the extra
> > > module reference; all it ever bought was making rmmod of an alt mode
> > > driver fail with -EBUSY while a mode happened to be active.
> > > 
> > > Drop the module get/put instead of trying to balance it.
> > 
> > It looks like there is a bug in the UCSI driver. Before we go anywhere
> > with this one, please provide a fix for the UCSI driver where you make
> > sure that the reference count always gets balanced. Let's not hide
> > that issue with this patch before that.
> > 
> > As a side note, and as background, almost all Dell laptops seem to
> > have issues with EC firmware not generating all the UCSI events that
> > it should. That's why the "poll worker" was added to the UCSI driver
> > in the first place. The Dell laptops just don't report all the
> > connector state changes, especially related to alternate modes.
> > 
> > Dell should have been informed about the issue, but especially with
> > the older laptop's, I guess they are not willing to make any changes
> > anymore.
> 
> Unfortunately, I am not expert enough with USB and the code, so I am taking
> the easy route, and just paste what Claude Opus 4.8 came up with:

Please note, if you take the "easy route" then we can also do that and
just ignore the patch :)

You need to be able to understand the changes submitted as you are
responsible for it, not a tool, as it can never be held responsible.
It's ok to use these tools for development, but you can't offload
understanding and responsibility to them, as that way just hurts
everyone involved (i.e. you, us, and our users.)

thanks,

greg k-h
