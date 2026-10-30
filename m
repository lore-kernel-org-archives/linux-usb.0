Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793361940;
	b=tYQqYYypnXlC7u4Ef4+O2XjsUrc5LSgqukWnmeYY0gIJIbABGBIpNYWv3/TIbkPdLpCp
	 eJGsGMxgIo41lDbJGw6UvFhl/ByNyAQplricYj0cJf9XmmCyO1MIfmsFhmmwaNMjOXiVG
	 Vx/MD0fiOEld7gUjNQ+0dkgr0TidvSKxeROQN1NJPpPM3mBfbILeUYQvP9x2bl3oKNakG
	 fiynkv5VXQ4wVkpN/pIGW2BunzPcDNTV4QCNkaEe6gIdns0mA4roZ1SiTVnxes5I4zybm
	 kuuL5HTwwz32+eWncv5h2YPrg1QJ7aJUPcb3CzJE1ZyzmuZFS+kbNKtCU1OGqozCsEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793361940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=jr3UzJy1RXD3EkYxBH1h5gaWx4Lr73w+qKlc2cURMHI=;
	b=uCadWfuqGrRG+Y8W+B8bQDudzI/0x8rbOGy79OMmWyEWxaOY1NenCfETEQoumoDdM/p7
	 gcyaCLwWfPu6smfZEnwEyI8Q5vkqvtd7XJDY6gpHAthIhgQPxufAtwcDPzzUHCSKHQsa8
	 XHwuyklmmgPY2N6CByCDrw6F7mNuzmbJbtpK6E+8LJOke4rbS9cDrEHR6rNoSoe1hxL9p
	 h3nq2nPY55Q5B5LA/5LwA8HOBOh2zgXjFklH9CUAaIp7RUiPH3vnNdeumrhPBYDuTWIY5
	 Sjk4fwmLFl/QLTmvCtVn0UX2KNdy5smYj7smIGbq1/Y33bZ2vaD/P+d11IkO1PyiwGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ze77JKKE;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC17606A33B
	for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 12:05:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CC17606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ze77JKKE
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso5378495e9.1
        for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 05:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793361938; x=1793966738; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jr3UzJy1RXD3EkYxBH1h5gaWx4Lr73w+qKlc2cURMHI=;
        b=ze77JKKEWiHNv/3wUe3+kllH69SXgQ9VNhIUs9AWsGI0GngIkcgYaUugpkQR8x+Noj
         TI7AR3ke4J9NV0Axe8r2S4Zmp/+ylYYGN7Gq5QY+RTo3u9Swjf2dLBRMtw4xUu92gV/g
         EyFf9iSDpZZuefcN3RysFE9Rybl+C1JQnal+VgiugGe2v9T1EN0Fydz2z2tmna6n4e8D
         G+bV9FOgZ+hmsryhcLwrZICYEShhAvBidcqdQbYT9KVoVKPf13a7E9NK/UOl2OrEG9De
         jEMq5FyJszANwvhUoujwG7Cx1bxJ3PpZwRu/XGKabA2u3/1439gVdbGmq4qfJTmR2WzE
         9TIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793361938; x=1793966738;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jr3UzJy1RXD3EkYxBH1h5gaWx4Lr73w+qKlc2cURMHI=;
        b=md3xAKL5mudm7g8MDt+1sPBQIwj/WZqb3NnzFBFZuPHOEtwRS0urEFV0aUD3sqI5ea
         9Y82jHNyW6A76Zn+Jj0MdVWNm5TCIULpPJa7FKup4LrnMW79PYPuBCcE6VYLq+cR/DtF
         8ugOmVIz4Yn3fLCIbn4aHZahCzqH3QZnqRsni54JQGLMrD1BDDOhqSW4xeLK4rRTh/1l
         Zx4pa5lDA+Roib381cKGygRwgP3Es7joixeu2XTuWgR9oPz12UBvcHSWFkJbFmxu8iUr
         w7xRnC5WyIZQ+Su3hlspBGD2iFlEPVZJ+FCOlUsHC0/rqS4+SDCTk8vL8Z0f8HSKWo6J
         Qvlw==
X-Forwarded-Encrypted: i=1; AKwUvByZqb3tgxuM7zgX6367mx7mplv5e2Gt9QJyi2XVwSbhxBOJmjvqewTtrOE9ewUUM7y9H01Ftui2Po4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBjolzk18eqqbnpFg7k7uHsTg3Sys8n0Hg4VzPh0DRQFMcNSD/
	7U4K82r3lLuTk/ABDDTpk6KXgpxfJOkM9+VkKITdATYcCJjm9pyHC0pL
X-Gm-Gg: AYBFou3hg7kCw4CVE49/eT8Xz4ZNUNxBNKvqiJOkMXS+AyjB0luOijrJYmOiuDpoRPJ
	kB4zSnPTbPtPGkpX5n+zRLyMZLbwakfWFhVGH9g0fLMBwNuVsZ67yBfAR8VpOCypnxtA2OFdvf/
	rAvFgECp0JepOK0FVJbuUw6UDEAR+Fyr7RQQ+ilmTCyWOQbeRjIcRjGKyZkBl6sEuqV45PdrWvN
	APcqxDSoJ66XA+UiWAz/RULVnbZfADK/4xVk7km9C8VfeEyIH5e8kkNiYnx1POvxJiNafXqIrGs
	LZCTTDe2IN/vn/lsl9O7WSMiyftZL5yZfNKMfvMX+LeCGmsIxOjUKV08vuyQFBeMaS1TXNcMsrn
	TPBEqQl6DxXjll0QEj3V/ZmJabeOgLGM27m+gYmMhxDk12hPgfG8Ao9jWL4TlCla+aoX+VQ1tDK
	nitupPa4K+Jnkz3bFY085PcIosuSOW+qUzzn7DEPjA5it2Ss/pvwrb3GKCn/99GzVL0apQjJk0g
	ZH4I8ESPdqJzuZu0x837sHjhXtN55cvm9Dyzgi01VD/vinPridcopaf0f48SZ5aBnIrFfNQHR74
	wmAIC4eVgxx0R+k9ripHpXtDaRNsjq9HdUc2YzYYH8GZFmhHMfraaGOqimk=
X-Received: by 2002:a05:600c:5397:b0:4a3:5991:719 with SMTP id 5b1f17b1804b1-4ac1899353bmr43628725e9.31.1793361937662;
        Fri, 30 Oct 2026 05:05:37 -0700 (PDT)
Received: from foxbook (bgu81.neoplus.adsl.tpnet.pl. [83.28.84.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba24f6sm2853609f8f.51.2026.10.30.05.05.35
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 30 Oct 2026 05:05:36 -0700 (PDT)
Date: Fri, 30 Oct 2026 13:05:32 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 regressions@lists.linux.dev, Yiyu Zhou <yiyu@yiyuzhou.io>, Dennis Wissel
 <dennis@dsine.de>
Subject: Re: [PATCH v2] xhci: give back TDs and clean up ep0 after
 disconnect
Message-ID: <20261030130532.36a75025.michal.pecio@gmail.com>
In-Reply-To: <f362a385-e1d6-437c-a31c-fbf4414fa0f5@linux.intel.com>
References: <20261029204324.658845-1-mathias.nyman@linux.intel.com>
	<20261029204324.658845-2-mathias.nyman@linux.intel.com>
	<2026103009-handful-labored-d1ce@gregkh>
	<f362a385-e1d6-437c-a31c-fbf4414fa0f5@linux.intel.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 30 Oct 2026 13:05:16 +0200, Mathias Nyman wrote:
> > And sashiko seems to object to it, is that response correct?
> >   
> 
> It does find one potential case where this patch does not fix the
> enumeration of devices that disconnect during reset.

Honestly, is this 7.3 code being fixed here reliable at all?

As Sashiko points out (and I did before), we are 100% at the mercy of
hardware and USB core with those "connected" and "link error" flags.
Sashiko thinks that we may fail to clear these flags in some cases.
Is it guaranteed that we can't clear them prematurely at other times?

If USB3 link comes back after core has cleared all status change bits
(brief disconnection), we will get another Port Status Change Event,
observe the port in "Connected/U0" state and reset these flags.

Is it guaranteed that core won't clear change bits until it finishes
disconnection of affected devices so that all URBs are unlinked and
we can no longer run into those HW bugs anymore?

If this fails to work, it's another regression vs 7.2 and prior. The
old VDEV_PORT_ERROR flag used to stick for device lifetime. And it
could have been extended to all disconnected devices, not just the
one directly attached to the root port, to fix disconnection of whole
trees with hubs while avoiding the above race condition.

The reported USB2 regressions would have also been avoided, because
old code only applied to USB3 ports and there is no actual need to
generalize it to USB2 at this time. The bug still affected USB3, but
it seems nobody uses USB3 devices that trigger it.

I suppose I could fix the Renesas disconnection issue which the 7.3
rework tried to address with an alternative patch smaller than this
fixup, provided that the whole series is reverted. The preexisting
USB3 bug would remain unsolved for now, however.

Regards,
Michal



