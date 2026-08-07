Received: from forward501b.mail.yandex.net (forward501b.mail.yandex.net [178.154.239.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FCF42049B
	for <linux-usb@vger.kernel.org>; Fri,  7 Aug 2026 11:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786101201; cv=none; b=aAYzDgYGgzbIU5suEbOqUoeAuuZvjKSNoXKvdf5zy7Aj7WSLb3IPjX5Q3mLubd87JxfVrltS5P99SxhfI9vuoaX5kcT8AJw2hz+T+oC+rlEmtahMClIKdkxJCyNh+IMhcBI52yXtm+4BypxFC2h5udLWiNJE8SHoMBwtTdY3YpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786101201; c=relaxed/simple;
	bh=cL3HCRqEqhoHnqaa5p8SVztI+2hdt6kr7zcSMjuQ/Ds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EeQcSYhahIPCF2QCswGvXPKgyFnwvW+p2Fh15qcVNcNjvFe5Ku73qshvoVtTFyaw83f4eDvI0AlUChriRdpOByA+d8qyPFmAFEiVlzGNwbyEJ7aiOyFM311+8CRfNKYkKf8Ks3jTUi9jv71XY+Dn8DkV9CbLT+io/6Z0UVGp9AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=kGBt8w+j; arc=none smtp.client-ip=178.154.239.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="kGBt8w+j"
Received: from mail-nwsmtp-smtp-production-main-63.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-63.sas.yp-c.yandex.net [IPv6:2a02:6b8:c23:4403:0:640:bf85:0])
	by forward501b.mail.yandex.net (postfix) with ESMTPS id 871988267C;
	Fri, 07 Aug 2026 14:13:09 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-63.sas.yp-c.yandex.net (smtp) with ESMTPSA id 6DIuYbKfK8c0-gw3wElwL;
	Fri, 07 Aug 2026 14:13:08 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1786101188; bh=cL3HCRqEqhoHnqaa5p8SVztI+2hdt6kr7zcSMjuQ/Ds=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=kGBt8w+jcrL5DgeoAkNIQ67FswQpQ/9pPMrVx1BLSclL1wiTV3B2O1ueujEiVghb1
	 JvZEGdARE9j3iTxTDdgAh51GGQl4mgYoo93FEV0b9ZN4+jzVJaofTmTa5ai23Z276K
	 PREhMoFUQyrQBGaQ35uVk2HWCkkLGh75B9GsY6aA=
Authentication-Results: mail-nwsmtp-smtp-production-main-63.sas.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
Message-ID: <7510bf11-7ae3-47dc-b499-5eb5e0aa0192@yandex.ru>
Date: Fri, 7 Aug 2026 14:13:06 +0300
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
Content-Language: en-US
From: Dmitry Antipov <dmantipov@yandex.ru>
In-Reply-To: <20260807095831.GL235112@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/7/26 12:58 PM, Mika Westerberg wrote:

> Yeah, I'm not entirely sure we want to start "fixing" issues like these
> where it's clearly not a USB4/TB NHI. IMHO If user forces the driver
> somehow to bind to this unrelated device then she/he got what asked for.

I agree but isn't there a scenario to trigger such a weird probe just by mistake?

Dmitry
