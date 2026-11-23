Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.210.214.84
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467123;
	b=uzVAHI1CC2iVFrciEZvCMqhXuzip+JQorp25961AWZAdx9PT7PuU21rnmqFNshcO4U6a
	 Fg5VbDx473xoomYtp6t7AhVU/Dj+qsOl655XIG1a8/64QWhJlHJZABrmhGWw4aEB0oWpf
	 BjEoyNvhdTiB2xYwpgSEg59eCFo8l2Hw00oAqnTp87xRuIl14/EjHo6GqkEuppkQoKGZd
	 Ng08u6OuDfUivf3n/cEJYCjQ61HBv5EyG97lYQ8eHtx+cDEDWbljden1ttwk84mu2YfIq
	 l3lbn6KKsuwUROO5uli1LNr/UAm3msCyvA8aD0Il2ndEo6D7CJA9rGuyfAa0VMW9iNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467123;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=eoFBuZX7cl9z83u/LMcI/j8Tx2rvqIARdyS6MqH8nbI=;
	b=KigGTir2z2gueiXVXLN2yzXvpstwIva5FL4hVB2sZcuG94bPz/VTU1BlCdx/+oEHn4dw
	 JoDlY1pke0Hp0/R7FB2ogs/Dg6qg1U7UqOoEJe5Sj+oPkkD1kGTd9eQmL8KhZPGbpraT1
	 FBx3ckjonVL9Sp6mWOxje2KYrU/mkurw1d03oRnxn5B70pt3yH/264s1RmJDeJBx7vVZa
	 z93BB39mHlhdot92PzzEYVdjYg2qXMSEpJImmMYmPO1V0FwCUVoo0Q0C3OESvbHj8I0wA
	 God7PUbJlBw4UG/PebaD9UYK8H2I6HY8qrVDwPOe5Kxw8sMy2vRPG8esRYHT+UCV7ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=codewreck.org;
	spf=pass smtp.mailfrom=codewreck.org;
	dkim=pass header.d=codewreck.org header.i=@codewreck.org header.a=rsa-sha256 header.s=2 header.b=yyGK7Ykb;
	arc=none smtp.remote-ip=62.210.214.84
Received: from submarine.notk.org (submarine.notk.org [62.210.214.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F01606A327;
	Mon, 23 Nov 2026 20:51:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2F01606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codewreck.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codewreck.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=codewreck.org header.i=@codewreck.org header.a=rsa-sha256 header.s=2 header.b=yyGK7Ykb
Received: from gaia.codewreck.org (localhost [127.0.0.1])
	by submarine.notk.org (Postfix) with ESMTPS id BBA2B14C2D6;
	Mon, 23 Nov 2026 21:51:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org;
	s=2; t=1795467117;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eoFBuZX7cl9z83u/LMcI/j8Tx2rvqIARdyS6MqH8nbI=;
	b=yyGK7YkbpvEiGOvMLTEouavV1EopCvmE6S2Eucjf3YMnoWaFdsiBBq3fCIPJcq304G6zB6
	MGyyaWaVqej28o27zWOChlZJ8fixouayRSheV2+7Pxi48CeSakT9ldhZyOl0NNN1vP4/PN
	6Xzk2oYai4BAZWDJ2kSNeSIvcDSBj5LDJMXe2WW/6rxX7oL488+l5tUNuOOIMQKdQ0VjlK
	1E8HkWjyztBqcW5n9slVMPro/XOm6LGcNvAVixpvjd54KNhuw3an3elQcZIpp2eL+KcX2N
	LIjG9DAXiUV3qhB17rgBQo681ao8mfGGLTPMxrGpDSAxq8sy3Q2oAuQsbGb1Eg==
Received: from localhost (gaia.codewreck.org [local])
	by gaia.codewreck.org (OpenSMTPD) with ESMTPA id fffc9bb8;
	Mon, 23 Nov 2026 20:51:54 +0000 (UTC)
Date: Tue, 24 Nov 2026 05:51:38 +0900
From: Dominique Martinet <asmadeus@codewreck.org>
To: Michael Grzeschik <mgr@kernel.org>
Cc: Zhu Jun <zhujun2@cmss.chinamobile.com>, nkapron@google.com,
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	v9fs@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tools: usb: p9_fwd: Send complete requests to the TCP
 server
Message-ID: <awSnWlnvyPkzYzJG@codewreck.org>
References: <20261120061937.98224-1-zhujun2@cmss.chinamobile.com>
 <awOQD-9KMTflKrd4@codewreck.org>
 <awRYqogEpIWuCN9-@line.checkpat.ch>
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
In-Reply-To: <awRYqogEpIWuCN9-@line.checkpat.ch>

Michael Grzeschik wrote on Mon, Nov 23, 2026 at 04:16:21PM +0100:
> On Mon, Nov 23, 2026 at 09:59:59AM +0900, Dominique Martinet wrote:
> > Zhu Jun wrote on Fri, Nov 20, 2026 at 02:19:37PM +0800:
> > > socket.send() can return after sending only a prefix of a request.
> > > The forwarder ignores that result and waits for a response to an
> > > incomplete message. Use sendall() so request forwarding completes
> > > only once all bytes have been sent or a write error is reported.
> > > 
> > > Fixes: 673f0c3ffc75 ("tools: usb: p9_fwd: add usb gadget packet forwarder script")
> > > Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
> > 
> > Thank you, picked up
> 
> gregkh already picked it to usb-next

Oh.
Dropped from 9p-next, thanks for the heads up.

-- 
Dominique
