Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=71.18.227.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793630466;
	b=FIuVr2vTiu7frYzX+IXJxjtrTI5QjoYWACLmAPsQJTcEF4RmQOQvkt4euGXgUpcD+EHr
	 uhqmjf79YGrwSh5Rmqppw8jvQ/Af1Oh9hBHZYBRRYBLeADVxAzIVH/5gWvJur4KwqifWa
	 D7YbYs+5iSqfEVyL9dbuy711ezfxTGmTeYXhl6yDQCNj4FxUr3PZtp7hCxl3pTJsNHJ54
	 WHV6o5teiTbmdxQ+q8pSAae6a4C0stqgr8Cdjyi2rkIXVQEtoqUPzFas4OhLEYaLX8D06
	 zfoGHq+eCy63MzaNW+MKb+r/llQOaSnNa8ItVTAepcRFHkoyOshnj2L02METxwMnvJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793630466;
	h=DMARC-Filter:DKIM-Signature:X-Original-From:To:References:Received:
	 X-Lms-Return-Path:From:Subject:Mime-Version:Content-Type:Cc:Date:
	 Message-Id:In-Reply-To:Content-Disposition:Content-Transfer-Encoding;
	bh=hBYpVLk0Gj2yhc6ZR1gYRn6W0WDnpenBHlPBQXVZPZo=;
	b=ubUligVoR8lIFFvJ3OVfZLCFcCGmYGtjDNLhbeo0WlGgbVZwrbmKJf3jUz//l+HTex9s
	 y+Wac12/YG6HJefL1I2Xo1/McIQ/sqYljECfF+X8bnyyd8ZO16Hs2DYf35lLHwyUVPgYm
	 i46c8VIGzCkeMGIV4StcG1StjWH0N8eTC7sdXk1aqZpsLNhzD47EM/Ksvjb3H6ieEsN5O
	 5VZ+GcSw77oScnRat3v1bPUEPBclEbqV8J48+8I92wnegmmUtYLSowMsnXai8de3Bq1Wd
	 a+p1AyjOYhnA3EvEUaXvnSKkTUcx9b4trhVw7naOuVOxFMt0MSzDlWAfa1QxEXPeMDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cherr.cc;
	spf=pass smtp.mailfrom=cherr.cc;
	dkim=pass header.d=cherr.cc header.i=@cherr.cc header.a=rsa-sha256 header.s=feishu2604220257 header.b=GJzEnvy8;
	arc=none smtp.remote-ip=71.18.227.4
Received: from sg-2-4.ptr.blmpb.com (sg-2-4.ptr.blmpb.com [71.18.227.4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F99C606F3D2
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 14:41:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F99C606F3D2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cherr.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherr.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cherr.cc header.i=@cherr.cc header.a=rsa-sha256 header.s=feishu2604220257 header.b=GJzEnvy8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604220257; d=cherr.cc; t=1793630453; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=hBYpVLk0Gj2yhc6ZR1gYRn6W0WDnpenBHlPBQXVZPZo=;
 b=GJzEnvy84RRKaN5aDA1cjZq/FP2gALazbs9k16zIXACzHliF7DQkbBZiBa4iNFO9K/Q0//
 pFhZKLcJnxX7vRJeJWD3VLrSJATnmwuIZ1uW+v1Mzh4AeJpjPRmHJ1ojPJsT7EDpcfiJ3X
 werdSyZZ/ETplnqcAT1v/yCTYSF5CzL6FKTl0C87VTifXgf6efEhqPq4jfLnBOHshVYnfX
 JHeB7odxBBJhK9dbKnKUlFKLy2AUicjTwToAhB65LZTRQhcmVA5Icyyea4ZoL0Y0Xvb09c
 EXFKyWEMbzzB1d9mpfpcsXKUoB5jsRl+ve7RP3FSzSUuvBal0P7Zzt1s+yxFXg==
X-Original-From: Shengzhuo Wei <me@cherr.cc>
To: =?utf-8?q?Tomasz_Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
References: <20261029-b4-pidff-rescale-exponent-v1-1-3ba54accf767@cherr.cc> <bbd1ec87a9fff50b189f74cbd21e1d5bddf41136.camel@gmail.com>
Received: from kernel ([111.40.58.226]) by smtp.feishu.cn with ESMTPS; Mon, 02 Nov 2026 22:40:51 +0800
X-Lms-Return-Path: <lba+26ae8a0f3+bb3eb8+vger.kernel.org+me@cherr.cc>
From: "Shengzhuo Wei" <me@cherr.cc>
Subject: Re: [PATCH] HID: pidff: bound the unit exponent rescaling loop
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: "Shengzhuo Wei" <me@cherr.cc>, "Oleg Makarenko" <oleg@makarenk.ooo>, 
	"Jiri Kosina" <jikos@kernel.org>, 
	"Benjamin Tissoires" <bentiss@kernel.org>, 
	=?utf-8?q?Micha=C5=82_Kope=C4=87?= <michal@nozomi.space>, 
	"Paul Dino Jones" <paul@spacefreak18.xyz>, <linux-input@vger.kernel.org>, 
	<linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<stable@vger.kernel.org>
Date: Mon, 2 Nov 2026 22:40:48 +0800
Message-Id: <auig8ARnvkEoAagA@kernel>
In-Reply-To: <bbd1ec87a9fff50b189f74cbd21e1d5bddf41136.camel@gmail.com>
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

Hi Tomasz,

Thanks for testing and reviewing the patch.

> Should we maybe add a warning to the driver that the time exponent might
> be out of a sane range? Sane range being, say, 10 to 0? This of course
> would have to happen during init stage not to spam dmesg.

For the initialization-time warning, would -8 to 0 be a reasonable
exponent range?

- -8 is the lowest exponent in the commonly used signed 4-bit HID
  encoding.
- 0 allows a time unit of one second.
- Positive exponents 1 through 7 would give time units of ten seconds
  or more, which seem unusually coarse for force-feedback effects.

This would only be a warning threshold: the driver would still accept
the device and leave the rescaling behavior unchanged.

Does that match what you had in mind, or would you prefer a different
range?

Thanks,
Shengzhuo
