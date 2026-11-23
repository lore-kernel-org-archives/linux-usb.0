Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.210.214.84
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795395620;
	b=wpJcYi5EakTCyorOppuojC3jyCZ22IA0ouEses2ym2eUG2u++G8WPq3Z8ivXWWDbBc1o
	 CsiyzYAKgeHNgDxScnuL3NjnYtx6gVKQ3G7QLxZA4r1Yo9Mh3ijOWeQOUxk1jy0EBQqZ8
	 Lkndwbi54G7bp72kMaADDX7cUs1WuJkOY47yXn92jVmeOo1KzyzqORsyhjghjtfV0Jw+o
	 O00wlaFPUu51+IyCDLx8I7ibRwcAHBxLDyu9kgY+4PBxcndB4/qFvC7fPRnmzmI38ijp+
	 Kd8PQazWJ8PxstgrLI0htlayb8HVucQKyKwA0T10TwjbdI/rhlCBu107KWg6K5e/miQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795395620;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=82UKgW9q7fdHJGNxFuYkS9f9oni4yYQAehGXY4eGJO8=;
	b=j8YmnhR985D+zMNgQkFc3sAfwfhqxGhImgiIyJuvWjb+t56hRKaGORzNSe8+gDWrCoYv
	 BCSJm6VL3aZIWq6Hy8CcnTN8BzGTwA0yF2XpaKJGqU5JNFHfQvADKmrOnhRVOCjogts++
	 VRtkxpW8TIjEJeE4a/mROzASdmUHWjtk1Mq6upZ9MFG4PDBIM7nkaTeBZGdd928hMf46+
	 nQRNNUI1vKwLLXVz9As1sEReCJJMf35LQosazk+3CbJpfWx04zRfN7jLd/7iy6pX3cRrb
	 Fq+FTLLVcwcJ25F7BcjFk1GJxZju0Li/LWBYBzVq3CGC8Nylyw6JjCLX3JafPcKbDfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=codewreck.org;
	spf=pass smtp.mailfrom=codewreck.org;
	dkim=pass header.d=codewreck.org header.i=@codewreck.org header.a=rsa-sha256 header.s=2 header.b=SYMO9gUL;
	arc=none smtp.remote-ip=62.210.214.84
Received: from submarine.notk.org (submarine.notk.org [62.210.214.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B402C606A683;
	Mon, 23 Nov 2026 01:00:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B402C606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codewreck.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codewreck.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codewreck.org header.i=@codewreck.org header.a=rsa-sha256 header.s=2 header.b=SYMO9gUL
Received: from gaia.codewreck.org (localhost [127.0.0.1])
	by submarine.notk.org (Postfix) with ESMTPS id D028C14C2D6;
	Mon, 23 Nov 2026 02:00:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org;
	s=2; t=1795395618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=82UKgW9q7fdHJGNxFuYkS9f9oni4yYQAehGXY4eGJO8=;
	b=SYMO9gULck/EMtV+eBS3tT+qNeooPRQGxbp7VkxiSqnisKDF6vN9+2rt9/KUhAAaD0twNc
	8YYJmcZxM8J1ugfC940GIDRoAx/QlMHVKALg7bSaE7xjPjKyaXM6vvNYdlRwEjQqxSxG5f
	eDxEfdXd4Mn0tHt1+X154PsXaC/S5Xf+QzFVhrQXXEkfC1Wu9HQjnvPgeZt+qmyW3Ffjue
	6kThehA1dWhIx09dFN3xQ5Zf78TLKnYyZT0w5b7Qr2GXWldWbEg6vtb7xCRV6+ZG0Ba2b3
	c6ZXKj4fOEY7qLAP+gBgP2vq/ldAwZY1gE16uTDEE0RiFq3VUk3QGENUeIeXPw==
Received: from localhost (gaia.codewreck.org [local])
	by gaia.codewreck.org (OpenSMTPD) with ESMTPA id b575b958;
	Mon, 23 Nov 2026 01:00:14 +0000 (UTC)
Date: Mon, 23 Nov 2026 09:59:59 +0900
From: Dominique Martinet <asmadeus@codewreck.org>
To: Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: mgr@kernel.org, nkapron@google.com, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, v9fs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tools: usb: p9_fwd: Send complete requests to the TCP
 server
Message-ID: <awOQD-9KMTflKrd4@codewreck.org>
References: <20261120061937.98224-1-zhujun2@cmss.chinamobile.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261120061937.98224-1-zhujun2@cmss.chinamobile.com>

Zhu Jun wrote on Fri, Nov 20, 2026 at 02:19:37PM +0800:
> socket.send() can return after sending only a prefix of a request.
> The forwarder ignores that result and waits for a response to an
> incomplete message. Use sendall() so request forwarding completes
> only once all bytes have been sent or a write error is reported.
> 
> Fixes: 673f0c3ffc75 ("tools: usb: p9_fwd: add usb gadget packet forwarder script")
> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>

Thank you, picked up

-- 
Dominique Martinet | Asmadeus
