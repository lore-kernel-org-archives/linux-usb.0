Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2CF3B71BD
	for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 10:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785495434; cv=none; b=k+ohKyK7F9XcueRJvP0uyZPKitvfwD+0B7fkbeYIQoI/mNo1ZTovpro5JBtejijmv34xBhpLuDJhqUQ5IWu7yvhXubG8SLX9e0SmhYqfI+HPMIm2q9E9nZjTt70gIWteDKeT7rU3SxBU7/GnQurtlT6rh8mPqbALAN3I4mwn7zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785495434; c=relaxed/simple;
	bh=yGH28gtQqHhec5knFR5sD1CQPcz72FlfWLY6Gw7j7BY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WTjnF96yECj+zE/neIRrgoqPQAG+Er/ctGuB9BmgjmnQFSLvHfNnGPhOLWMjMnq3bwdBO0jWHgYjqv6MnGsnEFDa0zrH4RIntwvTbT0KE3p+zUBkAhENObzH7AG3Vae0whKD0iiWNoHtCptt4//UYXeRipntzANl36JSAh2rjUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bWP/tFCF; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bWP/tFCF"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-69e2266b07fso1385677a12.2
        for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 03:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785495428; x=1786100228; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PBQcBLqkV/gb6gmWhio9kGVASVUCF6aNePQnrEZ5KNc=;
        b=bWP/tFCFDvGwzG7/bZfZ30hVU2bAG8XKHU0zHt5XMO5Jx+xbV34vdfhdey2y42qBIV
         ZozF6zUGVW04pKVmCSOR29Cab9EM4R40y3wsBVNaGjyonaSFMKqI48/5Uc1xkwproRWj
         tgi+V6jnlq9EbGYjmYShkF086DaQwouL/H3m46O72ywyHyscNIS9GP2ZXKpoihN+Pa9v
         eNgbqLN47QSW+/TClQgIkXTsuYVs8TxK1ll5XUOPS/dZ4a0MfoZavs7GQAUWlECHIzVn
         kiyTPkpBeIhnIK1WF2riQyeKyh9gN3Zwd1m04MDfJKwFk+0ho3bfAqmY/GYze8DbFiVq
         H3Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785495428; x=1786100228;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PBQcBLqkV/gb6gmWhio9kGVASVUCF6aNePQnrEZ5KNc=;
        b=dLLu1viDbi5CQQvVIKxdpRT7SkfimU6eWy4xuI7ivTZtSep//7qvax2gCB2uPhmJtP
         umdM54yuUVtkcOuLPOJenpTppTfKsy4zu7jZcuU7X+y+nWxqWEXj6q8AM6ZwvlGfSIQ+
         0ZYWLB6mt+RrnxXAsXXTZWPJQzkB3IZQ3bBoAGWtgNXLDvysxbFeFQ1ChPWwQJSHvpqv
         Rh63HLOQmKMoSoBw4trjBKkHJKowndIGKHujBCTlEAUbARUwZyOApDPENoJLYrQkoart
         W6tR8419C1ymqIdjgALnbcntoivd/IGlg7C8IqhKTtnstICX67tFhyVN4JqosDuqCj7J
         wOfQ==
X-Forwarded-Encrypted: i=1; AHgh+RrPQbn9iVTRNYWE9ExHdkK0+K65j0pNVEJEYiMipW09kxs17nTDB4MTF6Fj4yXH4xpymPhOm8BWBQ0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4194+/JdVB8BXqMFORlslMV+ZQhVcE3/TtiAhY1dEowoLt8gV
	iD15kwNSQCluKYDmt8mR2eXxo6uGvxXLlZuZt7q4JSoUHfcEF09qUWSX+wYFmA==
X-Gm-Gg: AR+sD12C12mQluL4bgcegkMOsm0oka2rT3aZx61Ii6yNtKdCSvwPwComJum0p5aZIWH
	ONdKdIMs0CDw6NKGhaWeCz+Pv9v1ZZh89ZTjc/zIGklFm5RA4GFHj7e2PYbTgXp+scuJbwygsQf
	Q4L7kHXyShRipYF6gNZO+bjw0jlJimPAhm7VvmhpjHBuLpfjlXx3Rzp8ddW2Mhf4AaIGd90ucpq
	nvSp4pkpB72hUJbX8ZBJPacR64XxgCHpx9Js+d2rtVyL2nPbABoFeXPt3hNfW5kYK8OUae6wmCw
	qeASXHTSZ5kZtB9Fn/4opnfRXTxOG8uc/tiYE20Bl4JMHByJZYAoYn7d3fudZYZ4WTIiKeOvCqF
	Mbn9Dj93oj4WJyAEwbInk9E9dt1Ltd3NVVDMqskacF2Jmv1YsxI8eM20e7bafzp1tzgbvQc8IeV
	dYCKkgLSu33LV9FIo+yVMHrAfBSX9LPu3PNF+lmAsIoOYBgunDrKJP+3Yv5v+kNQbjGE9Hm0zx
X-Received: by 2002:a05:6402:458b:b0:69f:e12c:bd43 with SMTP id 4fb4d7f45d1cf-6a098cacdc3mr735841a12.12.1785495428305;
        Fri, 31 Jul 2026 03:57:08 -0700 (PDT)
Received: from foxbook (bgt135.neoplus.adsl.tpnet.pl. [83.28.83.135])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a09c5b0c0csm1061040a12.7.2026.07.31.03.57.07
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 31 Jul 2026 03:57:08 -0700 (PDT)
Date: Fri, 31 Jul 2026 12:57:37 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Jie Deng <dengjie03@kylinos.cn>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, mathias.nyman@intel.com,
 linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: xhci: Restore MSI/MSI-X reinitialization on resume
 for RESET_ON_RESUME hosts
Message-ID: <20260731125737.073cedb3.michal.pecio@gmail.com>
In-Reply-To: <d71b1b08-eae8-4e0a-a58f-bbd6b131d5cd@kylinos.cn>
References: <20260714090210.1201964-1-dengjie03@kylinos.cn>
	<2fd4299c-c455-497b-a122-5f94eeb9d1bd@linux.intel.com>
	<e0c37a75-0569-45ac-acd0-534a24b6e3dd@kylinos.cn>
	<20260730064817.79e3d1af.michal.pecio@gmail.com>
	<d71b1b08-eae8-4e0a-a58f-bbd6b131d5cd@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 31 Jul 2026 15:38:22 +0800, Jie Deng wrote:
> The S3 test script is as follows:
> #! /bin/bash
> #
> for i in $(seq 1 $1); do
>  =C2=A0 =C2=A0 echo "the $i th s3" > /dev/ttyAMA0
>  =C2=A0 =C2=A0 echo "the $i th s3"
>  =C2=A0 =C2=A0 rtcwake -m mem -s 20
>  =C2=A0 =C2=A0 sleep 15
> done

That's simple enough, I could run it for a few hours on x86 PC with
a few different PCIe xHCI cards.

Just in case, are some USB devices supposed to be connected, or not
connected, or maybe it's known to make no difference?

You mentioned that the problem occurs both in D3cold and D3hot, on
my system I'm not sure if D3hot is possible with S3 so I would end
up with D3cold or use s2idle instead of S3.

I recall that in D3cold most of my PCIe cards don't supply AUX power
to the xHCI. Was AUX power supplied to these chips in your tests?
If so, I may be forced to use s2idle. Or maybe will just try both.

Regards,
Michal
