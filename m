Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDFA42A170
	for <linux-usb@vger.kernel.org>; Mon,  6 Jul 2026 09:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783331148; cv=none; b=lyQ4jj2KFfJJ3R1gwVjb4TFQ0lFwkgI9Tx2I1NyimdirG3WxHX3+fKvNpDActWThBQUPZxeYHnl5VYnE3ZMWEBzN828XMnzeYa3DnmK1W3RJH1f0cksbrrcN8I6UPTD0FS9+6aq9Z2bRfvSaI60PjgIImKDyYFDE0nWM6oi9gQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783331148; c=relaxed/simple;
	bh=z4ME+i1zwbwk/OvLpxkjwkYtIu4Ubp7pj7q23hgveLc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gl9HLH1XTnD10lap7zsabp/Xl//QC/d8QPaqrCeGtdBmE8G45jN0tTFlQjbMHk2tOFgnzhjtfoqw8X/f29NDNfnGu5B/58CvwViQMYFUMkxJikEd4f1w0PTkTJcxvcZZ0KOeEtRgzLDTQNeYAZLtPi1dgoE4s7NM0hIzSYCP70c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cbDdMPMl; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cbDdMPMl"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-46ed4f66256so2562317f8f.3
        for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2026 02:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783331142; x=1783935942; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bfNeQMc5HHOHbeivRIaOAaMk1zlvUrisd/hLb6wkCKs=;
        b=cbDdMPMl+Kq8222YH4wo77Fiyxnrq0vd0jsudkqQ58UaonzsAKg75/hhRsQjK65BK2
         MruVztF+HPdb7KsUczumHe7tQssHveCG/LourN7F0j2RdgNMxVbHza2ttF5RPY1PNbGx
         n43VxqKoUxE8nlv9IHfAHwUEH9V3T/HC6qPO67OLQysNXsb8H7q4qZ9djNM2MN6i7A28
         iEpJFB7nQ/2Hr4c3BjXxDw0Ma3HDchvt3l56KmrzJmsSATUw5oUw39FPBRFz+Vg8eccE
         Dbv6LqANmhAAOFFcJtK/ayy5F51NRZLNI+tRr0mwvutzuIF38XXyc9MuAht/IyMbl/z7
         VB9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783331142; x=1783935942;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bfNeQMc5HHOHbeivRIaOAaMk1zlvUrisd/hLb6wkCKs=;
        b=G4UU7YBh8VEZsasAZ/1n2VM7f20In1F6JZE71e9J1g1sn20upHnCYyt43vKHjdxSgY
         1SsaDkOHkTJQm1eyhGIMQuWgK6eF2GARjEiFxD+d4UDnBd7ylzfDwibXWYw5OQHsALIg
         xNo2A5t/26jX2COdVE9JgRsqOQV5xlBBBTpPsrMcwVbHT4mXnoe5XIUyxBfo83EXUo82
         PYYXT0igUJkQsBaPm2BlhD8/FIOqQwbg9W1ImpdX2iuKBsHZCjoz4mS7bqF4F9JuQ6FS
         xdzlgaXLvd6m6ME6d+wIv72YJbISShArOot/7mb/eyyOnwv8GJPp6VkvqVJA2JeOCGlx
         QIaA==
X-Gm-Message-State: AOJu0YzfAA0ecOaenR3VGAArrrYBMP1ZZ/JKKzotQmZHKn5cpXsicI5r
	9dfBKZadj2Peb0K9M9Ns9LzZHoajDc5xk/Ucb26zi3h9r9ev+LZa6BuQWNR6sw2GKZA=
X-Gm-Gg: AfdE7ckui2oG3X9G+wkMgVOeaLgrmJsoEUz/YsnACwdWJKzsYS5hrTLtyocAFV4Rzbj
	m45ovgK/drpjUByFf4sGFjGJO8+QH90wVdgQiZ/vsuzGD73BIgGMW16LU76TfT6kIXp6oPidgca
	urSbsPfSKdM9lXww/F1pn82jHwbq4QfboD88ggjC+0SJm5Qu+flbSySko1RgiElz0sBAMpLUGp5
	YhvbyeJFGaZTXAfdLc3ozDQDga/HVU8uZAA7UmSt1I4xRrnvVlVw+LRDOVKO+M42MWKLny3aotD
	tzU8Cq24vAhTx3RpDGyhcZfCtmqIglh39V774sutNwWLUY63wUeUfYv86eucW1ppH0qzd4IPkVU
	/cVzTKZvsIrbMKnPmxyMejBF+ec04pCaEJ7A1moOAhgWM4ZMhI1bl1Vmrk4k1i4FoBEoHyAFD8o
	LFZkkBc8sLzGhJGLs7Ha2ouBaC67lX1tMGFnfuiIZoFIpNs3pHvFfHNbQ=
X-Received: by 2002:a5d:490f:0:b0:473:b63c:8a21 with SMTP id ffacd0b85a97d-47aac2095ebmr8664733f8f.18.1783331142538;
        Mon, 06 Jul 2026 02:45:42 -0700 (PDT)
Received: from ?IPV6:2001:a61:136f:7201:4a82:7cef:c61f:a3f3? ([2001:a61:136f:7201:4a82:7cef:c61f:a3f3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f213e8sm20582902f8f.34.2026.07.06.02.45.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 02:45:42 -0700 (PDT)
Message-ID: <fddbeaed-ff21-4962-b09f-d975c96cd926@suse.com>
Date: Mon, 6 Jul 2026 11:45:38 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 10/11] rust: usb: keep usb::Device private and gate
 transfers on Interface<Bound>
To: Mike Lothian <mike@fireburn.co.uk>, rust-for-linux@vger.kernel.org
Cc: linux-usb@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, linux-kernel@vger.kernel.org
References: <20260617145946.1894-1-mike@fireburn.co.uk>
 <20260703030020.2694-1-mike@fireburn.co.uk>
 <20260703030020.2694-11-mike@fireburn.co.uk>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20260703030020.2694-11-mike@fireburn.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03.07.26 05:00, Mike Lothian wrote:
> Address the v1 RFC review (Danilo Krummrich):
> 
>   - Do not make `usb::Device` public. Writing a `usb::Interface` driver should
>     not require naming the underlying `usb::Device` (cf. commit 22d693e45d4a
>     ("rust: usb: keep usb::Device private for now")), so the struct is
>     private again and the device-wide transfer operations are exposed on
>     the interface.

Hi,

I would say that this is just conceptually wrong.

1. drivers talk to the common control endpoint of the _device_
not their interface
2. drivers ought to be able to set a configuration (That's a device property)
3. Drivers need to be able to claim secondary interfaces (we have an API for that)
4. Devices and links (and functions) have states, not interfaces.

These operations operate on the device level. Hiding that fact behind an
interface (which may not even be accepted at that point) is just a layering
violation. Even calling a device reset through an interface is strictly speaking
wrong.
We even have a driver that can ride piggyback on another driver's interface
and use only control transfers to endpoint 0.

This patch is fundamentally flawed because it operates on assumptions
that are just not true. USB does device level operations. Just drop it.

	Regards
		Oliver

