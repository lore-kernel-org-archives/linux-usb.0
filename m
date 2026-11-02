Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793636303;
	b=U+DDGaCpKC6z9Fvh0YjexrYaejBxesGsBR1Nq75Z2CzNZ86oGSlRZGT0o4/R5svUNw9Q
	 p13nxeIixJciIZlldIdBi6K7qoe1Ive/ymzD//26dCcAezoGQU6ol7EcUa+SGqiTRTNv0
	 1ipdX76eepAzRmVfPt75A45S2ew54S5wdupz3f8ZrZJ2tqn6uP8HE+5tjMG78nBhHqzlu
	 ard7uuYHYxJx9IZbwadB0Hpjhc9StFu2xO9ZUDX51T7H6lBMYPicozl8oDFQDg9W6LkLy
	 Qk4OrpXsLg1bXdI1jQ52kCez9j+7LEH+N0LbLzrIKuRPu13RpmuHDQbxSiV5F7TdTGQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793636303;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=CcXba6+QSvZDXF/uqMoMEPJwhAO9oMl+Ldeh0etrrCk=;
	b=rrqamopJvpF20yMY9yk6KZEPVxWFJ9zG2COTer+LBj8dKn4gY3MOsdhaHdCKiHPC8fvh
	 Bqng7tmLL+AVo3bDqH0h0CKtcmPtepMJDJbBjdH36QzCFEQVSU8uSZDSFsmFdR+g1S4LW
	 cwH7WVK6YNhkkTrGNlxxjMxGJpvbVyxSLONdntNPrI9NaKZVCN/8oOas5KmFUXzA0WCos
	 8H8NAZ7g41PQr8zd+skoGzeAgCnHEDzskcitV85xQO+2I12zvO9YKmOQk1Z0Y27eQkFY0
	 jCb18WCGY4WURtZOdVadSqgzOhY7xvlkQ3EViNPDQ5G/87Z1/wwzPOuqg/NDWHrtkFw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oiPmSiKG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0706083617
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 16:18:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB0706083617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oiPmSiKG
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3282db206d3so5197821eec.0
        for <linux-usb@vger.kernel.org>; Mon, 02 Nov 2026 08:18:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793636302; cv=none;
        d=google.com; s=arc-20260327;
        b=MnOD/DZFiDh/l34vs+Xeepo0mN3/2zyLarRxWJ0JEcImYRU94vefibOmRLmgALDO0d
         m+XJpJibLikjgpM8+CeFfSd+yLgvxmW+i3RqMhIYGmAEcRysdDEYq1OE4rBkpWPKc3Pr
         4tI1UaxGo/yd8YZ+ldwl5y6ywcWRUjni0qFzfn047YtnU54fh2B4DUZVEkQUTiiEtiWi
         49trYQeofmnMNeXvbDWn8GyquhebJBhyJnqFdFsZos6kR3efCvlSZbresatzVs8xwHMX
         ARU16g2LqsHJGOLsoRk89jnt78tHEFPDpOv8lttDkyqQlDB6uQ86QcQcbpFHKMeb3I2S
         CBWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CcXba6+QSvZDXF/uqMoMEPJwhAO9oMl+Ldeh0etrrCk=;
        fh=8vVkivZRuhdEvoK3rggyNUH2e+WpgfYScoR9/k97KNo=;
        b=Deh1GFJhevgGrUGsRszgqLdEgj0+Q8igE0hFHlV9+L1Zc1IvgTmqt0HzjLLDVYDAA9
         3095gYMyghqBFqhdWM7wwnE1SAUjgMI4joTT9yXamT4DeUOy/fmsO6SAiHymbXCEPkQY
         OdyEtQadtHwWoIU8ewzOt08say+Bfc4720mlYyKNh4h6zZYC+NC3NDw+0VYEs69xn1/F
         tsxiLmmArfFz8prfccTvX0XB99BFYIEFc72H6ybdYhvCjLfgUVC+ouHTcWv7mpQI6+MK
         U7Wj/T1/n5CLHD5sl+647rrCRpahuvekg8DK0nDCcdf/5a1EU29CuGpPaKMGlRKsiyS8
         xv/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793636302; x=1794241102; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CcXba6+QSvZDXF/uqMoMEPJwhAO9oMl+Ldeh0etrrCk=;
        b=oiPmSiKGc/9iR+p8CGhW031Q6pD44el9sD5FeY84Wj5De2OZRNH5+yEF+BjF3trLUy
         3n90pJtd+8i7QflHvhbZR3TL6YRdBcLpzS7TMgnd5QPSbPzP/mTxqUQ7W1OfX3ZjS85R
         lyG3G1R1FzRJEKMKnLZ4c4X3dOZ15PcZou5xmxcALNaTwT8bgY6bKOvERVde6VIs3kMf
         R1LORE/nSdoKQYtObvSjP6EdrUDwcg9ERikwNXCXGLkUehj9fCQozAxqk3lammBcRMYM
         7Sym/p7vzJIBrGAM02OZbuh4ZZ/9Msf1jyrMvwqsqDay1oByONDJKXNj/QPQPC0aTh/U
         QOLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793636302; x=1794241102;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CcXba6+QSvZDXF/uqMoMEPJwhAO9oMl+Ldeh0etrrCk=;
        b=dwydzIMYSQmv/NisNgQaPAcPqOByAdJDIQP9jwzGXO3DW/GNbCXzdgYSy8He8YZHEZ
         HSTa5yznVd9X0aZKPeYLHFtzNAJfLgJiHNf+LXVO584kJqo78XnqQ7sqeUKALt/1eIWe
         lRT2QnfGV2efh9XPampz6geQIjUQ42S6T0+fyjcbzHAI78llf8OuegknBvWxu4QMzwDX
         0jU5/7plGUgfqlgetXP6ykpgxNjJBb+mMu2v/BG2wbo7hQB69KzU/TsVKGiXcgU6E9zm
         CBQ/LAs0fvIHMZzEaBadEVr1dozYVHr/CAvPH5U5qtQeheJNzoz8EexzPb1PU2696rL0
         NIZA==
X-Gm-Message-State: APuU4Z+c70s3YUZ/C4CNtOMt4KLqmJgYa4zNo8TZm6wRGf47kvlbSZlH
	dDUTxd5QG1iPaSfRIvfK6MWaZTXChMpepMVq2FmiP/mAA9GgSng8fZ6oCUco2QeihrTYqCJv34Q
	aJuoFFQ5oPKs4rOUVUKPU64isYMRp+w==
X-Gm-Gg: AYBFou3fBs/mvfBWzTt2TMlECsS83nGLX6sVnNkbh33ELv7wX4EpIZi7iOY3P1EUsbq
	D7RZFnd+LodwfuG+GSW6+POyTCABw1+rcCDRuFmE390o5lLaZomhMLoHFkIrMfC4cUKsJFqXbIW
	qweJsFg2u0e3RwRxqCz7iblmwh1RjPGqwnzDZuw6eeBUuHs7oq4VP67+PNAPCWpDLJ6SySH+CoF
	4GZTB72leVXEFY0Oyx4RhZsQtq1buy1Iv2bB46kLfyw+jv1PQlNbn3GVcTpGnKBrTKHCud07oya
	hjIC3c3YiffXiZ5dhCNGZDFV57adZy6OOfjaVmexfJrJRfSGZB6Ith5tGXFNF4UVKp1WwBsU8fn
	+9qQMmvxM4zv7yEZuyPSbo5pQYMuiJRoXq3JpyvZtJIPjd/7WFivOMBg/IlSU623EoQa0ISBoTp
	RquB+iIY+/z4GSjly0mPc=
X-Received: by 2002:a05:693c:864d:10b0:369:9062:c392 with SMTP id
 5a478bee46e88-36a424261c5mr18440928eec.37.1793636301684; Mon, 02 Nov 2026
 08:18:21 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAM6_QD_PoTdwdM7DvzzgHRs-G5EvQu-c5oNGve=GuKV4wFYAvQ@mail.gmail.com>
 <CAM6_QD_xAyTFVvYKvCrrZmS+fV5DBBje9V=VdkDMMSpt2ussRg@mail.gmail.com>
 <20260928120343.49e02c07.michal.pecio@gmail.com> <CAM6_QD-CbYSsmic5LhpMi-aMXuC_VaniELBzaBeWO8SWm4UONA@mail.gmail.com>
 <20261002104355.698eaf00.michal.pecio@gmail.com> <CAM6_QD_z7eT+N6HieHyZhPmXqPxKqeSYKX8OK--M+rN2VAsO_Q@mail.gmail.com>
 <20261013232506.1b4dc340.michal.pecio@gmail.com> <CAM6_QD9NDbVESP5peiNhfU5B_7UmvKVLqNz_85A_GABwDhabiw@mail.gmail.com>
 <20261102135125.121f8de9.michal.pecio@gmail.com>
In-Reply-To: <20261102135125.121f8de9.michal.pecio@gmail.com>
From: Dane Linssen <linssendane@gmail.com>
Date: Mon, 2 Nov 2026 17:18:10 +0100
X-Gm-Features: AclHuK--jr7yX0N51mMeigjqHQa3DhOtTsDC_f0Xm_ujdo1a4DNU9CY359A64s0
Message-ID: <CAM6_QD_ceOeoiv8HC5aH5nMHoisnAXGxMz6tRAbgmp3RD_4cdA@mail.gmail.com>
Subject: Re: r8152: RX stops until rebind after -EPROTO on the bulk-in endpoint
To: Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, netdev@vger.kernel.org, 
	Mathias Nyman <mathias.nyman@intel.com>, Alan Stern <stern@rowland.harvard.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org, 
	Hayes Wang <hayeswang@realtek.com>, Chih Kai Hsu <hsu.chih.kai@realtek.com>, nic_swsd@realtek.com
Content-Type: text/plain; charset="UTF-8"

Hi Michal,

Your patch works here for the simplified case. I applied it to
openSUSE's 7.3.0 (offsets only) and tested on a second host with the
same RTL8156B (bcdDevice 31.04) and an Intel xHCI (8086:02ed), 5 Gbps.

Without the fix (stock xhci, r8152 with only your trigger), down /
ethtool / up gave exactly the stall I see on the other host: four
soft resets about 3.5 ms apart, the hard reset at +14 ms, then
Transfer error + Hard-reset at ~270/s, and virt_state 0x40. So the
onset of my real stalls can't be told apart from a desync that starts
at the first error.

With the patch, three rounds of down / ethtool / up all recovered.
Round 1:

  15:56:52.892  Transfer error for slot 1 ep 2 on endpoint
                (3 more Transfer error + Soft-reset, ~3.5 ms apart)
  15:56:52.907  Transfer error for slot 1 ep 2 on endpoint
  15:56:52.907  waiting for ep 0x81 clear halt
  15:56:52.908  Hard-reset ep 2, slot 1
  15:56:52.908  usb_clear_halt(pipe_in): 0

No errors after that, and RX worked: the gateway answered pings and
rx_packets kept rising. usb_clear_halt() returned 0 every time.

The host that stalls on its own hasn't stalled since 10-28. Three
things changed around then: the adapter moved to another USB port,
the kernel went from 7.2.11 to 7.3.0 the day before, and the host now
carries much less traffic. However, a 74 GB copy at ~15 MB/s over the
new port on 10-28 didn't stall it.

Testing your patch on that host needs signed modules, and I can't get
to it for a while.

Thanks,
Dane
