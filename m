Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794632496;
	b=qomBKjiCtgMytLZCfcklm9u0DcuSOjBXKOMacnobsGI7f2e83Ipg7oUwibs5SgyJy0g/
	 nziLiMM4Cbr8Jvsn1TDZbG5ohpP3uDep2bF2dvqxUFLfhuogU5RM8RF0Pigv+kWrYi3x+
	 7AYepYl3z8wdNkCLIqYtNlur3iHTNSiXRiubFWCiLi8QWrQGplaVA2Ce3xgTQSHiw1iKv
	 lA5ulG6bRZMkL/+gKd8z8W0ZMUeXXl5GERHEAzjMkWKugTWLH/uaWMye1bxzTZ9b+OjHn
	 jjOyd6AUVN7xEB6faqk/ZJvHE+Vhu/7wMVUqXm9PwEuvh8+waqpCZMdaZKkvlYSyoaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794632496;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=XsyBqFQpB4uqfmK/Q9kt69A4CrjPtbiX6wa6hMkSoPo=;
	b=kDO9/hMr7UbWyBR2K7SWG5cMydT34GMsGoTKv4X+mgzU/FCC5JOcfArwiIlq5BV27VY1
	 Pdq5w2d1dns3EAAVXRdGggem+P1rzj40A1oIsH50cK0GOTRNLARYsuWmxOC3JcZsS3Uhc
	 cInG0C5AGzvR4sKtvIFmp7Dt6CrgIz3S+2j6E/F9G900bnBIjnE+p9hCbju0xYqtMYkqA
	 MKeiBTLtXZPjk3YMKNUSMf4KJ0bDUIr86H7MJZ+MQEnxaHx7YFG7Cq7a752IojsscY0Fy
	 oZ7F51DP7qj6oOjevVf1/NBkYOL5DCau6IWG/A0sIbSQrxQaECEnKZXRdYkCPH3gZXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JoOiROaT;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC7B606A885
	for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 05:01:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CC7B606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JoOiROaT
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4b7252a32c8so23669475e9.0
        for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 21:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794632494; x=1795237294; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XsyBqFQpB4uqfmK/Q9kt69A4CrjPtbiX6wa6hMkSoPo=;
        b=JoOiROaTWElWJE/9OqmMcTcIEuBaZ9LFk+zZjR+KV3E2MgEALRFAz8g9l44oWgTpKW
         qclPPYr9pwJp8ludq/OulNKENxbDXJdVjUDL09hiEt6S4Y/X21V1+cUKZizLzoQx7Asd
         klCu4PjDeXbR6e511SzOwQ2lngjkAjWv1/vuNQBEHmGQP86DbbsqHK7q8jwWg3pEyFCc
         RvDxhUgfx+Q3sCp6ZYd6kpIZWXhCS5Jhvz1z6mnydrf2BWaj8ZXV7BBbCEe/DqAx3pDp
         BdpRZ7NqcVFMXKNUCRmxuXNKatZHpxvdb7cbakINnm7zFC41L2EBYnAVeS3vSHnGZMBq
         T1PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794632494; x=1795237294;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XsyBqFQpB4uqfmK/Q9kt69A4CrjPtbiX6wa6hMkSoPo=;
        b=cAZ866JgnWRFq8IIqN699QpHUh9LubF4lYSTfJnMk9ff6QiCbktO8X7jSB1XOnyG+w
         It65yJMm35rl9mPqD1AiJ0YvvdfD+qshPeiqKaSGosnWL5xbFFZzJb+3+aoKJhe45oLi
         QFY6n+0b3Ta6JUSlgqRfEJh0dU29CznzDRk4osTE7mc8UGM5koZzOiQMgHRvgKK7bJjM
         Eup+v/C32fD8DQu4dsR4hemp1slXUbnVuuc+bhUlAwEiayC+LTqrU6J6IHtryvLr2tpT
         E5eBDtp0CG/GBPLDPqAs20Nv+C8djxLDRgufZeC0q+dTEAO6uyRr1JMye2LUhU0ulqIt
         5mRQ==
X-Forwarded-Encrypted: i=1; AL+hErHSDoiAVK/jdI5YdKlnCmka8MYZ0EHrfg3R8RQC5SgCI7GpCVqdWSwT9Khlsu/pBORfL/BI5me0hxc=@vger.kernel.org
X-Gm-Message-State: APuU4Z88g4c5h8cNASgUGhp5xRx5sPARU3Q3s+/KwThWYdTBcPQvJR2p
	YGNnFO3yrXVekn9ceKnUVijVO24+QE+df6BlF83GRJ+0v/32UNRX6BFm
X-Gm-Gg: AYBFou1PRaNy2H33+wNLewhN5oQI129lnKwMNiuUD93bmvTQKxCDtvtNKRQaJ46OAGe
	AgFgsAs0fDwXr1OH9kN4oJ5a4TfwmzaVliC0S8hncVTKr9QEz1JPrePMgGyQz8YYbNkNvsNBifL
	2a1pmHjb78TDCwU5cUC6qOYYRrM0HQuf+WFSj6wcqE/nrGj3M1tuzJVmB3VL7n1QBRnRit8Mrb3
	cgvaj8qAI7m7J8guBdMC7MHiq3Qjg7AYrXrZ+OsgCM4e7xYsryfhw23WrhIaNdgpO4pV0qlk6gi
	EDT7gDYW0vGGm0gsL45wdqOlI3emRXWcK3AlhrZ/cwFkrMw1LPAxTsAGRc1KkAnufwI/QS7C6JR
	WQ3ipg0ODWV7xbfJkUbL0OSzcvyELzlT+qmGgOKUiyc2FY2VHALPIsL/5KnRq8NAP3jIIle5/Gb
	lJH5G59jyuLmNxcOWYQtlVfLrrDCOLioijV7vJbCPLKRTJ2WaFLLYgB+rYQcX2fr6CksuFJQpS2
	KeynGEeARbMUtGqGXm5bPvcfktxdgwthfbrHPa3AnYboNmNSNNd9uxKN8q6OK0fWV5fDdz86YKM
	lm/QRHmcjyD894iHgUfBNRlD4KLICsqZDhKxQ1CpmaVPLvKVGYi5/h9hGIxyd59X+RaNM/FX4aA
	9s+mEe2vDe4DRxN0be8vsfCHJkpAjII1b95HBmupvR9KZyEJl2umoQje+S3CYAA4293M=
X-Received: by 2002:a05:600c:1913:b0:4b1:2026:6b41 with SMTP id 5b1f17b1804b1-4bb55ab021bmr98950275e9.30.1794632493836;
        Fri, 13 Nov 2026 21:01:33 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5671059bsm65540875e9.1.2026.11.13.21.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 21:01:33 -0800 (PST)
Date: Sat, 14 Nov 2026 08:01:29 +0300
From: Dan Carpenter <error27@gmail.com>
To: Shunbo Shi <shishunbo@cmss.chinamobile.com>
Cc: dan@pereq.eu, elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, johan@kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-usb@vger.kernel.org,
	syzbot+0b456664585fa81a47f6@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH v3] greybus: verify the received message size covers the
 message header
Message-ID: <avfrKSBbpEp7vQyO@stanley.mountain>
References: <avV8I97uZJgX8Osk@stanley.mountain>
 <20261113234739.1432-1-shishunbo@cmss.chinamobile.com>
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
In-Reply-To: <20261113234739.1432-1-shishunbo@cmss.chinamobile.com>

On Fri, Nov 13, 2026 at 11:47:39PM +0000, Shunbo Shi wrote:
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
> ---
> Changes in v3:
> - combine the two separate conditions and unify the error message
>  as suggested by dan. Thanks!

Thanks!

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

