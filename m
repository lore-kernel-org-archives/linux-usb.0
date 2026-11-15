Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794754570;
	b=DDXuSRiccBuovdU55ozkJSH4/ipktAitVwO3Fj3m8H4mTbydGmZpnbaB/PpZH3ijaygK
	 sSnhIt8IGtFc1l0HnsiHVZ69n4FjG3JqXeuqz7cinBvvUQVP8db0K3a7aitXcGUuwRJQy
	 qKNDfe/KYKf62+gVn2W13YvNmCVq+4Q4g0sxVGZI8rojGluT4SM8+zXAiKh+ND1+WMid1
	 zwQXRuI3nMfGjifw2jzCUBTs8mWg2OsyLYBof9KNH7ADy9WTuF+lYwL6G5mZ1eQDkj508
	 9Um+IAMr0loIbbYaaDf/uUH2CYgA8d6E5pP2qzFQv/CHi+NZPniJx56EhSeeEoOtRNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794754570;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=66KrluPErA73yZ5oWO4/Se+YF4oLxRzv02FOs2NcGy0=;
	b=AhA3CgxoB6yu4siOtd0Xv8GY/Lhj3HUGrOqYUET/t4dbF1exlWDsjL2zPy286W2IK9bR
	 lgkZhjKuAkWNEOZI86/1GEzECf3AuPqSXmCfeym2S8uqPQJPbMasSOIMJxqg19jFSCq4I
	 ffDuO4CcXuPjY5rnqe8kuVVLyMFdKW/s+G+yLkJwzAalmofG0ipELpiN428ry/612Ci0y
	 2D2qie0hifPLYzmDIHpRYjglYMNuh/5RBKXjYHEQpO9zpKiXHiYHIxWHIPcz8HzfnzyQY
	 3LxQT3HEub72xw/AQVl8HZ+ehEM3Elzz5D+HNHMfPwPhxGKybg47CtHbOZ0sXrI8prQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ieee.org;
	spf=pass smtp.mailfrom=ieee.org;
	dkim=pass header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=MdjyCQDg;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5D0606A31E
	for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 14:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF5D0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=MdjyCQDg
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-85ac281604dso2173038a34.0
        for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 06:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1794754568; x=1795359368; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=66KrluPErA73yZ5oWO4/Se+YF4oLxRzv02FOs2NcGy0=;
        b=MdjyCQDgymuxq21YTzEo9I02h9xhfqBitfXT2rvxDMXO7aai4bGGI7wS9F9l9TXhuh
         tsSff63SYcMwrTPUqLh3CZM8wcRXZNZabZ7uKKHRXyd7W0T6ypagmMWJOJYMZoGWVRd8
         xeKYKWZxNvg+IGCJo+FCvsYm7x0fFgFGH6RDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794754568; x=1795359368;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=66KrluPErA73yZ5oWO4/Se+YF4oLxRzv02FOs2NcGy0=;
        b=thvxzqCMYWEktcgZBIhI2+gdxsRF3qUp9hZEhvZrscJU++4Dqw8Fo63u08SKBIaViY
         lQoTi+cjre5X0M/Y7HbElSuODBBUjfUUnGm1+v63YcJLGniGNrBb31VSk6+e/rRxwYfd
         H6BoXlAA8H8GRJL/oiZXBFPShVfY67QeWGNWaqU7O0Bes+Ihd6oAbWmYO1wBpr61oe+u
         c8vKZpXXlewaFCj4OiHef/SHXl+y9Q2L5wCPljRyvhrPaj3dLW5lN1+Zkk31spog5ZKt
         THpuqiXUzzzvA9tNvbrvtVwENpzEGdVczBRx22Ka3UY4y108364CQ7y9DgoVe6qGCsnE
         Ad6g==
X-Forwarded-Encrypted: i=1; AL+hErHZY4or71NaBINOPRtNZObwJIJT0swy9O3d7NHtaVucBqXIsoVilNKWOFybSvV99mhPXEqZHJFjJlA=@vger.kernel.org
X-Gm-Message-State: APuU4Z95vviOFdiA0KY+dBITXS/J6KeCYxbXt4Ti3hOGYUo5Fxt6bMTM
	giMem42vC3LhK0qmZtjEw2XrI9QxxbXLAE/z+wKKUWV1c6k47YombqmsUpoRdu2BcQ==
X-Gm-Gg: AYBFou0/6ZH8Bh5aHOTcfv8qsKyQztf8rEsQFUkTCcJybNms3q6E20kad+ifM+e0B98
	gm5Zi+sOhAdXek8Szsct16KXshMm6nMXn2KvV/2PKx/pQ/tL6PFMHEAtZsa8WyFkGtpzM2tMO5B
	uPfXFa89BQ8tddbKcez6YOizpIWKsJ7tXRsy0vir3nRs7lnoTHxvZvi84a8j+v7+53JOzVlMsPH
	SZR/B1q2Zs7I/Lw/BV3hTH++qpQ5p3VgMjkCo2yKKS57BkOUP8yUqm1wa5PxCmXJ6cFjuAExoD+
	olozRgrld2GdiiDt93ch2GDAdfj7Nu6DFxffJ82dgflH6pOGS2LFV8HT/S3Fg2lwCvNKRdDgATg
	3KkT0NetLbUaKSu1vv4XX1nrRDYytaPs7uUS8Vcp1/RTe8iM5Xukhho7keLbglQ8gsJrQIJFS8c
	/tEKtYzfsdRFunoEJtPkkQNT6omZK3PjcFoY7HTQtdN2RoXTBPt7paVyNcH9Mqsoxy1pVPoFhPf
	ahvxSwZdtvm+lpqbZKn8Naoh5AzHtfDXX26nRRm0mDWRwJ1gWslKYKwqNcGCz6b6Mx7OTwkHgIC
	XCcBMfAxFNwcq4hqrMDW4xPU
X-Received: by 2002:a05:6830:3495:b0:85f:31f:7643 with SMTP id 46e09a7af769-8628981ad1emr8483076a34.7.1794754568555;
        Sun, 15 Nov 2026 06:56:08 -0800 (PST)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-8628812e44esm8317981a34.15.2026.11.15.06.56.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 06:56:04 -0800 (PST)
Message-ID: <b304a5dd-f6b9-4cd8-9d2a-8ca398119a41@ieee.org>
Date: Sun, 15 Nov 2026 08:56:01 -0600
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
Subject: Re: [PATCH v3] greybus: verify the received message size covers the
 message header
To: Shunbo Shi <shishunbo@cmss.chinamobile.com>, dan@pereq.eu
Cc: elder@kernel.org, gregkh@linuxfoundation.org,
 greybus-dev@lists.linaro.org, johan@kernel.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-usb@vger.kernel.org,
 syzbot+0b456664585fa81a47f6@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com
References: <avV8I97uZJgX8Osk@stanley.mountain>
 <20261113234739.1432-1-shishunbo@cmss.chinamobile.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20261113234739.1432-1-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 5:47 PM, Shunbo Shi wrote:
> In gb_connection_recv(), the size of the received data is checked
> against sizeof(struct gb_operation_msg_hdr) and against the message
> size encoded in the header (msg_size), but msg_size itself is never
> checked against the header size.
> 
> If a peer sends a message whose header claims a size smaller than
> the header itself (e.g. header.size == 3), the two existing checks
> both pass (size >= sizeof(header) and size >= msg_size), and the
> message is dispatched with the undersized msg_size.
> 
> In gb_operation_create_incoming(), this leads to an unsigned
> integer underflow in:
> 
> 	request_size = size - sizeof(struct gb_operation_msg_hdr);
> 
> The underflowed request_size then wraps back around in
> gb_operation_message_alloc():
> 
> 	message_size = payload_size + sizeof(*header);
> 
> causing kzalloc() to allocate a buffer that is too small to hold
> the message header.  When the response is later prepared in
> gb_operation_response_alloc(), reading
> request_header->operation_id reads past the end of the undersized
> allocation, triggering a KASAN slab-out-of-bounds report.
> 
> Link: https://lore.kernel.org/all/sashiko-outbox-210716@kernel.org/T/
> Fixes: d90c25b0a279 ("greybus: let operation layer examine incoming data")
> Reported-by: syzbot+0b456664585fa81a47f6@syzkaller.appspotmail.com
> Closes: https://syzbot.org/bug?extid=0b456664585fa81a47f6
> Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>

Looks good!

Reviewed-by: Alex Elder <elder@riscstar.com>
> ---
> Changes in v3:
> - combine the two separate conditions and unify the error message
>   as suggested by dan. Thanks!
> 
>   drivers/greybus/operation.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/greybus/operation.c b/drivers/greybus/operation.c
> index 7e12ffb2dd60..74429f3745bb 100644
> --- a/drivers/greybus/operation.c
> +++ b/drivers/greybus/operation.c
> @@ -1047,9 +1047,9 @@ void gb_connection_recv(struct gb_connection *connection,
>   	/* Use memcpy as data may be unaligned */
>   	memcpy(&header, data, sizeof(header));
>   	msg_size = le16_to_cpu(header.size);
> -	if (size < msg_size) {
> +	if (msg_size < sizeof(header) || msg_size > size) {
>   		dev_err_ratelimited(dev,
> -				    "%s: incomplete message 0x%04x of type 0x%02x received (%zu < %zu)\n",
> +				    "%s: invalid message 0x%04x of type 0x%02x received (%zu < %zu)\n",
>   				    connection->name,
>   				    le16_to_cpu(header.operation_id),
>   				    header.type, size, msg_size);

