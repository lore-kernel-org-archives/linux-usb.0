Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=176.119.200.161
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795093716;
	b=wZ0uY59GblsAOzuPRNZJdcg3gvvJy4LaOQRd4SkYNNw8dKgkakTNCFtobp/j9P+XqgC5
	 xWdGRgseLvvbLFGmR8nJCITOaTLn38lpY96FahwRxLugTkR5W9thgRmLJvngk9vShB1F6
	 YXW/83/614qzzRYQhebxKMNphB7NKdzmpaxh65IKNKJgdoQIWjr4bzws5zHIswbthnQtH
	 6uDf1r/EHXYVSd/4P4JdZgAMt8XflHbXNGQIZZxPGyVkuroMM+XErB9yWDEsR3AkioAE6
	 e6URjqb2Og7GXHDlqQ6p6hVS63bi0pJlLQTsWU7VOK+D16TBHDiENLHGw7Ci77x8rHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795093716;
	h=DMARC-Filter:DKIM-Signature:Date:Subject:In-Reply-To:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:From:To:Cc:Message-ID:
	 References:X-SimpleLogin-Type:X-SimpleLogin-EmailLog-ID:
	 X-SimpleLogin-Want-Signing;
	bh=rrzaULI4PDERzS41dVrWshFRT4j/Xv56UkNZCvPJTbw=;
	b=DJezdhCSCNl+pOcUm7GJpcwby3ohxdzHJvGcHVjes/ZEi3TDWaYTxQD00bNpyJkpXjRA
	 46RjjLW3VKnnNBZENlGhwXEOOUNjlqu2LLTVPd89hTKvfOFH/1Wi04UblBsh2qUZ9jqIg
	 Lhx8T3UKYCJzb8fq1awQvLEhkn1apWemn3FFHKlVXJdJYhmBcMFSnp5dVOvRchTYBTUoz
	 pXsQSu4zV0ZqZ8HJO5AXaP+VazZnZGz4ALl9Fo50rjuZWReD2tm39xs3EY2uiKMK0i1Ld
	 TvHpmVuNmL3/3fe+Q70XKhH38EAJ1hju3iqTpVNET7n2GLIjXdcmfWOM2BdXeBAPjPA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yasunobu.dev;
	spf=pass smtp.mailfrom=yasunobu.dev;
	dkim=pass header.d=yasunobu.dev header.i=@yasunobu.dev header.a=rsa-sha256 header.s=dkim header.b=vONyspo+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=176.119.200.161
Received: from mail-200161.simplelogin.co (mail-200161.simplelogin.co [176.119.200.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB5C606A320
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 13:08:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAB5C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=yasunobu.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yasunobu.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=yasunobu.dev header.i=@yasunobu.dev header.a=rsa-sha256 header.s=dkim header.b=vONyspo+
ARC-Seal: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626; t=1795093708;
	cv=none; b=ST4VGM/Bo5p0sdXpx86k0y5zcVpSwai3CEfFnuTd4rBT5LYIqkhOFpUWvS2wH/+d/qkvyHQ5ueYQgE6kbIHWRtn22N0kGELFbumUIykLRsw6/Jfho+0xrn1ZjP//JdkgQ2LlL2szvIWZAVr170cFGqn87kn1wqJbviSKWB0bijBYYGbH4vsoP1GKVJ8yETbGUdafH0zo81CQlqtmJrWI0DeZaVCBXpaMX6u8uMlRazaWz6FfH/rpPaBL46shID9+6HeYmXWwIC2PX6jZcymFHUay8l28+E6te4NCDD3nulSUPNgD7ZdVYKKx+SRvVClzzYi5rUAvJ0qfR60PfEQNTw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626;
	t=1795093708; c=relaxed/simple;
	bh=rrzaULI4PDERzS41dVrWshFRT4j/Xv56UkNZCvPJTbw=;
	h=Date:Subject:In-Reply-To:From:To:Cc:References; b=U31HBwfOw6qJGONqK1qk8zXpxBsBr2yTolRxQJBkRZ5y82/qa4fMas+jD0ZHh8B67vq+bM879OOEYDpqoUCaMYtNSvy8gm5FkFn++X7GqVRSO5pCBdDeCHlsYnZyshzr7WWu6opUOJaQAgIA07GedrZF3etbxZSqkKjceWosRqkebjJP8uM2qcSXsHcrcDdURMDov0Qt74P6/4wPTvO11P2mNm4UPCPn4/XKimntMQ/GNGuUIRJ4455a/QxCLHJknxUABwl03PzzHqZYwYlevQNznUKhF0HyBjfei+Yze0AfxRIz6aO2Y2Mk2J6EgJPDYKJTVHt+kJAU916+cuUmoQ==
ARC-Authentication-Results: i=1; mail.protonmail.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yasunobu.dev;
	s=dkim; t=1795093708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rrzaULI4PDERzS41dVrWshFRT4j/Xv56UkNZCvPJTbw=;
	b=vONyspo+eRK5RN6STgTDjGR4T0cap7wVrYhlHt5bRKH27Uo/2tQ0j8uk8PMMTppbdVpEu3
	+ap8RMg2xPV3IoHc6OPmVMmyDPYLe8goCavPyA0h6AsPfQBpZK+UEEGK6IF4auX7WEVo6W
	YUm/bhPTSPugOc3WvQXSuF4GqGRu7+w=
Date: Thu, 19 Nov 2026 13:08:20 +0000
Subject: Re: [PATCH] media: uvcvideo: Batch StreamCam unlinks on ASUS ASM2142
In-Reply-To: <20261119124331.GR1923307@killaraus.ideasonboard.com>
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
Content-Transfer-Encoding: quoted-printable
From: hi@yasunobu.dev
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>,Michal Pecio
 <michal.pecio@gmail.com>,linux-media@vger.kernel.org,Hans de Goede
 <hansg@kernel.org>,Mauro Carvalho Chehab <mchehab@kernel.org>,Mathias Nyman
 <mathias.nyman@intel.com>,linux-usb@vger.kernel.org
Message-ID: <179509370754.7.5011876058707374029.1785696182@yasunobu.dev>
References: <20261119-streamcam-batched-unlink-v1-1-076bc02866c1@yasunobu.dev>
 <CANiDSCsdaokL_2u_74b3ADT+U8TXskK53+k+hVA8D+PtttYEZQ@mail.gmail.com>
 <20261119124331.GR1923307@killaraus.ideasonboard.com>
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 1785696206
X-SimpleLogin-Want-Signing: yes

On Thu, Nov 19, 2026, Laurent Pinchart wrote:
> On Thu, Nov 19, 2026 at 01:06:50PM +0100, Ricardo Ribalda wrote:
> > Could you check if your device works fine on 7.3, or if it still crashe=
s?

Thanks for the quick replies.
I tested 7.3.5 on the same USB-C port, and the xHCI hang did not recur.

> This looks like something that should be fixed at the USB level, unless
> proven impossible.

I agree the fix belongs at the USB level, so I'll drop the patch.

I appreciate your help with my first Linux kernel contribution.
I hope to contribute again.

Yasunobu

