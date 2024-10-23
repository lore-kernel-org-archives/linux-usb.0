Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F6411C2BD;
	Wed, 23 Oct 2024 03:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729654403; cv=none; b=UbNGZNpCea4E7mqF82cOKEIq82GP0IbdcSm379ZaYcm4IYrf+dGw2W6NPs5YWGIbOKXLnTLVRY6Udgw1Jujfauo3sWmnxpaUvqiTs+IuknWyFkGbs+JWr36dzDSgRAUdh/3v/36jQwhBLHTGLbSfCns0ZhjojwD6F7ayUih79wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729654403; c=relaxed/simple;
	bh=ax5WuJGW+cS3AECm5BWPXmB/kRcCeFs4WLnhzfCojUw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=GY18mCWZUtBnbZT7ZSYUwA2cK3VXI/nyy2Xw967fwyNvhfjO9s6vQ2pDjeDcJEqThqkRufnIkXNKOhgu4cMtupUEB4nuFsXiMS2P3IwcMOgIBLKGnMG6C6OEPCQDmEKm6Pd/J0DJQPMJw4jrczIOaR/pup9tDnQFQI6Dyxf5goY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=mv/h6/I5 reason="signature verification failed"; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="mv/h6/I5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=R8/FM5CUel34QihVodbZrukE3iglR25OtBlPu+BDADY=; b=m
	v/h6/I5jY2HiKKoXBQ2661LwJrL4QmM6GyZ3lUzZfgH3MGd6uFIl4oHJy2Rmgsae
	QSnge/ZapIJS7W1R3bFpIq6YbJrEiPNlSeEO1+o5DsdrvMsKG8JSKWoaAvSdrqlC
	tosHayMCLa75OHWOUz4x+IUwdMVpW1VA5H1BbC0c4U=
Received: from huanglei814$163.com ( [111.48.58.10] ) by
 ajax-webmail-wmsvr-40-122 (Coremail) ; Wed, 23 Oct 2024 11:32:27 +0800
 (CST)
Date: Wed, 23 Oct 2024 11:32:27 +0800 (CST)
From: huanglei  <huanglei814@163.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: gregkh@linuxfoundation.org, mathias.nyman@intel.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	huanglei <huanglei@kylinos.cn>
Subject: Re:Re: [PATCH v3] usb: core: adds support for PM control of
 specific USB dev skip suspend.
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2024 www.mailtech.cn 163com
In-Reply-To: <3691558b-55d2-43f1-ac77-5f15843f2f80@kernel.org>
References: <20241022090905.9806-1-huanglei814@163.com>
 <3691558b-55d2-43f1-ac77-5f15843f2f80@kernel.org>
X-NTES-SC: AL_Qu2ZC/qeu0sv4SKdZekfm0cTguY+X8W4uv0h2IVSPJ5+jDHpxzIJU25SH0rv/Me0FgyImgmGczJE29VGf6NUYb4LulGxA2HEZ4oY9NrTLlc+/w==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <78620d2f.3fa2.192b76ed5f6.Coremail.huanglei814@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:eigvCgDnr0NLbhhnMNAUAA--.35582W
X-CM-SenderInfo: xkxd0wxohlmiqu6rljoofrz/1tbixwWB9mcYVqlGtAACsF
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CiAgWWVzLCB0byBiZSBwcmVjaXNlLCBpdCdzIGEgaGFyZHdhcmUgZmVhdHVyZSwgbm90IGFuIE9T
L2RyaXZlciBwb2xpY3kuCgpBdCAyMDI0LTEwLTIyIDIwOjE0OjQ5LCAiS3J6eXN6dG9mIEtvemxv
d3NraSIgPGtyemtAa2VybmVsLm9yZz4gd3JvdGU6Cj5PbiAyMi8xMC8yMDI0IDExOjA5LCBodWFu
Z2xlaTgxNCB3cm90ZToKPj4gKyNpZmRlZiBDT05GSUdfVVNCX1NLSVBfU1VTUEVORAo+PiArCQlp
ZiAoZGV2aWNlX3Byb3BlcnR5X3JlYWRfYm9vbCh0bXBkZXYsICJ1c2Itc2tpcC1zdXNwZW5kIikp
IHsKPgo+WW91IGFyZSBhZGRpbmcgdGhpcyBmb3IgRFRTLCBzbyB5b3UgbmVlZCBiaW5kaW5ncyBh
bmQgZGVzY3JpYmUgaGFyZHdhcmUKPmNoYXJhY3RlcmlzdGljLCBub3QgT1MvZHJpdmVyIHBvbGlj
eS4KPgo+QmVzdCByZWdhcmRzLAo+S3J6eXN6dG9mCg==
