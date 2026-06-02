Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B313F44F4
	for <linux-usb@vger.kernel.org>; Tue,  2 Jun 2026 14:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780410377; cv=none; b=NVN/WTxWqIuBRFC8MNY3ZpNDaxdhC7IKa+Y6kd6wu6BvmDTssbN2+ISyo64dK9IXtblf7VkBMG4tXZx4URaVSwchgLUylPWrz5coAdftB8w+VlShUBbMekx8Ivw+8WxdZuOGc/gdXCdHbybE3iOgP/IPLh2CaiStOBjpN+//96Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780410377; c=relaxed/simple;
	bh=DITiKwOitso36mAhZkPtf7X8S2cqbVFtnJBIr+rhjvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ForBMYc4DChGMk7gRxju8RRLKLpLqVomBVp5F9Q8TLa7wlhIu3QFxfRxggGRWSz+QmMXkUgCRgAfFcCYAJKp/dB8ajU6ugFYAywuSKb+7jMpuqTLyuh5KhELF5vy7fNTdzBTe1VyYWG3InA3Z2rR8XdFzkC8jIW47AvPiCKOPFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=OQjqLJq9; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="OQjqLJq9"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-91578c374ecso88345085a.3
        for <linux-usb@vger.kernel.org>; Tue, 02 Jun 2026 07:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1780410375; x=1781015175; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LDObwgxLHqUhiRXoqT8k7RF+l6jYHI6R9YGJadTu/oQ=;
        b=OQjqLJq9QUbKvYgl+X30WJj0xRPGQxkoPpfvIXonVNpL8J2GWjMPaZ4xYPpTp3s9YK
         WD10470EdLn6E2fVt2SaSrzZ9YusawOYXII+APyFvZeBg/RfG3xmIW/1440YjgixuPE5
         YtTUay34gPt7vGSR8DD+p6g1avLHQQS6wfVjPW8UTZQTyAUYPmLw+wvOTdu9gPd/Dsfx
         yV/eDu2duHV0QYeK+HhEuRkz1uk9CqwvP201154wUAaQ0plLMSp+we9/X33BgZO8WXRK
         FAanE0bDQR3U1LCtzkUWPnaRFjWXbi8I+dzq0UIrhGDnPtdUxfMErIuKKsk8dO04tRJd
         IEKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780410375; x=1781015175;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LDObwgxLHqUhiRXoqT8k7RF+l6jYHI6R9YGJadTu/oQ=;
        b=Zm6X+c4fKr1y28lwjkgvZetLZBNoCwVZM9/nDrGezQjCVYRMK/So7D7Z0xcUrA3gEt
         DJj6aKF4igObS7bj8tvUunillP7nvUdkCUc+js1aW6GYqyMBbBZmMf1uTH6vm5x9jSwP
         q65ZUA8S6sL92tSdDILmFV8yCQlma03ms3zBqCoCAlx3PJNf5fz/kRmuubqQaaUiGqwi
         qPMUT2rxM4ZidJkRB/g87x9e8ikc6LImN4MJ8JIwJht5rTGB9RiI7MliFMinoOb0K7Rs
         LShSK6nLkKLmUPDTmLlBZI71KYhXstl4l2Ya8aySibyQ9xgRqq1QHtQH2vqvK6kQ2H9P
         gmQQ==
X-Gm-Message-State: AOJu0YyN/PB+ophF651O/XJwcKQVBb4OtMWHfkpDaSdSwfp9Hp0dQsOQ
	zCmKwE6LtTGPeskZYsR5GooyQkoOt6Mt8HT69ULuQovAeIop+Kf3WDZpjSdz58j7Ng==
X-Gm-Gg: Acq92OE1Y9jQd7FKQbYy8QD1ZkNFIHM//UWTFNUX3PF4OS/odU5S00o5sJYUlsBG0eH
	1R+cKXIgjfEMZZvN/RROOFYzLFrufY9hr9RfNhQW9bsz1ym2qI+Ol++bFFZU0mkcX7uoU/DW3Gu
	MeWaNXBbNaD0ykfq5/GpcHh1OleDZZQdq/az3i85y81DOHltjgL65D3tdQRKitxI6DwfQwPB5bl
	jOo4BTNVmwEE9+UG5aZV0fSkAgWpXZhEahX3m2huUMV+LBfutiJt+1jjwWdt89nLHpl585wPhBY
	/fR8Mbjf3n9Xw1btcLG/5kFqpZqBlmOZTKPBJ1gsmOHqsFIwnLxsUNGzRsJSJUsllFPv6UQnWmW
	39CJv8thBU1raUo/At+L5OsxU6Ye9krDlj+MPlfPmFisVuuJt4lTown43lQhqxJjeTIIt5MlkVe
	Ir/HGIdMO10fTFLRElI/IGj8YDskh7JMp4OcjDrnlwS8hiRduP/OWmzA==
X-Received: by 2002:a05:620a:1999:b0:914:c0ab:f1ee with SMTP id af79cd13be357-9153da3c95fmr2561384185a.44.1780410374796;
        Tue, 02 Jun 2026 07:26:14 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210:d62f:1911:f952:16ba])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9157576a193sm316115885a.12.2026.06.02.07.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 07:26:14 -0700 (PDT)
Date: Tue, 2 Jun 2026 10:26:11 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Brent Page <brentfpage@gmail.com>
Cc: linux-usb@vger.kernel.org, Michal Pecio <michal.pecio@gmail.com>
Subject: Re: [PATCH] USB: EHCI: inflate max_tt_usecs and implement sitd
 backpointers
Message-ID: <a30d95f3-9802-4a2a-8b5e-ff4b5ac93662@rowland.harvard.edu>
References: <35666FD0-D108-41FD-8CE4-CD8F0DD87472@gmail.com>
 <bfdd7729-be9a-4014-87bc-7b7a5b393980@rowland.harvard.edu>
 <EC0D612B-B61B-4652-9CAB-FCED814F46AC@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <EC0D612B-B61B-4652-9CAB-FCED814F46AC@gmail.com>

On Mon, Jun 01, 2026 at 11:52:29PM -0700, Brent Page wrote:
> > That loop adds three new "blank" sitds to iso_sched.  At the end of 
> > sitd_urb_transaction(), the picture looks like this:
> > 
> > 	+-> iso_sched <--> new2 <--> new1 <--> new0 <-+
> > 	|				                              |
> > 	+---------------------------------------------+
> 
> But for an iso endpoint, the schedule should never be empty (except for
> when the very first urb comes in).  So, there are sitds that are already
> scheduled before the new sitds come in, and I think in total the picture
> will look like, e.g.,
> 	+-> stream <--> new2  <--> new1  <--> new0  <--
> 	|		        --> prev2 <--> prev1 <--> prev0 <-+
> 	|	                        					  |
> 	+-------------------------------------------------+

I'm not sure what point in the code you're talking about.  Also, you 
don't seem to have noticed that iso_sched is different from stream.

> Then, after
> 
> 2177  sitd = list_entry(iso_sched->td_list.next,
> 2178    struct ehci_itd, sitd_list);
> 2179  list_move_tail(&sitd->sitd_list, &stream->td_list);
> 
> is executed 3x, the schedule will look like
> 	+-> stream <--> prev2 <--> prev1 <--> prev0 <--
> 	|		        -->  new2 <--> new1  <--> new0  <-+
> 	|	                        					  |
> 	+-------------------------------------------------+

These labels for the sitd's aren't useful.  What matters is not the 
order in which they were allocated but rather the order they occupy in 
the queue, which must match the order of the submitted URBs and of the 
iso_packet_descriptors within each URB.  That is, the picture should be:

	+-> stream <--> urb0_0 <--> urb0_1 <--> urb0_2 <--
	|		--> urb1_0 <--> urb1_1  <--> urb1_2  <-+
	|						       |
	+------------------------------------------------------+

which is what I wrote earlier.  Here "urb1_0" is merely a different name 
for new2 (after sitd_patch() has filled in its details), and the same 
goes for "urb1_1" and new1, and "urb1_2" and new0.

Alan Stern
