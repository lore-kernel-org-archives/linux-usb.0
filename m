Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794061083;
	b=wDveLkxV+GaHF8RJ+7TreZ4DfK3chao56jWfkmeD+juuivdvSmiunF+0PGTqYS54GzC2
	 ijDcWpF9O6BuGw3JQOminzqoRX3HE5IT+zmlKtQyQXHtSDo4YoAPFzO90FhO7XOUJlCVu
	 AXMWCMotG0Bzc/t2TT4c2qZ2B60OlIM/JeMl42V99dU+1aVmFun57PdqfSr+aeAYnt27+
	 9RYgiDSecC/UeWwz6wLt2PRRusjet7vxhaMPG8uCTlFLoHrB0hdPpEVH6BjyeyYuxJEsw
	 kznZPiI82ECakoT1/LD5Mh1Ql6Et0stWn8Aln6jELmqarN+RnfZ2yErLqSVvG1r6tGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794061083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ZIuiohscteJo2hp38Rebuh7m/8NNcOKtecBPcT79lyA=;
	b=BR+cDriX0J3URWEB2VLARPgBI8d7sH9jSXpEc9T4Dj+jUNBghJGgrPnsXaQ7VrzfhXqy
	 YF0uEKu2nD5bDm9oTtBen/DXPIft6jZMM4t12yqpwjiCy+0iMLJIAfrEyoW7xHyGkIsWf
	 CjSygRYpnwtPxSGaTtO5ca1Ka04RRbcPq9OIToqIKzQSYJ00LDnnezQQ1yymmNBTSpwN+
	 g7j1GF3+NBHzuwHckanXUX2Z3LrGk9kS7UKUyKqCXouClgzQBpn8hjxPp4mtKlpi0T6EY
	 yBYrhvg/gyZOFiE3Gb+f1NsW3VlFWH9WZIdYYIjRweNr6n9SuN3ev8z5wBmbed1WNYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vRKJMeNk;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AAF6083613
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 14:18:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8AAF6083613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vRKJMeNk
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-33fb4680717so3152844eec.1
        for <linux-usb@vger.kernel.org>; Sat, 07 Nov 2026 06:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794061082; x=1794665882; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZIuiohscteJo2hp38Rebuh7m/8NNcOKtecBPcT79lyA=;
        b=vRKJMeNkeYTvBGviD6I87j8Oy+rPbFlUb52I64IClyQsWkjEB5fZLuDzsYvW7iObbR
         GYEenh1eZQOwcd9e+Km0yBbUYS8upsjVAp/uHrp9DzQUCUxe0/RJ6sLbHtyr54ETYsod
         X+7wTcR/GQ82jkhUSdXSXa3QNoPk3Gtisy9D6RT+xuvqrvK6vaWLijZb1Y2stUIwTzVX
         ZcuTVjJq4d5I6yThJNvdyhAL+cMJV6UMRr4Xzftp6lyPsbsj+BMhOvTF2/SgZ6Y17gE4
         iuIv0ziNNHOdsxjhLbmerNIoYMOQOKfG7ySNHHC0hZXZh8sGDm1apSsuXi048t2ZqDNi
         rElw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794061082; x=1794665882;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZIuiohscteJo2hp38Rebuh7m/8NNcOKtecBPcT79lyA=;
        b=flNlU1VCXzF/J3hkcVZ4X68CbbhDjnvfaOyPDt1u/QQU12Xw4NYGKQUhaMOGyw38G2
         neZA3YmD6Jo4J2bybhPcZkUcLi+b5/AbTv/mhqCynuEHzRCQnI0q+yhte63L0tgQ9DmM
         xcSYsVBFOvkP8Ad/zBuEgcbwY2Y2RO17sEfPivbElsBj6hcz4G5aoIBkoT3SMs02w9cl
         SYXkAqeUsQytE5HLQbEQDtd1j6cP5IJgkFvBVX6/zKmOabnJdee7X0YTy6qH5MsakqMB
         gzs+EHz9HctsHhrHM3BdiSihfPmj7I5dZ9kc/I3SHVrosozfLMBNuG3gUrRoasYVr80/
         acaQ==
X-Forwarded-Encrypted: i=1; AL+hErFSXy1XeWd33/B2pYTL7ngXk7s6nlsbVuaSh67OK9O05EuFt8jmuea1tCkgNrCPlfdKCXks3LOqUDQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ftKVKjOrDHd+YnFf65smFZczfACfr4tcxp7kWC41jw2lxH2Rm
	hKgZitJMsIbl3FdQA7wJQkm+68K9lNxMX1x2aGrwJBz/ofNF4PJ5NPT7
X-Gm-Gg: AYBFou34CUiGGfhqL+fVtkluJllfvKdDTCXw1Z+O9sbv8h8SiQ3JRq3rjfXj0qyK5de
	tl2YyYOX3a55OjzA6JagSF2qmTaeUGI8dPW/w9TWIlRX90/KIVIW0sGqKLdufpkMaa2qXZARd7S
	csKqiRB3Aw+pOdUFGjSwcpWf2/C2UJJNF0+4gKUdeZwpt3uR11Eig1iwcBXecdMVxHbgOo3EXq3
	dUPfaK3b7lqDfC9ReN/fTy1e/j1UocdflwAs0cV9Q79WFA+O9A3OhjlsUyhx7cZoB4DzcPAy5QL
	OP5VJFaYGQIe9k3M/u2K1efmrlXh0lz2gPtIrP51XCLkhaP0ttZMGOhwzyZfFivJGOP1zXtHVTh
	FHoIgwNHUywnlKQTGQtcjnKdEoZXAIhV6XCrnPpxYJiJS84V/MzIYLzedqmuxCEdaItLUlIw+62
	81TMvNq4GrXVU5RMOGWdQ8qThXZYm2JGnDsviWGwZmG7wzvxCohUJZWdfywyWQF1QlSsyGrILtr
	L2y/yp+01cignMd/jM8aSaLdAegsTdORhIRddRpjGopquit5EFwEhw56y+1gq53ZwKQmvtkIBKs
	F5fx6kz+/Wm5yRQ7ZJXZ6DaXmjSGfa/D0vYUKUvPF31iAqilkv2N3Bjnmvk=
X-Received: by 2002:a05:693c:87c7:10b0:36f:26a7:968e with SMTP id 5a478bee46e88-36f770062cfmr7560876eec.40.1794061081678;
        Sat, 07 Nov 2026 06:18:01 -0800 (PST)
Received: from TheRealOne ([2409:40e1:407:758:265f:d54e:2491:df90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9ed126csm16251949eec.18.2026.11.07.06.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 06:18:00 -0800 (PST)
Date: Sat, 7 Nov 2026 19:47:51 +0530
From: Chandradhar Kumar <chandradhar.2003@gmail.com>
To: Alex Elder <elder@ieee.org>
Cc: syzbot <syzbot+693652ded53d3eb9cb91@syzkaller.appspotmail.com>, 
	elder@kernel.org, gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org, 
	johan@kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [greybus?] [usb?] KASAN: slab-out-of-bounds Read in
 gb_svc_request_handler
Message-ID: <au8s1_tIBa0mpTSL@TheRealOne>
References: <6aec63fd.5f5735a5.290c1c.0002.GAE@google.com>
 <46a139a9-198c-45c1-b41c-521def10a0df@ieee.org>
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
In-Reply-To: <46a139a9-198c-45c1-b41c-521def10a0df@ieee.org>

On Thu, Nov 05, 2026 at 08:08:01AM -0600, Alex Elder wrote:
> Here is what I see happening at the beginning of gb_connection_recv():
> - If the connection is disabled or offloaded, return immediately
> - If the size of the buffer (passed in as the "size" argument) is less
>   than the size of an operation message header, return
> - If the 16-bit size embedded in the message header is less than the
>   size of the buffer, return
> 
> In other words, after these checks, we know:
> 
>   sizeof(header) <= buffer size (size)       AND
>   buffer size (size) <= size encoded in the header (msg_size)
No, it does not verify this, it verify:
	size encoded in the header <= size (buffer size)
> 
> Therefore (transitive property), this is true:
> 
>   sizeof(header) <= size encoded in the header (msg_size)
So, the transitive property is not true.

I have sent a patch for this bug which verify the msg_size and header
separately, which fixes the out of bounds read.
patch link: https://lore.kernel.org/all/20261106094303.55158-1-chandradhar.2003@gmail.com/

Hey please review the patch if there is something wrong or there are any
other way to fix the bug.

Thanks.
> 
> And it's not possible after these checks for this to be true:
> 
>     header.size < sizeof(struct gb_operation_msg_hdr)
> 
> or put another way:
> 
>     msg_size < sizeof(header)        cannot hold
> 
> 
> It surprises me this would be missed in the AI summary--and I
> fear I'm mistaken.  If I'm missing something or wrong about this,
> please feel free to say so.
> 
> 					-Alex
