Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792538844;
	b=nIrl69lA+JZAlYhQQfkwUV44OTuQIrQnN8PZAoNU3hPL3sg/3oz1PcELEhPVOD0x2k15
	 lffMksjYzGz6N905oMIx69K/RLkB6gvIiFa63yIYuO+CGIBvroVDZujYA/wOur0IH2+JH
	 AlPz+AXjs0eD1Ct9OPr121WKuuZp5D+nZ4XhtegO0GY0Vj/NtAmRXEBmrlRCN3c4HB8Kz
	 oJNTMlITMF7WP2AY3oO9hMeffTb+GW+Y6Oc618edb6S5W8YfdiXwq18lmLZubwClnRVFS
	 zdyJSyXG6ob1B+RxZxxJic48kVNfWlcggsfMTIU5jh5LxHkWZqEhAu0TIllkw/4m72g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792538844;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=7xrQizPs9jyFGxVEZgkAne+d2HksxHj2CHSRwRXclX8=;
	b=b0Kkl34iIvxKnoZ6yXNexkfgXDMzJvTu02HJFBDclhPEBRTYMFmcdbugXP0B81/GdksO
	 pNkEUjja980L8iC4ZPFtqLfk6q0VJ/GggSAlOOcGBHTkcPIYMkYN5bGVJpNlKgyZFgewB
	 mi+LUMbOmGxe3PNJRhYKiF0HS+OugXYQTV7U8+WsKAlDknI8K2lWBYEC5810YsIS6527k
	 ZaS18DZue/55t0mcpvk1a9O9hR1r/nisgZGIR63LvVE7PsOjCizkcb/zzQ0VPwfMlKO6m
	 9KP24PWSktCFyWK98z/TzqaMertj+uNTCJvjT5zMKAhKdPi+OgMs7o8IQzm0sNF4Wvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=SEyj5l3R;
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33652606A319
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 23:27:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33652606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=SEyj5l3R
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-823b938464fso128423a34.2
        for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 16:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1792538842; x=1793143642; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7xrQizPs9jyFGxVEZgkAne+d2HksxHj2CHSRwRXclX8=;
        b=SEyj5l3RyGxTwL4FUsPuPgwFJNW70mpo+xT9sPH0iWS+44aJp+TEBRJsLYpxba6Txy
         FiEtI/wPlhAB5k3U/7WJOO+IYQu4CV9NLP0mit0C2k9Xz48bKfC16wwvHuG5KWNjw1FU
         5gxqEAQvTuNM27Eztc9slPFA62TjtKmGJ3E44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792538842; x=1793143642;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7xrQizPs9jyFGxVEZgkAne+d2HksxHj2CHSRwRXclX8=;
        b=avAoDxaeFdkZ45FyR6m6K0DMu4OyUv6FatHHhaj9tXPHyj89Erb1KGEXgx56NAgioH
         7VHd8/XdT69CfO16qpUed35qILdhOLu2l0xp4SafsslXATctxYVa5leWAxet7v+ugwSO
         CFmTNpYdTb3GNkcblqBkRDlY2hpqDf4jsxRnitSdTV/uoQy9WuGFQjN+N9dDxjXOxYDh
         vm5QriHBs/r6rvTPDo+aNVsHoG61IMNLobTMdKpyMlVhDNN/iBQSoMHDCNmpCCBjJnZ+
         YU5dCPfihZzkBA3d3vvy5Yk050fMpJZbAf3D1iTXf7FrGGoG3eP7k6LlS0hLyQnAtO8a
         beBg==
X-Gm-Message-State: AFq9FYIss2DsK0htviRWnMvnRU2UT/Cku5ofSmg9eybBCdagv+3Y6fWz
	7fRJXA+AdE5iWQv+pmh2ravs9CaaTSC1QNadLmySW7zaOjnLj+J5O4/aV/PrmKjkwBo=
X-Gm-Gg: AYBFou1v0FSjnLcoy9eWvjoRisiOnjp/j3tn2IdCFAHZd1CRuWF08ml+fYMHVVTeRki
	y4SvVQxiMmd/QcLjkRuNcU/Xn18ij1ywHw9h17uVF5utaLAjxcQFKyjRyP5CG2ocftuNmEGyZGX
	EuvBm/TyFHRyoUINKNgyvatn6BteGJ5dh2DLcIXXzDt1zH9qssUjZ6KulMDeonvFA3pJ0DKjKvs
	T2QHRn2lI+JQZuk7tXrr6D3Xqg7VpjoBc3pBCiIG9GG3Ga3R/wdpNQ6O0yby0K6HSwsWbFT3XD/
	+pSozjHRMMu3P6pKeghrjytPwqLoU+PYKoDPn1M0pZ5fdN0YZDc8mXPmeLyuPxXFBsJO7CDWfZ1
	1xFWijsvhDOkIYgOXD1eOyGWhKIYRDDaie1+8h+u5qR8OW/HU5Lk/Ipyy9ZMAxNv/XdIs92FKwZ
	eIUw9slzqN8IlbpVK0Top3BoB+WkZo9VYb8NMP1dkAjCdPVEZTe+JcH3hurpZFsiNHehTMqnVb6
	BjNmAqW+NGnyBOtnggnyA8Ql1q7sUtAM2Qvz208cUUkfHOIRBTSTCtxK95C8cUvIw==
X-Received: by 2002:a05:6830:6685:b0:828:d647:3324 with SMTP id 46e09a7af769-84d0890443cmr181058a34.13.1792538841883;
        Tue, 20 Oct 2026 16:27:21 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84cbcddcd41sm821658a34.13.2026.10.20.16.27.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 16:27:21 -0700 (PDT)
Message-ID: <572df927-cb52-4504-a663-e73c68592c97@linuxfoundation.org>
Date: Tue, 20 Oct 2026 17:27:14 -0600
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
Subject: Re: [PATCH v2] usbip: vudc: reject submits after endpoint state
 changes
To: tjdqudcks0424@naver.com, Valentina Manea <valentina.manea.m@gmail.com>,
 Shuah Khan <shuah@kernel.org>
Cc: linux-usb@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20261020181832.461892-1-tjdqudcks0424@naver.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261020181832.461892-1-tjdqudcks0424@naver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/26 12:18, tjdqudcks0424@naver.com wrote:
> From: Sung Byeongchan <tjdqudcks0424@naver.com>
> 
> v_recv_cmd_submit() looks up an endpoint under udc->lock, but drops the
> lock while it allocates the URB and receives the payload.  A gadget
> configuration change can disable or disable and re-enable that endpoint
> before the URB is queued.
> 
> In a timing-controlled KASAN test, one of six unmodified baseline runs
> faulted in the inlined receive path while reading endpoint descriptor
> state after the descriptor had been cleared.  The other baseline runs
> also showed that a submit could cross the endpoint state transition.
> 
> Give each VUDC endpoint a generation that changes on enable and disable.
> Snapshot the generation and immutable parsing fields during lookup, then
> recheck descriptor presence and generation under udc->lock immediately
> before adding the URB to urb_queue.  Reject a stale request with
> -ESHUTDOWN.
> 
> The parsing snapshots avoid unlocked reads of mutable descriptor state.
> The generation check also distinguishes a newly enabled endpoint from the
> old endpoint state even though both use the same struct vep.
> 
> On a KASAN build at ff47652a4b66c067c765a7ad464d930b5a9367cc,
> normal enabled-endpoint, serialized-disable, and disable/re-enable
> stale-submit cases each passed three independent fresh-boot runs after the
> fix.  The stale case returned -ESHUTDOWN without a sanitizer report, and a
> following EP0 request succeeded after bounded reconnection.  The touched
> source is unchanged at 0c2669a9f4a1d607e7591ae50ccf3c432a0aff08, where
> the patch also applies and builds cleanly.
> 
> The demonstrated impact is kernel/service denial of service.  No
> controlled write, information disclosure, RCE, or LPE was demonstrated.

How did you reproduce it? If you didn't how are you sure this is the
right fix?

thanks,
-- Shuah
