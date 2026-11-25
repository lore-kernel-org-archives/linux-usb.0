Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630271;
	b=0NAmBX0jc+rOCWlze3FjELVwA9SS0G88z7gJu7M+PZN56mGNMdNIMNlN5Vz0Hu1YlKaX
	 1SqocMJYji71IdvCRRXmQPeXP9O0ta8f85NSNO+Vq/OTA3nD8Ieu9tonItPZu9e2rraup
	 IZaa5aZsKlXA3a9J5YZlnuOUCaoWaFsgXReLgKjIacMCbBnTN5ndQaUjkifcnLWbr78wT
	 xghNM+4h1kiabBq9/f1YKqYmR4/kAg61l0KjI2Zm3/lgVksRtjgE/5KO+Loe80KnETZ6h
	 prOybD678Ny0XjBox2TFXtKp6wHWD8TSBa41LLnkH9zG4xQiIBQNwHFuwwOlJAzrf8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630271;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=bV56WuCqdxs/d/79ZdlE9Y5jpjOdMcPVYy0fTABj0Lw=;
	b=tkv1fvko3mdlSA9ojCycQ7AUN4XQXFEZ8Z3vFe89e9/bg5zSVJdFR+8SyKLluunHTdUa
	 vBQ93GAvKcpoDjsOzIfyma6MMoujewv0E03oWk8W8ARc0Wvxcm5HrjkY5hifZoC6xqYZX
	 BdFzFVEZtMvQKF9vwm2wzw/iphFcqcHnxucNw7zdCfbR0ZOzy6up1K2EOD7xT+B3HZvIA
	 wstcnnFYCAsPvrS+3sjUCDcZj3SifQxMJK90qp6/ks1yXoulnN4D0mX27nPYNA9CPxgcx
	 sblWEJLL/AMFd9i/ebX/C/zIRWiQspWyU90UiFt/E68bVxv/R2LLbNvPpSaoUEPoc3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JB+6cSqt;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E250A606A33A
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 18:11:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E250A606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JB+6cSqt
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-38692f62b22so7212985eec.0
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 10:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795630269; x=1796235069; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bV56WuCqdxs/d/79ZdlE9Y5jpjOdMcPVYy0fTABj0Lw=;
        b=JB+6cSqtrJ7NdNPYm7dhd/ymdEhEFOHZN/J+sqsuPD8YXcPI9tNxImftGOMcZNQ+fX
         WUyqqgy92aSEnJUgwypqoz/3CWO0Q2GgHVvxHo/6DEs8V6tLZP3ViTH37dPiq8c/NnyD
         Yssb5DzKLO6w0558NReh5/L9tx4QhcIxkNdzr479zllmz6SndcOX68skn2uT2fMBHCd9
         AoA5+o9OeIIXZR9slOE2EelhG6qgZ7wq+xfuGTuZ+C9vtyFbDoUHvBFOkbToeERhWC55
         oHXIHYv9DMGdCTW1D7ppLKSA9PpX8WGjL3ZKVIFcopNLlBtRVBoFdaz1d7D6KT+LoCPG
         kxAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795630269; x=1796235069;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bV56WuCqdxs/d/79ZdlE9Y5jpjOdMcPVYy0fTABj0Lw=;
        b=B7Qiyc9QU6TVMd4nu88y1up62UkWNsilXfxvNHyzZP3v6uvCVlOAdfrHS+C/zFAzuS
         HBCBZdX9QpsLbmuHPmIqJtysWYtngOSVLZqTTjxTx3V6jCFad/jBX07Ps6LkounNg5+M
         Vz58mHzOi7GomWdywyA/HbuDYp2wDn4/IoviFB7T6bx1D/CI8uu4dphlgmGCN5oBDoFg
         VU0tPzdK1j9nec+mQju3O7Q+vtPWrF8JJ0BV3Md49efIO4vZBRzpLGQAozEsa+Hxe3w4
         SS2wqgQV85rPA9Inj7/dMsudzxs1L3PcY7AT+jQ6zVacPya3hq6tvLjOFxoT31QMXj3F
         FNSQ==
X-Forwarded-Encrypted: i=1; AL+hErHLTGPDj2tRUW8zNR7SlZ/Z90MPWE1hP7OB8LTpp1YNqyMiHbq8LZ+Gfl0kP59+JllQ9YDcMHrc0JQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tum7P9iNtdqwIFd15uDYKZ9t2JVUcUHaBBKEri08hFaB6Ubru
	U5WFhqUmppAXkPX6xjnKGoKB+XWk4S9BvDoTL8x7kikpPaLlJ0BN3nT4
X-Gm-Gg: AZFdTZeeSFYt7gBtf8t9XthvuvJRuUahFsWRsVsblH/0BKg2vivDVo1NWJAqbLXJrbU
	iNrVSfJERm23Q3BQQTAn85/0nMJcMSu7yf4O38wB9y4wqneolCYxs9HEmJ5u1AGPoR1jvdHFv/K
	JiQZ+1c/NXVd6CzwBltYr8PzCDLlBz4vME1IOO3DpzoPHqFVKeIzmPS3PoeNF8OAtRhAfOItvJe
	t3wxd5JmEMuZ2UmSW9W0K+S9BnxfX7EsJycSyLgAOdQLLsKE64h20XimYOKxroGpkQKZYCJFyS1
	dtjs7IMMpIxhNezrdFF/RPX6GlQzYWlSDtOjbN5IV76qK2+i1Uu54MWKAcnReZ2spyD2P063ihG
	vqoAkKt6qvzmBW29QZZc/RR17ddMEcB4HGmvJT2rHwveMgRzUxvIAlAGo66vtxNZP0IgurtEx3R
	FyPdut6KS7dpfd8QRK2wP+5tuV/Gp5QKw2l8Dq5+FCSsXP4JbAOG3luCC8s22+09lTvG3FjeG4Z
	D8WW005gFTEksDrdBUHovLPZE6xL64gs2Xr0N8/BtEIwsK3rkrPo5wTZGTIjbP+zbiqOWeQ6fGO
	HxDFteBzdUK5TUoj/cYtCiLoxUfKlnex2vkASg==
X-Received: by 2002:a05:693c:20ce:20b0:37a:a9db:6bd2 with SMTP id 5a478bee46e88-3856e63b064mr20473117eec.11.1795630268730;
        Wed, 25 Nov 2026 10:11:08 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([2001:e60:8549:f8b6:d936:b4fc:15f9:5ee6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm66440899eec.10.2026.11.25.10.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:11:07 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Xu Yang <xu.yang_2@oss.nxp.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: gregkh@linuxfoundation.org,
	aiyengar1990@gmail.com,
	mathias.nyman@intel.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: dwc3: tell xHCI that it lost its state when the core is powered off
Date: Thu, 26 Nov 2026 03:11:03 +0900
Message-ID: <20261125181103.830-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <rtgfuz44sjpiomzhamrkvteqygkk6jdzrvxh4nfcpabiae6bsy@cbtvblfx5uao>
References: <20261112141512.1840-1-26rote@gmail.com> <awZHwRiICsPs-UyI@vbox> <rtgfuz44sjpiomzhamrkvteqygkk6jdzrvxh4nfcpabiae6bsy@cbtvblfx5uao>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, Nov 25, 2026 at 12:44:05PM +0800, Xu Yang wrote:
> On Wed, Nov 25, 2026 at 02:37:38AM +0000, Thinh Nguyen wrote:
> > Can we also Cc stable?

Yes. I'll send a v3 with Cc: stable, limited to 6.15.x and later since
xhci-plat got power_lost in 6.15, and with the Acked-by and Tested-by
tags.

> > Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>

Thank you, Thinh.

> > This may conflict with your "usb: dwc3: wait for the port to leave
> > RxDetect before xHCI reset" patch. Can you check if rebasing on this
> > patch work for you?
>
> OK, I can rework a new patch based on this one later.
> Maybe I should wait for it to land first?

Either order is fine with me.

Thanks,
Joonhoe
