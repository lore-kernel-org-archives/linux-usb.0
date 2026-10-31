Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793464363;
	b=m200pHroj0SPqqPqSFJT5AbCP0W47Hxi0kqmsUlP2IUUClWhnt2IRoPzKyWTxSj5OSEZ
	 jjqPP0/XXLGmJh11d+KFH9ULrYDxEwGSwiZe9+GPI0s3GzU2o8ajxfOBhNJomYYUQXOze
	 raw0Vs07cRVwXVMYzrjdibO9MMzcIAqTm7m79tTT3v8q1QIFcyVw3zFMInslqItIu51nA
	 loCPz9ZWmu/ioNzro4IDf6JHP9+nRD4rkPwgoyLW1Hh0zIz2ENv4BgOC26JcbgY4l8uS3
	 oz/lZTrUExxeirEQZKOJW6A8aQpAv4L3qNlWrBIKDGokx7i4aW8EP+i1+y4neWxnvDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793464363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=mp4gO+fjAtIo2pyXMs3mDPHOrNMwKVTtKclVo7+AAps=;
	b=OGkbhdGs8RxYPZSNtqavGS5FJhHt0Y+rXRhMk1AuJJCCXSWE9dxHodhDXdYBspeWofBi
	 hkZWtBJymq5dpaBhdN7EACnu/Md4Mg5R6SOMKfDsVkh0XhJEdFIYZn1mFF8cA0vvhFc/3
	 ZR0oGPH2BEegHgEG8BNHWqtM70tehiBJLg3dgezOpyksYqMO4vTI2zjPc8LH4w+wSErGK
	 wwjzzrMagkO4LXngMnWSrjZ9Bz38oFmjxcKSqAHVOTlsJ/msZKHzX4BOcRUNhxrtRsOwL
	 Ypo0xurZ4UvxzKV6zHP0wkb8gN5NMDWMutx8DkrZ+Tr8y37Ei2SOoDYF83Ui/vODrEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=m38cpto6;
	arc=none smtp.remote-ip=209.85.222.175
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B66606A31C
	for <linux-usb@vger.kernel.org>; Sat, 31 Oct 2026 16:32:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3B66606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=m38cpto6
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-93f3c895a0eso157465185a.2
        for <linux-usb@vger.kernel.org>; Sat, 31 Oct 2026 09:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793464361; x=1794069161; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mp4gO+fjAtIo2pyXMs3mDPHOrNMwKVTtKclVo7+AAps=;
        b=m38cpto6UIu7qcSujmHNPBCl2UUXHMtudwMTRvi9QCZtFNgFz44LR1fmqdkrS9O4Rd
         Or7yamr/G1xb/I1i95pjHpqRRx0GQblIDkuk1SoL+VFElbozzdUAwFd5pH+lkPVB5YEL
         JEJZPKyRXBN8MOYYWafnxskukiv241GXBhfvaDxKKEKPz8S6oZ4TpHBjXiQrjEy/xVMP
         SIckYFI+iaxvcvO4HENdqwNC7lUwLFAofGApU8399192kTDLLGIWSr6xM2tK0upzwWdr
         r0O9DJB72yrcOywOO6gNSvfAc3iDa+5IBXV6IVqSzZ86vV5UVfF21/OYVs25UWtpiWcd
         WQdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793464361; x=1794069161;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mp4gO+fjAtIo2pyXMs3mDPHOrNMwKVTtKclVo7+AAps=;
        b=dvrkMfF4illQEVcFDtpVpowAJ9FReBvyBrtPsMwnlePLfEiDVlSp1+zW0IuakjGz+R
         avRaiv+UWqL40ANckReBlz7ulic19UDJodAG/TaEIcL5OO4X7rIWINgfthrwSkdED0Zs
         M44/03k2VRrnbHKiXQKVrA1ub/hYyctRuTaUwc7MzoHDLyTeqPYSMppCDyjROiHTXX+/
         sQRld6GU4i0YgAK+coaxkSv87Aulwu/F4p2mWKnAHm1DlvwGl8CsPSOKaQMC76lWq/Fn
         2kLJbR7rHBkcBq0OeBbtUzxgIDRUxDpwDoPttqFKKRJ8CCOTZscilPYaVShyRzMjAV2E
         VPVQ==
X-Forwarded-Encrypted: i=1; AKwUvByvl/glRf8rTd3CvcwNYB/2IX4rv6gnNCKGILGbpowqyHu4dyb7OEmIzSKxz6+CLMu9CCgjnb8BSBg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDraxnbNK5MPu86NJ2/hdaqCnD4qPKWjQdF57H5RN2uKZ2wAeF
	ZBYqGVWo5jQaWEx8pzzX7Xi2RZNGWyRDFLSIxc9q/jeI2TrZBHw21JZakj+K4L/0MA==
X-Gm-Gg: AYBFou1bSkce/Qd5VHjsG66noSR8PcdecIm6tWpHj0vvaBIgRRN8MbwajDm08InQXBi
	u4WdEyejpMPqpQimiPLeQjrv+j0PVyRQiELT7j/OuUdouF6JlU2knkOT+e3nVxIrO/OOuxJIMBT
	ASxivVau2xFHh5xXX/vRztwwSVY8oGfXQrOJaph8OaDXJcgpTm+/6r7fNR86/B6Hqsd2LsR1uXe
	o6fNwE4bVxwix+yR8Pvj/OoKHy/9z6xqY0U7AQ7/35pb3xnwk9Q4jZTlPvP12eAi3/UKhiq3uKX
	WEh7IwhwyFjHuo1tWYTzxqwfdNiNNh8icWTmwnAckWoWrer5GNkuGwLBuou/3Cltwr5MlDx6PCx
	3aEynxc6WR2oYx0/DkaEn7NR09RqYcsO0qNPUaZ72gF93IJPs5n1hxNFQo4eBiuAAAchacLPpQo
	q+e+9U78+XY1H3HWjfPwf4p6qjAU/4j24+Ad3POb5YGJ6UduM6Yvpzb33RDj4Cxlmhc8lZ1jbQ/
	ng7dknm+3t1yoM6qITngPCAfaQwUJLel9q9wjRuJGVkfq6oTRkVB+6823KVwxSqn1vOI4fyJWq7
	CUQ3u4PaGDpZHRzSyWwoNrAyWSJXzhyt5QIsZqxGKPNXNVu+QK0=
X-Received: by 2002:a05:620a:6844:b0:93e:c12c:4400 with SMTP id af79cd13be357-9442172bcecmr893711385a.77.1793464361471;
        Sat, 31 Oct 2026 09:32:41 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94425ac6bddsm417925285a.37.2026.10.31.09.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 09:32:40 -0700 (PDT)
Date: Sat, 31 Oct 2026 12:32:38 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
	Dennis Wissel <dennis@dsine.de>, Yiyu Zhou <yiyu@yiyuzhou.io>,
	linux-usb@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [REGRESSION] usbhid -110 timeouts and reset loop for Keychron M5
 (3434:d068) at boot since v7.3
Message-ID: <387e9e3b-683e-474c-ba00-4b12c7c77b7c@rowland.harvard.edu>
References: <4MjB9K-2SoiA85WbI9iEig@dsine.de>
 <20261024203558.3181711-1-yiyu@yiyuzhou.io>
 <SrQQcLIwRWyg9PdEIpc0eg@dsine.de>
 <20261025111410.2c14fcef.michal.pecio@gmail.com>
 <7082e2e7-8d05-46b8-a26b-5b888a7a0545@linux.intel.com>
 <20261026105139.6b86cb3c.michal.pecio@gmail.com>
 <3ddd9334-6dee-48cf-8a62-82cebbe51d7f@rowland.harvard.edu>
 <20261030174718.1f28218a.michal.pecio@gmail.com>
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
In-Reply-To: <20261030174718.1f28218a.michal.pecio@gmail.com>

On Fri, Oct 30, 2026 at 05:47:18PM +0100, Michal Pecio wrote:
> On Mon, 26 Oct 2026 14:56:49 -0400, Alan Stern wrote:
> > You can read the login in hub.c:hub_port_connect_change().
> > 
> > Broadly speaking, if the port is enabled after a connect-change
> > event, the core tries to resuscitate the child device (and checks
> > whether the descriptors have changed).  Also, if the child device was
> > suspended when the connect change occurred, the core will try to
> > resuscitate it by treating the change as a wakeup event.
> 
> Thanks.
> 
> For USB2, this seems to happen if a reset was queued before a brief
> disconnection and executed after it.
> 
> We believe the issues reported here happen when a device disappears,
> usbhid sees -EPROTO and tries to reset it, then the device comes back.
> But what happens to a device that reconnects during probe doesn't seem
> to matter, as long as it ultimately gets probed (reasonably fast).
> 
> So I wonder how important is this feature and what motivated it? Are
> there known use cases that depend on it? Like devices disappearing
> mid-operation for a few ms which need to have their state preserved?
> Should we worry about things breaking if xhci-hcd begins to act like
> the device is gone: ESHUTDOWN completions, ENODEV on submit?

The USB-Persist stuff in the hub driver was originally motivated by the 
desire to recover from disconnections during system suspend.  For 
example, disconnections caused by host controllers that don't provide 
Vbus power while they are suspended, or users unplugging a device while 
the system is suspended and then plugging it back in before the system 
resumes.  A more detailed description, somewhat out of date by now, is 
given in the changelog for 8808f00c7adf ("USB: try to salvage lost power 
sessions").

Yes, this feature is very important.  Mostly it was meant for USB 
mass-storage devices going away and then reappearing following a system 
resume.  Before the USB-Persist facility was added, if the device held a 
mounted filesystem the result would _not_ be what users desired, to put 
it mildly.  The ability to handle transient disconnections was just an 
unintended side benefit, although there did seem to be some real cases 
where it helped -- USB mice or something like that.

To the device and driver, what happens looks like a reset, or rather, a 
reset-resume because the former configuration and altsettings are 
restored.  Naturally any ongoing operations would be expected to be cut 
short, but while the device is suspended this isn't an issue.

It seems that you're concerned about two slightly different types of 
thing.  In one, the disconnection happens while the device is suspended 
and it is discovered when we want to resume the device.  Presumably 
that's not a problem for you (?), because in this case we really do go 
through the whole reset-resume procedure.

The other type of thing is when we see a port-connect-change or 
port-enable-change, but the port is again connected and enabled by the 
time we see it.  In theory this shouldn't happen for USB-2 devices; as 
best I can recall the code was written that way to cover a theoretical 
possibility (hardware not behaving according to the spec).  But with 
USB-3, of course, the possibility is quite real.  The commit meant to 
take care of this is a4f55d8b8c14 ("usb: hub: Check device descriptor 
before resusciation").  If you need to modify the code added by that 
commit, go ahead.

> And if this happens to a hub, can we rely that its children will be
> freed and reenumerated, or may they also get reused somehow? If they
> can't, are they guaranteed to go away before the hub is reset?
> (Because that would be convenient...)

When a hub is reset, the logic for what happens to its children is a 
little tricky to follow. I think that each port with a connected child 
ends up being handled by hub_port_connect_change(), which treats it as a 
new connection _unless_ the child was suspended beforehand, in which 
case we follow the reset-resume path.  So yes, it is possible for the 
child will be reused in this way.

Why not try to make the child persist even if it wasn't suspended?  
Largely because there's no general way for class drivers to recover 
from such events.  However, it's possible that I'm misremembering the 
behavior here, so if this is important to you then you should check that 
my description above agrees with reality.

But even when the children aren't reused, unless their 
udev->persist_enabled flag is clear, they don't go away until well after 
the hub has been reset.  The reason is that the hub driver has to look 
at each one, after the hub is running again, and evaluate whether the 
connection can be recovered.  Maybe this can be improved.

The case you mentioned, about a reset being queued but not occurring 
until after a transient disconnection, is a little different from the 
other cases.  The core basically ignores disconnections while a reset is 
in progress (in USB-2, the electrical signalling used during a reset 
actually makes it impossible for the upstream port to tell whether the 
device remains connected or not).  Disconnections before a reset starts 
end up getting handled much the same way; the most that happens is that 
the connect-change status is cleared and the reset is retried.

This was all implemented before USB-3 appeared.  If we were to do it 
again now, we might do it differently.

Alan Stern
