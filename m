Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F64847DFA9
	for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 17:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787246577; cv=none; b=IZfOS+vu9OYjVJoBE/jYZ0H33nEUrYxPvt3WfJ33BSHLQF9nsSFG+uYxJHRikbTTE7N4Hml9OAlWZVuqi7IrMGSnWWvyoaVpO0ckdwtAsK85x+oNrSdKeXApegubZkN+cn94wsi4Na1W7K7IgsscyyfgWQ3gvMlgHMFke1kvdU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787246577; c=relaxed/simple;
	bh=Zm1oQlw0CaOGPNrnh2kIFTU16TjcwpdnXKlPrF/GQh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=huHr5H/RG2D+rET6gZhsZovUc2YJW38kTli3VeTBW0mKEaidlEnUFM4EiGOkdh2UsxZfsqnvp9SlPWmmBYMXlgqI58NuGEaxsiGqe5cK6kw3BJ/5Qd0HAIgwCIx93UIZWyfXC64dRq3nBB0VucOjqXsrWQN+V8ag7pGEFlOOYHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=j/be/aKn; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="j/be/aKn"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8f29ec73064so909376d6.1
        for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 10:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1787246574; x=1787851374; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/PsthMERcIolX2Su7a+AWUPTiGykOhiKXEjB9LoU7H4=;
        b=j/be/aKn6UVPSF1hQXm0NlLJHdON0p3lynbaUKcJjhDEvpGVsVgjyAWDuOsgWiBifZ
         CsL/VUc1J1rk5kPqVl/ul3ypWkE4UfcM591+1w/MlOcHbATcWzw6EKPylx3Ip4PaLa3d
         6q1Ezs0Wb/VVvTpmpdkzxDHlGnxsafw6qez7D0YnU+6lzI9isHqQRmaFqdkB7k9nj1T/
         6PteZMC9h7/2y9nQ2Bch9HVAZbLuKABMam6icfqZUdHiguZ3a4jXJH28/9XUCAtoxy1a
         Eq8owIjOysAbtnvxPErS6v01GpqYUoCmdGs9eUMnvlvowaYULTlOAXoXYvfT/QWb9vap
         Erzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787246574; x=1787851374;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/PsthMERcIolX2Su7a+AWUPTiGykOhiKXEjB9LoU7H4=;
        b=pD6y81bB7EAPeFm8v2IyIlAqZYep/37CO7l3o2xPLoVLwlftIsQ6Xq9YEnyLC1oTv+
         cqw3TjhVm18Xluv3e9vIXcx4C1pYbXMslv0mWNp8fF0rI3sHIPoeh4iGA33WTuz3x4C/
         sDKjslTd0gWai/xWhaORxb9pFu5rsEU0k4G7a2MRPb6eesKHP6WdivchKN4Ckxqo+Hcm
         KrIiAEZHl2Tj6LLAHM4m+KKhCZJrRTCnXcNIZ209q9IrpToi/2G4K4SMn51jQZ29YXg4
         gcMqxI6clXjVao7mfhkkswPOAUACR27KkpLr60KskDVQY/TjUa3CKEpL6Du4hMafrmZo
         Yozw==
X-Forwarded-Encrypted: i=1; AHgh+Ro2H6iSQ4cAG05j6y4Yv+hpuo0NV+uNQDARXI1GeTQ1vi7YoOm6QiUXqbp9MciIxWz2eZYoJxIhQFg=@vger.kernel.org
X-Gm-Message-State: AFuF++lKt9sgPuQNc3QgstKdExE0HUSfW3aEqVMVWJKxp0/ujiOY5UJD
	i1HF97lq7ZSywg+PiM/D3tvkXniMXaecoJfiGvxIZf3GX0CPBJWkRINWpSCf/gR96DdHISlZuKF
	E7QTNUw==
X-Gm-Gg: AR+sD12E9OfN5lztEdntRGZ22ifaTO7GNhVuxUjLnBoEGlIgI+cSvqKxg5BmVOMrn19
	9Z81Pii23xdyg9XA5M/ZESkbuYyOpBLeJckO4mmqGEeaUJ6Ie3xjTuv/EAcBNYykxAJrt0pnpwe
	T2a4BkyB2ChV0OOhbnVKIr6TUNX3fICiduTtvb3pdALPTJzoGqWYTCYGTASZhszmBo8ZZRcNBgZ
	Wmkz8HLbYfeuke8I2PxdyBz9x9Q/irHgrNXOAH5qHRpGV93fgU+N51O6E74XRMRGIPnvFntRo2y
	/PjMD9qiXU1JlOCsAqm1ckLM5RLJlqTRDX4cGM8pOceJo+iPV+BgUfhN3U+at0/MxDfZlh2DS6C
	BOWzHCmSGH8dceb1+b6tKw9YCYb1fxglog0tKSjSsfHqYYgCyyssgCRf7+58ccfT/StT2hRFOgC
	LSACfwcVS1pZLo8Fnme9lZxRP5nVGS1UWDp01A8eSDGc1s/+8D9B5IptGOhih/s9KiOzIt/ILcP
	zNoYxME7aJZFQXXgn8w+R6SUZa1gNv0
X-Received: by 2002:a05:6214:3d0f:b0:90c:4fdd:c6ef with SMTP id 6a1803df08f44-90c5e99081bmr151894786d6.15.1787246573850;
        Thu, 20 Aug 2026 10:22:53 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c5eee3936sm43169966d6.20.2026.08.20.10.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 10:22:52 -0700 (PDT)
Date: Thu, 20 Aug 2026 13:22:50 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>,
	gregkh@linuxfoundation.org, rafael@kernel.org,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	syzbot+87188222c77c0dbbdb4d@syzkaller.appspotmail.com,
	stable@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v4] driver core: avoid klist_remove() on unattached
 knode_driver
Message-ID: <0198b9fe-4bc0-4e12-b788-85aa2c9f8162@rowland.harvard.edu>
References: <2026082042-coma-moody-5b4e@gregkh>
 <20260820084557.129908-1-khiemtranzo532001@gmail.com>
 <DKTWKZFYC6TL.2ZESRE0NWAV2T@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DKTWKZFYC6TL.2ZESRE0NWAV2T@kernel.org>

On Thu, Aug 20, 2026 at 06:14:37PM +0200, Danilo Krummrich wrote:
> (Cc: linux-usb)
> 
> On Thu Aug 20, 2026 at 10:45 AM CEST, Nguyen Quang Le Kien wrote:
> > Fixes: 94e7b1c5ff20 ("[PATCH] Add a klist to struct device_driver for the devices bound to it.")
> 
> This is not the correct commit to reference, this commit seems fine.
> 
> > diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> > index 60c005223..4154b4499 100644
> > --- a/drivers/base/dd.c
> > +++ b/drivers/base/dd.c
> > @@ -1354,7 +1354,8 @@ static void __device_release_driver(struct device *dev, struct device *parent)
> >  		device_unbind_cleanup(dev);
> >  		device_links_driver_cleanup(dev);
> >  
> > -		klist_remove(&dev->p->knode_driver);
> > +		if (device_is_bound(dev))
> > +			klist_remove(&dev->p->knode_driver);
> 
> This looks like band-aid for the underlying design tension in the USB core
> (which we should address instead) and does not belong in the driver core.
> 
> It's not visible from the above diff, but with this patch the control flow
> becomes:
> 
> 	if (dev->driver) {
> 		if (device_is_bound(dev))
> 			klist_remove(&dev->p->knode_driver);
> 		...
> 	}
> 
> but dev->driver already indicates that the device is bound to dev->driver in
> this context.
> 
> The reason we "need" this check regardless is that usb_driver_claim_interface()
> (ab)uses dev->driver to indicate that a certain USB driver claimed, or rather
> reserved, this device.
> 
> There are two cases in usb_driver_claim_interface():
> 
>   (1) The device to claim is already registered with the driver core, in which
>       case device_bind_driver(dev) is called and dev->driver is correctly set
>       during the bind attempt.
> 
>   (2) The device to claim was not yet registered with the driver core. This can
>       happen when the USB interface the driver actually binds to is registered
>       (and hence probed) before the additional interface the driver wants to
>       claim is registered. The USB core sets dev->driver independent of the bind
>       state to indicate it has reserved the interface.
> 
> The first case is perfectly fine, but the issue with the second case is that now
> dev->driver is semantically overloaded:
> 
> The USB core treats it as "dev is reserved for dev->driver" and the driver core
> treats it as "dev is currently binding or bound to dev->driver", but that's not
> actually the case yet, since device_bind_driver() hasn't been called yet.
> 
> IOW, dev->driver should only be set under the device lock before calling
> device_bind_driver(), and, in case of failure, should be cleared after
> device_bind_driver() with the device lock still held.
> 
> Besides the reported crash, another implication of this is that all other
> functions from device_release_driver() are called as well, even though
> device_bind_driver() was never called before, and there is no guarantee that
> this does not cause other unexpected side effects already or in the future.
> 
> I think one solution could be to add a new claimed field to struct usb_interface
> to indicate that the interface is reserved for a certain driver and make
> usb_device_match() reject the device if ever probed otherwise.
> 
> Another solution (but that's a bit more work) would be to separate interface
> registration from interface probing in usb_set_configuration(). Of course that
> needs help from the driver core as well, but it would also get us rid of the
> slightly odd situation that a driver may operate a claimed device already, even
> though it is not yet registered with the driver core.
> 
> I'd suggest going for a claimed field in struct usb_interface first to fix the
> immediate problem and then take it from there.
> 
> That said, I wonder if there's more to think about with the
> usb_driver_claim_interface() / usb_driver_release_interface() API.
> 
> After having a brief look it seems that drivers have invented various different
> approaches to protect against the case where userspace could write the claimed
> interface's name to:
> 
> 	/sys/bus/usb/drivers/<driver>/unbind
> 
> I think this could be much cleaner if the driver core would support "claimed"
> devices" natively. OTH, there's only ~20 drivers across USB and PnP though, so
> probably not worth.

I don't object to the idea of adding a "claimed" field to usb_interface.  

However, isn't it true that the driver core has always supported the 
idea of a driver being associated with a device before binding?  In 
particular, __device_attach() specifically checks for dev->driver being 
already set.  If it is, the match and probe steps are skipped.

Are you saying that this code path should be removed as well?

As it is, the driver core does sort of support "claimed devices".  
Namely, a device is claimed (or probing) if dev->driver is set and 
device_is_bound(dev) is false.

Alan Stern
