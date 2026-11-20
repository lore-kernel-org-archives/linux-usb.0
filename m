Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169535;
	b=UTMXjRjj/b7TH3BQBSriaeN8fToG+kC6RLFYO8CDpdH14qoegYLx1YhY1usedsEKOlpq
	 zJKktZ7/7WCnlMo8iqj8RWOI8PZ5vACV3wJmLNJnUEZg4MkRgtbRJoXfxjRgXdg/9HlyW
	 B1IEUyZCpOMbnaurzO2Q2U6qsLknPjoKlDC0jOIxzHoSzyBcli56wcGoL7IwjDFe31I4W
	 hR5kRlQTgIf0BqLXorao2Dm9XDLXY5joBX3JmQqezx3CkksiJdFH4Ec17BxEjNIhv085n
	 yzXP/dqu3y0cOSpznlnLdBRWySjS/+whZdK4hxCnaqB8PQxh3ZGPw/rpTqdgsh6OTSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169535;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:References:
	 Content-Language:Autocrypt:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=1iioZKyiZ1smpGmNtr7VhCZmPi7MGt2pcm7kels3/ok=;
	b=sc2QOPRs5t2M4zV6vkNmbQfSFsWqcwUs3oTEYPJnjmD1A18hQpzyI5ExBNCFFd4hgw9u
	 ExVEAgE1LWbHlJNhgBJ5GP/2bZrIku0BrNylxoUQBXnwJQD6G85Y3n/x+uQOPvPqgOq16
	 bYZPgaSUSUd+Y/Nj866EVQHjujsJywjVv3D1ZRKwklFkXz4v445nleHO9bkgdsA3hmhdy
	 CMTFUY+t57LFjrem+aeAiQu6gidgYCfjMwP4NzGzB/CTWA90g42e50W12uJC1xqSmtpjv
	 chQq/U/nkmmm+DDGropEuTnJiKD14f/zpMe2oa06WEMua964sljgJ75kiMgJc/p0Usg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AjKIX2uM;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E81606A337
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 10:12:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2E81606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AjKIX2uM
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4a358881793so324387f8f.0
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 02:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795169533; x=1795774333; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1iioZKyiZ1smpGmNtr7VhCZmPi7MGt2pcm7kels3/ok=;
        b=AjKIX2uMq+pNQpvJQxU2MXlorkMRKjoXxZvj1YMIqrVLkYE29DWgJDr3W6Rdm9sOaV
         J3rVX9nxYtp9JceropjogV2ABuAEHxlrqdhMqwIpGB/RV5FiztdfhrY4mgZrPgnVuFZg
         3XU5RELjYY2I7bnv2AVuqRo/ZvPw5sds+2JpdhVI23/je9xd0+i3AKupGcm4tq763vuK
         50+r5pAhBLc0vRWDH7YAeGoWhVZUYU1g7NAiDQvteJIt0FHGEJd8mNRa7wdHuFQt8YDY
         V/6Ur809Ta0GLy0SnD4ItkgP5Ytg+dCjgdJzcWlhPyLA2jnc2JR/fl9SSROu1crb5mBv
         Ck5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795169533; x=1795774333;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1iioZKyiZ1smpGmNtr7VhCZmPi7MGt2pcm7kels3/ok=;
        b=qZHmhZRn4pl0kMYRy7PMJ3QHrXi1UIGV5GwDtbYi9Ta5yLLI1Is9D1UpmlMo8dQYQc
         AeXLp0IHuZdMlcWmkWJTPqbrC99RAKLJL2KQTc1YOO3Lrsb2AiJqFUClrn9TpTsbv2U+
         OmRubLPSA1IvTWwe94O3T6nX4vrPw62zvk6TQfzAoogXb7ldIrzKSEshIiVF87eRuQEi
         lo8FVj30ovgJByYvb9A4j7Pt8gS4VflZRjn4kknv7yb/UhJAuR88IYgxQXLozagZW8gU
         zMdKULogGfQGdY88ULNarF5Nzsy+VlNwSMt0cp0jbyoEpVV3+DABqRpT6tugI5jv9Iyf
         njxw==
X-Gm-Message-State: APuU4Z9xbWLYecNnGX4ed8HG/nc5TQ8Z3Wui1Y3oxN4ofkHBjl1NWviz
	Ot8WXJcW5qHZkCyHq3jFliH7V/NpUqT/7u4OzK8XcEApbyLuI7mut9Zao8yN1gdJcrX8W7V7eBA
	xX2b4PC8=
X-Gm-Gg: AZFdTZfJE4Xfc1D+LaMVE7KAUgy+GQ3DH1vzU1Eb8HzP0lUIIIfWjnDfips6JciqDbI
	M96nmcEc0R/hync7EJn9nT8FGvkmBVy5CdVE/ZLxWiGuu3OWS5fWKkuSfpvIZpL6E9PKpnXR9iv
	8muGHbyP9eNUwkAc4zoxFrZDfegL7d5vr/z+m7hpK6F/Quli6g8XGdi3AkQXPtu89H8MOCHHfTE
	bLFfcqOrF7RpsbsosjHobjiWmvbuTp684n2gtLJoVHGUiFTJXxtGt01fRW31X3Lyi8qgKWzYDLu
	hTLLcAOMHbxd0Ar3xafCtG/icqWhB8zb/tw6I6QAKIUmTshKVpPO6dlHorII739dR8QGB/J4aGa
	xjXG8C0UxLgQLFKz3Bgpzlwtofje2/TTcKz2ohDpYhS/MlWqEvKLrPJyRTS5JEtlKdAwFSO4iep
	tBU3dO/q8PEd0yhpPsJLZ/SvXZy/28pQdKO6tB7cnL7Hb9kktGMS2+CR9UtKoWIFi0tV+pje+Q9
	fJmRSGR09qehfjYSOes2QkCY7M3EfPDTOKjw7DsnMUxScwy9WlyBXhmzI+hxDHa6j71v/vFSYJy
	o3Hyy8J1QYM3S5RXB0RAVkNFQHTo/NgmB4PsHlhRx7IUxJ8VNkcd7mTegeHli5NhmL/GOXThg8i
	j26fpLyIXhw==
X-Received: by 2002:a05:6000:40ca:b0:4a3:976e:27a2 with SMTP id ffacd0b85a97d-4abb5146238mr4771515f8f.34.1795169532973;
        Fri, 20 Nov 2026 02:12:12 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:3374:165a:45ca:24fb? ([2a01:e0a:106d:1080:3374:165a:45ca:24fb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf680fsm5235224f8f.14.2026.11.20.02.12.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 02:12:12 -0800 (PST)
Message-ID: <09c5bd80-763d-4de5-89af-0f5b6350745f@linaro.org>
Date: Fri, 20 Nov 2026 11:12:12 +0100
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
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] usb: typec: tcpm: unregister stale partner sink
 capabilities
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
References: <20261120-topic-tcpm-core-fixes-v1-0-c753d1d286bb@linaro.org>
 <20261120-topic-tcpm-core-fixes-v1-2-c753d1d286bb@linaro.org>
 <sashiko-outbox-224904@kernel.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <sashiko-outbox-224904@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/20/26 11:03, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] usb: typec: tcpm: unregister after register in
>    tcpm_register_sink_caps()
> --
> 
> commit bce11ccecca861664b61850ba73a6eebf8702e1e
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> usb: typec: tcpm: unregister stale partner sink capabilities
> 
> This commit unregisters existing partner sink capabilities in
> tcpm_register_sink_caps() when new Sink_Capabilities are received.
> 
>> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
>> index 1d007e59a2bf9..c5a4c0b6da16f 100644
>> --- a/drivers/usb/typec/tcpm/tcpm.c
>> +++ b/drivers/usb/typec/tcpm.c
>> @@ -3563,6 +3563,8 @@ static int tcpm_register_sink_caps(struct tcpm_port *port)
>>   	if (IS_ERR(cap))
>>   		return PTR_ERR(cap);
>>   
>> +	if (port->partner_sink_caps)
>> +		usb_power_delivery_unregister_capabilities(port->partner_sink_caps);
>>   	port->partner_sink_caps = cap;
>>   
>>   	return 0;
> 
> [Severity: High]
> Should port->partner_sink_caps be unregistered and cleared to NULL before
> calling usb_power_delivery_register_capabilities(), as in
> tcpm_register_source_caps()?
> 
> Because the old sink-capabilities child device is still registered under
> port->partner_pd when usb_power_delivery_register_capabilities() runs,
> device_register() fails with -EEXIST and tcpm_register_sink_caps() returns
> early at IS_ERR(cap) before reaching the unregistration.
> 

Exact, will move it right before.
