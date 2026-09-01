Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3FB411A10
	for <linux-usb@vger.kernel.org>; Tue,  1 Sep 2026 14:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788274682; cv=none; b=rCJCe3D2f2f5am9V5JcBYeFst/VUpGhZf83r77bnYaE1ecx7CixTJsSYp+wa+TVTLctj6mlB3eCdpTj8op4weJrxayiX8oWXqRiOELWygDFQN8u0p4+ggfL5i5l36HipiMbNfL4FOOaJeuIh+rPQBRNbU9d0m/A4OCZzYYNW52c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788274682; c=relaxed/simple;
	bh=xGGT6ev6YnlKUvS8Bw6ihAIyneNBkLYVa7+GovOX2uM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e4VgjW/E9M/0ZM8hPeQsfq68e/NVQuiRUWbbF435Ka31b8NklmBcVESxZVy2uYG3hp+MgAn24Ef3SitAttD1e8RKgBRL/jUF+weQV+qRUd4Ju9TSYpm4i233a1HTi0TLQ4XFKOCNRHoh4VmhDs70KLhKD6MAoi5igDIT1nkVcr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=wWQdt3Zx; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="wWQdt3Zx"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-52d5bfa4bafso11098921cf.3
        for <linux-usb@vger.kernel.org>; Tue, 01 Sep 2026 07:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1788274679; x=1788879479; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3UglSJQrs9C4hmjmA2b4GF/jKcD4sITEPAg8uXUAeEE=;
        b=wWQdt3ZxSnDHOyGmMnoZhyImRigDLvLDci+w6N0HgzdwV07t02gcJnB1anz76dyNlX
         z65VQ+LTpJ+/feWrZEscojMEF34YyELPkovzn1qY3tT/2GQzbrAXJxKNGEsAbtyH0qxS
         QLnPmNAxrC8BZZh0jGJG+0MWk5udN5SE+YUtf8t9w2b+hD2xA2JmSco58I/kwVQPjzQb
         Yr7kYNNni4bNjAtrCXtI/NseUhVFllJYhGSwMoS0BhDblleRql+wHIEzrvGpYr0YEtzp
         QCRbI7Qnn0647LQOXOjOJHDPFK96dOG2wemcmwnHPNL096CbXVL5Tqy/OfUNX+gyHAQv
         R+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788274679; x=1788879479;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3UglSJQrs9C4hmjmA2b4GF/jKcD4sITEPAg8uXUAeEE=;
        b=IH8ch7Exdmluv6VaTbpmRHyXL6Ps42fdyY555Nj3YrW8ADITsougrnwcnBNl7ub1UD
         MLj57aIHZbGSXyoLWWtRRZ7V4R9o3NC1BCmCRi5QxZNmyNh3CSM306TrlyBspEDk8kD2
         A1jWvoJSb+tnIO10oEMTN3Kk//n/z0HDZJptzj+4BdtZFrKV5jkL/x3VJT8NwM/kid5j
         3T+S8eoneR5bDhKnhUjztRXzcmh1i8ACVlPltc0ndnPt0Y4LZvhAwVqKQe1nqbDooi/B
         DnUVgIOtERRPpz+re7gjAILh47YJKadpX4+L4LKxNqCYmx028uxWIg0kDfnnVZBk1hVv
         HBPw==
X-Forwarded-Encrypted: i=1; AHgh+RrDC6C0Amgyt/5Sv3Pw4EmQnCWOESDv9nKRx8SUslUdjB/PUuyqDP4wcC+gma6HuyOIvmaSY5K1G3E=@vger.kernel.org
X-Gm-Message-State: AFuF++mh1z1UQ6HusiPvBFH4ElrLDY9QIfleGOUSPOZWY5bKBR38GeMK
	wv1HlejI2DTJ/+XWh5hgpmgDLlZBWS9qf7hEoZB6UGjRIt9uId4SsKvzdfP7gak5BQ==
X-Gm-Gg: AR+sD11pTkf8iiofViW0Ig3+/GPEaw1YUbG8fAYQ5Td6tQsNFS9C5A6uAMIXsVDYzgi
	tcGMang9s1CcHXGWnRcfMIYqYylgsIAM6QUagkA9wvnDtJC6HnzvriISxPVVf9JPT2X7HlbunFX
	6ozYnD5HH17IiolkO6++SBm3OTzqZ+Lzxbt6O3f53Tj7gOXyfzQgGFgLPiFUwlMmooAizUfrgup
	HeH3JIyljnxCKoBoIoLKnoV3tYiDezLYk1Fg1pP1SFFaVFRex/PZYUFcvicbto406U8rOUn3utc
	FrzB8HS0JTsMQ1hxZlnuGVGZyrTRFrKZi+pwG3/zKVbF+EW6XNiZ+yLIJstmQxiCkYy1faE47kq
	RnyCJOvcpc7JLF0TxyjnvftQNShEX1bCLWxCbli53xOSI/Bwmn4jvXUQ3JH3du28yg8B0FmY62H
	8pJul3mls0bSuM5H5tEat2zIEe+y+/nHtoIxxcSMoeWWJgq6qIve/aAqn6V/jsqg==
X-Received: by 2002:a05:622a:858b:b0:52f:b9ad:9dc1 with SMTP id d75a77b69052e-52fb9adaa2fmr352866411cf.20.1788274678874;
        Tue, 01 Sep 2026 07:57:58 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52fbe581f8fsm97181971cf.9.2026.09.01.07.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 07:57:57 -0700 (PDT)
Date: Tue, 1 Sep 2026 10:57:54 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Rafael Alejandro =?iso-8859-1?Q?D=EDaz?= Cruz <rafad900@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com
Subject: Re: [PATCH usb-next v2] USB: gadgetfs: Fix use-after-free in
 gadgetfs_kill_sb
Message-ID: <211b5666-1777-45b6-b1dd-9e85276900b1@rowland.harvard.edu>
References: <20260829011901.325379-1-rafad900@gmail.com>
 <991f3432-02af-47e7-b470-b21d36d09ac5@rowland.harvard.edu>
 <CALp66yH0C0WAgUDkXArbLHgwSdrJ0hfQP2id2xhztg-d=qK1Jw@mail.gmail.com>
 <23099c10-19ea-4626-b1a0-74a64fcb0dda@rowland.harvard.edu>
 <CALp66yGtNY1e3DFdRxMjf1YDnCLrsH_bg4gpyu-A1K0mRgOt2Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALp66yGtNY1e3DFdRxMjf1YDnCLrsH_bg4gpyu-A1K0mRgOt2Q@mail.gmail.com>

On Mon, Aug 31, 2026 at 10:06:23PM -0700, Rafael Alejandro Díaz Cruz wrote:
> After spending a couple hours staring at the code and
> asking claude for things I might have missed, I did come
> up with a better explanation of how the error happens,
> but not why it happens.
> 
> I began by removing the get_dev(dev) line I previously
> added and keeping a mental score of all the times
> that refcount is incremented and decremented and found
> that in most cases, they are even. Except in one case
> inside gadgetfs_bind():
> 
> static int gadgetfs_bind(struct usb_gadget *gadget, struct
> usb_gadget_driver *driver) {
>      struct dev_data *dev = the_device;
> // ........
>      + get_dev(dev)  // HERE
>      if (!dev->req);
>          goto enomem;
> 
>      if (activate_ep_files (dev) < 0)
>         goto enomem;
> // ......
>      - get_dev (dev);  // Move this up
>      return 0;
> 
> enomem:
>      gadgetfs_unbind (gadget);
>      return -ENOMEM;
> }
> Somehow the reproducer is triggering one of those two
> if conditions and sending the execution down the error
> path directly to the gadgetfs_unbind(gadget) and skipping
> the get_dev(dev) right before it.

That definitely looks like a bug.  The get_dev() call should be moved up 
before the set_gadget_data() call.

> Inside gadgetfs_unbind() we call put_dev(dev) which
> would be an uneven decrement. I can confirm this was
> the problem by first making the change above and
> then triggering the reproducer on my local QEMU which
> does not trigger the UAF.
> 
> Yet, I don't understand why this is being triggered since
> from what I can see, none of the syscalls coming from
> the reproducer are directly related to this. And these
> .._bind(), ..._unbind() functions are not part of the UAF
> stack trace but rather, something that happens in between
> the reproducer triggered by the usb protocol.
> 
> Not sure if this is good enough. I don't know what else to
> look into.

You can make debugging easier by adding dev_info() or pr_info() calls at 
various strategic places in the code.  Then the kernel log should tell 
you exactly what is happening.

However, no matter how you decide to attack the problem, you shouldn't 
submit a patch until you truly understand what is going wrong and how 
the patch will fix it.  This means thinking for yourself, not relying on 
an AI to do all the thinking for you.

Alan Stern
