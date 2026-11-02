Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793586351;
	b=FyJ6+KYh3qnG0214IcR5zlMQOgLT4kLLHASrwANoIl/dkSYEAUN+DVVbAGy7DNk2GL9m
	 2TlESdQ822F2ThLm76rfHnALlGVjXFgz5UYob5u+xnAXMwemeDXZ3POo2f9WqjUBNE1zk
	 HC6XDyZtd80mJgpNLuwDyHCddJACoBzUvYddiP81B0vNcqIMLkCL4QfFzKVbkyoeKxHEG
	 l+YAQpzrNdDjd0ppGAFQT3DbOIaGEzJvLMB+919n6ObZx2pNhHmetjflrn3Q4GpI35ExP
	 NTjrHZrZsP/YME6/zlNO2YIyRa08JHqtOebAIBW2TLLs6QQwwQGjd2Wo/2sYe/JoQwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793586351;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=n3mx44U9YkJwgZeg389YBYRZqdY33U7LYb9Ka4ftvIQ=;
	b=QHxEdCIqCfWeqtFBeMBvF8RsQgFcxsOP6dk8ZHJBVrmKt0VcQFIx+S76UhBDSfv3DJs6
	 QDwbQFYngjUNrwYa3dBPCSoxuUlasgXMnDXpsDg3eb05/GNI9cWlCARpS8dZIRW2LeayC
	 LHOSdiO4wjz+dZvYwAmykqiJAqyQ1tTJ6TYAdC340PM6ywdpT7nAh5Qv+9rVmTvhliNSa
	 5LJILaYDdYfpi4JwLzmWGtvy3w2z8oaz0ID7PoTZ98n7gaKjzVm46bsAhPowIouO/dRn/
	 2r85WKmvIwt884v1gymvg3xMgy5cky0wEaTEdcM9AdB4NnecGuRXZPMRla6GZyAs18Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=XHlpSCBG;
	arc=none smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A005606A32F
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 02:25:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A005606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=XHlpSCBG
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91c79a9a739so41022056d6.1
        for <linux-usb@vger.kernel.org>; Sun, 01 Nov 2026 18:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793586350; x=1794191150; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n3mx44U9YkJwgZeg389YBYRZqdY33U7LYb9Ka4ftvIQ=;
        b=XHlpSCBGmZaskhqJOuA4xN2OFc9ajIrxB92Pb2t1bkUjydmgMWzWNaGCfjimNlG4qD
         k1tkEsh9WONCyaLHpl/Pc/+MZTV5VWwD2nE53dGSSQhQzkyy+0tx/sYEXGpbDoHYA2rR
         RjLv7g01RobEkEYe96hSYknFdpuqXZpMbPcEm0ME7ndltp1HiKwrB8ZwFCBGEqs30ZBt
         HPDFMKecpaneIqziUl4aK0vkrt9L7Hlg+xkm+gg/yWKO3Tthi1o9owjDJRKAegJQqiOj
         x0GuirsMJ8EdhNF32IuIidWVlM6tdhc3wytCRUSo+AQ01WM7fQH5hNU9pbRdTVtHDEiK
         c7Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793586350; x=1794191150;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n3mx44U9YkJwgZeg389YBYRZqdY33U7LYb9Ka4ftvIQ=;
        b=fFaUovbbVVw3tVtbeLtVMaccMnelAGKZX8z79WSw94oEdowTDKhywhTCAfWugMkdpr
         V/9kxX/zP4fcwGM7fSysOLyGw7PImMWVgpspFAbgDtJX1PaO47lDMqlCEN5//46TCPsH
         vhEDjzwqAcz1ep7InOq/HiMpZbOrLQ9f5cfGU6PR90gh5yC5BApHFAeiJ8sZ8rqS93CJ
         qB5LYjKgTzviG8AKKpOwE/DvNCsAU5pM5DykksfGXdzODEPMiFODAk5QS99pJezSsBdn
         JhTjsBs4R1NkqukCb9jHaVY7Yq7p/TuMjohwQgOsyRR51hjkSmgum7BR99Ir7uykmmXT
         7ZKw==
X-Forwarded-Encrypted: i=1; AKwUvBzSJ5ReeP+ovz79clALhaJzygEfEBY5ehR+SEJ7TeGY0o2FifKRL/aLQDKIOF4C/4FWPyODlIvEPv8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+G37ouA1z5owOwoNP5jgUi+WZElGA04vHyGRMPN6A2TLzh7+h6
	yfc0xiKu4EtmO0cM8aUx/+j+tIT7sK+q+zpargX5jgm937e6gRqIl0vVIW2HIdSJTt6gK0VUKGA
	LkSiT+Q==
X-Gm-Gg: AYBFou1geD4MNC6smWbRZLMPoM5j4OnC2A0D7p/1CyY4USGUIs1/L9qzRYMC3Q1VKO5
	RkRM5kmT1HSVMFiyFJL2Pz7kHrpIwr2/GolQRI2go7lPm8i419iF7sym8rHfhkldWAcdS5J4IRH
	PAIOgG6dkK644k3Hti4/2+sgjuYThe/gNNim5b4i1OGkwbSUm7BO+zqHbhFUZwkSNghsRvjxSnT
	s5OoU7RJ4VoeL07ytBFa6eT8iHIZYL341Oean3xclfx4HPnVV2/znRWzSu7PyoYBwjIgIAhoX7U
	ACUOlQInbL8mvr2UnM+kWcjzJ9az/3agPEAc6yd/nbXo3dcg0s5bYYVFDh/lI7P/ji4cODULTEy
	PLI+0gmConPjcBQTnUgl31a1C1SYfAqEpvWXpq/woFh4QvHMtnYLjpK7OdkjMokvPNrqlH08uqv
	xqQ6k8FLREvHFqEIrvg+Wqa2gNMcghoLwU90X1JKrG515BVBh0mKeDPuwi3ZIc3aL046/MoCGhS
	cs5DhMSI7N7vSMLGnFju/YvQnhSkUhitcthMYU12Pv0u2UOIEHnjQuVDxTdUGOvGjw1Y/sPB/xR
	AB52koPyNwip9m1cA4KUsW2cd+xs
X-Received: by 2002:a05:6214:5907:b0:91c:6ce0:a2a with SMTP id 6a1803df08f44-91ca4b24720mr149807036d6.31.1793586349963;
        Sun, 01 Nov 2026 18:25:49 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca7e24001sm79452676d6.3.2026.11.01.18.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 18:25:49 -0800 (PST)
Date: Sun, 1 Nov 2026 21:25:46 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
	Dennis Wissel <dennis@dsine.de>, Yiyu Zhou <yiyu@yiyuzhou.io>,
	linux-usb@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [REGRESSION] usbhid -110 timeouts and reset loop for Keychron M5
 (3434:d068) at boot since v7.3
Message-ID: <7d0a8d8e-0b90-42be-9ee6-45288ddb27ca@rowland.harvard.edu>
References: <4MjB9K-2SoiA85WbI9iEig@dsine.de>
 <20261024203558.3181711-1-yiyu@yiyuzhou.io>
 <SrQQcLIwRWyg9PdEIpc0eg@dsine.de>
 <20261025111410.2c14fcef.michal.pecio@gmail.com>
 <7082e2e7-8d05-46b8-a26b-5b888a7a0545@linux.intel.com>
 <20261026105139.6b86cb3c.michal.pecio@gmail.com>
 <3ddd9334-6dee-48cf-8a62-82cebbe51d7f@rowland.harvard.edu>
 <20261030174718.1f28218a.michal.pecio@gmail.com>
 <387e9e3b-683e-474c-ba00-4b12c7c77b7c@rowland.harvard.edu>
 <20261101092930.114ca454.michal.pecio@gmail.com>
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
In-Reply-To: <20261101092930.114ca454.michal.pecio@gmail.com>

On Sun, Nov 01, 2026 at 09:29:30AM +0100, Michal Pecio wrote:
> On Sat, 31 Oct 2026 12:32:38 -0400, Alan Stern wrote:
> > The USB-Persist stuff in the hub driver was originally motivated by the 
> > desire to recover from disconnections during system suspend.  For 
> > example, disconnections caused by host controllers that don't provide 
> > Vbus power while they are suspended, or users unplugging a device while 
> > the system is suspended and then plugging it back in before the system 
> > resumes.  A more detailed description, somewhat out of date by now, is 
> > given in the changelog for 8808f00c7adf ("USB: try to salvage lost power 
> > sessions").
> > 
> > Yes, this feature is very important.  Mostly it was meant for USB 
> > mass-storage devices going away and then reappearing following a system 
> > resume.  Before the USB-Persist facility was added, if the device held a 
> > mounted filesystem the result would _not_ be what users desired, to put 
> > it mildly.  The ability to handle transient disconnections was just an 
> > unintended side benefit, although there did seem to be some real cases 
> > where it helped -- USB mice or something like that.
> > 
> > To the device and driver, what happens looks like a reset, or rather, a 
> > reset-resume because the former configuration and altsettings are 
> > restored.  Naturally any ongoing operations would be expected to be cut 
> > short, but while the device is suspended this isn't an issue.
> > 
> > It seems that you're concerned about two slightly different types of 
> > thing.  In one, the disconnection happens while the device is suspended 
> > and it is discovered when we want to resume the device.  Presumably 
> > that's not a problem for you (?), because in this case we really do go 
> > through the whole reset-resume procedure.
> 
> Suspend and USB-Persist is a thing to keep in mind to avoid breaking,
> but intended behavior change is only to drivers with URBs pending or
> submitted on a disconnected device. We would like to reject such URBs
> on devices behind disconnected root hub ports.
> 
> Maybe I will just say what I'm looking for to avoid XY problems: we
> need a "barrier" which separates URBs (and ideally state changes like
> deconfiguration) related to the pre-disconnection state from those
> related to the post-reconnection state, when a udev is "rescued" and
> the HCD must accept URBs to it again.
> 
> A suspended device has no URBs, so the barrier only needs to be one-
> sided. I guess root hub port reset or hcd->driver->reset_device() on
> the device or any of its upstream hubs is good enough

Okay, that ought to work.  The only case to watch out for, aside from 
disconnect while the device is suspended, is when a reset fails because 
of a disconnection and gets retried.  Which was what started this email 
thread in the first place, right?

> (Current logic in 7.3 watches for individual reset_device() calls
> or RH port reconnection; the latter is clearly less than ideal for
> USB3, and Sashiko thinks there are other issues.)
> 
> > When a hub is reset, the logic for what happens to its children is a 
> > little tricky to follow. I think that each port with a connected
> > child ends up being handled by hub_port_connect_change(), which
> > treats it as a new connection _unless_ the child was suspended
> > beforehand, in which case we follow the reset-resume path. So yes,
> > it is possible for the child will be reused in this way.
> 
> Hmm, what about hub_pre_reset()? It seems to usb_disconnect() all
> children when it runs. I would expect even a suspended child to be
> permanently forgotten before the hub is reset.

Yes, all the children are definitely gone before hub_pre_reset() 
returns.

> Unless the hub itself was suspended and gets reset-resumed instead,
> I suppose. But then everything is quiescent so no problem.
> 
> If core can promise that children are suspended or already deleted
> when a hub gets reset, we could use hub reset as one barrier for the
> hub and all children, without tracking this per-device.

That guarantee is valid.  If a non-suspended hub gets reset then 
hub_pre_reset() will run, disconnecting all the children.  (I may have 
at one time considered trying to preserve them and decided it would be 
too difficult.)  And if a hub gets reset while it is suspended then of 
course all the children have to be suspended too.

> I implemented this barrier logic and it seems to work as expected,
> and ftrace shows that hub_pre_reset() runs and drops children. But
> it works != it always works != it will stay working...

If you would like to add a comment stating this guarantee explicitly 
somewhere in the hub driver, I won't object.

> > But even when the children aren't reused, unless their 
> > udev->persist_enabled flag is clear, they don't go away until well
> > after the hub has been reset.  The reason is that the hub driver has
> > to look at each one, after the hub is running again, and evaluate
> > whether the connection can be recovered.  Maybe this can be improved.
> 
> That sounds like suspend and reset-resume of the hub. Considering
> hub_pre_reset(), it hopefully doesn't happen on awake hubs.

That's right.

> > The case you mentioned, about a reset being queued but not occurring 
> > until after a transient disconnection, is a little different from the 
> > other cases.  The core basically ignores disconnections while a reset
> > is in progress (in USB-2, the electrical signalling used during a
> > reset actually makes it impossible for the upstream port to tell
> > whether the device remains connected or not). Disconnections before
> > a reset starts end up getting handled much the same way; the most
> > that happens is that the connect-change status is cleared and the
> > reset is retried.
> >
> > This was all implemented before USB-3 appeared.  If we were to do it 
> > again now, we might do it differently.
> 
> Thanks, good to know. It is maybe not a big deal to maintain this
> "resuscitation" of awake devices. It seems similar to recovery from
> USB3 SS.Inactive state - logical link error without disconnection,
> software may try to Warm Reset the device. (I don't have any repro
> and don't know if it's handled here).

To tell the truth, I don't know how we could go about it.  There would 
have to be some way to inform all the drivers bound to the children's 
interfaces, and they would have to cope with a bunch of failed URBs 
together with putting the device back into the proper state afterward.  
At least with the ->pre_reset() and ->post_reset() callbacks they get 
some warning beforehand so they can prepare.

Also, there's the issue of telling the difference between a momentary 
disconnection and a real disconnection.  How long would you wait before 
deciding that the device really is gone and not coming back?

Alan Stern
