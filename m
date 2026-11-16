Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.145.95.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794831259;
	b=WJQJG8C1VlSzqEUT65luTFGzS7QsKIWiuyOejU109iMzdKa0l+MPbo9ajR+va04GCTHZ
	 ek3VnI+a5ASSqCZMND7YhVucH+Tv2QJI1Gvku8Qsai1YMxJXzqWxmbQDXnU2ATIRuJPdp
	 pkmAqW6z6cbztbHBo3a2XifOnhrMhr02ola1ZlLF2K3VTKuZTsb95FGDxlgXHgCEcW5gr
	 NioDeylKzbRQt0EiK+WEm1dnDugy5xpaeLQXuiEAhHqzY1cdARd4UpD7s+1WZZx/qgL9i
	 T2I9FdCJmRxevz1a0XiZ7rE9p6yvV1B+Ud3ChcwRDYNv1cch3Q/wTRChxAhP6piNsYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794831259;
	h=DMARC-Filter:From:To:Cc:Subject:In-Reply-To:References:Date:
	 X-Clacks-Overhead:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=alkB35vMDP6Ea/sE08F2tIeX6BsjbwLRq1pKzh4GKt8=;
	b=oM72KB0ZJxl/+BGc8zGgh6Kmyymad6SUAJDOoJoEr/dxywQNm31ssSkT2FiH+QDkNBu/
	 TVJcla5RwFrLRhTvm6h5rBVeJmSfjtTrxGL+wtlTeJ7WrP4E8Ib1GQWOZuRXWsOWFe9V7
	 jOnp6xn6trl/+h1GKmwjOLE/cM1ljNNCCOwD5KUl55f26UTsJXxlukoVjHtzu7goh3S1s
	 c4ZxJgtcYoPHj8NSJtxyUDk9/FjGXlogv+VhySSRGulgZnv0mAZvouWuiZB0Mtvm0f5+D
	 WrBiafvS1+djde57gWQGKWdPOUC7FKIz7w19h9f10Wz1ovZDN0maEitf2pG/yy0Z49w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=toke.dk;
	spf=pass smtp.mailfrom=toke.dk;
	arc=none smtp.remote-ip=45.145.95.4
Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4FA606A31C;
	Mon, 16 Nov 2026 12:14:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A4FA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toke.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toke.dk
Authentication-Results: mail.toke.dk; dkim=none
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: =?utf-8?Q?=E9=93=AE?= <fengaojigui88@gmail.com>
Cc: linux-wireless@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [BUG] ath9k_htc: KASAN slab-use-after-free in WMI event tasklet
 (v7.4-rc2)
In-Reply-To: <CAO-4RZ1Xu6vdLg6y74YfyT=On+Lom9L+XprpvORdXXOdOsAALA@mail.gmail.com>
References: <CAO-4RZ1Xu6vdLg6y74YfyT=On+Lom9L+XprpvORdXXOdOsAALA@mail.gmail.com>
Date: Mon, 16 Nov 2026 13:14:08 +0100
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87zev9t1m7.fsf@toke.dk>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

=E9=93=AE <fengaojigui88@gmail.com> writes:

> Hi Toke,
>
> We found a KASAN slab-use-after-free in the ath9k_htc WMI event tasklet
> on v7.4-rc2 with syzkaller:
>
>   BUG: KASAN: slab-use-after-free in tasklet_action_common+0x2ec/0x3b0
> kernel/softirq.c:988
>
>   Allocated by task 1259:
>    ath9k_init_wmi+0x49/0x320 drivers/net/wireless/ath/ath9k/wmi.c:95
>    ath9k_htc_probe_device+0x203/0x2650
> drivers/net/wireless/ath/ath9k/htc_drv_init.c:956
>   Freed by task 1259:
>    ath9k_htc_probe_device+0x292/0x2650
> drivers/net/wireless/ath/ath9k/htc_drv_init.c:978

I believe we already have a pending patch for this in patchwork:
https://patchwork.kernel.org/project/linux-wireless/patch/20261021120237.48=
1898-1-toke@toke.dk/

Could you please test if this resolves the issue you're seeing?

-Toke
