Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5750347AF5F
	for <linux-usb@vger.kernel.org>; Mon, 14 Sep 2026 15:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789400052; cv=none; b=jOaIaxWgK+ud3/tniTzBEttP/6LvbzjbEzy6TE8hF3GU4fiRz3yYmuxUXAJm5XCgT4ADp07FlNAQ9vRhh9H/vTHcZIZL63lpkVEW6ynMmUXz8t9fpmU3DKg2BwZaDiVQts+PxZYsXlfd+GVjmR00PI3z2gC1YCHtKTs1iYTu52w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789400052; c=relaxed/simple;
	bh=73+u3x/n1YfpiE8SSLEI/w9n2zZJ9GrkZIhTNXSFHP0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XA++nVcFrHX5VUPq8vmi39knyZOCxudk3mdtsgHWDxdtkb71khN8tyr8j82papmegwP3tabI8aTUFAn9j1xxLN6JBdQTuGc/Vv57BudzjcBPfAZvvKQ7McYLxPvroeSk77Pq+0T7u9shjNJlc0Y+HGJH0rIGjnCwqvKnFtBkx2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aJZIQ5VY; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJZIQ5VY"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485933b2522so1839170f8f.0
        for <linux-usb@vger.kernel.org>; Mon, 14 Sep 2026 08:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789400048; x=1790004848; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7+kCrOYTrT0PBR6fmrHzTjMR9TWO6j/pXIvsh9ilVI8=;
        b=aJZIQ5VY7WRzyyDd/vZTwCJqg3wVhoFLLhU69s2CYBQtkchAJaehOE9JB0HLSiJeLD
         J2UHv/x5hsW/Rik8IMLuu4ePHxKyWFHAduCO3W68AnD3fWMF2ZWm8gfiWJyV7hnbhlHe
         SDeGWQNl4ZJMTcrtaVOYo9kWrbOaDN9x1/sifGQQ5fQpdLeQdAU0aySOuMuzeHZ1UogS
         xGFhAFZpDKTnUxKb9QgMxUfLXdP1qe5j6U7t02UlQGvavBAalNORDwlIwttYo3pBjVy2
         dcpobYqIRSs+aT6HJJkhM3oDWcigPNN/p0yxqrVavxqz81Hwl6DxbEaQUf0wHcorlaJs
         hUug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789400048; x=1790004848;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7+kCrOYTrT0PBR6fmrHzTjMR9TWO6j/pXIvsh9ilVI8=;
        b=rXoyHdCSORGRtAo4d8NmviYGxIlnh4wA5Y5+DjHzs9IfgKjo5mD/ihgLDXbde9+/kG
         p/Goaqsx7DVbcmQ6nrNcPKsQ9IDpNJFXdVwMIRx2AZqlnGC4BmfP+818aT+YRmT9e8aG
         nqNXJS1VCDqWs8RyxWohEklWb/qDTG3RGl+9xev50pr5Z/PUqsPb6n7dAfXNYnnJ3A5b
         rmLmRrnwpDT1sqkY0+MmMhI6qL5Ws6ECS+NYPYF9wHV8RMj13ExJ1lww4+OosLXsHI6N
         xms/xihid+YPh48pl1w0S16uuYaT90ZuvP0IJeztyjzpPpAnCHlpMaNJNHtoRA6mDYXy
         d5tg==
X-Forwarded-Encrypted: i=1; AKwUvBy4UK7IxDnIzlFsLHBjRtwdggjthSprS5Wymz8w9Jn/DY283kvn5DGupzdDukbyRejtAvplldwpHzk=@vger.kernel.org
X-Gm-Message-State: AFuF++mIICBwWciFjpm6nUTiYY3jfKSNA4ImSUAH9FtdmgckOktRdHR5
	aRrSmb4lvbFd8nHmABSQXYiVoqhewS1coqu38T/r7V1l5wWHni6QLYbV
X-Gm-Gg: AYBFou3U4Du1Ejw36RS5M8FNVPoZSjSf6mXF1/EW8SBN2n8S5syE3JTel1JI2MTJL/5
	h92UHAFMju1KsxmGfvyb9iGXAe+vb15M1cuj+41HNnMlrY+1/sbjVtb/DrXbmAL30LZc7DkFOS5
	0FSEEuWqCtVBUlFZI1+rOtIgbazF+tywh5MTBbaRsK2oH2YvW2PeD5UL8UcB/vhMlUIG4J2zjaK
	TED2t3LrofEXkMy8a1uDZHZr0dqcHEPiZC53wxDahZ28QK8RwqITtEVPOQ7wX+a2x0PErWpwEXd
	W3gh9udMp5kHnWcajwRgFMcC9c7NnM/tYdTJ2GN7r4g9ey28apyFPoHgp/mO4VGoQjBn0lnaAbc
	UZSiOcrQot1PKC4Oa1H+lnVfkGLnO2Hgp7YAvPv9x4hw4GKK/OJyqGzUmfQ6+cNFMGeMsd79HUk
	B0IHkkMoF2ibjhmVDYPiAMOCwUc9/+9Nam/b3fb5mh18HnPkgAcn5qeUn5lkONFMxS+nuzYQITc
	HLKxc6dMebT3zO6gWgQPQ==
X-Received: by 2002:a05:6000:2685:b0:485:ac96:7251 with SMTP id ffacd0b85a97d-48702b1d3f6mr9417456f8f.21.1789400048017;
        Mon, 14 Sep 2026 08:34:08 -0700 (PDT)
Received: from foxbook (bfh234.neoplus.adsl.tpnet.pl. [83.28.45.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e8d1sm28140259f8f.11.2026.09.14.08.34.06
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 14 Sep 2026 08:34:07 -0700 (PDT)
Date: Mon, 14 Sep 2026 17:34:03 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: =?UTF-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>, Selvarasu Ganesan
 <selvarasu.g@samsung.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "quic_wcheng@quicinc.com"
 <quic_wcheng@quicinc.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "cpgs@samsung.com" <cpgs@samsung.com>, "alim.akhtar@samsung.com"
 <alim.akhtar@samsung.com>, "thiagu.r@samsung.com" <thiagu.r@samsung.com>,
 Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: Re: [PATCH] xhci: sideband: check vdev liveness before removing
 endpoints on unregister
Message-ID: <20260914173403.05d1bca1.michal.pecio@gmail.com>
In-Reply-To: <9d326c6e-f033-495c-a5e1-dacb46ea7b73@linux.intel.com>
References: <TYUPR06MB6217000B59003EDF233D7246D2B22@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<CGME20260910101324epcas5p1faf6f82de85c9468f42f6f9b2f13e99b@epcas5p1.samsung.com>
	<c17e0351-d390-4a40-89c4-51d4be9f0123@linux.intel.com>
	<360067785.01789039502721.JavaMail.epsvc@epcpadp1new>
	<TYUPR06MB62172308C897F81F7DAFF557D2BF2@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<750468423.101789103583573.JavaMail.epsvc@epcpadp2new>
	<TYUPR06MB6217F0788C14DD89D237C807D2BE2@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<937773018.41789116303608.JavaMail.epsvc@epcpadp1new>
	<191ee5d5-d93d-4fa3-9654-b3735d344118@linux.intel.com>
	<20260912141837.06b2f3cf.michal.pecio@gmail.com>
	<TYUPR06MB62174110FB101AD6B7B069EBD2BB2@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<20260914110949.38a46596.michal.pecio@gmail.com>
	<TYUPR06MB62170DB4AB23F7A79E8DA466D2BB2@TYUPR06MB6217.apcprd06.prod.outlook.com>
	<c6c9890f-46d8-42f1-a7e7-8a5d551fa22c@linux.intel.com>
	<9d326c6e-f033-495c-a5e1-dacb46ea7b73@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 14 Sep 2026 17:06:35 +0300, Mathias Nyman wrote:
> > Selvarasu Ganesan pointed out that xhci 'core' in fact doesn't
> > include xhci-sideband.h yet. If possible I'd like to keep it that
> > way.
> > 
> > Setting xhci->sideband->vdev to NULL, or calling a callback here
> > changes this and is the first time we then intertwine xhci core
> > with sideband. 
> 
> Disregard the above, I forgot about the
> xhci_sideband_notify_ep_ring_free() call in
> xhci_discover_or_reset_device().

You aren't entirely wrong, xhci_sideband_notify_ep_ring_free() isn't
useful to sideband clients so it could be declared in "xhci.h" instead
of <xhci-sideband.h>. Then xhci.c won't need the public API header.

This function is also exported unnecessarily. Another unused export is
xhci_stop_endpoint_sync(), because sideband hasn't become new module.

Regards,
Michal
