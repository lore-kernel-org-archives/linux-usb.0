Received: from forward500d.mail.yandex.net (forward500d.mail.yandex.net [178.154.239.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E980943F8DE
	for <linux-usb@vger.kernel.org>; Fri,  7 Aug 2026 11:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786103296; cv=none; b=mrDF/F0CJJ1Yp0vXvaB5GizZw596CEXpD/bFHOsmbB1qDi4fKo46vHT3tlQjTQou6Ty2xMNbJwbBmx4C6nlztHy2kV/IIf+NGRDGAEtnWhdWT4Bfq086NDQzv5Ss2rDwGhhDUHdiIqzHtYSdxRRbDtMswtgEnSy25xh/Czv88dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786103296; c=relaxed/simple;
	bh=NcfvZnPjvpbEesgPzWQI7xteVPqhXavdAok6nmqENDw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BDvUZXIhztM2epybPA0/A9QNo4n6il5V7TwAwuRlRu8P9+ILT6Q5SYqACKHumebegv0vUHA0CD577YzFZAsh+9ZPwHlKUFRP1MlC8bB7X1gJzR9aR5Snmbwa8AZbhlW0VT0aFtxxiuRYWMMzCtKlKdHcAELiebAadzHkOUbio9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=Is1aUrWf; arc=none smtp.client-ip=178.154.239.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="Is1aUrWf"
Received: from mail-nwsmtp-smtp-production-main-77.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-77.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:2007:0:640:5fb2:0])
	by forward500d.mail.yandex.net (postfix) with ESMTPS id CCC2082EA8;
	Fri, 07 Aug 2026 14:47:56 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-77.iva.yp-c.yandex.net (smtp) with ESMTPSA id slIDYbGfCuQ0-Mdsjrg3J;
	Fri, 07 Aug 2026 14:47:56 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1786103276; bh=NcfvZnPjvpbEesgPzWQI7xteVPqhXavdAok6nmqENDw=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=Is1aUrWfKyB6CTDmDGu0ht9K4NRKUWuoUmhmyi8+oc5bL0xNsYLjAZQxCeyWXwmZT
	 r+ZWMCvSIR9m60SeG5P2ZRaTiWbUdcvOhU2b5BGlapEVecEjt+obrZ9NK9Cn2rC2kl
	 5W0D0fpuNkyc5ilCduWawRhx8zPymBSKFJpL3OGo=
Authentication-Results: mail-nwsmtp-smtp-production-main-77.iva.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
Message-ID: <0c4957c9-8642-449d-b71e-6615babd553f@yandex.ru>
Date: Fri, 7 Aug 2026 14:47:54 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thunderbolt: verify PCI resource type and size in
 nhi_probe()
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
 Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat
 <YehezkelShB@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, lvc-project@linuxtesting.org,
 syzbot+901ca72278dfd89daf58@syzkaller.appspotmail.com
References: <20260807083757.318371-1-dmantipov@yandex.ru>
 <20260807095831.GL235112@black.igk.intel.com>
 <7510bf11-7ae3-47dc-b499-5eb5e0aa0192@yandex.ru>
 <20260807113113.GO235112@black.igk.intel.com>
Content-Language: en-US
From: Dmitry Antipov <dmantipov@yandex.ru>
In-Reply-To: <20260807113113.GO235112@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/7/26 2:31 PM, Mika Westerberg wrote:

> I'm actually not sure how this was even triggered

:-) just as documented in https://docs.kernel.org/driver-api/driver-model/binding.html:

Userspace may override the standard matching by writing a driver name to a device’s
driver_override sysfs attribute. When set, only a driver whose name matches the
override will be considered during binding. This bypasses all bus-specific matching
(OF, ACPI, ID tables, etc.).

Dmitry
