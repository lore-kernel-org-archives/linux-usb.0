Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792437912;
	b=RQcMDhn+N8A6OZlCOLLtx+04pPZnioU/itGVCZDeZLumqZcCnWiCS+tmQ7srnM7vgIR3
	 SpBkSdecWhiSrxDDa3oe3YKhC4IJsdWwdcKa7apEgWovpEyN6cZvF9ok5DdSMBfPsv39O
	 Vm171QDVkEIyOmn9maDDb1hP0GbChbmUJeH1IUGZ06JaQXjAPRB/cFJhTqG4UF+LRI/2M
	 ytnNpo7o9SbBm8x7Nmgk2sb/87vf2a0Ka1Itr9lWLOfeH78cdw5mgdan7PomoflUAP4mQ
	 x/fKVpXgy9sZKpVC3Jqi22Oy0i1pL6++QyEiJ60mKMFu7klFgN7QXcAbTwPA4hWOxqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792437912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=e9goDj8Ix0klNyf8VXW3mR09UsJ+54eQV2g2kLe6z0c=;
	b=2dFK5b20mn9Fcyc4ed6BXgYD6td03UulI+b/ONeERx85ne0NhPbrj3YeNFBWxZiQIz2V
	 ko50FfsC+0lVF+ic+fdvpwewHaWDTRMZyztWV/GGDLaIkILxJ0u/LySylJ8vNUTAY081O
	 cZPp0vNjIxUHFVXHesl+Qk3PFhlxCGqlK/yxBmL1tXFXYoTmbKFP0pCVwFk/WryKfgmGT
	 6+XAIm0RNMJlkiVa93lI1frkRmx6uku9tVMxeO5IPyDKY/O16F8N1gSBB8lpMjhORkQh8
	 UUSO5TdeUTkhmywuM+l2IGwfZtiebH7EDqKHCPWfPV4Joalgo9BzccV683Sc/4Wk0pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=Szzm6kOg;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3221D606A31D
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 19:25:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3221D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=Szzm6kOg
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-8446af403b5so1221524a34.2
        for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 12:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1792437910; x=1793042710; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e9goDj8Ix0klNyf8VXW3mR09UsJ+54eQV2g2kLe6z0c=;
        b=Szzm6kOg/u1e6cSP2f6hRzN+hP4v7eKZKKBUYKzUOqaZhdvoFxRGHnTJKzRXtknkqY
         RaZtkba9n1G1xZVhfW9FpH81uj2LrbOBZj+LYuHfNFcOriBGOuDuASXKSvjkOXMeCAXj
         59UhfMeOKwfAaZyS75AWGKoFs8zINf/lOkp8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792437910; x=1793042710;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e9goDj8Ix0klNyf8VXW3mR09UsJ+54eQV2g2kLe6z0c=;
        b=AcZ4E2LxNJeXFSVwzgBaHKQOkBvRMWBL2s3lyqH+QGHNdycvzSy/Z5witsvjinUvwd
         pEK+vcDNVKDh53cDQExhFSkL9h+L3dcz6lD06J0bQQwVC53PWZyeFYO1/YDyAa0mYkZ3
         ED7hJgJVqf4pfj+DBPQZ1tfvsCzWZPWaE3V9MWATp9NJ3sRaeBmiHWmQNC4Gvf/A6JBt
         HusBZD+Vmf+msMfCLwOVbwvAlq4o55kJC+OCw8SwfriBYoYEDbFZNc1xGTshuLzbpevH
         sYBqreG51YynGt/NCZ9YAKDoDE8XrPgYCpgsXVJ7cZ85yH53n0GDpM4u3IwqMeaYuRpZ
         kjVg==
X-Gm-Message-State: AFq9FYL9gHx8dvquLq5dl+sOwjgmQsL4wdRoT+8NP3lCyRXFzmmsx/59
	fc9bvwBeZvQmlIikJ3CWonZBW94RUQCKQ8z7MUPlJMwgNN/R4PRd7+Isw/GHfsInXUCInFN7EFB
	J2mT8VDU=
X-Gm-Gg: AYBFou0F0LKqKBHoWK2eXozeT02iwBRUuuY1FSyi0HQ0pEBvKgrxQMbMyWQ2yxRUlBT
	bLPhwM9J6wZ+jkf4siErhyXMfNNUDlw6m0p29rlc5fAh6V2TgRZ+hHtSbHIwZlUoyZdkjq9MDhR
	2upt433cYARz/3fxw9+oU+ctp2viQRvQgBLONNiGAgZCBzw7RlOEFuvLHXEKXlyENT2+0ETov9K
	jSH2nwj2lm2h2S+ctIkreqMW38E3CQyR5hb7jscYfWv1ZFr8cWOCH2zG7hJqrkJMUiWprM/YdMu
	M/SNW1Ce7phDcAFBlyEHMwrPXk9Uc/tKz//LZ4f2+QqL0Y/QgOuVI5WCU/COAcx0CzUWunqSYZP
	Ch4LmKq7X/FC7vKJXHpSJNk0fuqTYXwZhO3mUbITdKkJB5bDzRhGkRGE90OX0UH3Kcy263Vd0zd
	AQ1YZcxcL44/r9zjFLcF5joR/J2Wf8MnmJaIGN6HjaVfrZ1aHlbxzjsSGU4xqeFWV9LTRNvt98a
	aUDHp7Ok++n7i54Ylw=
X-Received: by 2002:a05:6830:3c0f:b0:829:9992:20e7 with SMTP id 46e09a7af769-84503837838mr8570702a34.30.1792437910062;
        Mon, 19 Oct 2026 12:25:10 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-842a635cc36sm10295414a34.18.2026.10.19.12.25.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 12:25:08 -0700 (PDT)
Message-ID: <bca330ed-9594-4b0c-a15a-49d694d72cfa@linuxfoundation.org>
Date: Mon, 19 Oct 2026 13:25:07 -0600
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
Subject: Re: [PATCH] usbip: vudc: reject submits after endpoint state changes
To: tjdqudcks0424@naver.com, Valentina Manea <valentina.manea.m@gmail.com>,
 Shuah Khan <shuah@kernel.org>
Cc: linux-usb@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20261008183753.10231-1-tjdqudcks0424@naver.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261008183753.10231-1-tjdqudcks0424@naver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/8/26 12:37, tjdqudcks0424@naver.com wrote:
> From: Sung Byeongchan <tjdqudcks0424@naver.com>
> 
> v_recv_cmd_submit() looks up an endpoint under udc->lock, but drops the
> lock while it allocates the URB and receives the payload.  A gadget
> configuration change can disable or disable and re-enable that endpoint
> before the URB is queued.  The submit then carries stale endpoint state
> into asynchronous VUDC processing.  The confirmed failure dereferences a
> NULL urb->dev while logging a completion error and panics the kernel.
> 
> Give each VUDC endpoint a generation that changes on enable and disable.
> Snapshot the generation and immutable parsing fields during lookup, then
> recheck descriptor presence and generation under udc->lock immediately
> before adding the URB to urb_queue.  Reject a stale request with
> -ESHUTDOWN.
> 
> On a KASAN build at ff47652a4b66c067c765a7ad464d930b5a9367cc,
> normal enabled-endpoint, serialized-disable, and disable/re-enable
> stale-submit cases each passed three independent fresh-boot runs after the
> fix.  The stale case returned -ESHUTDOWN without a sanitizer report, and a
> following EP0 request succeeded after bounded reconnection.  The touched
> source is unchanged at 0c2669a9f4a1d607e7591ae50ccf3c432a0aff08, where
> the patch also applies and builds cleanly.
> 
> The demonstrated impact is kernel/service denial of service.  No controlled
> write, information disclosure, RCE, or LPE was demonstrated.  The source
> reproducer and complete logs are available on request and are not included
> in this public report.
> 
> OpenAI Codex assisted source inspection, test design, patch drafting, and
> evidence organization.

Please explain how this problem can be reproduced and why this fix
masese sense?

thanks,
-- Shuah
