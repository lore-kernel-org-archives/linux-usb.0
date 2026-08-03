Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F83B40315F
	for <linux-usb@vger.kernel.org>; Mon,  3 Aug 2026 11:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785757161; cv=none; b=iR0ZniwRccyEKvNTczqCacIORJNLJDaRPhGXnsA7lxoB/AXCxK2ctjs0gdls+6EQDPVzpYIT0eorkpq3z6j2ES4puTk4eou2sGdQDT7p3r2tTI/dZ4sAddFCSorym9xVf1buBDR9LpKclhs7hGr3haMoF0KfJw+8eO5aJYRWFM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785757161; c=relaxed/simple;
	bh=CdfWodirFgw1Ed9n5sstSXJyDj8AhHM/oa+p0Cx4vOg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=nA2pD0xZtp2hBz2a6/9XNUFafTZjllGNX7JjA9nlZUmQg9tv82XeziudHjW3/111+xnSCQ8K58OwVinDmoIJSUw6y7GADOLYLuCbSs3ZmF8/wUA72QRGP0z+yLCz2EVi6yOjJX6JfdakEVuPFqqG6dOAe6+TREmcE9lafgJDKWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wyliodrin.com; spf=pass smtp.mailfrom=wyliodrin.com; dkim=pass (1024-bit key) header.d=wyliodrin.com header.i=@wyliodrin.com header.b=QI5HPf7U; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wyliodrin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyliodrin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wyliodrin.com header.i=@wyliodrin.com header.b="QI5HPf7U"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4956869750eso12257175e9.2
        for <linux-usb@vger.kernel.org>; Mon, 03 Aug 2026 04:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wyliodrin.com; s=google; t=1785757156; x=1786361956; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WJd2b+nAhn+22H9JaMbhByCLa4f0+AZx4UQqq+PPVEI=;
        b=QI5HPf7UGqkEazzVR+7a97M8hZb+npAuOjr8fsjViJjeSSBTrtqdIY+SyC+PKMXyMj
         S64Js/QIlFEBXTSTZhTb1lSuwX4tcjJ3U4vJX3tRBkH4PktyWTr7N3mSxhei7w8MneJ2
         7i4FdUxdUeDeEXreaSvab5h+Th7uOPlrtgaqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785757156; x=1786361956;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WJd2b+nAhn+22H9JaMbhByCLa4f0+AZx4UQqq+PPVEI=;
        b=QKACgrVk2Zrh9iFAhPt5SzavHr99hazEEepc9YbPnRO3jnFp7jK/kJgOPmjk7HRsrG
         iov9kP7qWLGksmGcftUbH7NcOwxiTYbvszohCnNKwnSwJdOtrZgAElk+2nFgWrMZNkfd
         8nFCHzZi+nU5qiqmjpA+pOnCykdcfcp/Gw5coLxG6A8WOf3BlVrEtd8lyvq+ih9asM6N
         MonuIZHN3iiokqsS4ERVEgxvHGXV2ppQLyGGMTfF71vDa1m/d6tQqW9JLSbOg40/74B/
         muReZ1YBnjC8e6vTlzDGzBE++zifLomW9kv2iUVEkMiSdkSfOC/kUGf5rTFEI110SQLK
         z97w==
X-Forwarded-Encrypted: i=1; AHgh+RoCQCezMqVzXmt6f7MtO+g3LUSVyk/r3Lpdi2TWnjPGfWeHjs1lkklRqTRFOA1+2HAzoHkFu5a3bcI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvtEbdd5H2XBTmfwdkD7uD4EzAy3seq4uSRzS9FjGIxHNzsoNU
	QEhtj/V6qWMjcIeo4LURImdM6u+Tyacb89lRk5GulBEZeJcTEuqKJrstqlEsckLwQn0=
X-Gm-Gg: AR+sD10DSMpXoG9XtCank4G+ag8/F6YDZ2QD9RDtKMig0ZdwZ/NJQg/q6YpCrAbzwdO
	YTDxfy/87NZNtKNibdNkckv1i78Eg5o2Ngj9m8pPjv71D238BVodXGQN2unQ2+zFHtsTc+0nhab
	POI3ltn+dMRCfVCLM7VWLYScgj2WsgcYsZJc7cZbVgcuI6c8swGsSnEc03jfsk2JGanx4BHwMgG
	EHLRLJIBe63yAb/fMzqLPssPOf+gwrM32lhWF6nJ50HEwvUfptmgZgtTJAaI+i7sT77v71eFVH/
	aPrI7LuCCd4omHYIG+dU/anzDqAvlZjc+JQZKbix1cOzyafRfBD84Jpimh1tsF9KEwygFYbUhC9
	HpZrj0B0GewWSvJoVMHoU7SfdO/ojierZU+0IZV9YHv8C6VauqnRXGTusako3Pw2DiWho6riQMH
	TUlybD/T8oEX8HHZP10XOUEEAYkt30rnhxXX35LM9IJtjhaIHDdv5fYlXreSHjZrkHKHV+8Mw1h
	ln/4InHlMYe6HZtdho0dKHPHoXSUtUlIg==
X-Received: by 2002:a05:600c:c8c:b0:495:4589:707 with SMTP id 5b1f17b1804b1-4980c6452f7mr203906995e9.5.1785757156437;
        Mon, 03 Aug 2026 04:39:16 -0700 (PDT)
Received: from localhost ([217.73.170.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41e2961sm35814991f8f.13.2026.08.03.04.39.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 04:39:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 03 Aug 2026 14:39:14 +0300
Message-Id: <DKFA2VDUIJNX.2UAJMD907F7TS@wyliodrin.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH RFC 2/2] rust: usb: add control message send and receive
From: "Alrexandru Radovici" <alexandru.radovici@wyliodrin.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Alexandru Radovici"
 <alexandru.radovici@wyliodrin.com>
X-Mailer: aerc 0.21.0
References: <20260801-rust-usb_control_msg-v1-0-655bb444b52c@wyliodrin.com>
 <20260801-rust-usb_control_msg-v1-2-655bb444b52c@wyliodrin.com>
 <2026080244-ability-education-535f@gregkh>
In-Reply-To: <2026080244-ability-education-535f@gregkh>

On Sun Aug 2, 2026 at 11:32 AM EEST, Greg Kroah-Hartman wrote:
> On Sat, Aug 01, 2026 at 03:01:08AM +0300, Alexandru Radovici wrote:
>> Add `Device::send_control_message()` and
>> `Device::receive_control_message()`, wrapping usb_control_msg_send()
>> and usb_control_msg_recv(), plus a `Request` type describing the
>> bmRequestType, bRequest, wValue and wIndex fields of a setup packet.
>
> Why not keep the names as close as possible to the C calls?  You have
> switched around the noun/verb use here.

Sorry, my bad, I will rename them in v2 to `control_message_send` and
`control_message_receive`. Thanks for pointing this out.

> thanks,
>
> greg k-h

Alexandru

