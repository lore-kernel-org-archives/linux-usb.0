Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C20230AD00
	for <linux-usb@vger.kernel.org>; Fri, 20 Mar 2026 20:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774037898; cv=none; b=ajZSRYpNWiGdOhkv5T3VwoCTxsemrVlIhGGPFlmF42Nyzj2mVXiuQQKjJBVFnzjICxckxgOk45HYCbOfmfJO64j5xA/L8zKaEO03yNVmfOEuwf+fVPgB9Lq8VROuGBkEOLztC0/qy95SQxMfPlZaOWZeTlTyDP1SlFUrg1hipOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774037898; c=relaxed/simple;
	bh=FqkvLIS7PYMTAq785ZX7WI9Lx9p9a3zizqdun5ZsVWs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hnbhwiZdHgzzQ00QqugFeeVG6ySIHXMnLJOckIGerptkdG9Yc5oKt1l98oSvHx+WoPJpOdscwk1EfNtX++ygzWEKTxdsGbPTJGQV8Zy7UIquKgQmcrNzSAaDtqXpOocNf7FZCEuxpW9sSGonQcoKDM69zvNSyyAGKYoIEoMvqMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nr6bLaSB; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nr6bLaSB"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b9841aecf72so82301566b.2
        for <linux-usb@vger.kernel.org>; Fri, 20 Mar 2026 13:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774037894; x=1774642694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FqkvLIS7PYMTAq785ZX7WI9Lx9p9a3zizqdun5ZsVWs=;
        b=nr6bLaSBBmppUYvE+iN/JPHnqXbUSCJ89aitq177qHFNWoCByZmsBRVB6GQRfte8Rn
         zSjSG7Yr1IZtU0GkfkpqOOPExgjXOrjUIzvlzIDff0WtYQuqMqblyhSYHlsAHTi3j1+V
         dgiQzMUGnPwdiAAsFYd3IYRJ7pALDwHwO0jTfEG0gTdNrs2d8QFwDfxX75N0DH8UCTjM
         sleaoAuJ4SzVzXDWgaSkQst0GcewOQiD/C/G6LBJO5Iffy49Fpif0OI5z4rJowao+spn
         d7zeNgDEAnSUfGOqEeIuolbKnIQ/6eunqdhn8YjsJEAQO/JZ3Oped6DmxWyorEdE7wVl
         tCnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774037894; x=1774642694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FqkvLIS7PYMTAq785ZX7WI9Lx9p9a3zizqdun5ZsVWs=;
        b=PZPjQD/NHzX2PsarvsfmkbLi+Ym7E5mkfaf/xMtfEArCqcEyuLqCA2V4jkDvaAqZM7
         3itlsiWTcOmkl1NJJl83nXw8F7dgrVvYm3KzBLTFeDKh1gSgwq9vkpDWEFZewL4rjzgD
         bqcvc7Ufl7ldPxaRVE5CvBcSpE53DpVYGcstuF+Trq36TnfeoYTsWQdQ//MxbV71jagP
         xIOtKQr+VLtWrp0NueNfz6Ja1wL6j3TIUnwYLQO0nbSa8OP0mJKJmaKCj1LJOaIX5SMh
         kLkKPEOvUzGWnuU2394Hlus3q+IxRqbneTM/w43CKeKllndQ1br5vgZJUf5i6RmvCkFO
         rBVw==
X-Forwarded-Encrypted: i=1; AJvYcCVAANfQKhcxRZ1KGkX3SQXWqwN2klvAbrSLTuL7ygDk2FkqA0IYl98lCr8AkdebctVA+WXkKh5xtm4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ6s2epoDE2f+gZbcxrAiOfK60HYH9zuLqnyfoS6XjGhfkxRjm
	3pLxaXpGsVoCL/ChJLbHY7A49OA3/8pzLGbIYr3ExiZ88Vq8r/UDHJ3A
X-Gm-Gg: ATEYQzxWa+DeW53vcmjMgAVLZ5ZbhWqo4J04to+xy0iBgDTKyA6HG1jyWp4yLR7lJYD
	93G/QWNwtWPqBhKgBjroNkZc+0fO+UpUqtiOXYGYYMdIJ/3siZR2aKZ6lE/l43VFSis1y2FfjpD
	LL01oQ0M4fL/fdyCN/05be04pCTH/6TvTIo763/WeRDs3y1FsI9ECJg71KFGdEYxp95Tgo2rZps
	URNyzKF9Pecp7EynCpleW7l3AIIySsmcgETtB1AX4hmPOucBu1v0S6SLWYSHM/ueYidVJ2Kw6HJ
	gTdhm5P6AvURuV5P7AuIylb/3NpJUpl11OlBvtSID0bNsuCqFU9WJZa0/trRDpIkL0d4o+D7P+B
	k2yHr1jejirISLHMwQCyP5OaVix0eYMAAbt09TKe3cnqOVumOuL4eVgCylEEdYyrKI0Fuss2M10
	MSsb0TfSCUXoQ5CDPRu5CfhVQohgsn/5mxMqo=
X-Received: by 2002:a17:906:919:b0:b83:e7e:3732 with SMTP id a640c23a62f3a-b982f3630e7mr269445466b.30.1774037893684;
        Fri, 20 Mar 2026 13:18:13 -0700 (PDT)
Received: from foxbook (bfk214.neoplus.adsl.tpnet.pl. [83.28.48.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983388070csm184858166b.60.2026.03.20.13.18.12
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 20 Mar 2026 13:18:13 -0700 (PDT)
Date: Fri, 20 Mar 2026 21:18:09 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Niklas Neronin
 <niklas.neronin@linux.intel.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: xhci: Simplify clearing the Event Interrupt bit
Message-ID: <20260320211809.705e0cbd.michal.pecio@gmail.com>
In-Reply-To: <408ff4ce-1020-472c-9526-312ba8ea2ae1@linux.intel.com>
References: <20260304114224.62814449.michal.pecio@gmail.com>
	<408ff4ce-1020-472c-9526-312ba8ea2ae1@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 19 Mar 2026 22:33:49 +0200, Mathias Nyman wrote:
> Leaving the Port Change Detectd (PCD) bit uncleared worries me a bit.
> Did suspend and resume still work properly after this?
> especially something like wakeup from suspend (D3) on usb port connect

The bit seems to only be mentioned in 5.4.2 and 4.15.2.3, with no
indication that it's supposed to have any effect on HW behavior.

And I found no occurences of STS_PORT outside xhci.h.


But to be sure, I tested resuming by connection today.

Chipset xHCI and a PCIe card with Etron are fully functional.

NEC wakes from S3 but not s2idle, also if waking with a keyboard.
Maybe a HW bug: expects absence of core power.

Several other cards (VL805, FL1100, uPD720202, ASM1142, ASM3142) wake
from s2idle but not S3, including with a keyboard.

No difference if this patch is reverted, no difference if PCD is
explicitly cleared in xhci_suspend(). And same problem in Windows.
Looks like a HW deficiency in those cards.


I also ran into this problem (and applied the patch):
https://lore.kernel.org/linux-usb/20260316094811.1559471-1-xu.yang_2@nxp.com/
