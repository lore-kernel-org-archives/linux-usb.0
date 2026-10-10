Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2456235DA53
	for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 05:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791611557; cv=none; b=OBRlBj2s23ha51klYWEhBGEYA1ieU64NEzSbJNmcsTdU/38DLLjYUGnGR3Lb783W5kjDeEr/nUeMm68xvJmji/fXZ7RX1lw0xRGugiItfcWH5f0ZkdDcxcznRJggSHOf3l/J0BVJM2WX1k8t00RO802JHnst/TXYYicN2i5PZyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791611557; c=relaxed/simple;
	bh=09ZkGyGxl2haCuOTsJHpKoL9RywQWtCRuJ7tAjjMEkU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KztDQ8K0Ffh0RGirhTA/3fO9X4JIkfyyRqDKMiL/2D9/KpruJzjuUjiuON6dK3J2RpxVkeESIxsH0DIo3c3v40UbOfU3khZkeXcaVA/NMNzfU5EYwBeKz/5j3emLFMXdbk5EvXwjKNUJAMyzh9rIdjtvxBcfvhRhTtTpNknGAyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bbi8YfCV; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bbi8YfCV"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48c02782159so220631f8f.0
        for <linux-usb@vger.kernel.org>; Fri, 09 Oct 2026 22:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791611554; x=1792216354; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wgzi0jjef/x5jdCdIXvbTSLLXrrhjeQUe6RmKthP0C0=;
        b=Bbi8YfCVHShavJbOwP/BGzTDYc7CrcWlejvz0WoGGZd+VNHGfuw+/VkZRJ1quBuQu5
         STWSNKoIYrpmiTIBAfE/4MzJITfymavI3QhIb2YbrWP808Ww4WFyJcJ4jzcMpRare0uK
         5aTGQlNlbvS0KAs1H0Xbk+x/PtsdYceTVVgHXdNu7gHiHCgdlc29tuSjraMmrzSwhgX/
         9eddMi9XrlkgQegQfn5MTgWcawEX5kpoI/EXkSOMOXvKwwlygNB/arq20tu0ZSYKLTcN
         m+RvPEvZL/ElCQBY/Vccz/bvLNBGR1XvNShTZAHhNBQSqmirtUhfjlgkaF7fRuK3D4po
         ga+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791611554; x=1792216354;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wgzi0jjef/x5jdCdIXvbTSLLXrrhjeQUe6RmKthP0C0=;
        b=g2xrOyi6loqkyF/bk0fIQjy5j278+B6+1FwYv6G3taIHbNc8v0Nj4L9E6z/53t7Cd3
         UosR5VtGdgWEItg1o//BfB4TslDAYUI2e1XEEjUbvMKrACuMMGYywlFvwGW7elQGtO2E
         tEJOV5F0N60FU1sB5mfwvoVszZsfPh4rJayO70FKqDgnrCwYGHl9KALZVcttbhaYAsDP
         Rn9/gFO3zKVUfysA8fnMQL1TqFoBpkbwvVn+xVu3+FNVN5qrVxEN8Xiy64M6fk7jbsy0
         pnPMlH8a++lN8hNdspSK00RVVAlRPCoqQ4OE47hlxiYrHcLpogmwEd4N05SxJQnHlW5w
         dxOQ==
X-Forwarded-Encrypted: i=1; AKwUvBwCVRDSI2fFHIC5z8jvTrLgwL+MwEkOmBXJzcDdXJZ/MZECsWSJYOGM2cOkcIMUXNzzXHntwXfyu9Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPF8HlrtsYXgormQp+hlLlgwqWQE+arL0b46WfWLFtFAZDc/h0
	1FfO7M8g9gqNwQllOe69wDW6YRRhI7e38PUvBk2+qO1TyMnXiT3Ee8QwQWyJOyXT
X-Gm-Gg: AYBFou1GgdOgyQF/4EE0C+qeNqFrqEcBKCa8jQohLb8nkTRfIKvyMf3SXunOoXntqkK
	dMkyF6Oq6KvHH/DFlr5M/eeqVZEUUIW6CZ1mQmFwUbeNMH5aHrarGP58UlgNzDWnS1y1MJS0dXv
	X9dzeC0cKbfAFN662eO4FUOPX8LGCvHNIHWsmVNibe0hQCGg2L7ttfJXM8INqijt3xAXIV2FX/3
	mcOCLMyBStM5P4sp/ZnN1FwbMAegUGSvmnzixZiJYuPB+zvZiO+lm/EqDQAESxq2D1gMIuPXifT
	AopkLzGd07jI1XcukQCNG4EV3tCLV3s+qcqIfF24cKXCAVwLpQC64AYiG7Dhs/U6Hp7qjF/ayMQ
	pp9C5yUcfUVDwubsI0MPAy0yrLbMTDHn0qhmAh1lR4vLvXwS9AYGjignK6mn7sN+xGVK48sH+0U
	goB6caSXBB954n1FHH8AxWKB2V0w1LdPrGbojHAMt/QNzjkavF1nVr/JF45ckOAOndFPB59rxo4
	y3fTQbplA==
X-Received: by 2002:a05:600c:6215:b0:4a0:eae0:b30e with SMTP id 5b1f17b1804b1-4a18e4ca157mr65023145e9.22.1791611554116;
        Fri, 09 Oct 2026 22:52:34 -0700 (PDT)
Received: from foxbook (bez186.neoplus.adsl.tpnet.pl. [83.28.37.186])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9463a9dsm7627632f8f.6.2026.10.09.22.52.31
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 09 Oct 2026 22:52:32 -0700 (PDT)
Date: Sat, 10 Oct 2026 07:52:21 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Jie Deng <dengjie03@kylinos.cn>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: xhci: Add XHCI_TT_SOFT_RETRY quirk for transaction
 errors on TT devices
Message-ID: <20261010075221.409a5353.michal.pecio@gmail.com>
In-Reply-To: <20261010032518.2040608-1-dengjie03@kylinos.cn>
References: <20261010032518.2040608-1-dengjie03@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 10 Oct 2026 11:25:18 +0800, Jie Deng wrote:
> Low-speed devices behind a high-speed hub on some xHCI controllers stop
> working after repeated lsusb -v: a transient USB transaction error on a
> bulk/interrupt endpoint is followed by a hard reset recovery where every
> command completes successfully (Reset EP with TSP=0 and Set TR Deq both
> return COMP_SUCCESS), but the first new split transaction issued after
> the restart fails again.  After two such cycles the hub reports a port
> connection change and the device drops off.

There are no bulk/interrupt endopints. Which one?
(I tried and lsusb -v does seem to trigger some interrupt transfers).

The patch seems LLM-generated.
Are you sure it's a HW problem and not an LLM problem?

> The affected silicon does not honor the xHCI spec (4.6.8) requirement
> that a Reset Endpoint command with TSP=0 "reset any USB2 split
> transaction state associated with the endpoint": the stale split state
> survives the reset, so the next split transaction carries the old
> transaction's identity and can never match the hub TT state, cleared
> or not.  The soft reset path (TSP=1), which per the spec maintains the
> split transaction state and retries the last transaction on the next
> doorbell, recovers these transient errors on the first retry.
> 
> Add a XHCI_TT_SOFT_RETRY quirk: when set, bulk/interrupt endpoints
> behind a TT hub may use the existing soft retry machinery to retry a
> USB Transaction Error (completion code 4) in place instead of going
> through the hard reset path.  Platforms without the quirk keep the
> exact previous behavior.  Isochronous and control endpoints never
> enter this function, and the existing MAX_SOFT_RETRY bound still falls
> back to the hard reset path for persistent errors.

Sounds like you may need Configure Endpoint recovery if you ever run
out of retries in any case other than disconnection.

> The quirk is meant to be set by platform code for controllers with
> this silicon bug; no in-tree platform code sets it yet.

Is support for this HW coming upstream anytime soon?
Not sure if we take fixes for out-of-tree issues.

> On the affected controller every error reports comp code 4 (USB
> Transaction Error), tt_info 0x301 and err_count 1, i.e. each in-place
> retry succeeds immediately and the fallback is never taken.
> 
> Signed-off-by: Jie Deng <dengjie03@kylinos.cn>

Suspecting missing Assisted-by.

Regards,
Michal
