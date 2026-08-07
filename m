Received: from forward500d.mail.yandex.net (forward500d.mail.yandex.net [178.154.239.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57E3442399
	for <linux-usb@vger.kernel.org>; Fri,  7 Aug 2026 13:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786109241; cv=none; b=pHHxFJltgRxUHgrfo5l3ErrRIvDIbeXwCB3haBkD08fL8puBe0kU3soJM4TkXbEH3wI7lNY3mffXL84+zb3faIOL09AP5Al9TwaYy6BAS09lYCCktI1Tak1LPllvsLHvvZPZLeEgP/t4cLlSQ4xhlsCjjirAhywf1ZF/Z9LGdBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786109241; c=relaxed/simple;
	bh=3BgR6ltVD5wFHwNQdYWtUdg4vVQPaPEGxN8PO7VtXuc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MKJDi3CLtlot5u34e5uTpj/bbFIlitPRRPaK+ADokrpSl+cOtuCJBNslKvQzonR4iTIyS07iu0dLHPI6d2NrrmPzEidhAKNDohbZTKziLmoPFywp/kqoZXiOZ31CIEXo8yNaitw6+IYqfysgGZLnylTK+Upy1TnmgeiVMFArH5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=oYkkRxQw; arc=none smtp.client-ip=178.154.239.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="oYkkRxQw"
Received: from mail-nwsmtp-smtp-production-main-52.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-52.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:ea2:0:640:ef77:0])
	by forward500d.mail.yandex.net (postfix) with ESMTPS id B9B7C82B14;
	Fri, 07 Aug 2026 16:27:11 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-52.klg.yp-c.yandex.net (smtp) with ESMTPSA id 9RKlA1Og50U0-J2p3xACM;
	Fri, 07 Aug 2026 16:27:11 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1786109231; bh=3BgR6ltVD5wFHwNQdYWtUdg4vVQPaPEGxN8PO7VtXuc=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=oYkkRxQwkqrQfAyAQ/0H2buo0HDVSOvm/y/fNwYdCyVBdwj76LbEmsSHdL6flFsaL
	 SL4VvQcc7B1MpYB4joyvztLwoX4aZDgMz9B7azvtOjpZnkSvvEcAur/V+OTYtm5lEH
	 KGCArL9b4Z0mSd9qq6l6aB3D/t2mHIFJzmYJh+5s=
Authentication-Results: mail-nwsmtp-smtp-production-main-52.klg.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
Message-ID: <c6baa5a3-b466-46ad-a83b-f642ee85f04b@yandex.ru>
Date: Fri, 7 Aug 2026 16:27:09 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thunderbolt: verify PCI resource type and size in
 nhi_probe()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andreas Noever <andreas.noever@gmail.com>,
 Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat
 <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
 lvc-project@linuxtesting.org,
 syzbot+901ca72278dfd89daf58@syzkaller.appspotmail.com
References: <20260807083757.318371-1-dmantipov@yandex.ru>
 <20260807095831.GL235112@black.igk.intel.com>
 <7510bf11-7ae3-47dc-b499-5eb5e0aa0192@yandex.ru>
 <20260807113113.GO235112@black.igk.intel.com>
 <0c4957c9-8642-449d-b71e-6615babd553f@yandex.ru>
 <2026080747-doing-humongous-c14b@gregkh>
Content-Language: en-US
From: Dmitry Antipov <dmantipov@yandex.ru>
In-Reply-To: <2026080747-doing-humongous-c14b@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/7/26 4:11 PM, Greg Kroah-Hartman wrote:

> This is a debugging-only feature

AFAIK QEMU's vfio-pci uses this to bypass PCI devices to guests.

Dmitry

