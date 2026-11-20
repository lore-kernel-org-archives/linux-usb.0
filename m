Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170425;
	b=nZLtmqPNUOUEITQqZrZvlxRZHG+z7uhtxj3BxYgJ6U4wulBaQ2xAKJTqPOWmCwWu3HUL
	 BukAj28hpSWcU0LhSlW8zIr+NDv92iltL7X6Hw60BvwbKkzmrYIlo5EcVFQ8uM3NYDNGU
	 ro/X5s8zsU4uzey/8A0oh9zekx6xsuXrqJTsWnqaePZGHAO/5Furnk4CYiFmkW7MbsO3X
	 wcGSoM1rXSEcSbN7Du+86G9q94h7tiDzw2eF6K9/k7bWqxTTg8YfwpR2C/Y1YmFls9AGn
	 gpkhdecAzJKNzpcWrrZ2WG4zjOP6Pu8Xw/GQzLUU0uhc6rPF1VhjA9BmZBwWvRpJ7wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170425;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=sqtvpGfRA5LrlR7FglzvD5iPxlTRXGw7iSiBMQnMByw=;
	b=CPpZYTji1LoWgrzCbpP040whJL6yyWUnB43TagMC603bLAwWpqICTfI1dHJU3sS63T5b
	 Vnbhi2bnjNwkOXDGM7jMddAEpZASsQGmrw969gV5ZWSyhg5OoHum+rclRH5RdSjO8Bhah
	 9trGHSN/9MZFOg6H7tvVE66OeQEUQNMLL2EQK3uqFnVOGt35KfZMcFxD234ilgS8QXzE2
	 8sjmg5nm3sRIcNx9TLBGekDONIkq91HKlQDk1TtV4HK0g6xapW4yz3mcRa6OLSe4Lpgg5
	 mcr4/Y3+0N9hSDXmZEaJfK3iQU1PMUEpypjfzhN30DmeV1VCVlLmXtQe1nKHzTqVEPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kroah.com;
	spf=pass smtp.mailfrom=kroah.com;
	dkim=pass header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm3 header.b=ZkPJJklP;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=AwFEZEZ2;
	arc=none smtp.remote-ip=202.12.124.156
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DFE606A331
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 10:27:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2DFE606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm3 header.b=ZkPJJklP;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=AwFEZEZ2
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 720147A039C
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 05:27:04 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Fri, 20 Nov 2026 05:27:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1795170423; x=1795256823; bh=sqtvpGfRA5
	LrlR7FglzvD5iPxlTRXGw7iSiBMQnMByw=; b=ZkPJJklPphaoemP8OHUXLCd+Zw
	UEHwHOB3YQuNvcxe7b+xyKuOTHc1xvOk26vBwIDPGUZRDH6G6CEa3EZMPZ2BUUHi
	F5HZd/Oz0HDkNKb+h9N0jVesrJBt4b6Jrn4nKZXwIUkNte/D5rKRnRUzMc/S2kOl
	y73TZisPlMOjmI9Vt6NGBvpNbxe7wFg7V5x80ZHGToyePh0w5xLK3DA/b5SHfd+N
	5Bgd55TEsIgcfr4czPe8pT39PkWDTRypxvscsidjfY+AstcS3JTvisTb4dGiSWb1
	Y0GGnmfXA6BDkPqaGqIF9bRbEJlo7uOGVCmLmDYIIMK4GR4uoTq8w/K/F5KA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1795170423; x=1795256823; bh=sqtvpGfRA5LrlR7FglzvD5iPxlTRXGw7iSi
	BMQnMByw=; b=AwFEZEZ2LzLMm7PSFoU+fZFe+yWWW6hPiuVmNIPDP5bP4BxZkXQ
	An6T2ZoweBG+yGIMhaQ7r08tUyRmyqacfQl40bFA5zP8Vz+isk2YkaG+pkPI381a
	wWyinqMMaiIOwWmoek5M2vE8sUpnJKn+IhZRfUOlZpJhHXNSmOZMjjmTk2AtfaCA
	tBozIS90t9Uq/2SCrAh6zA8ZUBBsqR/sLDezLZF+z3F7ItDyV1VXQyR5KpdwfIf1
	lROpstTC8pPfzaraatBlU4roszp/RmaXyEzpDMop3DSxlKvwYpTD4JBy5GeA+2Fc
	dtSai45czd6t1i4ohk1RxQbMzLFdB665nhQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=kroah.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795170423; d=kroah.com;
	mf=PGdyZWdAa3JvYWguY29tPg==;
	rt=PGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:Ym+MbwhHFWtg6JDg3ouUm+3Ibn29cI6ssD0z2N/yMap7hjz
	pQKEi5ShwSzUTimYtzx/GPyzUzPAUqaIt6Db4BMLRMDLK/DkDIMBhN+UwxMnRt4r
	G85TzChbGK54NBV1wpZEu+3hQkCiZLGoqGbhR+7pKewv06/O3Mvwk/QNe2Wn/pwI
	UxNeXTo6DBbu/6U8f83Ev3qdlOut0o6zsmxbpAETsumWtkix7pfuM4OlT1KSRZ1W
	jkwbkuNh0XlwNrgpzEQAxiMgvCGVlyoN7LBiKeng13zamQwYGCgdHekpqvFmtZWu
	+eyD5+m6VvvVBJG2bPskAriBUanj3WrPQ/aRYmw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:BebwPQmHYVEegXjc6hjMYvUNtjWewRwBzJu8gWTOpko=:5yHZwQOF2d4XcethyBIPk1L6TpLA/kYqKZ9KunJ07iI=;
X-ME-Sender: <xms:dyAAa6xeWuaAWGFD1JiIXCpPfHjEjX0IaX5PODum9JT4DYTcQfKFXw>
    <xme:dyAAa4jb5rLeyll8XFksCTpB-FGFIeH-o97DF49Dp9Tkyb37C8EshR23k0X-R0cU4
    ykL9Or_jDlep9SPzctu27xBz2NHCLXAoTEUN7bCw5StVr2-qsk>
X-ME-Received: <xmr:dyAAa-mEK9ISi-4AalReRx1jtqE7CSeCIyz2lbk6BhCJ8H2TBQnIsUr7p0JN8ydJT2GDfqIuVn3z4U0JTJsb0z6sM5gGJNtjuYFKmzTZAVc>
X-ME-Proxy-Cause: dmFkZTGyUuU3Ufzythcaao9OzcyT8m5XBwO/0kVQLdA/GepU7ksrYgrE0xlPHc7MHjLVI2
    82xnpAJgLU4ucyk6yJZ7+AIXKnhBolgfQfZ9heLwg7hnKu0rSk0SNJkGFoc8TGmCoa5QtC
    R8Y6h5Av73LH/uxNQ+RdLmp7i1H/nQpRnYfs8afy+VXBbWNdRUyccaCPoHcdi/SEaAUVlw
    /vWB8Xs8QHCwf2IioW1FWF0DYa0ltQ2TRxZ8jb3kiFbei1ZtgiqtnagjMMyIGiZrGlXbQP
    XhjF/Q6KEu2k0AFq53SA0TM1nW8H64YD4q0E/iC4RQz3ersMrxhtC5AYGozVknN41NAGF/
    DrEAS/+3IAxBzZEOBg22LqOBLKDLSu0ehRKhQLPGKsogY3fcLrDwozNYjyxw7TwmxRu6Si
    lSb+0Ir7prcA39/i7SqMcRjqbbzqt1MJyiumLoRMUvTEeVOHR89EBZDV6rWF+mmHy/YZTf
    sCGd+SolN6mrlUSWW0oHtkF1nc2SY694NcycOUFhEH+28nWa0l4rzrQjQ0MERBmRoRgx/T
    2kfqkQhGs5QBrwKRA5ktHCkvf9tnY/PklGSVTH/FpWVjV91xYCh0i35E7UQu6dhKDJdh0/
    Q4iUAaVw+lWck5nFoidLp6n9QGXHBj6d0Mtx/cz3M+jIfGuuSy0fYgrxl38Q
X-ME-Proxy: <xmx:dyAAa2hbbLkXrQbXvOhW5iK9Nev8aAHqZYEDACbTXgxXYPh1JLtU9g>
    <xmx:dyAAa60v1wjMTqm-mHZbwgi_1gVa8I7a8MtX-nR2dgIPmgCb9-uGpw>
    <xmx:dyAAa3IaPmQBQ77SQD7nUboFkec--XDcYod_tccrnU0kNgB93o9lvw>
    <xmx:dyAAaywKJitlNFLDXC5lYPtt_1mXNN3uEikdghD8oC2K5RlnJQ4lsw>
    <xmx:dyAAayybZ44Xbdev3vqSqBdPzJTjul3UlfwOcpwIRMA2WtsHBgGIpfYa>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Nov 2026 05:27:02 -0500 (EST)
Date: Fri, 20 Nov 2026 11:27:00 +0100
From: Greg KH <greg@kroah.com>
To: Chengyu Liu <lui2012qwq@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/4] usb: musb: cancel irq_work after masking interrupts
 in musb_remove()
Message-ID: <2026112046-trash-blot-dd55@gregkh>
References: <20261112160448.41566-1-lui2012qwq@gmail.com>
 <20261112160448.41566-2-lui2012qwq@gmail.com>
 <sashiko-outbox-211493@kernel.org>
 <CAE=Q7=4PdubbUYnNwcVHg1kbChe5ukOxD_uj8ee3+J7sW5OhUg@mail.gmail.com>
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
In-Reply-To: <CAE=Q7=4PdubbUYnNwcVHg1kbChe5ukOxD_uj8ee3+J7sW5OhUg@mail.gmail.com>

On Fri, Nov 13, 2026 at 12:33:48AM +0800, Chengyu Liu wrote:
> Thanks, f730f205cc51 is the right one. I'll carry the corrected Fixes
> tag if the series needs a respin.
> 

Yes please fix.

Also properly quote your emails, there is no context here at all.

greg k-h
