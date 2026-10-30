Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793326988;
	b=CsEgu6B5JOYIKfNkDN9uuswpEGXWQkwg9vZMPLQXU/RtKnUjhKZKJKnFxzVZ25EcL0f6
	 y4qq+SmE0R7x1pUnjn7c+N+POv55Apy6AUHUfKU1Ql0856wpauKZnEkwy6zHbOwXJ7MIh
	 gliNXhEGx+XRGQ+UJQrqwtLiokN5G7fKKnApCrkO8i9jK4Twf6d9K4RtHyLEikAf6mtBd
	 ANt/SlTV9Hkmw2UH1siirq3Q61a86rHC44dg+TZeQn1tau+ZWnzrQElqorERx8zRspa1s
	 q7ZQH9S0P4BklmcStG8fBaFpNM279v4FdZQLGIDuvW7VGcIO7cvi7cizXsfDmfKN2nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793326988;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Zz5WGsHypyEtdDcjSz1FOSuo47hN9fAyIAMB/geGHVA=;
	b=qPGaOdjutD4hZwrYxaNViIrkWuHVPkIZjEdkOy6WHllGU4hwdAg9UZ+1IuHK0EBx6qgU
	 DUxC3+exyBkKdbHPiejs6oaknNaOUsX1zHLYPwQxZsogu5jeST+U1WDqB/dKRC7ngQnk1
	 XOcwv04wAAJxhKz/xMvQ8GVa2g9ztcue5nJ10D1026No4OQYSsYxZxmpOh+zNcb3XCYHc
	 Y7VCmmYPGL1Ik36eVGVISC4FuiV45nMvZ7nUHxWddPGWRyKcSd2cdAzwjBwrUwYhV1klp
	 d8vRmdXVi3gkaZKLkm7OyOfYyjI25RDREGCwkYjdonEQYSDVFb33TS6buWnH3NwFKNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=MQwhrC9p;
	arc=none smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9C3606A31A
	for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 02:23:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E9C3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=MQwhrC9p
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5364d86f7f0so2505371cf.1
        for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 19:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793326987; x=1793931787; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zz5WGsHypyEtdDcjSz1FOSuo47hN9fAyIAMB/geGHVA=;
        b=MQwhrC9pdshC+kxWKYleANqU9qxe8epHKueUbhrU3yry46AFngca57xcAwxJxHxkXR
         CBY+JIacdQ38jZHJhexEaW1CW4RB0kY/72Hsmkbh5f6x+yi8YG80QWSDpqPRRyBp6Z1G
         0i61hWrEOqjSoxhAvMeiuRx7hAQxB+IzKHyerExLvzz2fGnSI3dtqyFYEtB19Xaqak2/
         Yml+FAZSVG5x+iVKRIVoOmzl0eRep7EEcziaES1BP4TtDlqTUgYE/ElnReIhMyREjoVQ
         YNK5aS8+kwYWSOu/c+70Cghu7/osNwLSzZ2V6chOU9IYpsQhGPwu5mXPIZH6sfWE/9DQ
         gtnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793326987; x=1793931787;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zz5WGsHypyEtdDcjSz1FOSuo47hN9fAyIAMB/geGHVA=;
        b=EvLvoAuwBS0TheW68HAmz09+HjAqjcArRkb476HmYu99tpMbse+8HVCYu8QfLXctTF
         VusjT0AqTwjxLtRPIv3YeUK2RSyoNmXGZEwzo/u1So3fGdXPKi65evNS8S+TGb5f9l/C
         x1LRzqcZ2xZw4nXhYIyTYGa1yxW7NMn6emyMh8wS3J8Kc2gGXjRdLKvv8gpln7sKdrO/
         UsyQLICE16Fg9z2LqyT9bCQ4KMXbJ2ByQ61Ebx49Gsf4foEbtTr/q1wZkRN5d6cO6iuI
         buyJ+BhozN/vD6KJG2uHLCRqLv2DPKy6gjMQkfrqesREhE7k6r+3KcIHLX7qAK8gXYPG
         mMlw==
X-Forwarded-Encrypted: i=1; AKwUvBzEq53M7IEax9ay6k1GZcqBNA9vN1a7pAVzg8KqH1WjipT+ftUxyrmGKr0S+isDSRFmDGHhYLI2K/Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYI92HKIdbKiGVNYJE0GuO58fxpidbWb+urNzu8gwNyi5fH9UhrK
	WoXx5VIntvD3GCY40hGPCAVDymuM5N/PEaE8bxVJy4Oy08fJgRTT/bsn1U9O455oTA==
X-Gm-Gg: AYBFou1C/odlszHCSrMHmazeOqtKbfRa0Ntr7SDRa/r1OEUtaGc2w0tUegwt5E/Rnj8
	uK4cByP/gdEL1JrbV7B2dH7SPeVOTikqHBvVCHDnRIGgDJf+mpLOXwNhAQwdjqOBHcBGeqjIOwo
	zA8hep/6zu1pguTksh/J7GjIDx/tDuJXqLXiVF1X+80vvwczEljifirDYjgo/URZFhqO8252gdY
	+sWakPA7RoppRpfMDTuomvWDkXILogW7U61J0Alw9fQn0/LI+IdMaiDjtOH6f0mF4A99/idzqiz
	Op6AISDrGyPNedOkFnSSMVRFuSFgR7HArAXODOJvhrlSb2Vx2jjtBtZ/0ENbFkRZlOGEnaQ1BB1
	G2LmM5bWGPEMPTN6CHRvtTN5cXDSRLLCrx/XZ6Faloa3Y2xKd4NX5GIBARwbDZyq/Og4LjJvMX7
	8EUWTm8HNWhQJf5F8wnw9E7l6vY+ZccrxG2fijV3nWWFnC+bR6RHJIZU3DMm5Hw0/kzk1NZBmYG
	Vkpy8dj0g6txUG9Nu0tQtRqYPtI9OEq8R5qh1NDBSOu31dVh8lRWDkIJiBMxrwpZqqIBue8jt2w
	sctukS7gjk2EHJiRFD0xgn1jaKSg8Q==
X-Received: by 2002:a05:622a:8c5:b0:536:9737:e30 with SMTP id d75a77b69052e-542b62a563cmr16157041cf.18.1793326986787;
        Thu, 29 Oct 2026 19:23:06 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5431246b61csm1484721cf.16.2026.10.29.19.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 19:23:05 -0700 (PDT)
Date: Thu, 29 Oct 2026 22:23:02 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Jianping Liu <frankljpliu@gmail.com>
Cc: gregkh@linuxfoundation.org, dakr@kernel.org,
	shashank.mahadasyam@sony.com, johan@kernel.org, hadess@hadess.net,
	frankjpliu@tencent.com, guanyulin@google.com, gary@garyguo.net,
	rafael.j.wysocki@intel.com, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: core: raise root-hub autosuspend delay to stop a
 busy-loop
Message-ID: <a35865b5-3779-40a4-9a83-8edd797e56b5@rowland.harvard.edu>
References: <20261028041859.1061836-1-frankljpliu@gmail.com>
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
In-Reply-To: <20261028041859.1061836-1-frankljpliu@gmail.com>

On Wed, Oct 28, 2026 at 12:18:59PM +0800, Jianping Liu wrote:
> From: Jianping Liu <frankjpliu@tencent.com>
> 
> hub_probe() sets the hub autosuspend delay to 0. An idle hub is
> therefore suspended at once, with no waiting time.
> 
> Suspending the root hub can fail. While a port reports over-current
> or a connect change, xHCI refuses the bus suspend and returns -EBUSY.
> usb_runtime_suspend() returns that error. The hub is resumed, and when
> its status URB completes the same suspend runs again.

Why should root hubs be special?  An ordinary hub doesn't refuse to 
suspend because of an over-current or connect change.  xhci-hcd ought to 
behave the same way.

> The PM core would normally leave a gap before that next attempt. It
> starts the autosuspend timer only when the delay is still in the
> future. A delay of 0 is already due, so no timer is started and there
> is nothing to wait for. Suspend and resume repeat immediately, and one
> CPU core stays at 100% until the port is no longer stuck.
> 
> If a root-hub runtime suspend fails while the delay is still 0, set
> the delay to 1000 ms so the next attempt waits. If a later runtime
> suspend succeeds and the delay is not 0, put it back to 0.

The concerns raised by Sashiko are valid.  If people really want hubs 
(or just root hubs) to have a positive autosuspend delay, it should be 
set to a small value such as 100 ms.  Not constantly alternating between 
0 and 1000.

Furthermore, this can be controlled from userspace by writing to the 
aprpopriate sysfs attribute file.  The kernel doesn't need to be 
involved.

Alan Stern
