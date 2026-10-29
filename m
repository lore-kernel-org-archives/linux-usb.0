Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793268460;
	b=rt8igQZX5ghvbZYdsnTfyXa8JB+/EeRko4DQfL1x0kim4gpEmkpEh2Omv0uJzVlBvLNK
	 nLIFzdZWNyANLaRJjPgI2DGQ/z1RGDk/NayI3xZ9+PrWT5tBXkxk6drvAvvtmmEb/gwTn
	 rrQCa1zgOkxXvd8fE1f6MdDuBAVwDkzRh1JSu91tjnMa/MfOqTgzSt5ISjG7Kd0pZLkg3
	 S2ct/F5ipGvGAY3Y/RjH/aEXpzZFE92WHAk8Xp4vRd7sb2Fhk+RxQ2kZBdgJhxIMrwsQB
	 E+tT+8gWo44OIM7gagdV/R0xI5rzyxr6shgpzwsmYxvnEYtQPWGuFe0hk5v78bGKYCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793268460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2pI/j71t4VuCaLXQJYxfTinJklKy3KjSKz/+nzofH0A=;
	b=pcWs3FnB94q9zmJY2mRqhhLXP88HX67bNw1H7MMlDHLXNTbNuxmRotPCHnapHfxLfNhD
	 A5nOkq6lv97c7EaUk1EY11jzmjYkp95M85vPUgO+FMNl0DbHJB7y19sSR1FLhGx2eSvQr
	 HVdJf+sRZUDWqfjY20F9qDqcj8/thOFM/0qKpfq4BCUsn4+w4w1imU06F2O0iMrGgUPMh
	 3FzkETNmCZDlkVbxosLW1opc10VOI5C9iRV6KJAn+ZGQ2EHD1+HPK0f6qz9+BSywNQaN6
	 QZA9mmrkFd745x5CPZx3yTRyjqQE6OE2tfmKx8SUNGhHdsy0trK/yVO8VIuEo32XzfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fireburn.co.uk;
	spf=none smtp.mailfrom=fireburn.co.uk;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAB4606A31F
	for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 10:07:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BAB4606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso13318095e9.1
        for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 03:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20260707.gappssmtp.com; s=20260707; t=1793268452; x=1793873252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2pI/j71t4VuCaLXQJYxfTinJklKy3KjSKz/+nzofH0A=;
        b=N39LkpF4plrPg0Obd2SDQHqZDbH1N/plfK8Z4waFl06uhEx/mPRo1bMz2Iy0PUEEkq
         bRHoiAPI3uVCv/t1Hr506HXglkhKmiRwwYik2zjiXRwthNUNy2b3iSlP9bO14+f00W4p
         WyNqwLLyOMQhapQa+piUIp/eedHDjD4w9EE4QBOPNFir0TQN1LOoqQVywW2FWTl3f9hI
         XVjoNUb8m54Jsjy9pOnhDlxs0JD1QwYk2RVf5a4im8u6eiqQUjqPmEReLoIZzlVCpszx
         SPy+kZBGyh49WJd8XIbuYiCxOASRW8j3anS3qp+/VYPG4ZoZBFWHtZ7nb7DtDhKvJpn9
         XqeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793268452; x=1793873252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2pI/j71t4VuCaLXQJYxfTinJklKy3KjSKz/+nzofH0A=;
        b=p9zD3CaL0g1MurEMDsMsKKV73W6/sDkSIvZvxYifMZU8phHwdAaPNC/wfQtJQHvTQv
         mIL39H8ZRnMphqeDU6OUpM3Fz0pVSpyw4XsIn8zpyEzkq9HKWJT/wtyKUM9DAowijhCw
         E0A5jDsW/Aw/ArGjFEQVhVVBq7CTQ7kDGOdr6voXCU39CxE9bUVDlbOQPIvwBog2+TPx
         azndKk8UYTU06q1I33a8BVWFAtaoXOhwtsI3i+0Z3pIZ5ipiDEpX8xJAbgI4w3GKZ8oG
         5F4hSsYtImC0Ao3wceTuKj1FZcWAGxKTMWqSettYwQk7tDpWbUiMCZFWxf7epZzv+3MR
         kz9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxR9pc5ld7A3iyRUfsqny/DSK4+jwOBKs9C3w78QhxMwzx2ftjY8lzJjfdjNkAUYP7UrXNSN2xPRQI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLeZFvCH5HLc3xsnnduReCsSqbeZJ2F7Q2NbC3faa19Oi30pnT6
	5BcpyVCtwjl/++/FZd1N7B63A6KpeupR7P3EluUnrpaUev0EFu7tYDkKTQLN38h2lg==
X-Gm-Gg: AYBFou08xuZNOQ2ltCD+Q24ilqj/MN7SJn5Ac7AIKAipT3OifBo2vquFv0WiHhLrpKO
	ODweW9nCZvcKu9uVW+vg5Mq3RpEtzSJAzukNmXpAJTtExpIho0UMnqA5OEr4XUhoyO+o/rRGMo4
	4E4hdOqUT5lP7zOmR9hE3PjyE3SDAM+t8LLKqwbYzUXtSxxZkrihX/JoBy+2kNHhDcnN1tNvUBz
	fe3ang7Ph4wRSreT6XgYVVu646Z6UKGZLNRfodT/8XVAnG+t24XNIm56sZjHYSV5t38sQcy8A/i
	TLVW86Tb7SXV1fS2cRzbxHJx72tfhH0A6fwp9cnPRRXQWMXUGxHTdKFXfCtz/Y8iSJHz63UtDve
	VjQH5TsS+IS6h0Kh0v6yaE4cT5kTtDsdzEwiQWVIWJLV9ukgPzYzPMSyDLQc4mfUeyHMJggmXmL
	u8DhdBHNf713DjZq+N8MWl2/DaKCoZLmLB8/+h6/weY8ehwLW5u4mDL9p7Er9jYCrfQpCi5soX8
	8rvHvVVskE89a5+GFvM52ro2eCLunhVMORkBdurEL9gaLFRvg3pcuEwz92+EHpXYctSqvxqwfLm
	klNpHK26x1SplmW9W5Tb7c7ftNH85N/+d8LDIS2qRZJdEZ3tQXGx8RBWIq7fQ6Hv1c98znGINTf
	Ww5w1ZjC2YY6f29VNanbbqg==
X-Received: by 2002:a05:600c:3146:b0:4a2:fe11:9a8a with SMTP id 5b1f17b1804b1-4a96552d0b9mr101086605e9.0.1793268452134;
        Thu, 29 Oct 2026 03:07:32 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm11425165e9.12.2026.10.29.03.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:07:30 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: Danilo Krummrich <dakr@kernel.org>,
	linux-usb@vger.kernel.org
Cc: ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev,
	gregkh@linuxfoundation.org,
	oneukum@suse.com,
	stern@rowland.harvard.edu
Subject: Re: [PATCH v3 0/5] rust: usb: host-side abstractions for a bulk-endpoint driver
Date: Thu, 29 Oct 2026 10:07:23 +0000
Message-ID: <20261029100723.4160932-1-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <DKZ34IA4DZAF.16BWFH4JPGROV@kernel.org>
References: <DKZ34IA4DZAF.16BWFH4JPGROV@kernel.org>
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

Resending, the first copy went out as HTML and the lists will have dropped it

On Wed, 26 Aug 2026, Danilo Krummrich wrote:
> Well, Alan also said this:
>
> "At first I thought that we ought to have such a guarantee. But in fact
> we don't, because the user can at any time write to a USB device's
> bConfigurationValue sysfs attribute even if the device isn't bound to a
> driver."

You're right, and the cover letter was wrong to lean on it. I took "an unconfigured device has no interfaces" as an invariant and it isn't one

What the series relies on is narrower. Changing the configuration destroys the old interfaces, which unbinds their drivers first, so nobody can be holding an Interface<Bound> while the device is unconfigured. The unbind comes before the change, not as a result of the device staying configured. I'll say that in the v4 cover instead

> On an abstract level a USB interface is a device that is operated by
> some driver [...] there is no layering violation in shortening
> intf.device().bulk_send() to intf.bulk_send()

Fair, and I overcorrected by dropping the patch outright. Io already borrows the interface and carries the transfer methods, so it's most of the way to your IoDevice<'a>. For v4 I'll make it that, so no I/O path hands out a usb::Device<Bound>, and keep usb::Device public for the calls that really are device level, like set_interface()

On IoWindow, my question in the 1/5 thread is still open: can the lifetime and higher-ranked machinery express a window that closes and reopens within one bind? Suspend/resume and pre_reset/post_reset need that. I don't want to hold v4 for it, so unless you tell me it can, v4 will carry IoWindow with the Devres comparison dealt with in the commit message, and I'll rework it if you point me at the right primitive

Gary is also right about release_driver(). It's gone from v4 and remove_all won't be coming back through this series

Thanks,
Mike
