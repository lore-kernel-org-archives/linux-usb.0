Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794916937;
	b=AFK6KuBqyBc4g21IZhIvcVdIo0AM6A76GMXQt+FJqjYhdBKnGrl5lyChF1+kM4pIPQG+
	 VzBZ1aom8k/ia6GbpU35Hn2+II3aYB/MpagRhptLYoUP6Zc80tmP+230Wp3UNey3WJH2r
	 9Aj+1EW1f6XK6USxWTyWIe7VnlJ/IOkSg1VaP88h2TgkjVaXg4rSGSjhc4OcaAAlInCOv
	 kJQPmLEPGz2ZtZWBbVZu+PNF4g/nN59tGTgNtOCFMPFc8uWwgqEIX1PBqIBHawV5MV1aG
	 Ei8qBvkfHzgjBjJHgV6qEdxkwPg3W48rY8s/rj/A6pCirhdiBnoomY9Jz+fu3EZKabQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794916937;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ZpBAZv/F6frjiYMr+e5uwax+5b55mYj5/5iqhQbyN+s=;
	b=ncp7tFYXrmKHmZ+dx6MCzzDkMXKXc4/YesgUvSsqGHmfWlbwfPzp10ehgzp3qYur2LlJ
	 S8J7MS+KAL/YDSsQN0/KE37TCGAhw6MK5x/DFv/5r3e3H6KqU+HIlvJnAhXvBxh9trNXq
	 B+X+IxfnwwntMKtXAsStu5skv9KBvytYT4aEhobdEbzweX3wX19ET7qADtnGGCC7Yd5ZZ
	 Sm/arDDhQNMCRWJXJRkUTYezcLqICQ7eryRiCzVe8rjx5up/VRhqEV+cFE97pP0bjjV07
	 VBlwb5EzQEVZ8lJ0P/9rSylhHUbAv3DIxDhbCvqciSNeaK7pE26eDgucK63kt3H3pfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EbXasSWC;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=PZhFrElv;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A0C606A323
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 12:02:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1A0C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EbXasSWC;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=PZhFrElv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794916937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZpBAZv/F6frjiYMr+e5uwax+5b55mYj5/5iqhQbyN+s=;
	b=EbXasSWCZBotZQFLvsE4A+KejrorEkLNtQfTcsXUtMvBB3jzD2phJUMzmfb3P9m467pJ4j
	97jrlmy563MudKrPdSyViDNIxshI0FO/wXaHXyazMThFI6HsM1riNwdPXCPIh9G/iWdRpN
	QOqwspLqskooRC+O1Xlv2Q6ltaVlNzg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-167-GI8vY9idPGyU3u_u4ZxXcA-1; Tue, 17 Nov 2026 07:02:12 -0500
X-MC-Unique: GI8vY9idPGyU3u_u4ZxXcA-1
X-Mimecast-MFC-AGG-ID: GI8vY9idPGyU3u_u4ZxXcA_1794916931
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-49205554e17so2793076f8f.1
        for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 04:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794916931; x=1795521731; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZpBAZv/F6frjiYMr+e5uwax+5b55mYj5/5iqhQbyN+s=;
        b=PZhFrElvvCkdnqpsSHsZ8xKH8YcgcG1AvrPKtpxehcC3VJVOoTosaZcbM+DeEaYPQi
         LXxah7qz2Nyfkr1oOkEOjKAaLDUDmqOtGnRpDi72a6jjNDGNXEKpE5+XQhyh1Gwc9euP
         DjhgjTrK13vPi2gmAc3hRySvlMXXJt8jSQZQf8ovctqcfGlXX8QzMy2eVJmo2MX/tYk2
         9VxoQMG5EAmr523P/uXnhiodxZTaj/9QwctKgGOLXkS9eo0LktbZ8+4LEobOTMefd4eI
         il6F/wgf0MBhPO+K5CkskwfYIA7Y4XW50E3NlikYy3iIth5WwwihMJ1EojWZVtJP6iEV
         SamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794916931; x=1795521731;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZpBAZv/F6frjiYMr+e5uwax+5b55mYj5/5iqhQbyN+s=;
        b=A25fNRT+JSWYVgsJhguZRw/7eHKHRK+2uVigpt6uBn4YEOZVDRVEPXt26RPvX85yhm
         h9iY7eMpz6DjJTXU3n3wQMrgnB9xCWva5sTWDaiJBQBgD4KbtS+ejc0516jHehzu71eV
         3bIv+Wh6zseW/BGLWz2Kt9xUxjCEkmhsBrublisxOan86X+QnG56m8nvlzuOvu4UkYIt
         x3bAjKfs+jcdDOf7E8OsWvLCTX+MbIsdGxMUeNUPcgmn7dvqHhTOsVuf4g7OcYbfeUAv
         Pwdn22N65zWV+D3m3lAZZc6R/mJwcxuHl0pz6sYLV1nu5tYTLjQRTC1pIsaPV4s8JWZZ
         5aZA==
X-Forwarded-Encrypted: i=1; AL+hErGKH3XWKj1v2skl8X1cAiIgtx0TAUNAm6ucO6H+rmkdLcsIcTcm3DY2El+FIdbxT4+mYlRXNXP0u78=@vger.kernel.org
X-Gm-Message-State: APuU4Z81LiCkBaDWGiJ3ZBwKjDFiqkjsTcFwpXnEQRizeUQoDA5Ujbyr
	DkzJuVnIG3okeT4Y5+zi4f2G1seTze3GpMDLzvHCsobbjT4jubVqjfMXQC1GVK/WhiLIAm5lA9w
	EUzvZgwwxBXymIjHxIeVLfO1Eu/sXXgtn4I27/EwGqu9vRTd7x0QMnOX7Ly2ZmQ==
X-Gm-Gg: AYBFou1HEk5LjVX3mDrq3O4Pv0298sKDb0ur+yi5uX7FCzZoHb1z8QBRemSOqx88hML
	guP0ABkU6p3F5wpmIb1xV9L/3vKURwdLSp3B6ZQS9t81laghitzERCgrqrcLjBxpfjgE5t60Ckd
	njO99YX0OCw7rkSvQMxbz3k0yqd6MXWEMCbHS2wVLmAnNjtNZ+P+H0J95ofet9QN5v0pLA6rSDI
	kMIKAM8ui2dIAL384mzCA2IRNBksHrjc7zlwm7oPH3RwEmzkr/9W6sJdYE3/vQbrVj+ZeTeXorW
	OpkuOSGxlRdZG67KEJEKTXSrp6R/9ODce7k0+xLca2psKjz9ME7BNO8O8I3jRC9DVrZnWBDHbxa
	r/GcQFKtlpkDb8GRMklsRr0pil2Qc59XF4uv8zQNCxkm5Z+anWwOmIkTEwWfpefZ3IHsMiiWgmP
	GipDqYq+xznGI8jtQn23ZyO9on//SxbOlB/kwGss+E1Dy+
X-Received: by 2002:a05:600c:5395:b0:49f:ce78:356d with SMTP id 5b1f17b1804b1-4bb55abba24mr291238955e9.30.1794916931155;
        Tue, 17 Nov 2026 04:02:11 -0800 (PST)
X-Received: by 2002:a05:600c:5395:b0:49f:ce78:356d with SMTP id 5b1f17b1804b1-4bb55abba24mr291238365e9.30.1794916930659;
        Tue, 17 Nov 2026 04:02:10 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a4dec730f7sm1974480f8f.11.2026.11.17.04.02.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 04:02:09 -0800 (PST)
Message-ID: <7c2243c4-8653-4c7f-b58e-7eba1e247cc4@redhat.com>
Date: Tue, 17 Nov 2026 13:02:08 +0100
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: r8152: RTL8153 never runtime suspends with link up on a network
 with broadcast traffic
To: Paul Menzel <pmenzel@molgen.mpg.de>, Hayes Wang <hayeswang@realtek.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: Chih Kai Hsu <hsu.chih.kai@realtek.com>,
 Birger Koblitz <mail@birger-koblitz.de>, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <fba64030-4f1e-4158-ae39-bc072bc5751d@molgen.mpg.de>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <fba64030-4f1e-4158-ae39-bc072bc5751d@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Adding Heiner; for context full thread here:

https://lore.kernel.org/all/fba64030-4f1e-4158-ae39-bc072bc5751d@molgen.mpg.de/

On 11/11/26 01:52, Paul Menzel wrote:
> 1.  Do the RTL8153 and its successors support ARP and neighbour solicitation offload, or wake patterns, while selectively suspended? With that, the driver could program the addresses of the interface before suspending and keep answering for them, similar to what Wi-Fi drivers do with the ARP address list from mac80211. No new switch and no loss of reachability would be needed. If the hardware can do it, could Realtek add it or share the register description?
> 
> 2.  If the hardware cannot do it, would you accept a per-device switch for the behaviour of the experiment, off by default? A module parameter is surely the wrong interface. A private flag (ethtool --set-priv-flags) would need no new uAPI, and userspace that knows the network configuration (systemd-udevd .link files, NetworkManager) could set it. Or do you see a generic interface for a "runtime wake filter", as other drivers that runtime suspend with the link up would have the same problem?

This is IMHO borderline, but I think a a private flag could be the better option

> 3.  Is losing the first frame that wakes the device expected, or should it be delivered after the resume?

AFAICT loosing such frames is acceptable.


> 4.  Is power/control=on by default intended for these adapters? I did not find 0bda:8153 in the autosuspend lists of systemd’s hwdb [1] either.
Other questions are for realtek guys, perhaps Heiner has the answers...

/P

