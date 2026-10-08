Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE1734F46F
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 07:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791442899; cv=none; b=arEETEl2wEy74cjwWSpUfltj0FOyOao7hyUqOtvAsiHpQNW5RkNXPBXKjDYNlzbsAipYHtQCxvV2OlnBkie1OQup0NlAxrDjDUA4yEZmf3sMYVKZl+ZK+SjKZnaliFRw78+z/zDdy4j9Mw3ggbC8CqKICKmwKeT+tByqIco0wSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791442899; c=relaxed/simple;
	bh=NS/2gV4q1JC5+Bo7a0gN2KIcSVwFk2ZnpBgd81br4TI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PRvir5TxaIAlBPyDpG9qgt/WNlV6b032+J8FJxEEod72ELsG+qUMEDvz7VafmcCgpHVtn+4C9W+lFLNJujrtqyiieVny60gkc+X/eTBSkBV9hEkA9SQBNU32qDSvHgsqBpF9S2+tbzcPu4/rlYrwKRr4u+iYFX3gk96x1LyCnhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KjIFL5/W; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KjIFL5/W"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so22209285e9.2
        for <linux-usb@vger.kernel.org>; Thu, 08 Oct 2026 00:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1791442895; x=1792047695; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O/s15n5WAnK08EqMHI7ayGz+kJuyxmk3uPN6wuJwReY=;
        b=KjIFL5/WvcgYO22IJfQBDQOOPC+S1wQfQtIJ1VY9MaLhw7ExXyWRmWfoETaB5215Oa
         OXEZbeQ5GqTroTfy2aoXIfgHvD0UEFmhbKyBMPj26o3XQuFDE4hmmTRRMF1+X6A0AWiC
         pJmLGH2f5A6cN3KdEHQtoCnZnL81O7S87k2jo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791442895; x=1792047695;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O/s15n5WAnK08EqMHI7ayGz+kJuyxmk3uPN6wuJwReY=;
        b=tEOaJxP/wPUN462QAc3yNVL2YdQGrlEG+6z6nQTNR5bD228wIQZjGNSTJq2ti7wbo3
         sEcfQv+pxMh6Psc4IOxXL+ta8ALmlNFxg4X6i2/sGI34olSAqj9lRjOU7mdgXWzePlTf
         fl4B8TPxyg3VxnNh+yLJHD3FoC93D81qkDOhAmIyrrePcjpIxcXR59bORAlt1rMWh0B3
         sTJ5PDyu3wzKtIM0RTXmR3cF6kIAH30IzlchzYFORsd1j3jHdRBYKeMYc7ybtTJ14wyi
         d0novxqVTf+EOj5MxfC/gpIlM8EUTMpHYBvwAT1AMCAYsktv9r3duMfKMknUvTqf4MWV
         A5ug==
X-Gm-Message-State: AFuF++lGFKS0teycjxsVCXm6VZXzIQwhbjzJgzLXDkhHI2Zce3xsJdvw
	A9vz5hGIZh+GhJQEdGUkWz309sJXK5PLFdwvzYk46uLtLo3CmQg5DBvao8I45g1T4Uo=
X-Gm-Gg: AYBFou2FLzqwd35d0w2oz/zwLjNlDT7dc9sAviCgLpyXk3RPlaB7Alu36vLgjtyrS0A
	tZCP5a1tygr/ZmOyAwh8C7Sc2HO0cAjiwNF1idUP+PG8QlBXU9qCbb95nDUhDXYzlvCGCtiefW/
	dzw2gfmlU5FX9V309nM6ig9R8lIkmtoA350ctbBmRlZ6K+I517+LzQVg+Ctp1HmXAN/LNuyg6vM
	5youshgev5jcVzLpdJ95+iGgNbFe2w8Mdb27pRqByNHzeq6elD9u1dyvF7YUKlNsro7adRYgHgf
	LvmoswMiy3LZJY5f7MFOBG6yy0Ry724200p9zAp7B/23ijkE04ZfQVlYHFfi9kVGv3T3nh11gax
	fT2yJ90BjsfLO7MVdzNRN2vdR1OEWikU7pLbGXprX/xiJSTP9xuPJFy8GarArdXszFgkU0BpAVh
	YrtQ8lul+MsBw0jwUcdu+DYBYEegv4F4dW2dIV/L05BhKCgVuz/bH9bdem/lanRZnilOyL3GfZp
	9Jt6ILJwl4iN56ntSLDh1u+IqNnJIKmEba2dph3iA==
X-Received: by 2002:a05:600c:64c9:b0:4a0:25d5:e853 with SMTP id 5b1f17b1804b1-4a180648c64mr75296735e9.35.1791442894841;
        Thu, 08 Oct 2026 00:01:34 -0700 (PDT)
Received: from [192.168.145.89] (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1842abdb9sm46171005e9.6.2026.10.08.00.01.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 00:01:34 -0700 (PDT)
Message-ID: <52230f29-47ec-46a4-bd4b-5725af6654c1@linuxfoundation.org>
Date: Thu, 8 Oct 2026 01:01:31 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usbip: vudc: snapshot endpoint state under lock
To: Sung Byeongchan <tjdqudcks0424@naver.com>,
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan
 <shuah@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20261007063054.26374-1-tjdqudcks0424@naver.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261007063054.26374-1-tjdqudcks0424@naver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/7/26 00:30, Sung Byeongchan wrote:
> v_recv_cmd_submit() finds an endpoint and records its type while holding
> udc->lock, but then drops the lock and rereads both ep->type and ep->desc.
> The VUDC timer drops this lock around gadget setup callbacks, and
> endpoint disable clears ep->desc under the lock.  A USB/IP host can
> therefore race an ISO CMD_SUBMIT with endpoint disable and make
> usb_endpoint_maxp() dereference NULL.
> 
> Copy the endpoint type and derived isochronous maximum packet size while
> the lock still protects the descriptor.  Use the snapshots for
> validation, URB allocation, and pipe setup after unlocking.
> 
> This was found by source review with AI assistance.  The production VUDC
> and UAC2 fixture panicked in two independent boots without a diagnostic
> kernel change.  The fixed kernel completed 5,257 race attempts without
> an oops or panic and preserved the normal and serialized controls.

This change is incorrect to fix the problem you are describing. Can you
elaborate on how your testing method and environment in more detail?

thanks,
-- Shuah
