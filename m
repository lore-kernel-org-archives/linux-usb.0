Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D4A369D53
	for <linux-usb@vger.kernel.org>; Thu, 27 Aug 2026 09:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787821693; cv=none; b=kvoJCyric41zTIRRqEb6tRciwfV9RHaftPfBYNyc4ns7R9hJrjjPNC+/ngEakgCK7A9LttvBjX7SIpGG0D/Tk0BXDBIsIZmRl5H+LPWINHWMGsr9H3wM/F37e2wDuYMSFfuMLgRiIkvzU8lBCzHK9AeeDqWFK8VbUg/76oeJ5oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787821693; c=relaxed/simple;
	bh=Wn97tQUxuyvvv1tJFmLHl464HCpS2Xix17TyRvVpILE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AlwmoSb28OLNTM5tkEyTA/YdKlR2yEOQ3K+/zmiAn7DEeuoX5AWtYoN4aUY4C4Ls5nQvKkLgYf1Mc8qlMRCKxOd36W7Y8los1oCcZGFvZVICWT6hSHltBMnhRSz3BjXtO75EjBIFxrH2uJtGS9oO02y0KmTJmdD8PpROiE7Kyts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IeUHKjyF; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IeUHKjyF"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso9733195e9.0
        for <linux-usb@vger.kernel.org>; Thu, 27 Aug 2026 02:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787821688; x=1788426488; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c47rpv9RyurGDhGGYkGZTDAHfRgUQeclm5jfaqZLKqk=;
        b=IeUHKjyFCuNNDOO3Tzn4JGoPiX4Guq7rXFcnBRwQXZEdKzlDMuHmBvzuS4g/CQ7giW
         vf0CgJGD+OEdR2NgCj08EHQ0X65hnRufL6GIfF2JIedAUwnRTvs0RDvCqcblGm+VGgDl
         5pSH/VOc1lmEpymx+55ePB6WytuyAFH3h4v4xAOBU9sMg6R03X+ruHjslzFsyvuom8Wa
         fC3T6XDVucjQPBeFEby4lJxn0V+8idcbbDmR2I/tFs7EdWeMk3/F7lUR3CHvGBd4S04r
         8QcCS3cW5jn3AD0At1wBN78zf5pLvj0p3nefCrN+LMcf7YOwl2FnaCG3oPEHbHLxzM5y
         voDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787821688; x=1788426488;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c47rpv9RyurGDhGGYkGZTDAHfRgUQeclm5jfaqZLKqk=;
        b=GMFXYh4b6m/chDgrVZS7sz7UDs5w6oHmay+Vjhcjy7QoPIu4Xd4LNOkpNpybrTWUUM
         OfzFxJiD/jhdeIgVAzIUKztxPpo26Ev8JNyF8+V9P+8TfBmq7q6Ch64R/le+npoKtdmQ
         WdwDHdh7EiOOTy/vpXDZ62vcTb+xT1hmRB2FZrFrjJcT/svpZK4lE8tjMPM5519XD8in
         0VIgGxShZVbnIN+PnVxmB9VpodKUPyjsRe2aDVcgpCcIpayYY57+Q8YLeC0zqe/Zk4Ur
         qPbba7ZhmXuYQho5l2DrL2t/1OAXyMqiFUir/qw3lGZ6oi61VX6RLlMCWypW9tH0gd9M
         /6mA==
X-Forwarded-Encrypted: i=1; AHgh+RqDCFpWj1SKKoNnWLinJtzIHDXcSbfjgCVxj7V80Srvdp6hUlvzOQA4rjD/LoEDKfXYqYMfJxgVB0c=@vger.kernel.org
X-Gm-Message-State: AFuF++k6eDg1AZgPdfPmL23KVlkTLJEkeUv8rGyBMFxFJMbMPCp33qwj
	kkNjuxRVHW2jczV0bp8uWIsjpzyUR233R9+m6OMDb2dGawOPxzgW4nc2R1LSzw==
X-Gm-Gg: AR+sD12Sh/mxEMWYPN272zu0SgqHdjmp3WA+UCTcJXrnM64ZryLQRnSHIlzdDQcpmNQ
	AW9r1qFzxl2kPLcg/ZvWFJ9nYkNVK+K86jKQIIXc7R10n2/Ch3mawv5eyvsWypTBu57gh9yhInj
	yVkj6ZwFZu5jlUFLF5iT7JOpcsvY+0vGPJ8+c50QokKNErJXAggZGKv8o91gqFP9N8CyXfu3VDT
	lHP3x+Z8D/ivoYcJ8s1YNGIM+1QSEAN9QgA8nmMAIxYfr+S0Mjnknlldw67XGxlusndtN3EGq6z
	6tuxBtZr388/5O7mdtu16s4/4a2U7FzV9ZiTQmyJQwCrEwPtXk57eItHmBs4U5ZUakTSQU5KGYm
	lYKg5Mayd1yNwwv2K4fIlPr+L9lvTRJyJsvWGYw5+JGILT5Nd6tvb8WGyqegUx/YDtA4FweA3n9
	xqG2fbd9WAnBVFoeZblN8BUH3AA+/P9/xJrQ4tgc7rD0ixYXBM9VWS0kFaBG/eR1stmAA=
X-Received: by 2002:a05:600c:45c4:b0:499:8ae1:b900 with SMTP id 5b1f17b1804b1-499dc8230e3mr148761345e9.12.1787821688010;
        Thu, 27 Aug 2026 02:08:08 -0700 (PDT)
Received: from foxbook (bfk5.neoplus.adsl.tpnet.pl. [83.28.48.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b49236515sm53937925e9.1.2026.08.27.02.08.07
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 27 Aug 2026 02:08:07 -0700 (PDT)
Date: Thu, 27 Aug 2026 11:08:03 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: syzbot <syzbot+fd7be5ad9795b7f29df3@syzkaller.appspotmail.com>,
 dakr@kernel.org, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, rafael@kernel.org,
 syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] INFO: task hung in unbind_store
Message-ID: <20260827110803.49790ae3.michal.pecio@gmail.com>
In-Reply-To: <20260827110006.66b07ea4.michal.pecio@gmail.com>
References: <6a8adc31.ae6ddae5.3da009.0064.GAE@google.com>
	<2026082307-negligent-lusty-750a@gregkh>
	<20260827110006.66b07ea4.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 27 Aug 2026 11:00:06 +0200, Michal Pecio wrote:
> And something is also wrong with those timeouts, because 20 times 5s
> should still be less than 143 s. I asked Syzbot to try 500ms instead,
> which ended up being over 3s in practice:
> 
> [  566.662036][ T6636] usb 4-1: sisusb_send_bulk_msg()
> [  569.717341][ T6636] usb 4-1: sisusb_send_bulk_msg()
> [  572.777761][ T6636] usb 4-1: sisusb_send_bulk_msg()
> [  575.845365][ T6636] usb 4-1: sisusb_send_bulk_msg()
> 
> Same on my system, but patch below reduces the timeout to 500ms.
> 
> I have no idea what's happening here. Looks like a bug?
> Is it known that jiffies are totally unreliable like that?

Sorry for the noise, timeouts are 500ms as inteneded but the function
tries 6 times, which makes it 3 seconds.
