Received: from forward501b.mail.yandex.net (forward501b.mail.yandex.net [178.154.239.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562814772AD
	for <linux-usb@vger.kernel.org>; Fri,  7 Aug 2026 12:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786106192; cv=none; b=ns6UtYXvCIRgoFg2y4Juw4MjD267dTscFB/4ycP62lmascNF2gbHhWcmDLFjSbhPdIwtJczQThI/Puf0ojR/dVDMAbSEIN/yP9aMFPdj8bp1PsnpFAy8cxHO/QNjlNlqtjHMrMLiQKZtdRfGA1bmkWH6DOe3h9njqgxJ88kD7h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786106192; c=relaxed/simple;
	bh=5MZthOesNK0GOH2PWlCO9UHkUARqtYOwx32Ow8mXNy8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n1FmVgvKrH401GbRrxY2A6iFF6mcfUWHDvz0cI4gSoZ+tiOMLs8f/Wpuko+cjHGAss0josACKjHvQD55tzK5Zc3D9FmNYI5rTJRMo1+SIsuDWztAttBHmezBFw/qIw12Z3rpZ7Wxkf6JSWm8dhutjyUayZmPU1TbGTN/cuRs+YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=HLyKpidv; arc=none smtp.client-ip=178.154.239.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="HLyKpidv"
Received: from mail-nwsmtp-smtp-production-main-70.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-70.sas.yp-c.yandex.net [IPv6:2a02:6b8:c11:69d:0:640:32f2:0])
	by forward501b.mail.yandex.net (postfix) with ESMTPS id 94898828A2;
	Fri, 07 Aug 2026 15:36:12 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-70.sas.yp-c.yandex.net (smtp) with ESMTPSA id 9aJUpBLd5W20-R0kMDVnu;
	Fri, 07 Aug 2026 15:36:12 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1786106172; bh=mF5qhTgrflciHRR20bcq1N4L0obZDInU7B9ngD9fIfs=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=HLyKpidvmqjl7AyBl05jKPtFCK9izgpqzKE4hArg4RjcIqBUKAQfw+3bOLlM3FF3z
	 LS0LiwkP2NHIwET5PaeXj/3LEFG9pVnRa3sCAfqTs/3put4b+FPI53uK3H5SZXUo/L
	 PiTXPDgXulCIzPAnsS3LKx7qV9iHQZGuVUXf1Jcs=
Authentication-Results: mail-nwsmtp-smtp-production-main-70.sas.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
Message-ID: <6f6a7bc6-a686-484f-b654-17e0ceb874d8@yandex.ru>
Date: Fri, 7 Aug 2026 15:36:09 +0300
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
 <0c4957c9-8642-449d-b71e-6615babd553f@yandex.ru>
 <20260807120149.GQ235112@black.igk.intel.com>
Content-Language: en-US
From: Dmitry Antipov <dmantipov@yandex.ru>
In-Reply-To: <20260807120149.GQ235112@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/7/26 3:01 PM, Mika Westerberg wrote:

> Okay through driver_override, thanks. It also says:
> 
>    Buses opt into this mechanism by setting the driver_override flag in their
>    struct bus_type.
> 
> But that's not done in struct tb_bus_type.
> 
> So there should be no such attribute available even.

Hm. Syzbot's reproducer definitely uses /sys/bus/pci/devices/0000:00:02.0/driver_override
and /sys/bus/pci/drivers/thunderbolt/bind to make a trick. IIUC the kernel starts to probe
NHI just like any regular PCI device (so driver_override is expected to work), and
tb_bus_type enters the game during the probe itself during nhi_probe() -> nhi_select_cm()
-> tb_probe() -> tb_domain_alloc().

Dmitry

