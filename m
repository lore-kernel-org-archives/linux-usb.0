Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794499774;
	b=ytBAw7+cacRhWkuWPzsr1CKT5uLRS6jfd6cIlBK2G1HVpDucYi7f61ps+ID1wNvDhDT0
	 itbfQuAqRfqREQdAVz7KdF6LqsyKWshdlNi5423wkjmZdBWKWE1gUjPx+GXfUvI1gZVvy
	 GU4j1s0np+/ynxXJSogA0vc88gt4AR0F/gm0pMwrCe2YAVjqsnbH+J1eyKvjqLz46gzuq
	 loYlwLoXNCzGMhu4v/D3brvAOmu7PH9gQqEpoP0+zronEs67HD2qH/bUPqCqTwpE02fhO
	 Zo3WCv1dPOSbHZi//yqtniXRgStso725r1MIQA0PWT2o4kfXdC/HnO/SGO70LftibsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794499774;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=NprontI3S6wSUIPA9DtkrQi2JmNtITe/mB5h8L/dO/4=;
	b=Cosh0TMFdKnVx1+eb+zn3pwHDPMPppPPZIJXVURllCzMWOTSObKxvI3TeqXSH17WfjxK
	 aowLZUYzcyzivFbs967VNldFAhX9Eeij4/Eo9tYSdNctqrClV4fc9/dENySlRVDq13Obc
	 wHbzyI7tZZKg3oH42W5P/f/RNwFGQVMEN+feLz/tsNu16SnFtkfP9h4LPVwxmUoknWM9N
	 xRb60p6q+12zEyTfBrLVbHydybnHfGo/xQJifWUfDfSsya7VFo8e9Ivbw873sL7BPxd0u
	 pISqAhbHpOiT03p27UW4ixFGQaJHgn4s9FzDkmEYwVw2XEB4ARNAalvnU2k07hm8OyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SDW+3APw;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA99606A337
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 16:09:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AA99606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SDW+3APw
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so55643775e9.0
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 08:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794499773; x=1795104573; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NprontI3S6wSUIPA9DtkrQi2JmNtITe/mB5h8L/dO/4=;
        b=SDW+3APw35sGo9ekbc/cfecReuJ9i1TnBef80x3C1JAK0/avQz1v9UcwccYU4FKSz0
         pVPWt0hwSsrG8Uv+XL9jeNx27BavcBj9zz4GD3I6zAklojicL2h5/PerDzzG2lk434qa
         IjXY65JigmaiHQVtD9uCZM8QadnjylirJg/8u7+E8m7brITD+QWHNDdrR2vUYbHkVY1/
         OpMiQNa5ZT6BQjbVphKxey9DoD7qJI3L3ridMThYOM5eu3UUSUqTJybUT62tZdrkp7l9
         a6D+aJPjA+i9y2PQ09xB52CTKbbYf0oF8WcybOMYN2ghJw9AxcaCvzEBJcoiV9+9ZX5U
         G8KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794499773; x=1795104573;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NprontI3S6wSUIPA9DtkrQi2JmNtITe/mB5h8L/dO/4=;
        b=R+FVwPHV3YBFT80b9EoymXj4VNH9xwdlgLowv7BhKgi0HjcgeRIul6tPb1SN1gtSMq
         32xtg3UXKL1xkIYj9iDGorVQC6KxrNTNDCwyPhPgDmwiPDmIBkfS5lKBcWUPG7rcrYm2
         MHGru+bxnXd+kh5u7xgQoCwqPFNrG+xWsEuMXe0+4uh0MuIVaQtqiPDKMdMnKy3y2bsr
         /I8J9YE2bgixMsvihL36UiJSZQIBSRCefrCs/EbjyEktLY9NK6qJG6EDx07auRzBj78q
         OtEiVHASHTeCyzUWlMGA3XCk5pMi0c/0UO3U+/RQaw3ae7m8Rpml7VI35z6ArKZROv8C
         PnMg==
X-Gm-Message-State: APuU4Z9gRkmaOvFS9uWVr5Z/OO5hhuyEEYMoAjwRgsIOSQagDjpAeW21
	dW7X3XEr/hPccotDXdO0w3dhc8zjGXuTzFAT2vyzfwQmkN6n9leh2mHC
X-Gm-Gg: AYBFou3wAFqwhNQlpKBa64hgZLNwbh4ZGZDE5FpePT0qZUiqsREawirLjm40M4KrCI2
	jfi0xAb5gkP+dIGDWWo6yKbqsIiVYX8i2sheVz/ZKMDqMnzJUBUWfrj1V/M4W4JQ9N1XIxg4brQ
	Kh4YnNk6KmrLO5aa4C3C2zo9cW/vP97XwN//620pnbRcoaI4QQ+ho1fZf0tfI4IRmIIdGUK/7XI
	WWPbzHURRuQZIf1vCgjN7Ii95+j82beqw55lPuI0oXh/8OEa0CfaDErVlh0vXCz4ugsbg63wmIu
	v80HNhYnMrLkjsPdjFEPQw0MLnd0zFnPz9BKLc/4Pd0pAsmxdOA38YiM9KpZTwadQLt+daoWXq7
	bFs4FttiiZ80xNv0nnpKjQAMSZfRY2LyiKAePbNSZW0sAxo1/kOrnamsrRWJLbV2lrzcS/Xt1bW
	MVa/neht1ctHfTfABgsXr4oHXJBuDSA0QF06IBOfluDeWpGH7VxqvhQRphlwLGkqVkE0SMLBXe0
	LS2x/lkQqf6/Eq3jR+z1uQ/a1qIp3EeYgnu43WsKZNfs+MWViMY6TNZ1NfDk5OXhPZzZ4H/ACmy
	xzvjZh6HX2hVC5PNMcz3HZfQngulkVwniSgMNiOflM6JFoul9dWxB6gaHsZMKjng7WWxb1MB41P
	V70ES3s0c/Lp+MNX/sAqi1nq/PYO/mU7LwMubDvfCbvlRPwIHT+lXtYgPPpYFp0iVCt3SZ7rsXi
	PKHYFDxZN+40e6Z2N49ejaM9PItQSDjhJ314Mzexq5qX/XjAQAIBJ+wB/ohghe+EWss2GC8fc2e
	VM3vizV6xTUS0aQ9J+jNJ0p26DHHMW0YOQPQ5Yu4BYR76Opc7U=
X-Received: by 2002:a05:600c:871b:b0:4a1:fe26:24f0 with SMTP id 5b1f17b1804b1-4ba0938a4cdmr112713305e9.20.1794499772615;
        Thu, 12 Nov 2026 08:09:32 -0800 (PST)
Received: from localhost.localdomain ([2a0d:e487:413e:7996:2027:fa29:7e27:899b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e258e8dsm121173795e9.4.2026.11.12.08.09.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 08:09:32 -0800 (PST)
From: Olivier Kaloudoff <olivier.kaloudoff@gmail.com>
To: oneukum@suse.com
Cc: linux-usb@vger.kernel.org,
	stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org,
	usb-storage@lists.one-eyed-alien.net,
	stable@vger.kernel.org,
	Olivier Kaloudoff <olivier.kaloudoff@gmail.com>
Subject: Re: [PATCH v3] usb: uas: ignore UAS for ASMT135x bridges (174c:55aa)
Date: Thu, 12 Nov 2026 17:09:29 +0100
Message-ID: <20261112160929.6479-1-olivier.kaloudoff@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: e6593c6e-63b3-4198-b587-85b5636e033b@suse.com
References: 
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
Content-Transfer-Encoding: 8bit

On 05.11.26 20:43, Oliver Neukum wrote:
> May I ask you to test once more, harder?
> If that remains inconclusive, we will go with blacklisting.
> We cannot risk filesystems.

Ran the harder soak. Setup: the same 174c:55aa enclosure (iProduct
"ASMT135x") behind a 4 TB disk on xhci_hcd, kernel 7.3.0-rc5-vanilla+.
The device was bound to uas for the whole run (rebound after the
usb-storage.quirks=174c:55aa:u cmdline override took it at plug-in).

Enumeration: the cold stall reproduced once, at the first UAS probe —
the usual READ(16) at LBA 0 timed out, uas_eh_abort_handler followed by
uas_eh_host_reset_handler, then clean re-enumeration. Same signature as
reported before, still only at enumeration.

Load: three fio runs, all against the device under uas:

 1. randrw 64KiB, iodepth=32, 4 procs — 143 GiB total, 30 min
 2. seqwrite 64MiB iodepth=8 + randread 64KiB iodepth=16 — 342 GiB
    written, 75 min
 3. randrw 64KiB, iodepth=16, 4 procs — 161 GiB total, 60 min

Roughly 640 GiB of mixed I/O over ~2h45 of sustained queue depth, disk
util pegged at ~100%. Result: zero uas_eh events, zero aborts, zero
host resets, zero disconnects; every fio job completed without an I/O
error.

So by your criteria this stays inconclusive — I cannot reproduce the
queue-depth wedge on demand. The enumeration stall remains the only
repeatable failure and it self-recovers via the host reset. I still
think the blacklist is right for 174c:55aa/ASMT135x: two filesystems
were lost to this failure mode in the field, and UAS buys nothing here
— BOT gives ~3x the sequential write throughput on this bridge
(~136 MiB/s vs ~45 MiB/s) with none of the instability.

dmesg baseline and fio logs available if useful.

Please take the v3 patch.

Regards,
Olivier
