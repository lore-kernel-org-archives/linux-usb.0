Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794005276;
	b=Yd/E+CbsDBkxi0eaIboHCxpryeG4hgu1T9eqxm3BW+UHVPBEIUZHjl3vajRRiqdcyu5P
	 Uqo2xe7QOxWbJr7d3s4eYWafC8xLEoviRo+yVFvpLNpGyixNWZ2irpFRChocZ0XAyi/m+
	 Pe9ZK6aQQi5SP07LK0trwIodxJLcSLXBAqj+79WPelMQjxCm/h/hNNDE4PostXWnTXOLR
	 veGeNf8nKvCNHuLT9M6F6gu9E8RxVkHJyrUPkl4mEBMpqfY43WAyPDvp9fGpz+YBMc7gk
	 /RfuONV/moxIKAR8zOxVJMY1IhGrqXt4xP0QD9WUoyID5TR7M2OTVOp7waC0d92b1ZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794005276;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=7Ri9W+3kg88qSbuPThiC4vJC6+m87LpSEjqWT6Vv/x8=;
	b=gcptu5tqGNabKfQ8NDtKMjPAKJ9zK1lBYcIQtqFKtnPRU7nm/r+q0M7V5XxWx8rw4BbP
	 ATxTyF+LNbVfQlRmCM8yYAjO6LE6HD/0iosVjIUVlk7q0N+VQKKserJ8+npArrJdsGznT
	 VLfj/UEw5d+foPovpanMlQM2h/HHEQTf07YIkv8grCFV9K5H+gsKn6acwneg9n503k32n
	 55YFt6flCgVlJeuhWmulbPmuZsdpee2QQ771V3TeQJ0Eza3ZleojA+0qapZhVzZT2Wd4W
	 AmiEKMnjoisjhsZNi4GeUZpIdXlfwTIQyaiNuLIF0qmLr7VNZKLKhnVhpVc8aMcoVPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="BM/k+V2g";
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB6E606A326
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 22:47:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFB6E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BM/k+V2g
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ada8bc2380so654002a91.3
        for <linux-usb@vger.kernel.org>; Fri, 06 Nov 2026 14:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794005275; x=1794610075; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7Ri9W+3kg88qSbuPThiC4vJC6+m87LpSEjqWT6Vv/x8=;
        b=BM/k+V2gKoXYUDA7UzvURib6HbrbIFdlPpcofJFDflfJtTTe8BgQqW4taSgKjilm/Z
         Tq4nG0laMcgCWw+vyiXa9WAH06kLf+da3Iaf1HiSR64JWymiEOjGFpuJe3k0a+Ew9nrf
         Nno8s4Mni7KgtkHRQ3m7IEiTnDsTsjBOM6tl/kjdIlN+y+EcbL0dfNL8LqVniLxatwIB
         2Pd6aBD/pY26bBc8GETNI2qf+jbvWarZsaT/ITY5AZe+S2lb0RHleGtUDrgnPC2X8FUE
         hLIpLyAWj03Bx7Ef+t5ZG+1b4tA66FnulA41hya6AzkcNWIk6JoNL7E5pKQyc1hcDoTD
         K6fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794005275; x=1794610075;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Ri9W+3kg88qSbuPThiC4vJC6+m87LpSEjqWT6Vv/x8=;
        b=S27aFkN3dG0URrxKhslAUSzlX6gX1sN2X/CIeTgZOEceV0Dx8z7580sMTIgZ8HxSI4
         c0Il/dWqIAXaTeCb+TU/T2c61lsa3GRSbAt9vbJnKXve7e1NldwU2tU0+k14v5v13X0o
         02rz30eVOdfU6cs4LD/ZG780k2VEvhNVoHNyQ2oCIU/cpFpkTzYusrvTWefak1vMhme3
         WFPsxYCDZ8QFWAKR1SMoyoNCwoMkBLXNaggE5FcgO/1uqCIDqQ8P/K4GsUjgFVz7h/xC
         7GYMtjvOQ1E80SFobVZ2UL/hNwDhfOGQkQGzYLOalyIl1PB/K6V/Nw92L/yoq7L9xwZE
         7j5w==
X-Forwarded-Encrypted: i=1; AL+hErEuXDaGz01DK9Io28yZUQHEFALxMcw6cxJC6oTMeDtNYqlTfIDU1T29YcYALxwhj+y9gzZrR8FcxYI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MAbIgpKXY7bDEp5/P7JeHWr824+dNjURJYo8p4EEpc405SIy4
	pJCqnI6KvIJMDIuv4ATfebaDYU8bIIPYpaUlSGHWxlGAiwezu1xeu8R5N1F+SviLWA==
X-Gm-Gg: AYBFou39Quqgw6puGiDSP6U/fo4lbDlsRjkcUkRJqyBYddwOY8Tdy9wPa8j6jzOuySN
	O+HY9iPgTc7AjEF7kxP5n0lFUthFfgND22XfI1rr/PXTFUXGhD4Pi3UseRd+smbuVKsLvEOQnmx
	gY4mJj42g6l59ZuiyLnJRvLGuXHXMYWNSLoJimAawrpJwSF8KdSiH7io/YrHU/vLRoEDjAOcj5+
	gepCmmolluavichNNxN4VoYoYH75MiK5hdG/6eYSj2wV3JjfmhtUmshXx5zkYI6cNKekd3RjL0n
	ixUAyiTW8zWdzPL7euGRfcPRPI4YUs2FvC9CCU2qU11sswtE+7RR6pjfWbjApBNKy4Qv1MIvSsf
	M9qQUOO+o3ApfKcpHOXmYUUQCr8tgfKizpefD+35b5KryqnOKaUYVLdYgemtYI6OUd8pMIdv9X6
	zG79v395VK+MaWJTOWS00hBoqkD65bN8c0PyYGyw8JzPcLv0gNx7goZkmhukYFlaFP+Yoi2Bybe
	q6Zb0PJAftILUgHxkBX+u9RQxVi60nWVyvUtk7qTIuUM9gYlxlPfcRb0E8SH3Ms4z1P1JPuu4zE
	e62tqmJx3kB763wBX5cHOqNak3uwSTIlIfu1KFK/Vh/gT/bQgpV1xjw7eoA7lqiBXt7X
X-Received: by 2002:a17:90a:e7d1:b0:3b0:ae41:2711 with SMTP id 98e67ed59e1d1-3b0db6f10e8mr3802596a91.24.1794005274516;
        Fri, 06 Nov 2026 14:47:54 -0800 (PST)
Received: from google.com (162.127.105.34.bc.googleusercontent.com. [34.105.127.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b105881ea8sm568838a91.9.2026.11.06.14.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 14:47:54 -0800 (PST)
Date: Fri, 6 Nov 2026 22:47:48 +0000
From: Neill Kapron <nkapron@google.com>
To: Ingo Rohloff <ingo.rohloff@lauterbach.com>
Cc: gregkh@linuxfoundation.org, viro@zeniv.linux.org.uk, me@samcday.com,
	michael.bommarito@gmail.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/3] usb: gadget: f_fs: register cancellation handler
 only after request queueing
Message-ID: <au5ZFAei8LcpYNgY@google.com>
References: <20260901120908.14386-1-ingo.rohloff@lauterbach.com>
 <20260901120908.14386-3-ingo.rohloff@lauterbach.com>
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
In-Reply-To: <20260901120908.14386-3-ingo.rohloff@lauterbach.com>

On Tue, Sep 01, 2026 at 02:09:07PM +0200, Ingo Rohloff wrote:
> Call kiocb_set_cancel_fn() only after usb_ep_queue() completes
> successfully.
> 
> This also undoes commit e78dcb1f7ec2 ("usb: gadget: f_fs: Fix
> Use-After-Free in AIO error path"): The described error is avoided by
> making sure the cancellation handler is only registered, if there is
> something to cancel.

Hi Ingo,

Unfortunately, I don't think this is safe. The cancel handler has to be
set before the request is queued. 

Moving the registration to just before usb_ep_queue() would close the
potential race, but if the queue fails, you still have to unwind- the
kiocb is already on active_reqs, so it has to be removed before io_data
is freed. 

That ends up more complex than what we have today, so I'm going to NAK
this patch.

Thanks,
Neill

