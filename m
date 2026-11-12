Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794473002;
	b=bHu1SyO8qjVbL/ambcGAlqSC1OXf232Uj8bytie24c+4LSv+xgm7nPChs9eyDf0NT+/n
	 OGULys10GmMiO4yt8XbGEYH3oMJmUCRalk6/YT7/e2WakbYunViOZ4q4ZmmLZo3OnjMZv
	 A3ioK7D8yQZS80uWUXR7dzBTJlRBmPs4sgeXduRuRWwfY4MqfD2YlxZka5raQbmmWSiP7
	 xlYgOKLo9N2Temp2YjnAL/59Hz8m1xFIkP/y4h14m4KWizRSwCKoCeeI7dNfAlG/rR39O
	 Jb5VO2DIPBxvXqk4Vi2kfYpr6SE9n1wATgpGMXBCWOlslRUTJVxWpKr5w3vWheAAh3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794473002;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Ccrg0Ah5/raiZe23O01HRQmfIbLS9+N0hKSJNBgmJXY=;
	b=R8hBUpyk7e4QnsjPyzoiYiDIoe2ADW+LIDbcKXjZNvWE3TciGYVsDz6txGEoL56rc8+n
	 W1UD5NVSPOjvS22MSgu5RE3mkAS72u6CxLpkiCBrILhlNgBtV3wO9nxcIcxslOFiTAOKj
	 3fxREjVpesJfmRbCwPOEBwpDN//6dAh+J0qcV3YlSqfS3PG/bLW7JlFhJ3WnzMV6YGVZg
	 Xuswad0Hwu3o3CP4eitUO0cGGkODunW2ZyaXgostVS63Jle5AI8RIwPx5SbCuR7i0djh9
	 ee3b6yNzwAJBqPfEho2ch56tWmSpIWKr4CJeE8cO0N/Pl3e6VidzlJ7HT36V3/5uakw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=pereq.eu;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4FD606A8B6
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 08:43:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D4FD606A8B6
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=pereq.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso35077105e9.3
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 00:43:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794473000; x=1795077800;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ccrg0Ah5/raiZe23O01HRQmfIbLS9+N0hKSJNBgmJXY=;
        b=HpBl5aZr62+DP+t/ezrnUcH/DGR1gYPagVKvrVTXgew/RggtjTSowUj3o+FXLfxU0P
         F/PAuxB9MU/gogFJMsH92RyMFE5e3uH/lEXXLxmhWxgcfjihlHxcpKFxrdw8kSgdYlf9
         MWp5csOWkC7r6gRwH5sV15wiHyeQMsaQV+oOopYp4RBiaQPlccyK8YMSr8qzBCmHd6HD
         rjhSC3z4LouAZnRzUlQRyMT+OQAiXw892MXWS8uBF6XqtONrw5kipZjwz5RAoe6I11JF
         pwhrDyLsZsGmeqxjWPV1Sz5FYjqpX2/YqE2d5vCF8dpGLHCwujswx+9ZnkvBqcsIJ3GX
         aJYw==
X-Forwarded-Encrypted: i=1; AL+hErG/cKGwYXILzfGJ//lwvYmGdFGhHVFsd3Rqx6gh36v8i7xIJCJ3eI2F/XBKjgLSjTTWp3Ulu4MpvxY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pM5p95MoaLvIr80Ck4ItLnW2sdZf9c5yCkhy+zuBSFiYJSmSL
	RZDNx04gpDO2IelgeG8KU3YzcV1Y68vJyC1u6EENJh+XYr6urTm2DPZq
X-Gm-Gg: AYBFou2Yj8ibM714TDjplq7Qj9ehoGEB54nMMj4O9L/E1Q4H9abZzdCdC/8+B9bcBZG
	MQs9r9FEuhxQjWgce+0niCLliKVr7M71xK/uRJILVlFkMRhi/Z6hbNv9l3/91ie4wyi1vnDRapq
	n/nB2yElcX3NCNiWKu3H9eMIILlV5xNgjWTyHq38Aj+igL/UkoSpAJolIIBYLdl8LXp0lIikgdJ
	BgGgr6naZGJsyRW4AgRwscGUavv0ECrKCFX3mzNJ1+nboKqbKtcgeFQJFT+LaAqtm1j8hsg90eH
	LWhjAL3w4WM1NtJ9CydzNXadArmHvulT8LrpNDev02gDHiQgrJUWWI/keCHuWMH92iDyisp/XeM
	hXEEen3W+OSCIa7pnvPlATKPUCBtemmpAd8xSsHapC5nf5uW96LSsiNf8NFwgzc9V+/1nLchjwv
	6MTsZURK/m1ESPrmAyAWo6NSsqRgyOYVkAFdZTbeZAE6tQSxqYYX+gz7/DbOFtEeLE/mGvpIU2t
	0/BIjdmcm4Y5tZqR0txvViAYbp4/5P7vSRNNgQVQi57Q8eRyEPlOvaVgnfj5/Ty4amqFvbRyUvU
	ra/P6wIswooDy3CiQQNu4RVq9Da8blovnPlYrpqym814J35NkM1Qc6esrMTypZY/3G46Wy6xex4
	1bSqUcst1K1cx5xERZVpsoLHAiLq2qpd00Krk8Iv9VYBaUNEWpqa8B/jQdtycehd8ry1aqk8LXK
	kLURog5Q==
X-Received: by 2002:a05:600c:470d:b0:4b1:4017:c4f4 with SMTP id 5b1f17b1804b1-4ba093805b3mr88234605e9.20.1794472999607;
        Thu, 12 Nov 2026 00:43:19 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e258e8dsm82532545e9.4.2026.11.12.00.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:43:18 -0800 (PST)
Date: Thu, 12 Nov 2026 11:43:15 +0300
From: Dan Carpenter <dan@pereq.eu>
To: Shunbo Shi <shishunbo@cmss.chinamobile.com>
Cc: syzbot+0b456664585fa81a47f6@syzkaller.appspotmail.com, elder@kernel.org,
	gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
	johan@kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] greybus: verify the received message size covers the
 message header
Message-ID: <avV8I97uZJgX8Osk@stanley.mountain>
References: <6af55517.a0c627da.5d811.0010.GAE@google.com>
 <20261112082230.33584-1-shishunbo@cmss.chinamobile.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112082230.33584-1-shishunbo@cmss.chinamobile.com>

On Thu, Nov 12, 2026 at 08:22:29AM +0000, Shunbo Shi wrote:
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
> allocation, triggering a KASAN slab-out-of-bounds report.  When
> header.size is zero, kzalloc(0) returns ZERO_SIZE_PTR and the
> same read dereferences an invalid address.
> 
> Verify msg_size >= sizeof(header) in gb_connection_recv() so that
> the "Caller has made sure we at least have a message header"
> assumption in gb_operation_create_incoming() actually holds.
> 
> Fixes: d90c25b0a279 ("greybus: let operation layer examine incoming data")
> Reported-by: syzbot+0b456664585fa81a47f6@syzkaller.appspotmail.com
> Closes: https://syzbot.org/bug?extid=0b456664585fa81a47f6
> Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>
> ---
>  drivers/greybus/operation.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/greybus/operation.c b/drivers/greybus/operation.c
> index 7e12ffb2dd60..da53c0e026f0 100644
> --- a/drivers/greybus/operation.c
> +++ b/drivers/greybus/operation.c
> @@ -1047,6 +1047,13 @@ void gb_connection_recv(struct gb_connection *connection,
>  	/* Use memcpy as data may be unaligned */
>  	memcpy(&header, data, sizeof(header));
>  	msg_size = le16_to_cpu(header.size);
> +	if (msg_size < sizeof(header)) {
> +		dev_err_ratelimited(dev,
> +				    "%s: invalid message header size (%zu < %zu)\n",
> +				    connection->name, msg_size,
> +				    sizeof(header));
> +		return;
> +	}
>  	if (size < msg_size) {

Combine the conditions:

	if (msg_size < sizeof(header) || msg_size > size) {

regards,
dan carpenter

>  		dev_err_ratelimited(dev,
>  				    "%s: incomplete message 0x%04x of type 0x%02x received (%zu < %zu)\n",
> -- 
> 2.53.0
> 
> 
> 
