Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13AC399350
	for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 11:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789038303; cv=none; b=W836V3WnFl9di7TrTrGD6NO0VJHvKl2LX4iwV21I7B7GO8nmNheCDGOQHrCNBmMf8miDWfGT9s4oo4L4VFuiX/rlrKx43bvWOb+NmymGGb6HTjNbOa6ToQ+WQwg22yKDJX7NQ8hAJ106lstd/uCrX8GTVyLNzETlk9GY6s8qsjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789038303; c=relaxed/simple;
	bh=1f2mBzgJip/ph5VJ1y3MMkUtVNEaZhBFAoALTmqzLZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BdNWeFxK5ooZmImSonYmtEXtFt9iYYHi38CBtfTUzSoQWB1uzBWaVXJXHpMI07IaCXYeR5RYDNUH6LepqeVWrLROyb6BhWG901aTlF+MOYPqJezzMAeyyXhLQNAfK6OoiaCQnx7Y+CHvu2Bl93gPvcsfgnhZ+vi6jPovWeX/+Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=knUOQ9c6; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="knUOQ9c6"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-868cfc5c244so667745b3a.3
        for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2026 04:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789038299; x=1789643099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zyH+UvESg4tqh91rE+AZeLqx3byzwh8yG2FaqaKtXZU=;
        b=knUOQ9c6P9AaL5koz9d+mR6afzo6biAlcSEthR+bzTteaTzHkKkoLP0zhJD9ERIoHq
         T+D6DhjhR3EoV0UVwvAl+f/QZyoIOyBFqOnSK5vV83Aad3XUF+PYRUsib8jSoKpOmOe4
         3Tc/WM87WfiJ4ubdc4PF0F/my18z3d16yxIE5pegAt0XDarJhZ9wo+MNMcb6o6dBp5LH
         JReOwWkwYErYCuGhiyyooO2dyXc/fOIs8Ax4JJqJ7MWWPYVtSWUaupwO89FGHFA12UM5
         DRjY0ScG4OOVIGPvIWTeJmTo2S0mSxD6SsKTHCftuNyjLl6AZBq4a2HUU3YNkGNvsBrA
         BTaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789038299; x=1789643099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zyH+UvESg4tqh91rE+AZeLqx3byzwh8yG2FaqaKtXZU=;
        b=WvEjLCqYiJVMaJ7uYD2WWdV7ALGwF1UCJucmkGdhrL3oLwtTy9KItTemNr05VHRYRg
         JPs5QK2VWMkJ08z6UUQasr4+MQV5K6mjXC1jgnJMhz921PZYjqeQUrAfQTXIn6J8dPkc
         DAvxsnXRPC8xozQyW2FdEqHqsSK78VepsrTehEaaPCpct2wMsJan4t7H9vk2v32onOYX
         onosYXf9M4J10NxhnyQFm3E0lycLdkvSVKkSuXpJ4epap+JK81SUVHeCV82z88FHJ2up
         DRmaFarVW2/l15iO/WuCgq3IQ/qQqM6k0VTA2BAHwGGG0BhtS9ynIM6RxQlP4Nwixv1G
         4P5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwvOTfYW+AQRlYZs2tIMcUSMh3KeGGeH1j5XErqf+Lsvus7PExWNx13mAH3GyOrCcs9XuEDb9R7iTc=@vger.kernel.org
X-Gm-Message-State: AFuF++m2ILUBE2oi7fBCsA3ogA6fStdPgsHCD2zBiy6O/Gc4gYKeN9hz
	8iyQ4CB0c8J4L+AOLmL+aEPiXDmY5wc5Gg1WoeafLJLH00eUAc6OXt90
X-Gm-Gg: AYBFou1VvjdpBvdo1du+dj0T2AFK5wcSRZrHHFHmjhwIBu8BsnsxNFSZT5rZabyABf2
	SeQ54SIiV7z14jpWIGUNyQNFBdv2UZ75OonX/0D20Wspe71iz/eMzSeCBudlFISP1kHCL4calRt
	cUWlp8ewa6njyxtwEwjKM/ORyYHnDqTkCG2noF531wUEtUP7Ai8EMWCZuSglp1NVPRJvqcjdwhR
	dH1ciLNDXszd+R37KsWKamvP5OhgEqjNbJF2AgtUkJ2GHgIsruQWl3okYOKoVaFoNTMYBxcI72v
	nmVxVrgR3G3BCelhIDPWvMC/8Qnm/tbrRDVa8XVx2g3UDmK6gZY4T/+I81IZrO5YgAVMbXuE5Is
	a3JM8aZrztAuZq4GL8sU8xdh0lLM9cxFmkfizpU6m3Yob3foB++QePKs6n0kZj/W4FaLj9/wMqF
	Q2i7nExzIxWS+yvIoIMjEvGJG2Prt/PARvF5EDx4qTpr/nAErxGMoo5PZC0A20yWOXEY1dq5Y6O
	DcaEITkXM2YNYtCnS11+vx3NKgDIbBERgjzGsV/dDwYRyIe6ud9kVLOV1SAVUXWk++GHDTPFaKg
	NYfhxUFJkzxYn2jOv/4LpMELCo7k9TFTC8U=
X-Received: by 2002:a05:6a00:17a6:b0:857:7384:b5fd with SMTP id d2e1a72fcca58-86948e29d5amr6125719b3a.25.1789038298503;
        Thu, 10 Sep 2026 04:04:58 -0700 (PDT)
Received: from rikka.tailabced6.ts.net ([240b:10:ff82:b100:8ce2:c181:4224:d11d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8615273da5fsm7895699b3a.26.2026.09.10.04.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:04:57 -0700 (PDT)
From: wakasio <scarabeeta@gmail.com>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: xhci_hcd / ASMedia ASM4242: Bulk-OUT -EPROTO with Logitec 0789:0308 during DVD+RW recording
Date: Thu, 10 Sep 2026 20:04:53 +0900
Message-ID: <20260910110453.1528072-1-scarabeeta@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908131046.1fa7034f.michal.pecio@gmail.com>
References: <20260908131046.1fa7034f.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Michal,

I looked for the offending TRB in the dump, attached is the full log
(dyndbg_capture4_trb_dump.log, 1061 lines).

The 11 xhci_dbg lines all say "Transfer error for slot 1 ep 3", same
address ffffd140425178e0, resid 23552, each followed by "Soft-reset ep
3". After the 11th one the driver printed "event ring:" and dumped it,
then "endpoint ring:" and dumped that too.

I searched the endpoint ring dump for the DMA address that the event
ring entries point to. I could not find it. The endpoint ring dump
covers two segments, 0xfffc00000 to 0xfffc00ff0 and 0xfffbf0000 to
0xfffbf0ff0, linked back to each other with a Link TRB. The address in
question, 0xfffbf8e0, falls between these two ranges, not inside
either one.

I also noticed the event ring entries pointing to that address are all
labeled "ep 4", not "ep 3". There are 12 of them, all status "USB
Transaction Error", len 23552, same address 0xfffbf8e0:

  ffffc09f0: TRB 00000000fffbf8e0 status 'USB Transaction Error' len 23552 slot 1 ep 4 type 'Transfer Event' flags e:c
  (11 more identical entries, addresses ffffc0a10 through ffffc0b50)

No "Transfer error for slot 1 ep 4" line appears anywhere in the log.
The only ep 4 xhci_dbg lines in the whole capture are plain Success
completions.

I checked the source for the code that calls dump_ring(). The endpoint
ring it dumps is ep_ring, the same variable used in the xhci_dbg call
right above it that prints "ep %u" as ep 3. So the endpoint ring dump
should be for ep 3, which may be why ep 4's address does not show up
in it.

Right before the first ep 4 error entry, there are 5 consecutive ep 4
Success entries at addresses fffbf890, fffbf8a0, fffbf8b0, fffbf8c0,
fffbf8d0, each 0x10 higher than the last, then fffbf8e0 where the
errors start. That part looks like a normal ring progressing forward.

Let me know if you want me to dump ep 4's ring as well, or add
anything else to the patch.

Thanks,
wakasio
