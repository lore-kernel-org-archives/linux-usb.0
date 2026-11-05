Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793852934;
	b=Df04+b8Qjq7eIpsLDGoebt/oDpsX8Cg8fl9qyDPMhNATONfFIoI5Md1FuxNSeCVew3YF
	 HH7O9zVetQWv5q69ejbzfT1CtxUsw01I/m/Onokd6YInexOWu6hj8KcU9bqUsj8HejkEB
	 ci8zv9uZ4TvucuNhXEWOeMmOW2pzP6+zWgIjAv9A7jTosIJgEdyAKs424TyILtVM6n3xG
	 FxtX6ktyI8NqDtiK0peKLscDVI3sX38/XLvc0tm5Bl6N5OWyZa9Xq+ZqWBpKzud5vy4Z0
	 0XhhHX4kp5mc/LVcnjGl35blMqwVJZSsqyEhughb/c4cXqYML4Gtk9FN9LHZDg1iXYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793852934;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=KEm42QihUL6odJc0vgDavSCwsWRiCbS6wHuc5+HRkrA=;
	b=2NVAnmGsAKJ2hUM6tZpHFY7nwJYXuMF1zxf9bdjrgfi7kPYJ5mdqcrGfRyckmgF2FSVX
	 iKCPCsEwhz9267uW7KB9ezOD8StD6oHfDmfVgfx+e0Qvub2BiV1iz2wChw3n0Edp4r1As
	 OoldR5b0YvczKw9kxfNGKn50D7DgrKcmGhGJ/H45Lrgfj18zn7nURxIhYr5l2R67v+Yep
	 H8EbisbpA+LqA19YwHd+5E/QKGoD0OPdGCcVjYKBnJI1wYjPqr0b5aQcasINIYfePmi+R
	 xTMVzWln1ZFYFEY6ONDcK6mkGm0eVb45AUeSNi3stFV/i6JGRZ4yrHMcHZt74+M++pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	arc=none smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7291606A31B
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 04:28:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7291606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-536717a4d83so12210611cf.2
        for <linux-usb@vger.kernel.org>; Wed, 04 Nov 2026 20:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793852933; x=1794457733; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KEm42QihUL6odJc0vgDavSCwsWRiCbS6wHuc5+HRkrA=;
        b=Pz8epZirP16nHrgC4NO3PtdE3tUSEr3wJ+iQYqzaekJJRox81tcwLnWeIbBdoJMsvU
         uvgXwQF5elg9BvTN6nZS3BJ5NvVeNpCkEZHrA+i7J9fDvWGr3EN5ttyWtefaDG4Q/6nn
         I46sb4z0BLAyOZdtWa+LKOXoaQJNAvFaemIe9+Z9HALKuCgoTtMkrIIez2l/2sHwOQmG
         RrVrbh3rzYmaTo0NjYPEcbp5eDJM2cknb2pJhClM1wA32YSQxQ26JB2IEFMVDcVTvX3n
         7virYrZ03byn73qeFxsEGsKhTU26y450YpB8T0hRjsUlCjjfI/9os3AXNPTT8YmnFrlu
         p4FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793852933; x=1794457733;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KEm42QihUL6odJc0vgDavSCwsWRiCbS6wHuc5+HRkrA=;
        b=XgPypFdR16ROa4tYSQ/HOY3jm0Upo60OdrrFMXJ/tZEEglSt/4U7ZOZIuHqhghm0uT
         OrarT1jk/UcuRl48vfamB23Rh6yadlbIuUSpmXYPUdwFLGl9YdL128XB/lotzH9tGTei
         Ja29II6VfTo0Bp9GR62jdktJQ71CzMHqkjwaZ10j0TvI3CBdBUvw5bFw0R3uJD8L1H6a
         Kd8ufEc7E87B+IwDDINedo+6vxvHMSX+7Bct+8hbNUo26oDK1SahxCp5UrjZ5xl3hei7
         QHN5G0PSCQFdx/DnLs/4LPgvBjgctsRT8IrueD2ebN8aVGkqTZ6WD1D6Ko4OpECAJDRe
         xL2g==
X-Forwarded-Encrypted: i=1; AKwUvBzJB7IVnchHy2CkdqW89yU6oupenmZy9ZEUx4H/foQ/O9TBXop6dl1/1YdSNLv6qGl1GZmh0JW+E5Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OJblmY+MNzPCPKBSgjQKEDylFAsIoWQOFRf5CKI3CxWsdOqaV
	JaQQBo5v36a0LIvrfP48HPxN9gTPTTKJytY2Tamm4DnOazeXtjl0IAtNRCcFMWxsa1ZYcXWEAoI
	RcjtdGQ==
X-Gm-Gg: AYBFou2ExnDfOtXhtMhP5S29cGPDvWjQ4AI8Azd2OFVEJ6QupNTqP63xa+ugV6zEHcs
	EgJFHuZIbuHACO/cj7qnpsqtKOvLtZiRpcC8o6k9aw7hlodab2rQqFvuLLGAIZ9sVQmAjioAD/b
	yyR0PJOG3L2B3AyP8fc0oaDFWQdwJnz2a/aClFBe9hkpcTd5K7UKSfwyCDrQGp4YsHu53o8PNM8
	sw+oZ3bkV2tdj5Hcf4tIDnUickQLdiBDuMmqT5IVsA6qX0JEYMm/TzZPBs5kZNOQcVlv5V9zEeO
	Y62Xf3DLg7XtspOyEnoRbseSlywJyVjKqB3TxaU2LfY+a72ze8e4yJ+dQEw3ZDLeagA4C8OEAJ9
	Tp7JO82KIw2BsEQP5s+IkBpSOEd9srHB+Ba3KWNMh5GiQB74BAv0pFWHgPFm9XO7fEQ+xwItUSH
	G8oJtrW4Aobx5XeVGlXOVIRlJsoqLcxTgemoWgjhOEQgJhR1gpLxTWx2oInkHAa7y8MqPIzWPkn
	PnscBe/q/ZmjAGoipRdU+aMb59Y/B50aAGg8Rzt5MAZRPfuZJEiAbE/FHcSHjIE7Ox4BiDojMoV
	r110fZ3gVa9Go4c0cPVHJ+AnxmCP
X-Received: by 2002:a05:622a:514c:b0:53e:82eb:c111 with SMTP id d75a77b69052e-542b75248f7mr298071241cf.36.1793852932573;
        Wed, 04 Nov 2026 20:28:52 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e9378dc70sm16474186d6.37.2026.11.04.20.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 20:28:51 -0800 (PST)
Date: Wed, 4 Nov 2026 23:28:48 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
Cc: Michal Pecio <michal.pecio@gmail.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Bin Yu <byu@xidian.edu.cn>,
	Cheng Wen <wencheng@xidian.edu.cn>
Subject: Re: [PATCH v5] usb: xhci: Fix use-after-free race in
 xhci_stop_device()
Message-ID: <82a746b7-4e87-4d46-88c3-bb881f11b8de@rowland.harvard.edu>
References: <20261104000031.679944e7.michal.pecio@gmail.com>
 <20261104035637.3325-1-25031212351@stu.xidian.edu.cn>
 <20261104151544.26672-1-25031212351@stu.xidian.edu.cn>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104151544.26672-1-25031212351@stu.xidian.edu.cn>

On Wed, Nov 04, 2026 at 11:15:44PM +0800, YuanZhe Liu wrote:
> Alan,
> 
> Thanks - that is a fair point, and I agree that the generic exposure is in
> the core: usbfs can drive port state on a hub whose driver is being
> unbound, and usb core does not serialize the two.
> 
> The awkward part is where the lock would go.  do_proc_control() releases
> usb_lock_device() around usbfs_start_wait_urb(), so the control request to
> the hub runs without the device lock, while usb_unbind_interface() ->
> hub_disconnect() holds it.  Making those two exclude each other on that
> mutex would mean holding it across a synchronous URB, which I do not think
> is acceptable.
> 
> Two shapes I can see on the core side:
> 
>  - refuse or queue hub class requests to a hub while its driver is being
>    unbound, or
>  - make usb_disconnect() of that hub's children wait for in-flight
>    port-state requests on that hub first.
> 
> I am happy to prototype either one; tell me which you would prefer.

I'm still not certain I fully understand what's going on here.  It 
sounds like one thread uses usbfs's do_proc_control() to send a 
Set-Port-Feature(suspend) request to a hub, presumably without claiming 
the hub interface.  At the same time, another thread tells usbfs to call 
usb_driver_release_interface() for the hub interface.  Is that right?  
If so, read on...

The issue here isn't a race, or locking, or a matter of a port's state.  
The real problem is that userspace can use usbfs to send a 
Set-Port-Feature request to the hub without claiming the hub interface.  
If usbfs had to claim the interface then the problem you encountered 
could not occur, right?

It looks like check_ctrlrecip() needs to be more careful.  A whole bunch 
of requesttype/request combinations -- basically, anything that isn't a 
GET-* -- should be forced to call checkintf(ps, 0) if the target device 
is a hub.  After all, we don't want userspace interfering with the 
operation of the hub driver.  This special hub-class handling should 
come directly before the code for the printer class.

Can you write a patch to do this?

> What is xhci-specific is that xhci_hub_control() is the only one of these
> paths that walks per-device state: xhci_stop_device() looks up
> xhci->devs[slot_id] and drops xhci->lock while sending the stop endpoint
> commands.  ehci/ohci/uhci only write port registers there, so the same
> interleaving does not give them a use-after-free.
> 
> So I would like to keep the xhci hunk as well, as memory-safety hardening
> for the case where the core does not catch it.  If you would rather see
> the core change first, I can send that separately and rebase this on top
> of it.

That's fine; I'm not concerned about the xhci-hcd portion.

Alan Stern
