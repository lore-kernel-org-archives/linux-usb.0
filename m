Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793784989;
	b=KdjoAgOVKdERXoQ2HTL7o9es3TH8CTY568ELuDapK4s8zgFRhsCuTHuIEYLF4Booi1Pj
	 AWWOm4KErxZNexR0eyZzF01MLVpt8vfQE2wIwABxyQrx86Cva+wKXgqJKCVmEOkHPAjV8
	 OOmM7sXBwliVLyZ1RNvAs9P1xk27/9QfX2iITcQFf1Zxv2It5kZ+EPiXmOQyl2x1nGtyY
	 gdkuu7HgpauRy3D7PvHycAy1H9ZN4uJ6SeVQC1Q4wFYUKKyvYirEU0GZ6DQwE8bjneflN
	 H1TcQ2wzSz9xin/VI/XS+7+Ft8N7H57VflpjSpis4lOSFm2Oyyw63hnWePm+2YxqCDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793784989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lTXUcqEXN9fhbWBTgpN5+0qokRh4JVbIacGfVHJnplQ=;
	b=ZdU+AwN6SOvqEO0zCrORdQ94RqBH28VMNbuHYaGPvy0Q4eYFEcGe7OZXpy6ajeEbQydB
	 BMZKet3xvYFVv95VJdYpjyWTLG63ynsqEoJpcdtvxzXhwzfyieLfzwVo2AJt9wWdEGYK2
	 a+zzIkpnxFh5odnBmgx0TGvvAEwIt60IUSQxhxxW+tp4HinI2jAzim+OGmxKlqu2bm+DS
	 ZoRNapXi1AEaAmtqbJedVzyRLu9UXZi1Cus6gAkQ32ag+5f5NV1jPlQVlr6q2KsSl3RyU
	 1Oa3993jMjfGrvYqqZujGGlJXcvzBjsbDhQqsslg91Av2zPSEuAPLVieGb/9V7GHGeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GmGCxF+s;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CD9606A31B
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 09:36:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3CD9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GmGCxF+s
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cd69954c755so348385a12.3
        for <linux-usb@vger.kernel.org>; Wed, 04 Nov 2026 01:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793784988; x=1794389788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lTXUcqEXN9fhbWBTgpN5+0qokRh4JVbIacGfVHJnplQ=;
        b=GmGCxF+sHS82Xh/DPYUY5pfW0A39hyNAQWMZR3S11K6S959NrAiKn5Gvj8B/SUSnxV
         mauKncLIoCa/dTNCYroUkf9L1fq1lSvXHibiZVCT3CPMr5a57LrKFvLvxWKSK0LenaP3
         l5ZAGP6tXncoBnKeYMDAHuVEvVTcVRD8Ac+0zfaYf1toBl3j4UKp+CAEVpuhSE+YBw4M
         qrQ+9OqHbc7RJhCMAPIIrnbnq2t3pDzUm3VijPuGxR7zntnfv0X4pFpTsxUq4ABKTlrl
         ckJqwld9+PfhNeSHBFvKkDzOSncU0XZTBYXrS0xqpdgTKXEeatgsPMZHSD4TwJtu+ojq
         eVnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793784988; x=1794389788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lTXUcqEXN9fhbWBTgpN5+0qokRh4JVbIacGfVHJnplQ=;
        b=AUmutjdajwgmY/fZ4k154fGJibN6mWeuT0Q/QgUfE/JVLpHrf9ZBT2e5s1E/EiZRNj
         JTtZmBf17lWxTJ7cp8O4KwrBV1BMyB/Er/BP32ilReMAZgNVHXW2a9ZTo0gwihEt8ELN
         yMtrM2d3Ik1Fuz9NLuTVzoe9NQCOAwQ7hI2yzFu3so0SH5EwT8m/cnbmvjbokYKZp6g5
         n+D2SvoY384WW6hZzGLzzQfu6fp1udjsK/Wk/nkNgbIqQgnQbyYz/TJhZ7yQKLsv7yMT
         8dJtSntG9XbYe5oGgrCu8mcYqcZpD0C0M46U8Vhjy9Qvmgd9kifcKTjiKDhkgs1QHkDz
         KIug==
X-Forwarded-Encrypted: i=1; AKwUvBxDv0mE6NCsfQk27J0nc3P3fr8hVlDQo187nY9aTeae3PM3CVuwmc9n/XNPLwgcqzxGpbaG9kdUGdg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9y3WcrFS0lLK2+DvGXhZQEz/gftDO1OpAdoLANtMFeYZz3tkZ6
	+wHZ0ti9x9Cw52NX4bPPWP26vlH1/5e/S88UecRwppNrKgotJHQnWyEe
X-Gm-Gg: AYBFou31YJ61ZfGzvi2aWxHXcOUbLZlyp2ZpTBWPzLPN9a+cy8DWdEUWBKRn/kA09cp
	5gJpnearnlalWibshVq5NbEnBz96m23d5ELH8OctzIdCMWgKpwASp8uiE/sOcUPF90/IpxPHHTb
	+Mt3T0Stuk4N3uT5b7jJe1BtjhDPW8YVtryy/NnsxoJgx1Z1K426VQD99Ha0Sp0ZvzTMYlQNsfS
	Eb0M4wqk7TxyhOhI0ydaNI+Ke+AsVtosTGYUbQJ9lh8mq6RZsgG1cRAeMnGKGftHQbmSB1YMokP
	WKBba2OBZIkmBgmHaMJOTldwMwHL6CWVLZdNit/hG4cx7IyaGppYd8Bt4KkcXr0n492hwwOQNvk
	l3z+nkiLOjFNf+iPvlPe109t/zeTRAZ1tcjwa2WY5VC/2E0C/E00vkv0Uw5fVURyhLmC5xl9YwD
	fzuUo/omg2BCJMEnikJBgAu2MVOQgFkOc66TPG/ILhpl/P/ZHfeYVPVXKEWgi/dCXH2egMnEcHW
	YZWyJihjLNLYH4GMlBvQBmYkrVGmw0oePNzNUFC7+HtenJL39+sApmRaHHKCHkbLHk7UtgFhuOP
	TYOP3bSWOtao6lkWXNAGy5Jc+my0Ya8HSdxSPGJiquA+a1FRuhD7SQcm27fLhCpH+l0XL4IIGE+
	2Hvw3
X-Received: by 2002:a17:90b:2742:b0:3a4:b418:94cf with SMTP id 98e67ed59e1d1-3ae897158ddmr13702795a91.14.1793784988126;
        Wed, 04 Nov 2026 01:36:28 -0800 (PST)
Received: from evo ([183.171.191.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0944fd80bsm3149967a91.16.2026.11.04.01.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:36:27 -0800 (PST)
From: Ambareesh Balaji <ambareeshbalaji@gmail.com>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: xhci: Tear down host on Reset Endpoint and Set TR Dequeue timeout
Date: Wed,  4 Nov 2026 09:36:08 +0000
Message-ID: <20261104093608.2642748-1-ambareeshbalaji@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104101506.5ae19157.michal.pecio@gmail.com>
References: <20261104012725.147741-1-ambareeshbalaji@gmail.com> <20261104101506.5ae19157.michal.pecio@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Michal,

Thanks for the review.

On Wed, 4 Nov 2026 10:15:06 +0100, Michal Pecio wrote:
> I have long wondered if we shouldn't simply halt the HC on every
> command timeout other than Address Device. Commands shouldn't be
> taking 5 seconds to complete. When they do, something unexpected
> must be going on and it's unclear if the HC is still usable or
> capable of recovering cleanly when we abort the command.

Your approach is better than mine, which only covers Reset Endpoint
and Set TR Dequeue Pointer. I am happy to drop my patch in favour of
yours for 7.5, and agree it should not have Fixes: or Cc: stable. I
will test your patch once it is posted.

> I haven't seen cases when Reset EP or Set TR Dequeue hang but other
> commands still work.

I can't show that these timeouts happen on real hardware yet. What I
have is:

1) A fault injection reproducer. On an AMD xHCI (1022:1587) passed
through to a QEMU guest, I halt a usbhid interrupt IN endpoint with a
real SET_FEATURE(ENDPOINT_HALT), then suppress the doorbell of the Set
TR Dequeue Pointer command queued by the usbhid unbind. Without a fix
the unbind blocks forever in usb_kill_urb(). With my patch the command
times out, the host is torn down and the unbind completes. Normal
unbind and rebind of the same device is unaffected. I can send the
injection module and test script if you want to run it against your
patch.

2) One real hang with the same symptom on the same controller type
(kernel 7.3.1, tainted by out-of-tree DKMS modules). After a Focusrite
Scarlett Solo logged "USB disconnect", usb_hub_wq stayed in D state
for over 4 minutes in usb_kill_urb(), called from
scarlett2_private_free() on the disconnect path. Nothing recovered it
and only a reboot helped. There was no "xHCI host not responding to
stop endpoint command" in the log.

Reset Endpoint and Set TR Dequeue Pointer timeouts are only reported
through xhci_dbg(), so the missing message does not rule them out,
but it does not confirm them either. I see USB audio hangs like this
once or twice a month. I have enabled xHCI dynamic debug and tracing
and will send what I capture if it happens again.

Regards,
Ambareesh
