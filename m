Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0144041DEE5
	for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 15:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787757769; cv=none; b=RjlQQCCs84/Z+ZiLPrvKE1nfPXs1KMaYCg2qTfsGOsEfGLFOI7iq9aV4qcK17jzFf0CXJsLSq+0U2ljsn8ujFedW7JWjWAC9LrljvlIWSOh19p907p865LU50ny3rnSeWV2eDTtmBEGshhU2ZM42gg0rzBiaAO5apfeenT27Mso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787757769; c=relaxed/simple;
	bh=e0qrP02HWq5ayDKQG/MRP2B78qTQA/oS5HKaOLjhL/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=plo90nRbv8latno/GaIeUvvHVGs5Ac3okUgYEyu7YKO35VtfL5n5i9Cac+us0eduDjcApYKcAhPkR3x94db8FdMI8kR7sy5Nd3EDtpVsi8L8ebHoJic4RqE667AOmcdMpSIXA7aLnGnmCy9qSGIJmfnNqx8EOfB3EKMFYp5qjO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=qMfUOhLw; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="qMfUOhLw"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-9382fbb1208so40637685a.0
        for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2026 08:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1787757767; x=1788362567; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EIGCRHpHq9Elhl6132Jj4t93Tdvctmky+c/yA/nh+pA=;
        b=qMfUOhLw95gLYAxU1RX7/YLsdwydSoybOOTYqU9EKPyxPB2aGBvGHukiFlfODUNx3i
         lhPDT3PKV16Lj6MHkF6+RrBoYe0VadBwypd8ehUOpSp/aBdUlAYVgmmVu6l6uly3kK/J
         5aSdemDEWX30lgm8ogwuAgPjKl8D7jXquzvYGmjloY5dLc4IsLLksf/ukdN70MBpKpem
         zrT5dJ1K3kRfmyVlyK0twzV9e46Qen2/OuWk5nwKzXzTmCC4ZtRbN+KD1S74TQH0K2Fs
         21Yv2EtJkMry2ZPbG0dLwx0NmBNqMldhFseoasLMTGaPvbU/ZUlASCh+z4Hi6TMr1RrA
         BVsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787757767; x=1788362567;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EIGCRHpHq9Elhl6132Jj4t93Tdvctmky+c/yA/nh+pA=;
        b=mdHV4cavZ5N7AlMXr6kQfrMjvvUWPsR1lc3a7NTJfSAe5+QYzHUkH2x0bSJF9J+pB/
         b8fENXV4eS9l6iwS7lWfPXyFqwaLYpWHECQBVGVks9y3NbIuJCc1sSoLDIGK6aYTG3rh
         N6cxhLR2nwXLBqNwsba6V9s39ZlthH16xOJw+PNoZO/KH/pB7D6I4hi0EnnjGLEtrL1D
         jbOBbSo8g1Z1Ijsb5DvxCQWyjevgWKzHZ3h1fV4kP3OhTBrEb643DRLY1WkWtfi4FwjH
         vBi+dyiTh+f5k/9b1pyLXHd+xlrUMRHZS5P5JUSd6tNmYQFKnYdHAcra95tzt0yvfbm4
         ky1w==
X-Forwarded-Encrypted: i=1; AHgh+Rr2aRT6cRs28oFM52FVIRC6akOTPTgsasuQW9p5DXhnNsm7tl/BZdSANkiRDTli/3w67RDfpD7IksY=@vger.kernel.org
X-Gm-Message-State: AFuF++mrq9IpW5hy6/RPgL/3znzTunanXyg8z1HgrgnDn0n+EuVQCl7g
	MDvy8BfLw9qk9cV88SEad7YVm1xQsytehRYYaKntChsNLJlx3laO+urcr2t+SivLzg==
X-Gm-Gg: AR+sD12al3Fs4qW5ppXSs530XH+nSk9WLzEo99pRmOIlB/xiB6q/PINLK64a+WUwWPj
	WTVtXMrwctwPyC2sl6TDmDDW3gov78n7jqOW5gI9eqaiBwwPsEAQvI3lgOOhBVJnOv1baB2Zqj7
	QfHGBg1BkpdhoeUIicbkv1e9q+3/BDqJs15MeohWpXVIBsLrGITtrkvHKwWjy3wFflB65m6LRUz
	vE4ce9YulfAE+D09UI4E5JcbBV08yzjkjQxZRHED6aYqG8EtXmp0kF43HpM7awSiySYaqRTM+6b
	/8UdhL5+MkW7s+3HZA3D/qnotc7oX+v6KEHytz1b5h1/QKzLrfAPJFMEhlqmBLMtn+ZD32JLHeY
	5/plG0h3OVhBbwNpuyYeWh9Yt+N8u3HibE3HaJjA9PwqiMOk1wxIvEVxOg5bSuX08fQENnvazJe
	LzttPgVUe4zlsIyZTxa7WrRYqjWwl7IbRDH0JA7UjfF+trz0adI8M+I9F3sTZaHM1CdVZ2Ohvcj
	sPULW8=
X-Received: by 2002:a05:620a:240c:10b0:936:e192:e394 with SMTP id af79cd13be357-9378047c277mr558847485a.31.1787757764680;
        Wed, 26 Aug 2026 08:22:44 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90cc652b60fsm28158926d6.40.2026.08.26.08.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 08:22:43 -0700 (PDT)
Date: Wed, 26 Aug 2026 11:22:41 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Michal Pecio <michal.pecio@gmail.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: xhci: Fix isochronous scheduling regression
Message-ID: <810c87ff-7403-4820-b699-c3133620fd81@rowland.harvard.edu>
References: <20260821114706.34b095b1.michal.pecio@gmail.com>
 <327f6412-5d07-4bee-a51c-06f1ce5823e6@rowland.harvard.edu>
 <20260821180350.3648f011.michal.pecio@gmail.com>
 <de41d8f4-e8d2-47d6-8be2-f191b28aecd9@rowland.harvard.edu>
 <5aa2f501-6980-44c8-b7fd-77f6b3b98bd5@linux.intel.com>
 <25b021ba-338d-496b-81c3-0dc0a8777faf@rowland.harvard.edu>
 <8f84f6a0-02fb-4ba0-8da9-63433f91a542@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f84f6a0-02fb-4ba0-8da9-63433f91a542@linux.intel.com>

On Wed, Aug 26, 2026 at 11:34:15AM +0300, Mathias Nyman wrote:
> On 8/24/26 18:51, Alan Stern wrote:
> > On Mon, Aug 24, 2026 at 06:21:22PM +0300, Mathias Nyman wrote:
> > > On 8/22/26 05:38, Alan Stern wrote:
> > > > On Fri, Aug 21, 2026 at 06:03:50PM +0200, Michal Pecio wrote:
> > > > > On Fri, 21 Aug 2026 10:44:07 -0400, Alan Stern wrote:
> > 
> > > > Possible alternative: Make the URB_ISO_ASAP flag take precedence over
> > > > the "queue is non-empty" condition.
> > > 
> > > xhci driver does this. If URB_ISO_ASAP is set then xhci driver always sets
> > > the SIA "Start Isoch ASAP" flag for the transfer blocks.
> > 
> > I wasn't very precise before.  I meant URB_ISO_ASAP should take
> > precedence when there are no active URBs but there may still be some
> > URBs being given back.  In other words, when the list_empty test
> > succeeds.  If the list of queued URBs is not empty then new URBs should
> > always be assigned to the next available slot -- unless we decide to
> > support a new URB_USE_FRAME flag and the flag is set.
> > 
> 
> URB_ISO_ASAP always takes precedence in xHC case.
> 
> xHC controller has a "SIA" flag that we set for each TD (URB frame)
> in the URB when USR_ISO_ASAP is set.
> If there are no active URBs mid stream, and ring underruns, then xHC will process
> the next TD with SIA flag at its earliest possible slot.
> So URBs with URB_ISO_ASAP flag will be out of sync and laggy, but not lose data
> in underrun cases.

Well, that's kind of the point.

The USB spec explicitly allows -- and expects! -- isochronous transfers 
to lose data from time to time.  That's why these transfers don't use 
ACK/NAK handshakes and don't do retransmissions.

Given this attitude, it seems very likely that the USBIF would recommend 
losing data rather than losing synchronization.  I don't know what the 
attitude is of the various drivers in the kernel, but it wouldn't be 
surprising if they also take this point of view.  (Consider trying to 
keep an audio stream in sync with a video stream, for example.)

> A frame is only dropped in SIA case if xHC fails for internal reasons to
> process that transfer in time. This triggers a Missed Service Error, and xHC
> moves to process the next TD (frame).

But as you said, the hardware will try to transfer the packet even if it 
chooses to use a time slot later than the one the class driver wanted.  
This is the wrong approach; the packet should be dropped, and the later 
time slot should contain the packet that the class driver intended.

Perhaps you will say this merely shows that these class drivers 
shouldn't set URB_ISO_ASAP.  Or to put it another way, URB_ISO_ASAP 
indicates that the driver prefers losing synchronization over losing 
data.

> Class driver can then detect lagging out of sync URB_ISO_ASAP transfers based on
> the unexpected large gaps between urb->start_frame numbers

The class driver should realize that URB_ISO_ASAP generally _will_ incur 
lag and loss of synchronization occasionally.  It should set that flag 
only when it doesn't mind these things.  In which case it probably 
doesn't need to check the gaps between start_frame numbers.

The real problem we are trying to solve here is what should happen when 
a class driver starts falling behind, submitting URBs too late.  If it 
gets _very_ far behind, there's really no choice but to restart the 
stream, losing synchronization.  But if the driver is only a little 
behind (and has a chance of catching up again), there is a choice 
between losing synchronization and losing data.  URB_ISO_ASAP allows the 
driver to tell us how it wants that choice to be made.

Furthermore, as long as the class driver is doing the best it can -- by 
resubmitting from within its completion handler -- we should try to 
support it by putting in the "only a little behind" category.

Alan Stern
