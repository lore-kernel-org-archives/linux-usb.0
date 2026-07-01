Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F099C492505
	for <linux-usb@vger.kernel.org>; Wed,  1 Jul 2026 16:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782921760; cv=none; b=QJxyqTPON9txH0az7b6ageTKDJNLZVccLcLhmSw1kZa+Ju3G0/rC0rGfR6a0ZjPcfHt8f58NDzQEGIzRvCu/8FSup5EbhAPleslaMxZpJnvF4796CoO6ejrgDuzg2q449FbpiHL5UYydEX5lcf6zBtl7FS2tjRdRIivpx/YgQXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782921760; c=relaxed/simple;
	bh=CiNbtjImx2YAeBBAvZ8SJkNSD4s7bEMKuNONDB1DE00=;
	h=Message-ID:Date:MIME-Version:From:To:Cc:Subject:Content-Type; b=cZ1cCMVpiVJXKlDdKemL3obzU04bSAVYh3jWNRWOyTM4reVMP/L/ZJpMNuTWeY/83m9pOjzRIVAVL4Q36qLlGUMJ/DFSHFNhdbkd87CFf/UPp6kNSRLm0JkaAZOOl5FVoCOCkO+wFHghdPQIuGZLcMl/4zT3FQjKTkvs5WQ9PYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=nzDlg6wE; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="nzDlg6wE"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gr4Xh3tWzz8v0t;
	Wed, 01 Jul 2026 18:02:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782921748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=3FDy9fu4V+nWzdGLTIfkJnRbcwyCfMP2EnqYq57AbDE=;
	b=nzDlg6wECHylcVG4i4vWC8fKe6h2Rrbyjz3C1rFYYPBd1DnxYTBHrSE19w9lsyjWofNdJy
	WrYI6cvd1K01rXFGslZducNlo/x5AIoW815mBvZiklQrvjimRHLcE7v0KXk+bmpNAlwrHh
	tAJ8qFzbKbB2Cn+k4RiPBMRFlQkjMKrPvGbn3H0srxR3HNE6EbjS6V8ZHqpygwiQqjFMWw
	QKqIm+6u+yBwZbXcWe78OHCVrRvl59NmalRTSnsipqRPNu58cbM6WSFx8BDGAI9ZF0gZI3
	40RYvaEesur28urihwDdQaRwXO/yM/37OG4lG6tO1hfUe6d8+r/AK31GAMwbVQ==
Message-ID: <cb287e3d-3066-4820-b464-6208b947974b@mailbox.org>
Date: Wed, 1 Jul 2026 18:02:26 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: de-CH-frami, en-CA
To: Michal Pecio <michal.pecio@gmail.com>,
 Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Autocrypt: addr=michel@daenzer.net; keydata=
 xsDiBDsehS8RBACbsIQEX31aYSIuEKxEnEX82ezMR8z3LG8ktv1KjyNErUX9Pt7AUC7W3W0b
 LUhu8Le8S2va6hi7GfSAifl0ih3k6Bv1Itzgnd+7ZmSrvCN8yGJaHNQfAevAuEboIb+MaVHo
 9EMJj4ikOcRZCmQWw7evu/D9uQdtkCnRY9iJiAGxbwCguBHtpoGMxDOINCr5UU6qt+m4O+UD
 /355ohBBzzyh49lTj0kTFKr0Ozd20G2FbcqHgfFL1dc1MPyigej2gLga2osu2QY0ObvAGkOu
 WBi3LTY8Zs8uqFGDC4ZAwMPoFy3yzu3ne6T7d/68rJil0QcdQjzzHi6ekqHuhst4a+/+D23h
 Za8MJBEcdOhRhsaDVGAJSFEQB1qLBACOs0xN+XblejO35gsDSVVk8s+FUUw3TSWJBfZa3Imp
 V2U2tBO4qck+wqbHNfdnU/crrsHahjzBjvk8Up7VoY8oT+z03sal2vXEonS279xN2B92Tttr
 AgwosujguFO/7tvzymWC76rDEwue8TsADE11ErjwaBTs8ZXfnN/uAANgPM0jTWljaGVsIERh
 ZW56ZXIgPG1pY2hlbEBkYWVuemVyLm5ldD7CXgQTEQIAHgUCQFXxJgIbAwYLCQgHAwIDFQID
 AxYCAQIeAQIXgAAKCRBaga+OatuyAIrPAJ9ykonXI3oQcX83N2qzCEStLNW47gCeLWm/QiPY
 jqtGUnnSbyuTQfIySkLOwE0EOx6FRRAEAJZkcvklPwJCgNiw37p0GShKmFGGqf/a3xZZEpjI
 qNxzshFRFneZze4f5LhzbX1/vIm5+ZXsEWympJfZzyCmYPw86QcFxyZflkAxHx9LeD+89Elx
 bw6wT0CcLvSv8ROfU1m8YhGbV6g2zWyLD0/naQGVb8e4FhVKGNY2EEbHgFBrAAMGA/0VktFO
 CxFBdzLQ17RCTwCJ3xpyP4qsLJH0yCoA26rH2zE2RzByhrTFTYZzbFEid3ddGiHOBEL+bO+2
 GNtfiYKmbTkj1tMZJ8L6huKONaVrASFzLvZa2dlc2zja9ZSksKmge5BOTKWgbyepEc5qxSju
 YsYrX5xfLgTZC5abhhztpcJGBBgRAgAGBQI7HoVFAAoJEFqBr45q27IAlscAnjICalDn2zB1
 fXqoOkGsTwElvKa5AJ9FhyKJpysFRcejfdZwrwl9xb4oOg==
Subject: 7.1 regression bisected to "usb: core: Fix SuperSpeed root hub
 wMaxPacketSize"
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: c99e54f3a29705dc001
X-MBO-RS-META: upigbiwfmfj7y9yag99acadtr3ooud4u


The ethernet port of a Lenovo ThinkPad USB-C Dock Gen2 connected to a ThinkPad P14s Gen 5 AMD stopped working in 7.1.

 ip addr show enx482ae347e7c3

says the interface doesn't exist. The only thing about it in dmesg is:

 r8152 8-1.1:1.0 enx482ae347e7c3: renamed from eth0

In previous kernels, dmesg had more lines about it:

 r8152 8-1.1:1.0 enx482ae347e7c3: renamed from eth0
 r8152 8-1.1:1.0 enx482ae347e7c3: carrier on
 r8152 8-1.1:1.0 enx482ae347e7c3: carrier off
 r8152 8-1.1:1.0 enx482ae347e7c3: carrier on


I bisected this to d1e280334b7f ("usb: core: Fix SuperSpeed root hub wMaxPacketSize"). Reverting that commit on top of 7.1.2 fixes the issue.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast

