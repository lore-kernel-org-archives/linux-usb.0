Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645017;
	b=G3iIQuWEXe5FrsKbSk9h5Nhm6s7OxDg/Y+fEi7ywjOvvCFNFiM28zkUg55JgzkxdJhKX
	 rmDj9LJuiVp8O7JSkigRMO8Baymp2ZBXmAQMGVW0gX9N0nDVv/m9d4uMWmUzDXV6cRnog
	 QruYFZ2Xx0TaPvExuRn0hdytVupOUzYwNjpVciHTLbWwTQ6OIvrnQLec3Jx5eWO+jZvEL
	 W8zwJmnv+VNfmR2hvTjQV3gVrxcpz377VDQrbZKFCOOQw997r2jk9dK1pb/CIH90r2cx4
	 XCY9mqbV6vSeQrleX56LguBpdwOSWX9hfjNPbRLZdNgiB9Ivu7yzhaLjUqDgI+ohKPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645017;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=dsRfocXPesMmHNhLeGjAxbblKS85Ql2dVnn9fJRcHUg=;
	b=PtjZGM5RgGeWqxGCvJSOpLM8b9gWlnec+Du+aE3jf3L8L3tYsgAhFYczYRaLdWhRO6VX
	 gKJ8NzcJ0kRIxqatH6nybBYM7Ra/2sdixRb2g0ylzWeyHwb12Yxl3yg34gcFC7N96FLcA
	 QBJYZ5DE40dQMzg5gWCBK8+UMGAeL4yS9xj2naYf/9N7YgMuQAGY2ohZzeBB9wJV8YBrT
	 mgTbbc1gsYzQspCI4tKJc9cCsHY/bkj9eGoIMAUiMhFgcEm0cVTaiv+sSZo+Kr2roxb5O
	 FdPzOo0Xfv30MwcxBPoZ6QPZ1aX1ofdo7pO9kSN675jeSnu5hE9MxHgtON/BTKx4j7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uAMSUfDf;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862C0606A31E
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 22:16:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 862C0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uAMSUfDf
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4b52fcb410dso2121371f8f.1
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 14:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795645016; x=1796249816; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dsRfocXPesMmHNhLeGjAxbblKS85Ql2dVnn9fJRcHUg=;
        b=uAMSUfDfHoBWGLBNnVnJSvoygRi4EKsGdCCnIeVaEJZ8h58qVaqrbakRrS6ypKl1BM
         qr2dEzQ/V2d3FI2cv4xe1PdAHqbiZUfNJxA8DsYquhGMuK6/pP1QOl9DIKJrnzsxpmDF
         rsyK3lV4nVPcb9seUSvGYqm+DZUnFss+inPYYZ7k2DXVkLVnfOAnXtHxd0ca+jI+Vli8
         eIw1axmYAo459gvvqidA7H5WtHjUuTdUeskty7nx9bSh8hlPoON/EiOjhrVH5t9ylC59
         gT4hpKN4R4iTfqRVuzC+Wm8CvSwXuGOiSGPwJjmxRXRocMADUFhYzHHpPj4YBuEYPzXk
         gcug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645016; x=1796249816;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dsRfocXPesMmHNhLeGjAxbblKS85Ql2dVnn9fJRcHUg=;
        b=H1Kka6AhgFXjMjRcB/8fLQ0M9+/2ahDsXfuz8kis+BYrXyAYoHF11GRFEI7j7Ggn5o
         jxkz+cQtFo8SIC5InuhPR6rDIY8NwmxAm5Q2mn2HNI3vNKt2CQC8I4a28cl17uoBpTZI
         uz5Mm84655twJTHTXT380zMdiRMEg3wb2593ZvCRVG7U7hMUna2RQcG6iU5G+rqxj0Xm
         Ilg2KWCJDcPPIo7WLrgOGzkOgOPpJt+qSWmcP8pnvIQtT7kamQDquKB/MlLwpxu6t1T2
         jEwpGIZ5YhYJLP9jbXxvXXXAkADZ7fPS0BPyY5iqTN+zDOrvSjce6Fn6ykOJnv9PE5FB
         c+6A==
X-Gm-Message-State: APuU4Z/fzbqfafZTVXmfg8Aefu4fc8KGMGaqauAv/JqFHN0MKOHkCXpu
	X5H8JbHbUwV5PKfD7pBEEnvtHf5D48r553RTrN9kBo6mDRrLT/RYn74v
X-Gm-Gg: AZFdTZcV4c0Gt9qenW9SL5EX7NZr5ePqMDXumfmEKH9I/enI0sJjHdjlJb6oWHFq6Bp
	fDUhhSxTY8Xvd5SAEajMqEKztLcw6dBfhI1gPY7tBv4lyKf3lXC7iHG/nXXSDuhTooASI3qOxof
	p3GNg+uY8LLWYFLoZmw9i9UbvwG6pP6xGlJlu//oCY7TvoOrQEeYf5XPtvfDmQHojX75213vw9n
	bJCXevAd0vVci8P4HUEFdz8WIp+C8iMubmE1FXzV1/nmBTH1Hflw4puLfPgkfswk9ZWOkZwftX1
	KL6lr+Fuqmk6ar6GXSTJNWCZeTCcLbq4dU0syuhC8QHJUI4/U/D/SxXSTlbUgI9p1saxsRtn6gd
	BLNW+RcO786AoGeYvQ5aEmeDaNumFAcNnHLibaInjjL20fstH9aOsO/Fn0FTzwZGwR6jPrWxvNT
	6TzIUYVUps43oqsKZ8gbxEroovs2i8D2mjrUEge+ENO//ztmIEnMPF2e55fMQIKfNeB9n8ex5ci
	7JoXr/RIQ2nmVKA8DnfMClP14XAb/vWe/DlIFFaIDaTP6dOqTsM0aDmG8z5F/igfQd2/hwcyDhG
	CSymEEgDgG/na9t+EfRbSXFiRAbsys80MQ/z1awsnYxJVSJ3WFEc17ZYWPXMkdwn71r9xB6s1pf
	2kHtnmo89U5lHOMRSLcI2ACT0UAs5rvaFEqvZZWx66WKo3Zr0fT55LP9V92/cJdjuwYAj
X-Received: by 2002:a05:6000:40e1:b0:4a7:8fc6:d5cc with SMTP id ffacd0b85a97d-4aa5b7f2a9bmr45922505f8f.31.1795645015723;
        Wed, 25 Nov 2026 14:16:55 -0800 (PST)
Received: from andrei-reply-20261125.eml (host31-52-241-160.range31-52.btcentralplus.com. [31.52.241.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3882sm36178281f8f.49.2026.11.25.14.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 14:16:54 -0800 (PST)
From: James R Taylor <jrtaylor11@gmail.com>
To: Andrei Schapov <andrei.schapov@gmail.com>
Cc: linux-usb@vger.kernel.org, Mario Limonciello <mario.limonciello@amd.com>, Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: thunderbolt: AMD Phoenix USB4 host advertises Gen3 Support=0 in SB LINK_CONF with TB5 device, link stuck at Gen2
Date: Wed, 25 Nov 2026 22:16:42 +0000
Message-ID: <1795645002.1324468.reply.hermes@gmail.com>
In-Reply-To: <em10dd53bb-042d-44b5-a41a-d803eebee6e3@gmail.com>
References: <1794143745.17311.hermes@gmail.com>  <20261109111852.GQ176724@black.igk.intel.com>  <1794223545.366398.reply.hermes@gmail.com>  <20261109142041.GS176724@black.igk.intel.com>  <1794235167.3657.reply.hermes@gmail.com>  <20261109153955.GU176724@black.igk.intel.com>  <6af1e999.9efe04cf.8f35d.ae23@mx.google.com>  <20261109155007.GV176724@black.igk.intel.com>  <dcc400cf-809e-4b7e-a14c-e4b2f469909d@amd.com>  <1794753796.37750.resend.hermes@gmail.com> <em10dd53bb-042d-44b5-a41a-d803eebee6e3@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andrei,

On Tue, Nov 24, 2026 at 06:42:41PM +0000, Andrei Schapov wrote:
> So my guess is that the PD firmware on some Phoenix/Hawk Point boards
> doesn't handle the Gen4 cable speed code and falls back to 10G/lane,
> instead of capping at Gen3.

Thanks for testing that. It matches what I see on the UM890 Pro: both
Thunderbolt 5 cables I've tried (the StarTech and the DEG2's bundled
one) give 2 x 10 Gb/s. The only cable that has trained Gen3 x2 on this
port is the short one that came with the ASM2464PD enclosure I
mentioned in my first mail, and it doesn't reach the DEG2.

On 15 November I said your MacBook result ruled out the cable, but as
that is a different host it couldn't really tell us that. It looks more
like the TB5 cable is what triggers the fallback on these hosts.

> James: if you have a certified TB4 / USB4 40G cable, it would be
> interesting to know whether the UM890 Pro behaves the same.

I don't have one that reaches the DEG2, so I can't repeat your test
here.

Thanks,
James

