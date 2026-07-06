Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA941430CE1
	for <linux-usb@vger.kernel.org>; Mon,  6 Jul 2026 09:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783331272; cv=none; b=Fg/kEhvff7ilGg60hwE/FUz0bRwLjOrwE1BhtbkHjUmC8tcp/mgiYvps/QNBJnG2V7eXobOy7fLzGqZvXSg3Y0JG1PZdltwebMiYAIHUT7xR37JwJ/Dvn+IbryYAFhRT1Ji+WjNj5C2YXNAMS1dKGI3JdqIUAKKu3janDvwILi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783331272; c=relaxed/simple;
	bh=D2BNJPxvq5thXA3AEMfHup29jkERlBHJxKYnRI3a8uo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u72SYhDczyDDVKMHJiArdZxLB+QbXsf2MY8P9/gSoMqO++YqM2MiQZChPHBcKJCIHRxbGnJF9Bx64g/SUxrGgZQQnRCoQNbie5UIA2WHzE02n8x1HopFHIsI4nZHppacYt39UMszMOIKprQApJQ8HQFVfEoX8YfGzGqOo1qLYDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FkzL7q9p; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FkzL7q9p"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493b779003fso13716295e9.3
        for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2026 02:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783331266; x=1783936066; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4hhuJuMJe9nSKrMMzfJ8+GyPLHWWUVbJ5xDdEwOzMhg=;
        b=FkzL7q9pCclLkErL25OIB8+uIJOo85bbjUoGfDi7qYVf5D+Y5+CYK/8vWtxkkEJnIO
         0WgVNoNxWPNNaWTq09nIoyT7YuYrMu/PxMeRVoa2r1RTqpMigmcr/6HTyxKy/SFJUsXF
         Mc4hxGo90HwESHIPaf5fvs3g7gycwZ1BXYJMfdjLCAKy4p1zsRaMMV46oNFpwScujsJy
         K3xdcGM3XiaX/YLJkq8r8NNevb97GS+yYIddc9IoVaAZ7Wkln0YblyZwv2ntPfBO0Lpt
         tjNhbb3GofaQknRly6AdvZwAfeHv0W8DopcOPaP+tmuNAMi7A53cr7ius3vtjYhvyzVe
         eTNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783331266; x=1783936066;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4hhuJuMJe9nSKrMMzfJ8+GyPLHWWUVbJ5xDdEwOzMhg=;
        b=J7pxmWSBiwMdnIQ0xMtzTeH67oU5NDsVa2gMdOnTmmNwv8qjy4SNqf4iAZLNQPQho8
         tcybRHm+JWUNF86jZalF/bXXAl+bT7asYUDGilCxeiuqAhCxzcOlBsyih4hW+qebUoyO
         /bAlysD9H1U8AOxykFOHL0IWgbMTMq1elB4gbjztEpd6d5mHVVwbvOnYUAjLVBShcRPJ
         m3vAqirBwTJ5/WKN5OnUzQOR7dbCscB8gaSzFyxw2amnOjxbiKkYkto4y1c/gPP0EJ5T
         FgqtkG4keUT7QOTgtTEcy8P5sD5Tsy7TzNUo2Dh4eO7yCj7ZOp9cPcjDqZS2pHvmiEtC
         Ww4Q==
X-Gm-Message-State: AOJu0Ywkk3DBjlaCbeD+A4rLpLA/5d/N3um1E/TpnBGg7MpJKVoIsMdF
	8SC/e9qvLRbWEAeqKTy1e3dopMsbNdOJK0ikBDPrMlBoBwstchQQ8sZyrQyJS4RWOiM=
X-Gm-Gg: AfdE7clIoSUMV2F6F3Y4UafCiMSAoshvaxivIW9zMf70g+dfqNtGcD5HWyXQAjHgYl0
	2lepeVC0hvcjg6Sn7WnR8tbNizJgZygzzDPjnKnYVmObbj1dENukrxc1rkxE1Q1l8MMWJ1dG1WV
	CRTUYUf0OVsdel3GdIStpP4zwPWG4FQekvoD5RN7kEZ1gBZ1++0hMSTTG6FIoz3zpedYGBBZd13
	srum//h+Wp4iD0MAaX7PpQLqZAPleCj5Oso4dq6Palvi6bjAoos6lOl6uAghOBYnTvR28x4oK3S
	DsXvdUEo4pLLNdoILxy5giDUe1Ma9JuAGkXHMQZ3s/ivJJ4LAWXH7kVHiBHV5uZNxzj3qDr3+af
	ix+cfboBAmKms12py7oZSqiNkRFUcq0wJDqrbzjAUeUUkptYtSRRSJCNasdzbC0mRUlK6RJCouJ
	QLmhDSUc3lHaGUKxM5TdJwQhdjw41jlFamDDoZryAq2glQgoFzDaYZDzU=
X-Received: by 2002:a05:600c:8b6e:b0:492:66fb:5dc5 with SMTP id 5b1f17b1804b1-493d11f326fmr107259495e9.24.1783331266628;
        Mon, 06 Jul 2026 02:47:46 -0700 (PDT)
Received: from ?IPV6:2001:a61:136f:7201:4a82:7cef:c61f:a3f3? ([2001:a61:136f:7201:4a82:7cef:c61f:a3f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccdab27dsm253380765e9.4.2026.07.06.02.47.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 02:47:46 -0700 (PDT)
Message-ID: <d53a6525-55bd-495d-91eb-4537f804a74c@suse.com>
Date: Mon, 6 Jul 2026 11:47:45 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 11/11] rust: usb: let drivers choose the transfer
 allocation flags
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
 <20260703030020.2694-12-mike@fireburn.co.uk>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20260703030020.2694-12-mike@fireburn.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03.07.26 05:00, Mike Lothian wrote:
> Oliver Neukum review of the synchronous transfer bindings: a USB driver must be able to
> specify GFP_KERNEL vs GFP_NOIO/GFP_NOFS (USB shares error handling and power management
> across a device's interfaces, so allocations on reset/resume/error paths must not recurse
> into I/O). Thread a `gfp: Flags` parameter through bulk_send/bulk_recv/interrupt_recv/
> control_send/control_recv (both the Interface wrappers and the Device impls) instead of
> hardcoding GFP_KERNEL.

Sorry,  I did not read this befor replying to teh first patch.

	REgards
		Oliver

