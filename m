Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795776530;
	b=yo4CMAEZuNxCfG6WakWHFjmeIZoTUaYlgAqQ9fFk2y5JsKu1GXCNFTbrZuJYL4QgklvF
	 bUgJ8cmYz2ovZOySbZP8Ucewfiwr7IrbdaHHI0WLCty9oLR9PbjYb1m9xtMjWaVUPfKMv
	 gLG9L/a/BbgWgRtOCmEsQih9KVmATIBQSeDcfpEPr92v4vdrcahgq3ZhsimRHzRVwF1Og
	 3NR5SRrSh04OM9Ka0PAH0OK3QghElxk+onQWHnWvNIaaTJBTEvr55tz/hb4GseSEGC/tv
	 WNnbJPsvIJeutwhyGFOg4k8FD1jTyiCfLBIfnaqtfX6Uk42AJXGQu+i29oVoWASylFw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776530;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=bZfwrwWaECV1/tbhLITy17tqF3X7HBMLHo2nwLtYHHM=;
	b=JpLupff+jhU9IEb+wpFJw/eZoA3uvm8Y9/Oan/P3dJQIIlAXe3NpmPAy8va49Xl7l8Ts
	 u2xsknM8wwp+d3uW5fz73gRBadxWq/IEVTfG8uNL52EUDjt28yu2GbzwimsX4fzIWSKAq
	 g6UnuTZBJ2Oz0YOAp4tcQ+Us2fxen/o/FnFiY9KmmZ75yEy5Z8HPQi/MfHWZJybFrTjpS
	 HEAJed1z+ieJKbCXwpgyQhBzLOR7kRlFJm7wKYFi1IVsYNP4ezcefu7mxChww8XbfzVGC
	 aLwZvpxya9CrUqbqLjps8ub4h2+Dzk08+YAgnLPaK2ymLIJAQw+hbpGJDnrWubCu8ZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=fHDGl49p;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D74F606A31F
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 10:48:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D74F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=fHDGl49p
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c511c0e2826so908167366b.0
        for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 02:48:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795776528; cv=none;
        d=google.com; s=arc-20260327;
        b=bG35Az33Xt6nU1uUQNRFRJHGmJ3TU7xGbWqCq7zGzaJaGm8ZmGetX1JIiW9OAnce2v
         OBXfCBy9FwXgNeZEsN8RHVZerDGJ0/flm7Z/+zcM7xmvBgA1Ke870kscsbgKchpoCVCF
         YXcalnR5vFNLEivx16GQhvXq1G4dEQm9dgw3cDnVdYbcFhEx3v+a1RAOwEY8gUYTAIjr
         BT+/NKtxHiiNAnxVvmhUAxuhvlfYXaQDh9dlWiB8pJaGIv1Bwg6dLnqcpPuA0kKwWucN
         KFDFPx4AbZwbhoudYCH2op/IGDfVx8N9FxVa5qZEFw1Y0618Z4hR0Ug2Uf8X3ijyFdwp
         52Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bZfwrwWaECV1/tbhLITy17tqF3X7HBMLHo2nwLtYHHM=;
        fh=qvFjZEd2VDxbf8S5SEI8ZhU8kQlv2g2n0C70fHTbvkA=;
        b=jYVAIiNFn+HU7WpShnGx9OEuAmXyae7x5vvQNxf4nwO8X0R7jcOSxulvnCY4b1Xs52
         uX18SFcr3Bd4NhYP1ziESfgh+QOtPWlYv9DLN4EeoeqnXSD8hOlYOp/rhhf5tBrARlr1
         LdEkS4+cP9qBBgnbm2sV/fBKuNTWkY7pWO3oKw1571pkNHmMtsl2akgqWQxPSNFvJhpX
         kgdac7W5IUQckkXjlH6h6R110JHhyPASwb+tBiZCYHjVVEiwGJc6Nqu36kGZloclqSmH
         opSyIAnXvGx0bfQ1DBfAkPg1vIwUXGABs8lftLrGjxAkxFkJ9OMHdnF+FByNuDgZV75j
         rZNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795776528; x=1796381328; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bZfwrwWaECV1/tbhLITy17tqF3X7HBMLHo2nwLtYHHM=;
        b=fHDGl49pFCwXT27v/JhT4wfwo3Yg5uPybf2U64SBhXJ4e+FWQPC1LXOm4mW+6aKqa2
         RxhtJQE0mZjXzY0I3A942W1l4FPFK1xYx3fxEggdqvy2kvCkunk3ZWMdedxPVHRKflVg
         QXFlDB18ERazN99KYBXSL+DBSMIDDBdq9TGRSDEFBeoBJimAcXfkpbXknFIpRnZ5fs1g
         6Vm0jP3vw15TvQgZP80aQpybJFx91FjQIC1c3opxV/SMnQCRL4Jxo31c9hffaKfl8qDs
         VAkpWm0SFq7rpacr9ZkrxpDHWo3E7TKDgnXBKRD3TzfKclby8Xaye/ysBY3LKf6CAGYe
         6Keg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795776528; x=1796381328;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bZfwrwWaECV1/tbhLITy17tqF3X7HBMLHo2nwLtYHHM=;
        b=IUAja325BB8OolsfSW+PxVpn+XJtxlhlGuwbpnC8VvtiaYdDaCk7Z5jXuNQmiabdmd
         T1AIXSeeJ4XilXuXqrfEz11YCraZy50YWRwSA21QWpu9xtMrGwAzrbJYQTrJb8ut3K2R
         +gNO6e0m/ThRvYItulwoq2W5N6u5GUhXUcjkAY4d7SUugYGJxvFYh6CvB99dyRH+zBEq
         acw60hxvGm4BYEEXcyWJm4ZLLdkTSouWsrUXAdMXM8fI4VL7Rc8oD7iKfAKPRdU2iLVE
         Iw2QnXUnTs/1nVE+s1sFgIenJa3fUtb8d+bLTw5ZcaNMS8A7/hYgGbg7VsG4u8Mp2LK3
         A+3w==
X-Forwarded-Encrypted: i=1; AL+hErER/j/GU7j5nP7S8qZT/q/wi/hlNyKJ1xUi4LeL+iz+KrEYuTF8cMEEq8eIrZXEAiNf9tXFIuWfMus=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pU3hw2Jm/083QL2Dh6OP9tjoA8JE8w2meQ39W6thO0XuJW3/6
	GIxdtBmEicPxW8d0X2xeVBZy4TEyVuS9Bdulqyfx/w9gCHxW9pU3r/SNodlBLe5ZNvPqq06r9Dy
	SdPDXDVKMXV4YYzV1xMBXhOvcXK9tV+EsbPzdQQXhPg==
X-Gm-Gg: AZFdTZcXof3gSQmKbMYYViznUZXC3ryBBNkaa62mZjUXA0w8ww1VatmsUDANv3FuHF9
	ByWTC7uJhhNa4jvjbLtAGGUaiF2IBlJAyDJ/CG9BW0/vDWDXCBQC+r/QOhCVRU9WMqjstfkZFwq
	pVJOK5NavaYmVAZqxqQKCSR+9N/MaGWFDz0mHCIrd2Tf4Rjoj+UEns/YFBGUD0oQAvH+6yPVpSg
	zJkIwvywseZRs2Jii8yeEncKNCLPvWUb8CnluJJ2pMHaZ1SceMP7SAn9YFPJZLh/hOYbZH03foY
	MjSk+RHRiygJ4NtE7tcyDL59boB1BPLaWvytkuK7m8gsItkVI9KOAkKG2yJ6p9HkC+AfHqfBBrr
	DtcYcPMoq9Ms0OHtNmjJOyqBm0Jh/xzKAJBuh+2ZuJLWrtT6+q7iriTVgKZk+JZOfILAw
X-Received: by 2002:a17:907:6ea8:b0:c51:3bde:bfd0 with SMTP id
 a640c23a62f3a-c513bdec070mr1973240666b.47.1795776528545; Fri, 27 Nov 2026
 02:48:48 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-fusb302-drain-rxfifo-v1-1-bd9b232ab345@flipper.net> <avT9KERG1udN-TzR@venus>
In-Reply-To: <avT9KERG1udN-TzR@venus>
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 27 Nov 2026 14:48:40 +0400
X-Gm-Features: Aa3M54or9yeVEE-woI741UW0EzKnppjO5sHk_pBlY-YQQJfczYq3thTEXFYcoIg
Message-ID: <CAKTNdwEuROjn1LxnAHW-_pS=ERVF4iRUxwa3P+R25+kdNTCSag@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: fusb302: Drain the RX FIFO on each PD interrupt
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sebastian,

On Thu, Nov 12, 2026 at 3:41=E2=80=AFAM Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> Hi,
>
> On Mon, Nov 02, 2026 at 04:37:59PM +0400, Alexey Charkov wrote:
> > The driver reads one message from the RX FIFO per GCRCSENT or TX_SUCCES=
S
> > interrupt, assuming every queued message raises one. The chip, however,
> > queues some messages without acknowledging them or raising any interrup=
t,
> > e.g. it decodes only the low four bits of the message type and mistakes
> > Get_Source_Cap_Extended (17) for a GoodCRC (1). From then on every read
> > returns the message queued before the one that raised the interrupt, so
> > replies answer the wrong message and a Soft_Reset is never seen. The
> > partner escalates to a Hard Reset, which an Apple Studio Display repeat=
s
> > every 1.5s.
> >
> > Furthermore, two different messages received in quick succession may be
> > queued without raising separate interrupts, causing all subsequent PD
> > communications to be permanently out of sync, which usually also leads =
to
> > a hard reset eventually.
> >
> > Read messages until the FIFO reports empty, so that each one is handled
> > on the event it arrived with, whatever the chip left unannounced before=
 it.
> >
> > Signed-off-by: Alexey Charkov <alchark@flipper.net>
> > ---
>
> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Thank you for your review! I had to rework this patch because I ran
into another issue which sometimes corrupts a properly acknowledged
partner message upon enabling PD, so its new incarnation now builds on
top of that fix. Please consider this one superceded by [1] - it would
be great if you could have a look at that, too.

[1] http://patch.msgid.link/20261127-fusb302-getsourcecap-v2-2-6770eb1e7945=
@flipper.net

Best regards,
Alexey
