Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794871017;
	b=FMDU9glHsUoeJ4xQNFQ/4UTgJ2JXUYyDDfC++IaJQnecmbyWMHi3a6ZgEwYNYAK64PFu
	 vh3a/jQGf6dGnHn76mMRY4eVxFmdpQ/lDzQFMH0LTUKQ1fJCdhmu4hwB5j65Z8GFf4NrU
	 BYcBnwLrrBSPJ4h+/YxWGCSUseZIxiIgm8G12F4+vr81yiglRic+WpfXWjTkRxtTSAJBC
	 UV4BpDI8v5RZC3WiwjRMUqgVqvFDIlCJeptHUf8zYJ3+RdSnqJpeEE80sPhw4mRhjtX3L
	 j95nt81WwiG/U6qzFqap6pbBqMHYUGdlk7Cypcw2xoKpn6Ul738MoBi4YrGPbBDxpCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794871017;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=qGaBKJ56JVkr1DV2LxVYuA2rW5L9VQdkgkizr+SHquE=;
	b=ElHYawtuCoHMo0bGSBnQDdFtEYKbK/Kvt/tYXKOPJhVupVzkD7EKJVEYOPIJfgSUIkbQ
	 2KxXbs6rrVBe/xMf8uZ2R0CDvWj6xVL3h/gy6HFDKifV+8kYepRuemLCKxzVNAtY7f6HV
	 9e35/25emT3rjiWF0MORu3My4m1wQdEb4026thjcGIp00M5wXXP/KRwzcrJOM49ZG/DVt
	 xjfmoLCatH4/LEWftjsMojtIj9gEZFt4GEDGQ7Ywrqc7RAVtzeYdnTiPMMPgfkzPmVkcU
	 blQeX6YqKVgmsdR/MJ/gUaG7nsBERRdDs9uE43HJaRqvdnXii8Qp8tW1Gjb+dMjabLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=T5J4AAVI;
	arc=none smtp.remote-ip=209.85.160.44
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C6F606A329
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 23:16:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16C6F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=T5J4AAVI
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-4ad60ec5eaaso311946fac.0
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 15:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794871016; x=1795475816; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qGaBKJ56JVkr1DV2LxVYuA2rW5L9VQdkgkizr+SHquE=;
        b=T5J4AAVIcWVT8mpCdn45DanP2QzcOj7RDXZc0YQPkwV7XUWICfE2gWG3vk+OQgLEAn
         gjmGnj0rEWVy1mXDgmohD5MtLcOJQ9pXjKbGLw1R4rCVUJuP0A4wPS9vJX0eFAdGWBJL
         jiIeQIhFL4z0AMgTQ4H5it1u3nSf4xmTXIpMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794871016; x=1795475816;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qGaBKJ56JVkr1DV2LxVYuA2rW5L9VQdkgkizr+SHquE=;
        b=X9jEkoiR8T4zdfPEt3LIzrJnlkqiRgg/etuqidB1ELkpYU2KwOrLLQT2PwH62ofqfp
         hM0mp9ChRUfZC5savs/+qeLy0gWx6kasW2py5o0TuRC0fx7EiUjCjz6ZH495apH6hbXu
         7PesXvICnTmWRBjhhiyxSfApn/Dj4f1i1XQv+wYYCpuZGCfzTVRc8yPr9WZPPA7ufKmJ
         idqzJiYbDJxbbdfaq73NCjSrmZ0KrMLZV+DOpp9pcqJ1ViQdSIrwlBQogmQyPsma/ALG
         hM1emAelyYm2DlM8ES55SthVU9cUZztWGCJFqrPe9UNDGYXeLt5KEDWrSh1+bqbxBblQ
         bp4A==
X-Gm-Message-State: APuU4Z8Wu30xrkgoq8NELkJxWGq2M+YXiSlJco0kkgBDTvtzyJjUhnjk
	1dvoCXcw4Lrt4pWp9Fq7ZZCKyid+ZXMC/mRFStiiqtHUcKNi8uBJrC1KEqsN5NatmmY=
X-Gm-Gg: AYBFou0lQWRlN13ZuzacOIqEwBw3giEdCiMz8wNYjDszXQjP1T12HqVSFfYzOWVlDur
	z2FTvEn14eV28cgQrNsm6ynEIM48DY0YqW1SHY6eP2kZwdGlliuDIclPCyESzXbk57Id+LtFq/8
	YLcz5/NSbAE0yao46NQZLBZkFakUsgGbjD8PdAus7u6xfBGN8gGBYhuhyDdFmixdxnTxow3+bWY
	hVxnuoLj4dFNEL9kLseb1VCqAp4oUUwsqo1ASdGs7PWqdTpGHwW8eTCufxeVQTY7D1DkA0oYRBR
	eiYpbkU7I/SPZ27edIfUqDXncN/6D8T4vyRNObxDcVlt83ukv/t8UygvtJAjfWQD6kqUqRRsUqd
	cXW4kPxhntd5kQBakVLuPPbGDrgasR7Xoa5y6u7IKiykVNlmbmvZnRWhh9Zwnp0XKwS1nsni3Rn
	qPOInxppi78Vjn4i7faMQMLGyzoMhEzFXXtA4D9oTj6/g8Fv7QBeBDa0JUFOctT7hS9y8R4fqVU
	4aDf40s+Qw2/8W9aV9vnAAS5Is1ucQBWQvaiIndVzIK6LMQG2Kx1y8QZn0KyHATIloyu/V0wp8/
	eidPH/Yz5eyNv8uSsdJtHE4vfPlQbbWWoAHd36yUwcRCGkV2jjsIpoBY31A=
X-Received: by 2002:a05:6870:8926:b0:4a2:4864:4ead with SMTP id 586e51a60fabf-4b4118f4569mr822025fac.15.1794871016004;
        Mon, 16 Nov 2026 15:16:56 -0800 (PST)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe1c7ba35sm8000666fac.0.2026.11.16.15.16.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:16:55 -0800 (PST)
Message-ID: <5ffddf60-7549-45a8-8b7d-496967a4e91a@linuxfoundation.org>
Date: Mon, 16 Nov 2026 16:16:52 -0700
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] usbip: stability changes
To: John Ernberg <john.ernberg@actia.se>,
 Michael Grzeschik <grzeschik@puzzle.ch>,
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan
 <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261111-usbip-v1-0-da5217ac71d7@puzzle.ch>
 <131283b8-0d92-4277-9dc7-eebfe30de5ae@linuxfoundation.org>
 <d9cbecc5-3130-48f1-adfd-4483c1bb4031@actia.se>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <d9cbecc5-3130-48f1-adfd-4483c1bb4031@actia.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 04:34, John Ernberg wrote:
> Hi Shuah,
> 
> On 12/11/2026 23:46, Shuah Khan wrote:
>> On 11/11/26 04:34, Michael Grzeschik wrote:
>>> While using usbip on kirkwood embedded machine, I came accross
>>> some stability issues. This series is addressing the reference counting
>>> on and usage of the event handler itself.
>>
>> Tell me more about the stability issues? What doesn't work
>> without these patches? Do you have reproducers for these
>> problems?
>>
> 
> Since we also had the issue that 2/2 solves: The issue we have is that we see occasional CI failures with ghost USB devices remaining on the client side after our system (server side) had been suspended, even if the device was removed from the server.
> 
> Applying a patch 2/2 (or our version of it sent earlier) solved the issue.

Hi John,

Can you send Tested-by for the 2/2 - did you also test patch 1/2?

thanks,
-- Shuah
