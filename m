Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B8A3DFC6D
	for <linux-usb@vger.kernel.org>; Fri, 26 Jun 2026 08:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782461189; cv=none; b=txrpJPikJNA08appB87zVnX6GHD1Qv90C/duz0P/lE9Lg4jHQqbpD6rNMBHyDhTKnrnK6a1iZHRncMS9yLMro1BzKgmOhAIGnC1Q1r/x8leAmIq2xC0elC3wtReV2lMzAPhD872y5bW+TjpXtgVHofi5GCVkA2PDL30SHsBtu6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782461189; c=relaxed/simple;
	bh=aNf/SIvnB6c9FraSrGdr/C620AP7V86KVgV4EjsKswI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uxJEKByiVZK+/TZtUAUPKIewygJd/q+xBFDCHlYX5ajdrc4XfAnRrAjlSkfQxsQrpSyeRXo5x98wdgF+QRt9B58Ew5LXDGfz1y41I5rzbZhS1Z2m1T+Qa/r1kEZuqa3J2tR1BpVr8g05ghgWuJ4cJpKFMvPgKkPFmx6+9/OL0D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p0Xrb92E; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p0Xrb92E"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4923139e940so3824105e9.3
        for <linux-usb@vger.kernel.org>; Fri, 26 Jun 2026 01:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782461178; x=1783065978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mUEr3dtQd9Nv7yPrUavx0YnTQwbVYdum/QDhfIL5EyA=;
        b=p0Xrb92ERekAxv1jPyVroHbX3Xw2bOpG/6/UzVjs12gaZQh8Tyz/kYmOXKv4Gye25W
         Y2V9067/hsbUufTtBSlPG3UlsRWkT0/yiqqGKk8fOpMGgSTohfbqVVcMa04V/POZ1+6k
         8lp5GPmizLh1lXVRU+MHPq4P/2WFfj2oWEfvqVHrgltteH4LAiFAWW8DErz0qAmORaDL
         W8EQv3LW7sQfveeHFjlElr6MopO5SsGnU6S798LBwrSWcwx9OIXvBmxtz45lGVYgsc2Q
         DHDxYcYYANioNscYs03nI/u3ZbfNnxTw5otLKT3gJ++9kPyG0zFSZveUatNKya4S2oy8
         Ke/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782461178; x=1783065978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mUEr3dtQd9Nv7yPrUavx0YnTQwbVYdum/QDhfIL5EyA=;
        b=Fr85hhE9aGD9zY0Q/Hy+SYpqy7F8GI4lK8+2orurNiX+uss243d3dmciBLdPkkMSb4
         YCgLB9piRjO6pugYaZ6UMHPGTebfhE+LjG8OWOGIEADlUPjAEMidRvZcpHZZcJvdKyRd
         nQCUXfwPzFdAw6ZPbuUHBj4hrGuesrM7dms4k2JlPFO806UEmATpQZ7I/1Nr9HOeafI/
         I+ziSayIVw5SCudvseHzaj5vAnpZsU4OO5USjT0rrxa88Be1uhqRYB2vKvcbBMXoArsz
         t8KxEVScvKoYQDtQw40scWJN9fp4/RNr50JnfEOsMIKVDAmwBVjtO/wnIW1fum3eSGUn
         y9Pg==
X-Forwarded-Encrypted: i=1; AFNElJ/felKslPLQMMqYEo6yxykSkm4l8nC+tBdea8OiIhRIOERs8bRo2snWf6MIru+g+XyEk8BSbRdSwCo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyU3YRkotp1RWPlQ9fkh7rA8xZbjA2qCsbAoe74UpqVE048SdeS
	Re6uDy0K6h0gL6jOjr8rSuPSKRpW2cI2RYZ0zOa+2VNToMRqyultXVAw
X-Gm-Gg: AfdE7cmqh68jm+jHHD+eLWWZLAcdabwY4n3llK4mL2V+G4AwYLiT8khr1f7USVkSSAh
	z8Cn2yTvNCkmyFSsYF2wH4Nca0ErfvjSCXVBB9UQhp5oNKu4Ngn/+XXHkxz7ZGVd557s3N6jYyC
	whwVHDci3EHR79Tgl/yC8yBqtKQJZDjG4NzM9hGoCLfaVSw/NbcjUZsrqQGS+yq9AyTOBc//EXK
	boUKr00y1TtjWyQWi4Q7vSLoscxWgwcJvrbQvSNDcsfCjzcIsfT0sIqZkj1PWQVWVNJ46TbchY1
	kz+yEuLkyft+kZ9db6bXFtcN00IB2pTE/ArZZD9QU9Ar3nItirqylEjCGmK2SL2kvkefGga5d2U
	hSZyO4vtrxSNx5HpBnC8iGxPL8JfkzUTQkIqW9OJcgepaW/nvYjw6UNiTNFyIJixC/Olo4MoFDk
	JSSWwLiAvgS9xlF76cQIi1NGQuBIUSMK/aTY34peM2OlvPrYI3tA==
X-Received: by 2002:a05:600c:4baa:b0:489:5022:39a4 with SMTP id 5b1f17b1804b1-49266869e2cmr52298345e9.9.1782461177788;
        Fri, 26 Jun 2026 01:06:17 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492690a1a85sm101588975e9.15.2026.06.26.01.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 01:06:16 -0700 (PDT)
Date: Fri, 26 Jun 2026 09:06:15 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Xincheng Zhang <zhangxincheng@ultrarisc.com>, cyrozap@gmail.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, mathias.nyman@intel.com
Subject: Re: [PATCH] usb: xhci-pci: Disable 64-bit DMA for VIA VL805
Message-ID: <20260626090615.616666b4@pumpkin>
In-Reply-To: <20260625191852.0a8d511c.michal.pecio@gmail.com>
References: <20260623121847.53749028.michal.pecio@gmail.com>
	<20260624070612.337013-1-zhangxincheng@ultrarisc.com>
	<20260625020421.2e577a94.michal.pecio@gmail.com>
	<178235378952.3114334.15752812276771065417.b4-reply@b4>
	<20260625191852.0a8d511c.michal.pecio@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 25 Jun 2026 19:18:52 +0200
Michal Pecio <michal.pecio@gmail.com> wrote:

...
> Right, your addresses barely exceed the 36 bit limit. And I found why
> my chip behaved differently - 40 bit DMA was a firmware upgrade.
> 
> After downgrading my controller from 00013704 to 00013600 it truncates
> addresses to 36 bits and fails like yours. And it's a pretty nasty bug,
> because some of those accesses are writes to scratchpad buffers, so
> without IOMMU the chip corrupts unrelated memory below 64GB.
> 
> You can check your FW version with this one-liner:
> lspci -d 1106:3483 -xxx | awk '/^50:/ { print "VL805 FW version: " $5 $4 $3 $2 }'
> 
> More about VL805 firmwares:
> https://github.com/jpmorrison/VL805
> 
> One could ask whether 36 bits is low enough for all VL805, but I think
> it is because the bug is hard not to notice and nobody ever reported it
> on systems with less than 64 GB of RAM, even though 16 or 32 GB without
> IOMMU was a common option in DDR3 generation PCs, which is also about
> the era when this controller was introduced.

36 bits is just enough to support 32bit x86 with PAE.
Seems very short sighted.
IIRC xhci has a quite restrictive limit on address boundaries so supporting
larger addresses is just latches - there is no need for a 64bit counter.

Can you do a read-back of one of the control registers that contains
an address - if you are lucky the high bits will return zero.
That might let the generic code enforce a limit.

-- David

> 
> Regards,
> Michal
> 

