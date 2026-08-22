Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5882E03EA
	for <linux-usb@vger.kernel.org>; Sat, 22 Aug 2026 02:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787366312; cv=none; b=G3wTFlK3sFXBR2Du5jQec5yovjI0VxwCuAdfDdwtHmr3vIO3LNrHlm+XiYZ8hSv/W8mm+ADvDCcKwk9TGGG6158xKnKV9iiEIarrUzRmg8GW1qmkeZ8pThxDAWvjbu3OgE0Ex0TSoaD2+rnL3gKpkCzO5tYGZbvpk+gB0Bg+nkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787366312; c=relaxed/simple;
	bh=iMsjz4Gp3g1m7M6SWtUsr74yDWZUN6anjVASU4yOVOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HQDPS2tOapknxK0webIagiCzmiMub+BIg7UBjWvO++7hK4f51OQF/hjNaj0RnGvtJ/otalr7VE8pzpzE4/J95bWbmUrpk2v5NPL4+MqNuDHE+NPfXcQaoAof/rio4WqtQtpr+W/0TSSLFggpbXq21duAXSP9R2G4OMETJgEia3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=RYKaC1Mg; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="RYKaC1Mg"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-92e6c4a867cso104055485a.0
        for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 19:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1787366310; x=1787971110; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d1MJAMQ0wPBWoJaXmcehdZ4Td5AEjGOctgiLXWnFhiM=;
        b=RYKaC1MggU2vKbbxbwCW4o2RRTc2VUCIrAhX11eWVx7s/4XN7d+opZBk1CpfIs4oKq
         SV3hkvbdRIKGy8y6yYpzdF8N9mjnWxatA20SzDapsKxeTK09PRb/8/7lLVHoeiNUS6HG
         saLzN0UcNdyBbPIyjEHNgtPxhMN27LPodGvn5qpDE0iNc0b7FGLvapk7wm9YBXbB+DGZ
         K4VN9iuOhRl0d9ZtPj1Nm4SZcwmspP968syX8niBCqzd/ms6b08ZgFo8jzZwsD5lwu/u
         YJdcawvjhnJrMzyqZdhjsR3dUvw7pSIscXobkkx3ANcffiFysC/1Yf3w7uWeFEDbbNDx
         3U0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787366310; x=1787971110;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d1MJAMQ0wPBWoJaXmcehdZ4Td5AEjGOctgiLXWnFhiM=;
        b=tKYXsWvsegVxlXQaeK4eb0bgV+t3akv+tftDu6/YNPdNZncP8Nfv2jz7Ah5WHwYmxP
         KCms/G+RGKcrIR4fjn70+4s0TsK/eAalxlh7vyJI/2tbFKrsnYsNALQ2lyKAQxsYsrUs
         DFYjRNrNZcTKe0kZIJ2VjQAqcL9tjMmy7EcXiBXo1FPYEHTcRgYlTjDM19e1TIG1vPNl
         h8d3BLKUABa2g+K5CrZzMH90oihnCJfSDRcznRFILXtaQ8caUgGP9NkteandbzoxDdV1
         N18dvE4GG8tPMOUe8KJ6WXI9q+8nJnbx6yFQzy1tlUMWnzPr2sg9otT9CZgRoxTt5iC4
         i3YA==
X-Forwarded-Encrypted: i=1; AHgh+Rq/IUm2GkRqF9e/hcoDY8nLy4DroOjbM6jnIUQhBGeBAKI9NIgAECCGW0dEPsPbbmVwUNeXDbvIFXw=@vger.kernel.org
X-Gm-Message-State: AFuF++m73IgLJxu2GWBIpdOd5rrHwMdycLLT7vVtd0d/3ZxOXgpcVhvs
	nV1i3FGGE2oTtRafz08wEKRa+CI/bj3njvEWVjkGThHYil/xezHS8R3X6FxXb/YmcQ==
X-Gm-Gg: AR+sD112xqivU4RXdzHp0+2sIrNAPDxHifOFDtjyYvMkvMUZQo9PgIEK2DSHLH8yzlI
	tI5MH1ywB/cC2lw/zuO2Z9hTP8Kr7GJA60K2bcwtxcoaP6Z6XlfSSDljwQY/yu9Zh1CMUUswUCX
	sxjMlM1SaPTKH6Fh1hqdIOKMOGlmA9ufNGgf4kNWUWeAJAIAsYwZMelyx6D657MKH5I5vbuF82G
	DdCiiqbQMH4lzmYacsEL7l7c0K/qv5+nEp1OUoWO+jUhHstXIoFhBjug/X6sTk8au6681yBxqG+
	1tFOB2fJdWJww1dqjv/tjrU6MTKRRJuMsQ0fBd73uG9Md/DJYG23xqhQsp1If+gV82b5noe7/ab
	npvC9jSQs82nA9TGako87mI9WGhBvsfRAELl2LcePu4ZZ5boLnUM3laud6+2hfZY5wkzrafQPMC
	p+GMmMmFgaG8sCJjnx8JAt0w/GuwhRcawlQCkzVp13GrWDrHpGxvHCWHUKC7L/A7PD+fRgXb/TU
	g==
X-Received: by 2002:a05:620a:2591:b0:92e:76a1:96d3 with SMTP id af79cd13be357-93739576a0emr969019385a.34.1787366310149;
        Fri, 21 Aug 2026 19:38:30 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::dfd8])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93749adef4csm43266885a.11.2026.08.21.19.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 19:38:29 -0700 (PDT)
Date: Fri, 21 Aug 2026 22:38:26 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: xhci: Fix isochronous scheduling regression
Message-ID: <de41d8f4-e8d2-47d6-8be2-f191b28aecd9@rowland.harvard.edu>
References: <20260821114706.34b095b1.michal.pecio@gmail.com>
 <327f6412-5d07-4bee-a51c-06f1ce5823e6@rowland.harvard.edu>
 <20260821180350.3648f011.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821180350.3648f011.michal.pecio@gmail.com>

On Fri, Aug 21, 2026 at 06:03:50PM +0200, Michal Pecio wrote:
> On Fri, 21 Aug 2026 10:44:07 -0400, Alan Stern wrote:
> > Maybe it's time to correct the hcd_periodic_completion_in_progress() 
> > implementation.
> > 
> > For instance, we could add an atomic giveback_count field to the 
> > usb_host_endpoint struct.  The HCD would increment the field (while 
> > still holding its private lock) before doing a giveback, and 
> > __usb_hcd_giveback_urb() would decrement the field after calling the 
> > completion handler.
> > 
> > What do you think?
> 
> I would go as far as incrementing it on successful usb_submit_urb() and
> completely doing away with those list_empty(td_list) checks in HCDs.
> 
> I wrote an xhci-only (less compilation and module reloading) prototype
> which relies on hijacking completions of isoc URBs for counting, it
> worked, results identical as with the standard solution in a few test
> runs with snd-usb-audio.
> 
> Theoretical race condition: it seems we can't prevent new submissions
> after completion releases its lock and class driver considers the pipe
> idle, but before the counter is decremented to zero. That would be
> another case of "scheduling to the past" unexpectedly.
> 
> Seems low probability, but this type of bug hasn't existed so far, we
> generally have the opposite problem.
> 
> Or does it exist in non-BH HCDs?

It does.  It's impossible for a non-BH HCD to reacquire its private lock 
exactly when the completion handler returns, so somewhere around that 
time the class driver and the HCD will inevitably have differing 
opinions about whether the iso queue is empty.

> Maybe the documented API guarantee just isn't feasible?

I'm not averse to your proposed solution.  As for that race, just update 
the API documentation to take it into account.  Seriously -- it's an 
unavoidable defect and that's all we can do about it.

Possible alternative: Make the URB_ISO_ASAP flag take precedence over 
the "queue is non-empty" condition.

> Entirely out of the box alternative: new URB flag. And really, if
> only xhci-hcd existed, it wouldn't be hard to even implement explicit
> start_frame requests or hints as MOTU wished for, which would make
> the whole business of starting synchronized endpoints cleaner.

Yes.  Something like an URB_USE_START_FRAME flag.  It wouldn't help much 
for starting a single endpoint, but it would allow drivers to 
synchronize new iso streams with existing ones more easily.  (Although 
there would be a little uncertainty in cases where the schedules for the 
two streams don't have the same phase.)

Alan Stern
