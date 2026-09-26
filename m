Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3A7347FCD
	for <linux-usb@vger.kernel.org>; Sat, 26 Sep 2026 14:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790433979; cv=none; b=A7FUCUteyDIs6NfIja5wSXvgK9SNBYzoBQXAfSqW652v26nqOMqR92e+/KsHUUIXpBzJAIEbsifXx03YRHmw/MhigwvP5akQ3lJdujjJTt4DasGiKikGeqrVi6v5t0Gfw1NFU1y/ktI8l/V+ZI7DgA+ni5SxOoJHZ6/NlUTtG7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790433979; c=relaxed/simple;
	bh=JBsSQ55lN1QUpXoEExU0iVXLTvVf37cIW913mQR61YU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O4SLFX6y8MS12kb/KhiRPZ1uUIeE9+Z0yZhC47fXqquZi9VJ2dWLD7Y3/ggRnVk7D1OA5c3qibF07wZOb5PpsUeBJQh9NJmBZaFT1yIIcBMBiD9SRyUtr4wnjUX55LQb3YcNVB7bd1xzl1/bplagL8aXWiWkC1hErLwxYPD5FE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=oLqqU/4N; arc=none smtp.client-ip=74.125.230.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="oLqqU/4N"
Received: by mail-qk2-f41.google.com with SMTP id af79cd13be357-93bfa7b2093so206175185a.1
        for <linux-usb@vger.kernel.org>; Sat, 26 Sep 2026 07:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1790433977; x=1791038777; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sWxNzLmCVGq2M805s0Dqw+7yFQaCR+tur2n9MiDKJV8=;
        b=oLqqU/4Ndk1LUgCv85zS/WF0gzp2HQF31WB7TGONumKQ7GAMKESmvD/GJKzNhDSw0l
         Xwyma5pe/YNVwufw/xJ2XLXufw0UcvcRdS3K1+OwxQx2QDULHpOpvAToi3UQNwELk0eV
         KymVy5Q5A+U8IelyxIJOVHe1t7SmMdzJUh/QvHh33aSfTnQnLVRh5kJAy7Lyg9GraMtl
         vgATMldCCoFvRv6Dir1i8HYeKJIvvc1Jxim2VpRo8rHtPZRdATVsW0VANEDH/SK66GBq
         X0u0CrXHvU7ku+aqlfVFZ5UET6lpNOyn9C7Ks4mkh4NMzYQJb8HCu9zXShSRRF1WXC5e
         seDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790433977; x=1791038777;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sWxNzLmCVGq2M805s0Dqw+7yFQaCR+tur2n9MiDKJV8=;
        b=HbuNext6W9NHpbzdRYpD/qjTO8JeHr9QGp47LBRMlskPrli44dtbOnpZxPGVyk0XTB
         VcGKYfD/KL4KZ40v4+2UJQ8GSH/MsiIjNIz4oJ7qbQvyv+WxxUp+UMjW4nfGhupqsUH0
         hsi30IiaojNNBTBd1J8UCimRfysLwXyR2NTSsNlBAxQgeDr+J4mjqR2mLNLyF0//Hzv8
         wsGMM50aLs4UIxK2UMU5QOf/d9iksoyxDNLY7PVhS2T3GLtBCfosTHJN7fFUnrcgYmub
         HTdeR6OiirNQrlLfgNqlFE3Oh7DEh1ykGnR67UKHJNAuPmNtpKtv0JZAPd9fs4tZK4Dg
         425w==
X-Gm-Message-State: AFuF++lcwvHBhhh7EoVe1jaNYArymB9IweTEe8BjnfC8rkQaW/8qwwNa
	CtwXM+hRYnq/mYxFRLkxvaKMu/8deDcD0VAKReMA+gmDTcqsi8qAaL1G0bsI5LCh17ZiTuaMC9Y
	9Mhg=
X-Gm-Gg: AYBFou3bY664bGXqFEM1GDTa2tqQCikv+cN/QpD5Gq/GGJSXxd6v6PrlEW21VJo7vGD
	s2by6datYW+tYqYIqsNQGX8w/DZYKwQUyL2rfe8DJGZ7kwSOPEQZd3bdiXj1eZARi635evtQudj
	KSBuZKe0aSYUKstIdljtHubtE2HWoOe3TcFZzyOFosNFMpYzhPoZi6lbdLRh+gHcgd5wOoHZl5S
	iUfpe644rD2CDBJzAmD5LsbFPU3GV4wal7l+ocDHq1rkwy8N3zo5QzOFkkeCqBKSNEJVbZo8PCQ
	2VVk1QdVpopLXSI2sk2SLsFZgtvZ7CDXNw48uvCNdsjTYpPpivBNrVpGeSFpdEe7l9BKbm3IXSK
	r550ptTMGCnhZVTv19S27ljcOLI1qKoz/YcbEFzClfv4oJXE1Xq2YRnLsCaT0mRiVUbrtwhTW+R
	Xz3ZkL/c8uQkgFyOcYxazw45a3C5KY9ybK1GrypEF17NSJz6n/wtmmK63fj/t4+1jIctidVjPBu
	mYenilEuS7n
X-Received: by 2002:a05:620a:8081:b0:93b:d79a:c468 with SMTP id af79cd13be357-93c43e3e46cmr988160285a.64.1790433976580;
        Sat, 26 Sep 2026 07:46:16 -0700 (PDT)
Received: from rowland.harvard.edu ([206.64.9.46])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c448adc24sm431752585a.8.2026.09.26.07.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 07:46:16 -0700 (PDT)
Date: Sat, 26 Sep 2026 10:46:13 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Johann Klammer <klammerj@a1.net>
Cc: linux-usb@vger.kernel.org
Subject: Re: possible regression in usb-storage?
Message-ID: <0a83299e-c9db-46fb-a4ee-85b4e861f5d4@rowland.harvard.edu>
References: <18c4b811-e91e-c163-fe1f-ee081a00602e@a1.net>
 <28d1f995-5e4b-4d01-aad4-6c5626e51e29@rowland.harvard.edu>
 <d0cd9a1e-cdb4-97c2-5bcd-1bc9f5d9173c@a1.net>
 <5ab3e86c-f209-ca72-58e7-8ea56225775b@a1.net>
 <f66b21bd-707b-4503-a40d-972832db130f@rowland.harvard.edu>
 <605c0845-cfd4-0702-4322-53d9c8037b70@a1.net>
 <be5899e3-3e3e-4977-e4aa-32ca368f06cd@a1.net>
 <7e2440cb-41aa-3429-fb6f-b0f4cf761029@a1.net>
 <986f81b9-c195-4ef4-8176-ca69a8f506c4@rowland.harvard.edu>
 <04f165bc-e79e-4ef4-1f22-d4ad086c3ffb@a1.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04f165bc-e79e-4ef4-1f22-d4ad086c3ffb@a1.net>

On Fri, Sep 25, 2026 at 07:28:21PM +0200, Johann Klammer wrote:
> 
> 
> On 9/25/26 3:06 PM, Alan Stern wrote:
> > So is it working or isn't it?  And if it isn't, what's in the usbmon
> > trace?
> > 
> > Alan Stern
> > 
> 
> not working. same as before.
> here is the log for kernel 6.9.9 quirks uw
> options usb-storage quirks=0bc2:2039:uw
> options scsi_mod dev_flags="Seagate:Expansion SW:1024"

This is the same as we saw before: repeated TEST UNIT READY commands 
all getting the same NOT READY response.  In spite of the fact that 
there was no 100-byte INQUIRY command, so that's not the right 
explanation.

> ..I also tried to debug this early on but only got as far as:
> 
> > c6f9c300 1171416007 S Ci:1:007:0 s a1 fe 0000 0000 0001 1 <
> > unknown? request tp=a1 req=fe
> > (that one isn't in the usb3.1 spec)

No, it's in the USB Mass Storage Class Bulk-Only Transport spec.  It is 
a request for the number of Logical Units supported by the drive, and 
the response says that there's only one.

> One thing that baffles me tho' is the device descriptor that has a packet
> size of 64 right at the start.

The descriptor's size is 18, not 64.  64 is the size requested by the 
kernel when it gets the device descriptor for the first time.

It's a normal device initialization command.  It shouldn't make any 
difference as far as the drive's behavior is concerned.  Your working 
4.9.210 kernel probably did the same thing, although it doesn't show up 
in the trace you posted because you filtered that trace based on the 
device address.

> is it generally ok to have transfers longer than 64 on this device?

Don't know what you mean by that question.  If you're referring to 
the packet size for endpoint 0 and the device is running at High Speed 
(USB 2, 480 Mb/s) or below, the answer is No.  SuperSpeed (USB 3, 5000 
Mb/s or above) has a maximum packet size for endpoint 0 of 512 bytes.  
But transfers can contain multiple packets.

At this point I don't see any reasonable explanation for the difference 
in behavior you're observing.  My best recommendation is that you try a 
bunch of different kernel versions between 4.9 and 6.9 to pin down 
exactly at what stage things stopped working.  A git bisection could 
then zero in on the exact commit responsible for the change.

Alan Stern
