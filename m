Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9FF4C6EFA
	for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 14:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787323455; cv=none; b=Ii3ibrJpmDFuTM4k2PUUe3CVihrmCDpZ8Jrb83hNBonmBq9DNaQM6DD5JjCq2YeTIlagrkeDp8i9tje4EASYkl90qOs9wO5S/D9UPrrpxd9cmoyPiXFycTXR5T++93pzlzIKeQ7aT3kv4pGJ+sdjIdXAQJnRWW2fDHf6uQDfExI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787323455; c=relaxed/simple;
	bh=eu8c5UrLZdzmeLkMwbefxBnXRY6gH2t6vpBaZI6mVYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EwD0gJcrB9h6tqTOvoqFu0f3pS5XLM91XvqCZuXAHjzc19xXSgWEdDhX+lmIJ+b5nBquEkuUUWkc9L2Yp+cVE2U5iOfLVeKrzvS2ghG+kRzK3sG+SZKXEzlcJjbq7ZoMBMfHDGkThN0sQUgqpXQHEMG627G2HYynj9hc2tRXBgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=B9cqRceL; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="B9cqRceL"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-92e5c9211d2so86279285a.1
        for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 07:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1787323451; x=1787928251; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5RoumJcFMfg+obPFaAjKYFo0x3Y47ciP9Aba+FItD38=;
        b=B9cqRceLmsC2eKYXfBqzI4IePhGGeCOvV8g/dSGebzQXpMdvqi7l6UJLLES79ihmB/
         Urivbf0+9P+0DVAoVlw/sx2lCRnf+1fNtIlB/Xf8G/6Y1I1YpWygkaE3ZNU7JF6kYYc4
         usBj6m4dazdK3yrN6kgi3yVyIskebAY8ylBH3zfoeTz+bRw1v6RAeprgBUH2RvUu8ihR
         rGICa1bO56nhnDB86VPVIDSgLYVFVnUL59J0veAuV7+IRie1WgDdrb8IzZlgbw2PwF3Z
         6YD9oFrD0o0iptI3Lg2TjlI5IsvJD9jzC8mtLMFpk1A8JG4EUSQGa9gTSBeoh9vS1ioq
         nL8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787323451; x=1787928251;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5RoumJcFMfg+obPFaAjKYFo0x3Y47ciP9Aba+FItD38=;
        b=gHr2X9IramSiZdaFLhVYArSaTmGl63tDvwuzazS4nteh3Eu1Dzb0b5bomlvVYsMy2w
         NnA8iFVylEEmaqDCvBFcUsJkGdfCG7MRXWXzDKADOSS0HNVaNHNZkpUDig+JLZTyHne5
         3MEgLPOf8CsCeiiEKZL4NwGPaT2m0n/WL45FI/nw8RADRZt1jC5/fmbmhhlRcYLFVGK7
         pKbfDJ3D9a0UyJBLUg5/5y3moh9o5iuPbrLMWdphp9vSeNc4dbxFmTy+v0J0Fmk0k2jV
         V44SgFVcDHlQS7H9McFQKNDmEPcogpX1hIZ2HvQc/CXyWTSZzhnZ4Zk20EqpjV0TPmWt
         ZEUg==
X-Forwarded-Encrypted: i=1; AHgh+RpqvFpkohRQ5UeQT0J797WFU72rEfYcCmDUUNmS21pQs/dTDA3QOp2BAtbnhihT8xI/STMzZvGeQiI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoOEvSpH5UGYnYYL+x6YKpL2GyC4eP9CPYeq9oyXCdcQjuLtCZ
	zqspBm1h5F28nd00W1RZYo5KQS7RgpF9+gkpl9Iavp4fpMDPSp4e6wWNG29gS29mXQ==
X-Gm-Gg: AR+sD13CDm3I/rDZjHCTYYyDO77RIT/G0Dw82BjcnnDfwQ3rGxf1Xi6/kAV7wXYLKOI
	Rf4keYTPGqYHq1lQrKVA5xf+MF1FrLw5oOB189vt9b8yoBzaOYLqW3iJ5RnJpjHmhoER8kNszs7
	7+dsKEbbpxzzasz07X0Ilhw0TM06ZMvJ3KjUeB/prcAmsbEi337LBBEwVwrkKXh4CVk2uklG37H
	6F1slE2qokBly+Z/sh8eYgHQ9MSl/sGCZ9z6A96xzI11g2aXp9DGxXhcezw9JQnpmoOSPNU4NoN
	/uisXTQH76qpvhAAnSYC1LsneUWUqDnOYqIAKZZY1MLLnB4u/kliY749FQllOrCmwjmm/v1YioM
	Oykhh7zq/s2ulwLfVo3CtS8QWJKHqZXqxufknrKobGK8z0DWWltREcyrygu/zwobiXmBxym+tU4
	j5xlG9EGpZ2uHhNL7AyrKJxfMKYvKdJEl2ZsafN6UHKZGhOYqevN1VhJaZL1sSzg==
X-Received: by 2002:a05:620a:6ccb:b0:932:df7e:b31d with SMTP id af79cd13be357-937394766f8mr601956985a.12.1787323450754;
        Fri, 21 Aug 2026 07:44:10 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::dfd8])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93720582197sm598876585a.34.2026.08.21.07.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 07:44:10 -0700 (PDT)
Date: Fri, 21 Aug 2026 10:44:07 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: xhci: Fix isochronous scheduling regression
Message-ID: <327f6412-5d07-4bee-a51c-06f1ce5823e6@rowland.harvard.edu>
References: <20260821114706.34b095b1.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821114706.34b095b1.michal.pecio@gmail.com>

On Fri, Aug 21, 2026 at 11:47:06AM +0200, Michal Pecio wrote:
> Fix this by using the best criteria we can muster, taken from ehci-hcd.

Maybe it's time to correct the hcd_periodic_completion_in_progress() 
implementation.

For instance, we could add an atomic giveback_count field to the 
usb_host_endpoint struct.  The HCD would increment the field (while 
still holding its private lock) before doing a giveback, and 
__usb_hcd_giveback_urb() would decrement the field after calling the 
completion handler.

What do you think?

Alan Stern
