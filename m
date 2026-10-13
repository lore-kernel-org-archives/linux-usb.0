Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF36B472F75
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 09:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885600; cv=none; b=NCcA4AzxpYevL94TErqvZJw+9M1oP+IGiezoQeG4BRexQGp8LHnDlcXXBHplAeLAxlGYhDvTc9NkAfzwTMY+QE2O3nRYRg5ppMFqkbYQhscT4OXOxDLakRtSBD6j7clJ5c2wMO2/xE7dbVNU4vEbI2v4iEPXCCrCSqtmFcGzykI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885600; c=relaxed/simple;
	bh=qW6lM5IKkUw1NxhIQ2IPyVFTfvL5Fu/okL4TTVeTLE4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=jVcY2H0QpZHKSzoj48eW8KxpURmGWjSRY8T7BmBWsDn8YECI+uxC3oBRTH3PUZynqbilDLrrWi+AtQAikOu8bhNf2SWy+z4NOWuChFoo02IBuupyi2P8Mt+CBE1dQ2VEGxJeylfKGXn2HbFmfWQ2c8lcjVttncUW5wlXBv+farY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F9/6xYdU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F9/6xYdU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D1D11F000FF;
	Tue, 13 Oct 2026 09:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791885598;
	bh=tIK4MpegQHuX+fpnrc13BFGQ9/9DcJrc7sKxUxOYNu4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F9/6xYdUsdbDatV/MQLIdVpfqWz55T9VTebjcI94qMSrgEp1iTAjU8rHcY/F2H/TG
	 qmyXlvOTWEY6S880tyBaQJa4YqHPxGdBgAXmBxaSWzeUAj4FIxrKWN2akKLi8oKtXa
	 m0wbiZekThiMzI5qh4yrua9AvLlhkXEcN0S6VdhXiLwCRkGlbzlA5rNx/UAAJMqISH
	 Jjd2XJ6fQA7LNEmJCHKrIckTfMDYCDZQ7L1KZj5iK4KL7lXBMhSaRT2+9E3womPtgs
	 SU/ZmwhycdBYKnGS9v4h17jff0btHG+aqTbt4JUeTis72xSZqU7jqMg6Innmxfh1DG
	 Hjw1M8DXFKhLQ==
Message-ID: <sashiko-outbox-169423@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 5/6] net: usb: pegasus: Move long delayed
 work on system_dfl_long_wq
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marco Crivellari" <marco.crivellari@suse.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261012095452.135828-6-marco.crivellari@suse.com>
References: <20261012095452.135828-1-marco.crivellari@suse.com>
 <20261012095452.135828-6-marco.crivellari@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 09:59:58 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] usbnet: pegasus: missing locking around multi-step MII USB control=
 messages
--

commit b4ecccdd796761b12d0bedd35e1c982cb24bc36a
Author: Marco Crivellari <marco.crivellari@suse.com>

net: usb: pegasus: Move long delayed work on system_dfl_long_wq

This patch shifts the delayed work for carrier checks from the per-CPU
system_long_wq to the unbound system_dfl_long_wq. This allows the scheduler
to optimize task placement for long running tasks.

Cc: Petko Manolov <petkan@nucleusys.com>
Cc: linux-usb@vger.kernel.org
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

> diff --git a/drivers/net/usb/pegasus.c b/drivers/net/usb/pegasus.c
> index aba1a640fc268..ed3f8d555c2a0 100644
> --- a/drivers/net/usb/pegasus.c
> +++ b/drivers/net/usb/pegasus.c
> @@ -1118,8 +1118,9 @@ static void check_carrier(struct work_struct *work)
>  	pegasus_t *pegasus =3D container_of(work, pegasus_t, carrier_check.work=
);
>  	set_carrier(pegasus->net);
>  	if (!(pegasus->flags & PEGASUS_UNPLUG)) {
> -		queue_delayed_work(system_long_wq, &pegasus->carrier_check,
> -			CARRIER_CHECK_DELAY);
> +		queue_delayed_work(system_dfl_long_wq,
> +				   &pegasus->carrier_check,
> +				   CARRIER_CHECK_DELAY);
>  	}
>  }

[Severity: High]
Does this code risk data corruption in the PHY registers?

The delayed work check_carrier() runs asynchronously in a workqueue and cal=
ls
set_carrier(), which performs multi-step USB control transfers without hold=
ing
rtnl_lock() or any internal driver lock.

Concurrently, userspace ethtool operations or ioctls (which do hold rtnl_lo=
ck)
can read or write PHY registers.

Since the operations interleave on the USB bus without serialization, concu=
rrent
execution could overlap the hardware address and control commands, corrupti=
ng
the PHY state:

drivers/net/usb/pegasus.c:__mii_op() {
    ...
    set_register(p, PhyCtrl, 0);
    set_registers(p, PhyAddr, sizeof(data), data);
    set_register(p, PhyCtrl, (indx | cmd));
    ...
}

Would it be possible to add locking around these MII hardware accesses to
prevent interleaving when called concurrently?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012095452.1358=
28-1-marco.crivellari@suse.com?part=3D5
