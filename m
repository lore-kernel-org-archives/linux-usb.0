Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792438230;
	b=j1EpOV0FSLKvDKiLNEgERCzp/uJSUdvPDK3m80SxsRuhNfPzh8IJmUum9Rr79YNIDAC/
	 uVjSipGGR0b9+sc8YwysP3ZNW57+hLivFmKtK91l560H5vGXLoVVSr+L5117LRzXUPz94
	 WA0vJOAteiX3ijXcFVOWTFozDkfaYPhioSfR7oumW8KEXwi9bOp41+Jq+N6TAIv9rSXzI
	 qsCgb+15TErHrc4vj0YJ4BNjQnFUL8isDgTWycMpTbcB9uubDHGY8NMk6gfFRFfqYD79L
	 smi72J3+3gIAHASQej5guz7z2++BBx4MiWEuertaLep/PUh6svBhIDf04xsK/Oi2B9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792438230;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ujmsd1mQmndR3SCEvQ2ggDVXKPC4ZbkthKI3kKsBTLY=;
	b=urgG/1OvXoqHjIEPkBx9mSvPnytlKbZlmTjKeq+58/030uMata9q3qrvvqo8TBo8KwWZ
	 KPVUvfu7Dbon9gsOL0IVX6Qx8Nhp5yqI4hxC500ccHvNKKnPC6MwKUzsK/QMkxORW/Sf9
	 lb2KmHOeRm0T070osmFP6be0nhbZ+YqzKxZaoCqSKvLnEyP05kZGICsDevdpEgZBZFrG+
	 tSI5XFuZZzC305gUknuvkTw6KYLO3axD5RyFM2MKTlJJ/hT0AN8OMm9o4H9RrbP0LLbJQ
	 IBpHKqelSKkh2I3ZnSOoLBqbnBQCHg3q9N76uMCzZsHpEIiqGDY701u9ap1bdq+8U8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=UK97MxZA;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9470606A320
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 19:30:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9470606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=UK97MxZA
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6faddda49e7so2295977eaf.3
        for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 12:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1792438228; x=1793043028; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ujmsd1mQmndR3SCEvQ2ggDVXKPC4ZbkthKI3kKsBTLY=;
        b=UK97MxZAycdtm1bqT0oS+n7SMzMdRS8yYhNvGa7o6cvPsz6QqxphWdQKrFOFuj7NZE
         NsDK9Zqu28vkSA5nfq0FQRXUFGKuhyWdqq4MtUVz8KEWOVewp+escK3oDmHssm6SgVMC
         NdTGJUGlcDY3XfCekmgnO+NmqZ24JZUWFIHGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792438228; x=1793043028;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ujmsd1mQmndR3SCEvQ2ggDVXKPC4ZbkthKI3kKsBTLY=;
        b=HSZC6azLqRl0pqyJTxUrrpbq+gTJ7Ytd8ZnUrNWKfxDr6rM+yh74WsicfU8Z0KiwEM
         +wW3O4Nu4A9NKvZDG6uHE3sUN5cPSg24sXN4KsI/sfU+TBrj4P4+5UkmIpONirpIEqNq
         DtaxFLbkcp7IrIJwV7SlW3VsSC4YhWOMs/py7ESTpYk1dQrux508oRfVUQIV6Pr3oj9z
         sVhy9HfGntooO3eUHdRNp+DQCsFGJIIxe1+RtVHpvMiVYOyNk4ECX1GXpCD+KbvX+Qhk
         gOiMk3E01Dsq76bc3SxajMVJDFdEdrNDomquMkaTzU7B0arUnAOWb981GFzdcVvZtNxv
         EzQg==
X-Gm-Message-State: AFq9FYKUmqZdVPOSKz4wdjpOPotT2V/9D6L+s7nyf8tUfheF3ctRlpdl
	LgfL4RVnIHq6kOH6ZtCRc0KFdHe7gejqNzHrqiXywlhLc67DmfvrnUf1GQwnGDAZOUE=
X-Gm-Gg: AYBFou1iJvlYspNs1+yF/wxOSmYpzHgskhfRqWC77id4BU3L5RIhOxiKmdbMUTBfgrb
	2xV4TJ8ICiw97xkDvi17qvmKRIj50JzC4V3VHt5oJ2Kcy05EJS74bp70E0uvQjlsn8A2MUL07Eh
	rBTxwBklRFp+HU8RlswoEL8Q8Tm8aB5Pu4haPh9lSw03q2q5AtpYL4yTZS/5tGAzEVxpinXSG4H
	zCiii75dGWwKJB//pMXB470kOPeSHHyCRv3pbvWlsuXM7LyojEHHQJO8DVS9ghBbhxhTOwnxW9N
	qjjuPgdCCuPYmUzQjyQjGMDysKS+jDmNXVFM6ceX+P0P4Nwizedh4IUin+NEl4hdN6DWDhMSbnp
	zyNQ1a9HEIl2y1ahLHbHhacsra5MSx5gMtV9ka+Xou+VasTkl3IN3V0eGr9xBVYKyyWco4BZ8bq
	N2LDav5+fJVQt/wKFmRF+qSv5U4nDHO2UXmIa4sMofJ7XLsV2KTOD1iC5xaOhwC1lwNSyv/Lqv3
	yI7qd84CU7gu5uZ8EM=
X-Received: by 2002:a05:6820:160a:b0:6dd:e81a:5906 with SMTP id 006d021491bc7-70356f9a48cmr6041764eaf.50.1792438227672;
        Mon, 19 Oct 2026 12:30:27 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-701900719c6sm8480218eaf.11.2026.10.19.12.30.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 12:30:27 -0700 (PDT)
Message-ID: <98ab6ab5-ab3f-4b15-a841-e3059526d054@linuxfoundation.org>
Date: Mon, 19 Oct 2026 13:30:24 -0600
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
Subject: Re: [PATCH] usbip: clear actual length after receive failure
To: Sung Byeongchan <tjdqudcks0424@naver.com>, valentina.manea.m@gmail.com,
 shuah@kernel.org
Cc: linux-usb@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20261009122636.642575-1-tjdqudcks0424@naver.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261009122636.642575-1-tjdqudcks0424@naver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/9/26 06:26, Sung Byeongchan wrote:
> A USB/IP peer supplies actual_length in RET_SUBMIT. usbip_recv_xbuff()
> rejects a value larger than the URB transfer buffer, but the VHCI error
> path gives the URB back with the peer-controlled length still present.
> usbfs subsequently uses urb->actual_length as its copy-to-userspace
> extent, reading beyond the transfer-buffer allocation.
> 
> On current mainline target 0c2669a9f4a1d, a 65-byte completion for a
> 64-byte URB produced a KASAN slab-out-of-bounds read in _copy_to_user in
> three fresh boots. INT_MAX reproduced the same first invalid consumer
> three times. The one-byte case modified only a boolean sentinel oracle;
> the copied value was not collected or characterized.
> 
> Clear actual_length when receiving the transfer buffer fails. No payload
> is valid on this error path, and zero prevents downstream consumers from
> reusing the rejected extent. The existing protocol-error path closes the
> broken transport.
> 
> The fixed kernel rejected both triggers without KASAN in three fresh
> boots each. Normal zero through buffer-length completions, OUT and ISO
> controls, high-bit counterexamples, disconnect cleanup, and a following
> valid transfer on a fresh transport remained functional.
> 
> This issue was found through manual source inspection assisted by an
> AI/LLM, then evaluated with local production-path dynamic validation.
> 
> Fixes: aabb5b833872 ("usbip: Fix error path of vhci_recv_ret_submit()")
> Assisted-by: LLM
> Signed-off-by: Sung Byeongchan <tjdqudcks0424@naver.com>
> ---
>   drivers/usb/usbip/vhci_rx.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/usbip/vhci_rx.c b/drivers/usb/usbip/vhci_rx.c
> index a678e7c898375..741107a964660 100644
> --- a/drivers/usb/usbip/vhci_rx.c
> +++ b/drivers/usb/usbip/vhci_rx.c
> @@ -79,6 +79,7 @@ static void vhci_recv_ret_submit(struct vhci_device *vdev,
>   	/* recv transfer buffer */
>   	if (usbip_recv_xbuff(ud, urb) < 0) {
>   		urb->status = -EPROTO;
> +		urb->actual_length = 0;

What happens without this code change? The code path follows the
error leg because of EPROTO? So how does setting actual_length to
zero help?

thanks,
-- Shuah
