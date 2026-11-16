Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.145.95.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841833;
	b=0QtMyAJQv0lQxSZJVpBxw1KWWkP1TL40jY6aPzwfDRkswx+EWsMINrjAZI34tNyngGtk
	 KAuZq3/GwxlC7OGFgf2BcVvcq3dlOhCPrRxklB1djM4viDBit5dW8wXQUyok/I4CZamRh
	 Cp/Fkmk9Wvv4MVaruKODC9WwUopjF7xSSETn8LNHAXcWulvJLZv10exG3hkdl2s5ZAfDk
	 LDckytmxmCmbZ1LhMxU+UUUXLQTKwtHRhYKdqsjCsiE/DpSEW5JgPyWF9XMyO3Ek4Kcrg
	 T1Aqq99HCj8zZsftaT/PLpXS0/zsMybl/fptZWIY+1Z+oa70hIFvYimhNpLEUbosZ0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841833;
	h=DMARC-Filter:From:To:Cc:Subject:In-Reply-To:References:Date:
	 X-Clacks-Overhead:Message-ID:MIME-Version:Content-Type;
	bh=91U9iuk6vEjIfdj24CUYlz57o6AjyZ0fQqYIkDRQZfk=;
	b=POMVRG2Xq4X3ZrZwwLMJnLK4kQUP13hfIr6euLp8sINNB4Pfrhy82zVJtAp0C0l2Yr/i
	 dq6Ge9FY1X4e8udYOV/qZolc0Y789TPAlErXB/LvRUXbXfQvUtmpx0oyWZwX401EhAAxd
	 MHS/EZbEDU3oxxfLVgat8Nv89fRelaYiinuXcgKKAYX0CigwjuDJLxBKbtHtXZGkXxGLw
	 mV3oO+MiI/eoZNH4F/T9nGdU0yH6LGQjLen8+7iFd4GLdfpfEUA6DHxKWYL38xuTRAepz
	 3ukXn5Z/iLrPmmQ+sUqe+ZNjrna6AlefTC6jdwh7hLuYmaJfEr5e5PgpYuUs8sNDHnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=toke.dk;
	spf=pass smtp.mailfrom=toke.dk;
	arc=none smtp.remote-ip=45.145.95.4
Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5986606A31C;
	Mon, 16 Nov 2026 15:10:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5986606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toke.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toke.dk
Authentication-Results: mail.toke.dk; dkim=none
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: Zheng Zheng <fengaojigui88@gmail.com>
Cc: linux-wireless@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [BUG] ath9k_htc: KASAN slab-use-after-free in WMI event tasklet
 (v7.4-rc2)
In-Reply-To: <CAO-4RZ2Bwjtg=6o2gL2J0y8EWKLNrCW_Vy7sbKWhQ-Ga9a2A-Q@mail.gmail.com>
References: <CAO-4RZ1Xu6vdLg6y74YfyT=On+Lom9L+XprpvORdXXOdOsAALA@mail.gmail.com>
 <87zev9t1m7.fsf@toke.dk>
 <CAO-4RZ2Bwjtg=6o2gL2J0y8EWKLNrCW_Vy7sbKWhQ-Ga9a2A-Q@mail.gmail.com>
Date: Mon, 16 Nov 2026 16:10:28 +0100
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87wlqcu80r.fsf@toke.dk>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Zheng Zheng <fengaojigui88@gmail.com> writes:

> Hi Toke,
>
> Thanks for pointing me to the existing patch!
>
> I tested it on v7.4-rc2 using the same Kernsight/syzkaller reproducer.
>
> The unpatched kernel reproduces the reported KASAN
> slab-use-after-free, while the patched kernel no longer triggers the
> issue under the same test conditions.
>
> I can confirm that the patch resolves the issue in my tests.

Great, thank you for testing! :)

Johannes meanwhile merged this into the wireless tree:
https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless.git/commit/?h=main&id=ec95877e2ea1c655e914c34fa23fd51e32315fec

-Toke
