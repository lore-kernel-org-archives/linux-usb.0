Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FE53B27DB
	for <linux-usb@vger.kernel.org>; Sun, 28 Jun 2026 20:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782679317; cv=none; b=Hp1E+WC4jmn5IFOfp9Pggqz1X5+VNa8c8zZlBffHVkQ2cjVvxLKIyfpIeUS03B09PoIekaTS5N/7Iu3HaXz2IFeCFcizUJT2s8WPrN3utPAfhuHChSRSwZDrcWICRx/7zY4tGQqnrliLlh5DRaB3I3sKtZhdThTc4id39fdVS4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782679317; c=relaxed/simple;
	bh=j038mUcZjm4sep8U2CON12rveC0DF5YhYcieF8knB5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GMUBvSIvlFP/cDAoonuvT0cn3aeKh5qeuNnHS4yPVUdCugZecDeTWsGbmp3PssHuP4laX0dEpIxBVMccXJBRFDS2kALCeVmREKg/MkZv286Fn1xlIR9W6iRAxYmlpKbzCwItm1ZIHOrkp+ZQfnA+NkqA2/Axcp/MD5/NHHspKFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ouMvpPmf; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ouMvpPmf"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4938d5f86f3so7722655e9.1
        for <linux-usb@vger.kernel.org>; Sun, 28 Jun 2026 13:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782679315; x=1783284115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EjHbb/zbi5lY1Aux2naQDbYxfNt6M3ms/FuKtgATrAE=;
        b=ouMvpPmfZDeWdnA0zR+StyyfvNvqq2pWlaR3aguERJVMq+jLcR3fgsQss8oJ6iDjTg
         99aLrye0Bbgt5YwqdALjiJA+h/EIq7X3+qd9rpYMiH4xTwZSAzzypqm+XZFSq+GSrJGj
         gpUoRRMTGgbv36svLxbNW50AEfCT/7FmOySduV4tiqHj0aVN5NkPgT8xtu3y+IjUV1Kd
         XgcHN8LQIztle4t6F3680bKTnNV88fLP/dmdoJwAl4KJYNj/NrBIHaHkFCAMVrXdFOF3
         szOAshHMQ0leTWXThWjhOzJoqi6fsxdguTS/951W5RUXDfp6R41CF6PcPmKfmTqT5XWU
         BSWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782679315; x=1783284115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EjHbb/zbi5lY1Aux2naQDbYxfNt6M3ms/FuKtgATrAE=;
        b=mD9SI8JOnR+iaZUtFnTCv1ShT9N+HWadsSOtcjbYx4SpBGEdBm7JlCqIjb1i6Me6BS
         8ztrJL7YcwG1MHh67XmoxJ8sdVO2vwN6fsAt26wi/Mv1rn2xh1NqhHZAREr9qv5vgLN5
         UcwvPAWe+1zfuOXLtKcSo5KvSupzYFCajFkgcOpvYdcizqcDNGDIkUv4qr2O5lk1djLI
         nsGanyPCga1SmnQ90dPlxRwh88RYFrbCpKoXTfuQTQFoV6RQ1M5znelqg1ECUBNZzde5
         egLKSOosUPvQ9OOQn8EWl0hCn7g8iG5bQ2tHqUpa1g2rNFP9CNMblkZqJyg160zPRnPK
         zOhQ==
X-Forwarded-Encrypted: i=1; AFNElJ9EaBbwLK5t2tGswmELohv8flK+m0to35Vo4g+ydWFFSEOV9GutiIL1T3nNsF1pVWUhPeBH5tc11q4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvcpTTAn7Xwf7yMSSRq9Qq925JDUh/ZZHg0QPHUKcxGTAJXNyl
	g6GoDVntyjKETAF2SfhhJFy21AL7UVoJzPn2g9UTQ5iJJObjR0pAIcKU
X-Gm-Gg: AfdE7ckaZeWENyR4QiTQujqdNYQBBbq/1BEP5qPPcRNP+3zEA3XxCaldy+pc4ShfBhz
	eXyqqqzMnkQ+jgNiqQeW6eEysXvk9QrLlPLol33070JfTDSM4p+CRg9xZorgT0whZ/Wqs17pRlj
	dgCkT8xmewnPH/XbNNNjrtZ87rEMMbJVbU/nzYcZ75aZSduKSv0iPzgQEum9FLkHuFQGvNaKDhg
	xjvn2uYgZTVvx+RwUEBlSeA8yFNK8wVS1jpkFwrbGkR1LgJLo9Rap0G+F1qb+eD8dSOslej13d6
	vo0a+ne0/foeAKXFm8H/++2LJRO+7Qw1u7WU+wdlmfRPIilez5m5dY5raDFuHV3WcXUimEzoU8h
	hDXV0UJBeT7Oy3CTX0iyXZm4K4sNDSQURr163VS7YSpjD7sctGuTM9KnIzCcnnJwXH34V3wE/Y3
	FzeEtWVCLUaaQcrBrlqyuzRXXN
X-Received: by 2002:a05:600c:4e88:b0:493:ad8a:e7f2 with SMTP id 5b1f17b1804b1-493ad9a2b29mr18360745e9.13.1782679314528;
        Sun, 28 Jun 2026 13:41:54 -0700 (PDT)
Received: from foxbook (bgu190.neoplus.adsl.tpnet.pl. [83.28.84.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49268fcee16sm276918785e9.2.2026.06.28.13.41.53
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 28 Jun 2026 13:41:54 -0700 (PDT)
Date: Sun, 28 Jun 2026 22:41:50 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Nikhil Solanke <nikhilsolanke5@gmail.com>, linux-usb@vger.kernel.org,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] usbcore: Add quirk for 255-bytes initial config read
Message-ID: <20260628224150.39990d04.michal.pecio@gmail.com>
In-Reply-To: <8f5bb295-fc1b-4698-8f2f-2d40fb4d9f93@rowland.harvard.edu>
References: <567e8866-4308-4e5f-819c-fe778dbf74f8@rowland.harvard.edu>
	<CAFgddhJk0EYG71fnKdio=RHC-cH+JmL-EZ7-oVD-LdHoa2TBSA@mail.gmail.com>
	<5159fd69-dddf-4073-a8e7-95fa77de0b7f@rowland.harvard.edu>
	<CAFgddhJ2HeJ=oTBX_axMJcgJq7GXH9abe+LH+x9NGekGO4BMyw@mail.gmail.com>
	<eb0dfd45-91c5-49ba-a297-b183dbc52c8c@rowland.harvard.edu>
	<CAFgddhLZ9SuOzG_6mW09j9aDkCp6TedpNkzJ6TUD+DnR3TDLKA@mail.gmail.com>
	<02060df3-b8c5-4a86-b3ab-3a28eea8a562@rowland.harvard.edu>
	<20260628165040.76fd608d.michal.pecio@gmail.com>
	<62e1fab3-1045-41f3-bc74-4c7624011619@rowland.harvard.edu>
	<20260628190201.00afdccf.michal.pecio@gmail.com>
	<8f5bb295-fc1b-4698-8f2f-2d40fb4d9f93@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 28 Jun 2026 15:18:02 -0400, Alan Stern wrote:
> On Sun, Jun 28, 2026 at 07:02:01PM +0200, Michal Pecio wrote:
> > If such devices will exist, then it probably won't matter whether
> > the delay comes after or before the first request. Purpose isn't
> > known, but it appears to be rate limiting configuration descriptor
> > requests or delaying other requests after this function returns.  
> 
> In fact, the commit that talks about the Logitech webcams does
> describe their buggy behavior to some extent.  It says that they seem
> to reply with stale video data instead of the real config
> information, and from there it's a short guess that adding a delay
> gives time for the video pipeline to drain or time out.
> 
> In addition, the fact that the delay is needed after the first
> request but before the second suggests that the data corruption only
> affects transfers longer than 9 bytes -- which the new first request
> would be. Therefore it would be appropriate to have the delay before
> the new first request.  Whether another delay would be needed before
> the second request (if there is one) is unknown.

Fair enough, that's possible, but even in these specific webcams it's
still unclear what delays would be necessary with both quirks. We wait
for the HW to complete something, but we don't know what starts it. If
it's device reset, then b2a542bbb308 has already doubled all delays
so d86db25e53fa6 isn't even necessary anymore. OTOH, if it's the first
config request, then a delay between the requests is mandatory, and
a delay before the first request is useless. If it's something in
between then your approach could be the only viable choice.

I would worry about it when a device is known that uses both quirks.

> Good point.  But I dislike messages that actively produce wrong 
> information.  Nikhil could get rid of the parts of the log messages
> you don't like, but he shouldn't leave them as they are.  He could
> even do that in a second patch, separate from this one.

I can agree that the first "descriptor too short" message becomes
misleading, because we no longer expect 9 bytes exactly, but anything
between 9 and 255. So this could be changed to "requested".

But I see no need to change the second message. Regardless of initial
request length, the next request (if any) asks for the exact size and
we do expect it to produce 'length' bytes.

Using different words in these messages has a beneficial side effect
of making it possible to tell them apart when wTotalLength == 9.

Regards,
Michal
